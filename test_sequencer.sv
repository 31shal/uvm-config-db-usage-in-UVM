class m_sequencer extends uvm_sequencer#(test_transaction);
uvm_component_utils(m_sequencer);
function new(string_name ="m_sequencer", uvm_component parent = null);
  super.new(name,parent);
  `uvm_update_sequence_lib_and_item(test_transaction)
endfunction
endclass
