`include "interface.sv"
`include "test"

module tbench_top;
  intf i_intf();
  
  test t1(i_intf);
  
  half_adder h1(
    .a(i_intf.a),
    .b(i_intf.b),
    .s(i_intf.sum),
    .c(i_intf.carry)
  );
endmodule