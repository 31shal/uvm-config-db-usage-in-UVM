module memory_dut#(ADDR_WIDTH = 8,DATA_WIDTH = 32)(input clk, input reset, input [ADDR_WIDTH-1:0] addr, input [DATA_WIDTH-1:0] write_data, input wren, input rden, output [DATA_WIDTH -1:0] read_data,output valid);
logic [Data_WIDTH-1:0] mem[ADDR_WIDTH-1:0];
always@(posedge clk)
 valid =0;
if (wren == 1) begin
  mem[address]= write_data;
  valid = 1;
end
if (rden == 1) begin
read_data = mem[addr];
  valid = 1;
end
end
endmodule
