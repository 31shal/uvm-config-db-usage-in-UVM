class test_agent_driver extends uvm_driver;
  `uvm_component_utils(test_agent_utils)
  function new(string name = "test_agent_driver", uvm_component parent =null);
    super.new(name,parent);
  endfunction
  test_transactions trans;
  virtual mem_if vif;
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
 endclass
   virtual  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
     `uvm_config_db#(virtual mem_if)::get(this,"","mem_intf",vif);
    endfunction
   virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
      seq_item_port.get_next_item(trans);
     if(trans.wr_en == 1)begin
       vif.addr <= trans.addr;
       vif.wren <= trans.wren;
       vif.write_data <= trans.write_data;
     end
     if(trans.rden ==1)begin
       vif.addr <= trans.addr;
       vif.rden <= trans.rden;
       trans.read_data < =vif.read_data;
     end
     seq_item_port.item_done();
   endtask
       
