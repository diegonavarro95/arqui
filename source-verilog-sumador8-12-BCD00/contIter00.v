module contIter00 (
    input clkit,
    input resetIt,
    input inFlagIt,
    output reg outFlagIt,
    output reg [3:0] contIterac
);

    always @(posedge clkit) begin
        if (resetIt == 1'b0) begin
            contIterac <= 4'b0000;
            outFlagIt <= 1'b0;
        end else begin
            if (inFlagIt == 1'b1 && contIterac < 4'b1000) begin
                contIterac <= contIterac + 1'b1;
            end else if (contIterac >= 4'b1000) begin
                contIterac <= contIterac;
                outFlagIt <= 1'b1;
            end
        end
    end

endmodule
