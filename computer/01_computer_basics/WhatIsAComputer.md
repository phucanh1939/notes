## What is a computer?

A computer is an electronic device designed to process data (perform tasks by executing instructions from software programs).

### What is data?

Data refers to raw facts, figures, or pieces of information that a computer can process, store, and manipulate. In its most basic form, data is represented as binary (1s and 0s) inside a computer.

**Example:**
- "New York City" (the name of a city in the US) is a raw fact/piece of information that is "data" and can be represented inside a computer as a list of binary.
- 2024 (a year) is "data" and can be represented inside a computer as a list of binary.

### What is a task?

A task is defined by what needs to be accomplished and how it is accomplished.

- **What**: Input and output.
- **How**: Instructions (program).

### Example tasks

Below are examples of how a computer processes data to produce a meaningful result (performing a task).

#### Example 1: Simple task: Calculating Average Temperature

1. **Input Data**: 
   - The computer receives a set of temperature readings (raw data) from a weather sensor.
     - Data: [72°F, 75°F, 68°F, 70°F, 73°F]

2. **Processing**:
   - The computer executes a program that adds up all the temperature values and divides by the number of readings to find the average.
   - The process involves:
     - Addition: `72 + 75 + 68 + 70 + 73 = 358`
     - Division: `358 ÷ 5 = 71.6`

3. **Output**:
   - The computer produces the result, which is the average temperature.
     - Output: "The average temperature is 71.6°F."

**Breakdown**:
- **Data (input)**: Raw temperature values (72, 75, 68, 70, 73).
- **Processing**: The computer performs arithmetic operations (addition and division) on the input data.
- **Information (output)**: The average temperature (71.6°F) is the meaningful result.

#### Example 2: Complex Task: Image Recognition using Machine Learning

1. **Input Data**:
   - The computer receives an image, for example, a picture of a cat.
     - Data: The image is represented as a grid of pixels, where each pixel has color values (e.g., RGB values).

2. **Processing**:
   - The computer uses a trained neural network model (deep learning) to analyze the image and identify objects in it. This process involves:
     1. **Preprocessing**: The image is resized and normalized to a standard format.
     2. **Feature Extraction**: The model extracts important features like edges, shapes, and patterns from the image.
     3. **Classification**: The neural network compares the extracted features with learned patterns to identify the object in the image. The model may perform multiple mathematical operations (such as convolutions, pooling, and matrix multiplications) across many layers of the network.
     4. **Decision Making**: The computer calculates probabilities and decides what the object is (e.g., 98% probability it's a cat).

3. **Output**:
   - The computer outputs a label and confidence score:
     - Output: "This image contains a cat with 98% confidence."
W