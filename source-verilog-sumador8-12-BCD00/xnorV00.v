module xnorV00(Anx, Bnx, Ynx);
  input Anx, Bnx;
  output Ynx;
  
  assign Ynx = ~(Anx ^ Bnx);
  
endmodule
