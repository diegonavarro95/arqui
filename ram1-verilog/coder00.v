module coder00(

input wire clkc,
input wire resetc,
input wire enablec,

input wire [3:0] inkeyc,
input wire [3:0] incontc,

output reg [3:0] outcodigohexadc,
output reg pushc

);

reg hold;

// contador para confirmar liberación
reg [7:0] release_cnt;

initial begin
    hold = 0;
    release_cnt = 0;

    pushc = 0;
    outcodigohexadc = 0;
end


always @(posedge clkc) begin

if(!resetc || !enablec) begin

    hold <= 0;
    release_cnt <= 0;

    pushc <= 0;
    outcodigohexadc <= 0;

end

else begin

    // push dura solo un ciclo
    pushc <= 0;


    //--------------------------------
    // ESPERAR LIBERACIÓN REAL
    //--------------------------------

    if(hold) begin

        if(inkeyc == 4'b0000) begin

            release_cnt <= release_cnt + 1;

            // esperar varios ciclos libres
            if(release_cnt >= 8'd20) begin
                hold <= 0;
                release_cnt <= 0;
            end

        end

        else begin
            release_cnt <= 0;
        end

    end


    //--------------------------------
    // NUEVA PULSACIÓN
    //--------------------------------

    else if(inkeyc != 4'b0000) begin

        hold <= 1;
        pushc <= 1;

        case({incontc,inkeyc})

            8'b1000_0001: outcodigohexadc <= 4'h1;
            8'b1000_0010: outcodigohexadc <= 4'h2;
            8'b1000_0100: outcodigohexadc <= 4'h3;
            8'b1000_1000: outcodigohexadc <= 4'hA;

            8'b0100_0001: outcodigohexadc <= 4'h4;
            8'b0100_0010: outcodigohexadc <= 4'h5;
            8'b0100_0100: outcodigohexadc <= 4'h6;
            8'b0100_1000: outcodigohexadc <= 4'hB;

            8'b0010_0001: outcodigohexadc <= 4'h7;
            8'b0010_0010: outcodigohexadc <= 4'h8;
            8'b0010_0100: outcodigohexadc <= 4'h9;
            8'b0010_1000: outcodigohexadc <= 4'hC;

            8'b0001_0001: outcodigohexadc <= 4'h0;
            8'b0001_0010: outcodigohexadc <= 4'hD;
            8'b0001_0100: outcodigohexadc <= 4'hE;
            8'b0001_1000: outcodigohexadc <= 4'hF;

            default: begin
                pushc <= 0;
                hold <= 0;
            end

        endcase

    end

end

end

endmodule