class driver;
  virtual intf vif; // vif is a handle of virtual interface
  
  mailbox gen2driv; // handle of mailbox
  
  function new (virtual intf vif, mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  
  task main;
    repeat(1)
      begin
        transaction trans;   // handle of transaction class, to get mailbox data
        
        gen2driv.get(trans); // getting trans data from mailbox
        
        vif.a <= trans.a;
        vif.b <= trans.b;
        
        trans.sum = vif.sum;
        trans.carry = vif.carry;
        
        trans.display("Driver");
      end
  endtask
endclass