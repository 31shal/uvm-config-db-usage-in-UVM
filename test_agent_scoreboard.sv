`uvm_analysis_imp_decl(_rmon_trans);
`uvm_analysis_imp_decl(_rdrvr_trans);
class test_agent_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(test_agent_scoreboard)
  uvm_queue#(test_transaction) actual_queue;
  uvm_queue#(test_transaction) expected_queue;
  virtual mem_if vif;
  function new(string name = "test_agent_scoreboard" , uvm_component parent = null);
    super.new(name,parent);
    scrbd_analysis_export_rmon = new();
    scrbd_analysis_export_rdrvr = new();
  endfunction
  `uvm_analysis_imp_rmon_trans#(transaction trans,test_agent_scrbd) scrbd_analysis_export_rmon;
  `uvm_analysis_imp_rdrvr_trans#(transaction_trans,test_agent_scrbd) scrbd_analysis_export_rdrvr;
  test_transaction trans_collected_scrbd;
  extern  virtual function void build_phase(phase);  
    virtual function write_rmon_trans(test_transaction trans_actual);
      $display("packet recieved at scoreboard");
      actual_queue.push_back(trans_actual);
    endfunction
      virtual function write_rdrvr_trans(test_transaction trans_exp);
        expected_queue.push_back(trans_expected);    
    endfunction
    extern virtual task run_phase(phase);
    endclass
      
   virtual function void build_phase(phase);
     super.build_phase(phase);
     `uvm_config_db#(virtual mem_if)::get(this,"","vif",vif);
     actual_queue = uvm_queue#(test_transaction)::get_global_queue();
     exp_queue = uvm_queue#(test_transaction)::get_global_queue(); 
   endfunction
      virtual task run_phase(phase);
        super.run_phase(phase);
        test_transaction trans_actual;
        test_transaction trans_exp;
        
        forever begin
          if(vif.valid ==1)begin
            @posedge(vif.clk)
            trans_actual = actual_queue.pop_front();
            trans_exp = actual_exp.pop_front();
            if(trans_actual.compare(trans_exp))begin
              `uvm_report_info(get_type_name(),$psprintf("sent packet from driver and received packet from monitor matches"),UVM_LOW);
            end
            else begin
              `uvm_report_info(get_type_name(),$psprintf("sent packet from driver and received packet from monitor mismatch").UVM_LOW);
            end
            emd
            endtask
            
        
    
     
     
        
    
    
   
