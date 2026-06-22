module ram00(

input wire clk,

input wire reset,

input wire push,
input wire [3:0] inhex,

input wire [3:0] op,

output reg [4:0] outdisplay

);

reg [3:0] ram_mem [0:31];

reg [5:0] write_ptr;
reg [5:0] read_ptr;

reg read_mode_old;

reg [21:0] read_counter;

integer i;

initial begin

    for(i=0;i<32;i=i+1)
        ram_mem[i] = 4'h0;

    write_ptr = 0;
    read_ptr = 0;

    read_mode_old = 0;

    read_counter = 0;

    outdisplay = 5'h10;

end

always @(posedge clk) begin

    if(!reset) begin

        for(i=0;i<32;i=i+1)
            ram_mem[i] <= 4'h0;

        write_ptr <= 0;
        read_ptr <= 0;

        read_mode_old <= 0;

        read_counter <= 0;

        outdisplay <= 5'h10;

    end

    else begin

        //---------------------------------
        // ENTRADA A MODO LECTURA
        //---------------------------------

        if(op == 4'b0010 && !read_mode_old) begin

            read_ptr <= 0;
            read_counter <= 0;

            if(write_ptr > 0)
                outdisplay <= {1'b0, ram_mem[0]};
            else
                outdisplay <= 5'h10;

        end

        read_mode_old <= (op == 4'b0010);

        case(op)

        //---------------------------------
        // ESCRIBIR SIN GUARDAR
        //---------------------------------

        4'b0000:
        begin

            if(push)
                outdisplay <= {1'b0,inhex};

        end


        //---------------------------------
        // ESCRIBIR Y GUARDAR
        //---------------------------------

        4'b0001:
        begin

            if(push) begin

                outdisplay <= {1'b0,inhex};

                if(write_ptr < 32) begin

                    ram_mem[write_ptr] <= inhex;
                    write_ptr <= write_ptr + 1;

                end

            end

        end


        //---------------------------------
        // LEER AUTOMÁTICAMENTE
        //---------------------------------

        4'b0010:
        begin

            read_counter <= read_counter + 1;

            if(read_counter >= 22'd100) begin

                read_counter <= 0;

                if(write_ptr > 0) begin

                    if(read_ptr < (write_ptr - 1)) begin

                        read_ptr <= read_ptr + 1;
                        outdisplay <= {1'b0, ram_mem[read_ptr + 1]};
                    end

                end

            end

        end


        //---------------------------------
        // BLOQUEAR
        //---------------------------------

        4'b0100:
        begin
        end


        //---------------------------------
        // BORRAR
        //---------------------------------

        4'b1000:
        begin

            for(i=0;i<32;i=i+1)
                ram_mem[i] <= 4'h0;

            write_ptr <= 0;
            read_ptr <= 0;

            read_counter <= 0;

            outdisplay <= 5'h10;

        end


        //---------------------------------
        // INVÁLIDOS
        //---------------------------------

        default:
        begin
        end

        endcase

    end

end

endmodule