# Computer

## What is a Computer?

Computer is an electronic device designed to process data, performance tasks (programs).

## How does a Computer work?

A computer works by taking input data from a user through input devices (keyboard, mouse, microphone), processing that data (execute instructions on that data), storing output data in memory, and then present the output data with output devices (monitor, speaker)

Input device ---> Input data ----> Processor ----> Output data ---> Output device

### Key components 

- [Input Devices][input-devices]: Used to provide input data to the Computer (keyboard, mouse, microphone, etc.)
- [Central Processing Unit (CPU)][cpu]: Execute instructions (to process the data)
- [Memory][memory]: temporarily stores data that is currently being used for processing (include the program and input data)
- [Output Devices][output-devices]: Read data from Memory and represent it to user (monitor, speaker, etc.)

### What is data?

[**Data**][data] refers to raw facts, figures, or information that can be processed or analyzed. 

- **Numbers**: Quantitative values (e.g., 5, 100, 3.14).  
- **Text**: Words, sentences, or paragraphs (e.g., "Hello", "Data is power").  
- **Images**: Pictures or visual data (e.g., JPEG, PNG files).  
- **Audio**: Sounds or music (e.g., MP3, WAV files).  
- **Video**: Moving visual data (e.g., MP4, AVI files). 

For computer to "understand" the data, it need to be represented in binary format.

More detail: [Data Document][data]

### What is a program?

A program is a set of binary instructions that a computer follows to perform a specific task

### What is an instruction?

### How is a program made?

### How does a Computer execute a Program?

## How is a Computer made?

- **Silicon** is used to make **transistors**, which act as tiny electronic switches.  
- **Transistors** are combined to form **logic gates** (AND, OR, NOT, etc.).  
- **Logic gates** are used to build **circuit blocks** like **decoders, multiplexers, ALUs, and registers**.  
- These **circuit blocks** form **core components** such as **CPU, RAM, GPU, and controllers**.  
- **Core components** are fabricated into **integrated circuits (ICs)**, which are microchips.  
- **ICs, storage (HDD/SSD), cooling systems, and I/O ports** are assembled onto a **motherboard**.  
- The **motherboard** connects everything into a **complete computer system**.  

--------------------

## Then, How can I create a Program?
1. First, We write code in high level programing language to define the program using a Text Editor and an Input Device.
2. Then, We use a compiler & alinker to convert these code files into an executable file (contains machine code that computer can execute)

Code files (Storage) -----> | Compiler & Linker | -----> Executable Program (Storage)

### Questions
1. What is an Input Device? How does it work?
2. What is a TextEditor, Does it a program? If it does, then how a first text editor was created? Before having a Text Editor how do human define a program?
3. What is Storage?
4. What is a file?
5. What is a Compiler/Linker and How does it work (convert code into exectable program)?

## And, How does Computer execute a Program?

1. First, the OS read the executable file and load the program into Memory, setup needed memory & environment for the program.
2. Then, the OS find the entry point of the program, setup the start point and give control to Processor to execute the Program
3. Then, the Processor fetch instructions (of the program) from the Memory and execute it one by one from the entry point till it reach the end of program (exit instruction?)

Executable Program (Storage) ---> | Program Loader (OS) | ---> Program (instructions) on Memory  ---> | Processor | (execute instructions) ---> Write back output data to Memory ---> Output device read data from Memory and present it to end-user

### Questions
What is the OS, how does it work, how is it made?
What is Memroy, how does it work, how is it made?
What is Processor, how does it work, how is it made?
How Processor read/write data from/to Memory?
What is the program entry point?
What is a Output Device? How does it work, how was it made?






[input-devices]: input-devices/InputDevices.md
[cpu]: cpu/CPU.md
[memory]: cpu/Memory.md
[output-devices]: output-devices/OutputDevices.md
[data]: data/Data.md