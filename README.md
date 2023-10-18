# Systemverilog-Test-Bench-Environment-Half-Adder

## Testbench Architecture
![image](https://github.com/srsapireddy/Systemverilog-Test-Bench-Environment-Half-Adder/assets/32967087/3e323f63-807f-44b2-9333-0512323ca2d2)

### Testbench Block
Testbench Top is the top-level block where we will have our testbench components. Inside, we have a test block. 
From TB, we send data to the DUT via interface. We check the outputs of DUT to see whether our design is correct.

### Env Block
The environment has four blocks inside it:

![image](https://github.com/srsapireddy/Systemverilog-Test-Bench-Environment-Half-Adder/assets/32967087/f8d2f393-f3e9-4006-8f2a-8ae8874bec72)

We declare all the input signals and output signals inside the Packet. The packet class is also known as the transaction class. Input signals are declared using the rand keyword because we want to randomize those input signals inside the generator. 

1. Generator: We take the data from the transaction class and randomize those input signals in the generator class (randomize the stimuli). Then we put this information into the mailbox.

Mailbox: The randomized input generated in the generator class will be sent to the driver class through the mailbox. Then, we pass that information to the DUT using a virtual interface. Mailbox/ Queue is used to pass information from one class to another. The generator will use the put method to put the information into the mailbox, and the driver will use the get method to get the information from the mailbox. Then, the information in the driver is driven into the interface using a virtual interface. 

2. Driver: The driver will drive (pass) this randomized information from the generator to the DUT through an interface. 
3. Monitor: The monitor captures the driver's information. Then, the monitor will pass this information to the scoreboard.
4. Scoreboard: This class is used to check the logic. Where we can write the comparison logic and decide whether our test case will pass or perform well. 
Transaction: To generate different kinds of input.
Interface: DUT and interface are connected. The rest of the class interacts with DUT using the interface. The test part is used to generate the stimuli. That stimulus is going to the DUT through the interface. 

The outputs from the DUT are sent to the monitor class using an interface. We will sample all the input and output signals in the monitor. 

Reference Model: Design and Verification teams are different teams. We will get whatever design we will verify (DUT) from the design team. The reference model is similar to the DUT written by the verification team. We create the logic which is similar to the design DUT. This way, DUT will have an output different from the reference model when the monitor gives information to the model. This reference model will also produce an output. Thus, we have two outputs, one from the design team and another from the verification team. Using the scoreboard, we will compare the outputs of the DUT and the reference model. In the scoreboard, we write a comparison logic to compare the outputs from the DUT and reference model. If the outputs match, we say the test is passing or failing.



