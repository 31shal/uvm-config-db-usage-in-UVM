class test_transaction extends uvm_sequence_item;
  rand bit [7:0] addr;
  rand bit [31:0] wdata;
  rand bit [31:0] rdata;
  rand bit wren;
  rand bit rden;
  rand bit valid;
  rand bit trans_no;
  `uvm_object_utils_begin(test_transaction);
  `uvm_field_int(addr,UVM_ALL_ON);
  `uvm_field_int(wdata,UVM_ALL_ON);
  `uvm_field_int(wren,UVM_ALL_ON);
  `uvm_field_int(rden,UVM_ALL_ON);
  `uvm_field_int(valid,UVM_ALL_ON);
  `uvm_object_utils_end
  function new(string name = "test_transaction);
  super.new();
  endfunction  
 constraint write_read_enable{wren != rden};
 constraint no_packs{trans_no ==20};
 endclass
                 
               
