module xorV00(Ax, Bx, Yx);
  input Ax, Bx;
  output Yx;
  
  assign Yx = Ax ^ Bx;
  
endmodule
