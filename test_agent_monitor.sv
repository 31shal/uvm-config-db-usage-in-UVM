class test_agent_monitor extends uvm_monitor;
  `uvm_component_utils(test_agent_monitor);
  test_transactions trans_collected;
  uvm_analyis_port#(test_transactions) mon_analysis_port;
  vitual mem_if vif;
  function new(string name = "test_agent_monitor", uvm_component parent = null);
    super.new(name,parent);
    trans_collected = new();
    mon_analysis_port =new();
  endfunction
  extern virtual function void build_phase(phase);
  extern virtual task run_phase(phase);
    endclass;
    virtual function void build_phase(phase);
      super.build_phase(phase);
      `uvm_config_db#(virtual mem_if)::get(this,"","mem_intf",vif);
    endfunction
    virtual function run_phase(uvm_phase phase);
      super.run_phase(phase);
      always@posedge(vif.clk)begin
        forever
      if(vif.valid == 1) begin
        if(vif.wren ==1)begin
          trans_collected.addr <= vif.addr;
          trans_collected.write_data <= vif.write_data;
          trans_collected.wren <= vif.wren;
        end
        if(vif.rden ==1) begin
        rans_collected.addr <= vif.addr;
        trans_collected.read_data <= vif.read_data;
        trans_collected.rden <= vif.rden;  
        end
      end  
      mon.analysis_port.write(trans_collected);
    endfunction 
      
      
      
