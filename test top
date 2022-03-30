#include "interface.sv"
import uvm_pkg::*;
module test_top;
logic clk;
logic reset;
mem if intf(.clk(clk),.reset(reset));
memory_dut(.clk(intf.clk),.reset(intf.reset),.addr(intf.addr).write_data(intf.write_data),.read_data(intf.read_data),wren(intf.wren),rden(intf.rden));
initial begin
clk=0;
reset = 0;
forever begin
#5 clk = ~clk;
end
reset = 1;
end
end
initial begin 
uvm_config_db #(virtual mem_if)::set(null,"*","vintf", intf);
run_test("base_test");
end
initial begin
$dumpvars;
$dumpfile("dump.vcd");
end

endmodule
