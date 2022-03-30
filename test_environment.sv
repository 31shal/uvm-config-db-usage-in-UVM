class test_env extends uvm_environment;
  `uvm_component_utils(test_environment)
  function new(string_name = "test_env", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  test_env_agent env_agent;
  test_env_svoreboard env_scrbd;
  extern function void build_phase(uvm phase phase);
    extern function void connect_phase( uvm_phase phase);
    endclass
    
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env_agent = test_env_agent::type_id::create("env_agent");
      env_scrbd = test_env_scoreboard::type_id::create("env_scrbd");                                                 
    endfunction
      function void connect_phase(uvm_phase phase);
        super.connect_phase(connect);
        env_agent.env_monitor.mon_analysis_port.connect(env_scrbd.scrbd_analysis_export);
      endfunction
        
    
    
  
