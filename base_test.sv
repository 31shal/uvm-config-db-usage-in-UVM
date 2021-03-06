class base_test extends uvm_test;
`uvm_component_utils(base_test);
function new(string name = ""base_test", uvm_component parent = null);
super.new(name,parent);
endfunction
test_env env;
test_seq seq;
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
endclass
function void build_phase(uvm_phase phase);
super.build();
env = test_env::type_id::create("env");
seq = test_seq::type_id::create("seq");
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
  seq.start(env.agent.m_sequencer);
phase.drop_objection(this);
endtask



