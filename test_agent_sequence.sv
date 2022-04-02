class test_agent_sequence extends uvm_sequence;
  `uvm_object_utils(test_agent_sequence)
  `uvm_declare_p_sequencer(test_virtual_seqr);
  function new(string name = "test_agent_sequence);
  super.new(name);
  endfunction  
  test_transaction trans;             
  vitrual task body()
    trans = test_transaction::type_id::create("trans");
    `uvm_do(trans);
  endtask
  endclass
  
               
