module adder8bitV00(Ai, Bi, SL, So, LED);

  input [7:0] Ai, Bi;    // Entradas de 8 bits
  input SL;              // Seal de control (0 = suma, 1 = resta)
  output [7:0] So;       // Resultado de 8 bits
  output LED;            // Indicador de desbordamiento

  wire [7:0] SB;         // B modificado (para suma o resta)
  wire [7:0] SC;         // Acarreos internos

  // --- B xor SL (inversin de B cuando SL = 1) ---
  xorV00 X0 (.Ax(SL), .Bx(Bi[0]), .Yx(SB[0]));
  xorV00 X1 (.Ax(SL), .Bx(Bi[1]), .Yx(SB[1]));
  xorV00 X2 (.Ax(SL), .Bx(Bi[2]), .Yx(SB[2]));
  xorV00 X3 (.Ax(SL), .Bx(Bi[3]), .Yx(SB[3]));
  xorV00 X4 (.Ax(SL), .Bx(Bi[4]), .Yx(SB[4]));
  xorV00 X5 (.Ax(SL), .Bx(Bi[5]), .Yx(SB[5]));
  xorV00 X6 (.Ax(SL), .Bx(Bi[6]), .Yx(SB[6]));
  xorV00 X7 (.Ax(SL), .Bx(Bi[7]), .Yx(SB[7]));

  // --- Cadenas de sumadores completos ---
  faV00 F0 (.C00(SL),    .A00(Ai[0]), .B00(SB[0]), .C01(SC[0]), .S00(So[0]));
  faV00 F1 (.C00(SC[0]), .A00(Ai[1]), .B00(SB[1]), .C01(SC[1]), .S00(So[1]));
  faV00 F2 (.C00(SC[1]), .A00(Ai[2]), .B00(SB[2]), .C01(SC[2]), .S00(So[2]));
  faV00 F3 (.C00(SC[2]), .A00(Ai[3]), .B00(SB[3]), .C01(SC[3]), .S00(So[3]));
  faV00 F4 (.C00(SC[3]), .A00(Ai[4]), .B00(SB[4]), .C01(SC[4]), .S00(So[4]));
  faV00 F5 (.C00(SC[4]), .A00(Ai[5]), .B00(SB[5]), .C01(SC[5]), .S00(So[5]));
  faV00 F6 (.C00(SC[5]), .A00(Ai[6]), .B00(SB[6]), .C01(SC[6]), .S00(So[6]));
  faV00 F7 (.C00(SC[6]), .A00(Ai[7]), .B00(SB[7]), .C01(SC[7]), .S00(So[7]));

  // --- Lgica de desbordamiento para Complemento a 2 ---
  // El desbordamiento ocurre si el acarreo al MSB es distinto al acarreo de salida del MSB.
  xorV00 X9 (.Ax(SC[6]), .Bx(SC[7]), .Yx(LED));

endmodule
