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

Reference Model: Design and Verification teams are different teams. We will get whatever design we verify (DUT) from the design team. The reference model is similar to the DUT written by the verification team. We create the logic which is similar to the design DUT. This way, DUT will have an output different from the reference model when the monitor gives information to the model. This reference model will also produce an output. Thus, we have two outputs, one from the design team and another from the verification team. Using the scoreboard, we will compare the outputs of the DUT and the reference model. In the scoreboard, we write a comparison logic to compare the outputs from the DUT and reference model. If the outputs match, we say the test is passing or failing. Sometimes, the reference model will be written inside the scoreboard. 

As shown in the figure, we can consider a second monitor. If we are using two monitors, we need to understand that. We can sample only input signals in monitor one, and whatever the output is performed in the DUT, we can sample in monitor 2. We do this because, in the reference model, we only need input signals sampled from monitor 1, and we can sample what the DUT is doing using monitor 2. Then, we can pass the output from monitor 2 to the scoreboard through the mailbox. Then, we compare both outputs using the scoreboard logic. 

Virtual Interface: Our interface is static, and classes are dynamic in nature. Dynamic is something that is created at the runtime. Static is created at the - memory allocation  takes place at the compilation time. At compilation time, we can say that the memory is already present. It is not possible to do the communication between the dynamic and static classes. Because one thing is present, and the second thing is not present. Mean classes will only exist once we do new. New here means creating the constructor only, and then memory allocation occurs for the driver class. Thus, it is impossible to communicate between the driver class and the interface. To avoid this we use the virtual interface.

The virtual interface is a pointer to the actual interface. 



