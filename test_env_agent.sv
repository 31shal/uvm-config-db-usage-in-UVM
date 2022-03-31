class test_env_agent extends uvm_agent;
  `uvm_componet_utils(test_env_agent)
  function new(string_name = "test_env_aent", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  test_agent_driver agent_drvr;
  test_agent_monitor agent_mon;
  test_agent_sequencer agent_seqr;
  extern function void build_phase(phase);
  extern function void connect_phase(phase);
      endclass;
   extern function void build_phase(phase);
        super.build_phase(phase);
        agent_mon= test_agent_monitor::type_id::create("agent_mon");
        if(get_is_active() == UVM_ACTIVE)begin
          agent_drvr = test_agent_driver::type_id::create("agent_drvr");
          agent_seqr = test_agent_sequencer::type_id::create("agent_seqr):
          end
       endfunction   
   extern function void connect_phase(phase);
     super.connect_phase(phase);
     agent_drvr.seq_item_port.connect(agent_seqr.seq_tem_export)
   endfunction
     
                                                               
                                                               
                                                             
                                                             
                                                             
        
