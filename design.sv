// code your design here

module half_adder(s,c,a,b);
  input a,b; // input signals
  output s,c; // output signals
  
  xor x1 (s,a,b);
  and a1 (c,a,b);
endmodule