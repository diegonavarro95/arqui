module orV00(Ao, Bo, Yo);
  input Ao, Bo;
  output Yo;
  
  assign Yo = Ao | Bo;
  
endmodule
