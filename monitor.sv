class monitor;
  virtual intf vif; // virtual interface decleration
  
  mailbox mon2scb;  // decleration of mailbox
  
  function new(virtual intf vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main:
    repeat(1)
      #3;
      begin
        transaction trans;			// handle of transaction class
        trans = new();				// constructor or creating object for trans
        trans.a = vif.a;			// sampling of data in monitor
        trans.b = vif.b;		
        trans.sum = vif.sum;
        trans.carry = vif.carry;
        mon2scb.put(trans);
        trans.display("Monitor");
      end
  endtask
endclass