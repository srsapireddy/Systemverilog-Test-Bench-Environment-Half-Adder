class generator;
  
  transaction trans; // Handle of Transaction Class
  
  mailbox gen2driv;  // Mailbox declaration
  
  function new (mailbox gen2driv); // creation of mailbox and constructor
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    repeat(1)
      begin
        trans = new();				// object for transaction class
        trans.randomize();			// randomization of transaction
        trans.display("Generator"); // for checking purpose
        gen2driv.put(trans);
      end
  endtask
endclass