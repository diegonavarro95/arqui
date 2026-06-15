module haV00(A0, B0, S0, C0);
  input A0;
  input B0;
  output S0;
  output C0;
  
  xorV00 h00 (.Ax(A0), .Bx(B0), .Yx(S0));
  andV00 h01 (.Aa(A0), .Ba(B0), .Ya(C0));
endmodule
