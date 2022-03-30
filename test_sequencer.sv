class m_sequencer extends uvm_sequencer;
uvm_component_utils(m_sequencer);
function new(string_name ="m_sequencer", uvm_component parent = null);
  super.new(name,parent);
endfunction
endclass
