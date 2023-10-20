class scoreboard;
  mailbox mon2scb;		// mailbox decleration
  
  function new(mailbox mon2scb);
  	this.mon2scb = mon2scb;
  endfunction
  
  task main;
    transaction trans;		// handle of transaction class
    repeat(1)
      begin
        mon2scb.get(trans); // getting info from mailbox
        
        if(((trans.a ^ trans.b) == trans.sum) && ((trans.a & trans.b) == trans.carry))
          $display("Result is as Expected");
        else
          $error("Wrong Result");
        
        trans.display("Scoreboard");
      end
  endtask
endclass