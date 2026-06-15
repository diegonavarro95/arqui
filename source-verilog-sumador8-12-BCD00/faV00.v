module faV00(A00, B00, C00, S00, C01);
  input A00;
  input B00;
  input C00;
  output S00;
  output C01;
  
  wire Sint1;
  wire Cint1;
  wire Cint2;

  haV00 F00 (.A0(A00), .B0(B00), .S0(Sint1), .C0(Cint1));
  haV00 F01 (.A0(C00), .B0(Sint1), .S0(S00), .C0(Cint2));
  orV00 F02 (.Ao(Cint2), .Bo(Cint1), .Yo(C01));

endmodule
