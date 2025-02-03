# Computer

## What is a Computer?
A computer is a programmable electronic device designed to process **[data]** and perform tasks by executing **[programs][program]**.
It can handle a wide range of operations, from simple calculations to complex **[data]** analysis, based on the instructions provided.

## How a Computer Processes Data
For a computer to process **[data]**, the following steps are involved:
1. **Define the Data to Process**: Represent the **[data]** in a binary format that the computer can understand.
2. **Create a [Program][program]**: Write a set of **[instructions][instruction]** (a **[program]**) that describes how the **[data]** should be processed.

### Data Processing Workflow:
1. **Input Data**: **[Data]** is loaded into **[memory]** from an **[input device][indevice]** (e.g., keyboard, mouse) or a **[file]** in **[storage]**.
2. **Program Loading**: The program is also loaded into **[memory]**.
3. **Execution**: The **[processor]** fetches **[instructions][instruction]** and **[data]** from **[memory]** and executes them.
4. **Output Data**: The processed data is written back into **[memory]**.
5. **Output Presentation**: The output data can be written into **[storage]** (as **[files]**) or read by an **[output device][outdevice]** (e.g., monitor, printer) to present it to the user.

![How a Computer Processes Data](../assets/flowcharts/HowComputerProcessData.drawio.png)

### Basic Components of a Computer
- **[Input Device][indevice]**: Used to provide input data to the computer (e.g., keyboard, mouse, microphone).
- **[Memory]**: Temporarily stores data and programs that are currently being used for processing.
- **[Processor]**: Executes instructions to process the data.
- **[Storage]**: Stores data and programs permanently (e.g., HDD, SSD).
- **[Output Device][outdevice]**: Reads data from memory and presents it to the user (e.g., monitor, speaker, printer).

### Other Important Components
- **[Graphics Processing Unit (GPU)][gpu]**: Handles graphics rendering and parallel processing tasks.
- **[Power Supply Unit (PSU)][psu]**: Provides power to the computer system.
- **[Cooling System][cooling-system]**: Prevents overheating by dissipating heat (e.g., fans, heat sinks).
- **[Network Interface Card (NIC)][nic]**: Enables network connectivity.

### Example: Extracting Sentences with a Keyword
A computer program to extract all sentences in a text document that contain a keyword:
1. **Data to Process**: A text document and a keyword, represented in binary as **[string]**.
2. **Program**: Instructions to find all sentences containing the keyword.
3. **Execution**:
   - The program is loaded into memory.
   - The input text document is loaded into memory from an input device or storage.
   - The processor executes the program, identifying sentences with the keyword.
   - The output is displayed on the screen (output device) or saved to storage.

## How is a Computer Made?
1. **Silicon**: Used to make **[transistors][transistor]**, which act as tiny electronic switches.
2. **[Transistors][transistor]**: Combined to form **[logic gates][logic-gate]** (e.g., AND, OR, NOT).
3. **[Logic Gates][logic-gate]**: Used to build **[circuit blocks][circuit-block]** like **[decoder], [multiplexer], [ALU], and [register]**.
4. **[Circuit Blocks][circuit-block]**: Form **core components** such as **[CPU][processor], [RAM][ram], [GPU], and [controllers]**.
5. **[Integrated Circuits (ICs)][ic]**: Core components are fabricated into microchips.
6. **[Motherboard]**: ICs, storage (HDD/SSD), cooling systems, and I/O ports are assembled onto a **motherboard**.

[data]:                 data/Data
[string]:               data/text/Text
[program]:              program/Program
[instruction]:          program/instruction/Instruction
[storage]:              components/storage/Storage
[memory]:               components/memory/Memory
[ram]:                  components/memory/ram/RAM
[indevice]:             components/input-devices/InputDevice
[outdevice]:            components/output-devices/OutputDevice
[processor]:            components/processor/Processor
[logic-gate]:           components/processor/functional-units/logic-gate/LogicGate
[circuit-block]:        components/processor/functional-units/circuit-block/CircuitBlock
[gpu]:                  components/gpu/GPU
[psu]:                  components/psu/PSU
[nic]:                  components/network/NIC
[cooling-system]:       components/cooling-system/CoolingSystem
[file]:                 operating-system/file-system/File
[ic]:                   terms/IntegratedCircuit
[transistor]:           components/processor/functional-units/transistor/Transistor
[motherboard]:          components/motherboard/Motherboard
[decoder]:              components/processor/functional-units/decoder/Decoder
[multiplexer]:          components/processor/components/multiplexer/Multiplexer
[ALU]:                  components/processor/components/alu/ALU
[register]:             components/processor/components/register/Register