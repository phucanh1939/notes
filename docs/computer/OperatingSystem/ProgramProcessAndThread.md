# Program vs Process vs Thread

## Program
- A program is a set of instructions stored on disk (e.g. `.exe`, `.app`).
- It does nothing until executed.

### Example:
- `MyGame.exe` built by Unity is a program.

---

## Process
- A process is a running instance of a program.
- Created by the operating system.
- Has its own memory space, resources, and threads.
- A process can create another process (execute another program) at runtime using system calls.
    - On Unix/Linux:
        - fork() → creates a copy of the current process.
        - exec() → replaces the process image with a new program.
    - On Windows:
        - CreateProcess() → creates and runs a new process.

### Unity Example:
- When you launch your game, the OS creates a process for `MyGame.exe`.
- Unity allocates memory, loads assets, and starts the game loop inside this process.

---

## Thread
- A thread is a unit of execution within a process.
- Threads in the same process share memory and resources.
- The main thread is the entry point; others can be created for parallel tasks.

### Unity Example:
- Main thread: Runs `Update()`, rendering, input, etc.
- Worker threads:
  - Unity Job System (e.g. C# Jobs, DOTS)
  - Your custom threads (e.g. AI, networking, file I/O)
  - Async/await background tasks

### Note:
- All threads must belong to a process.
- Threads **cannot exist independently** outside of a process.

---

## Important Notes
- Only the main thread can safely call UnityEngine APIs.
- Use thread-safe queues or dispatchers to pass data back to the main thread.

---

## Summary Table

| Concept   | Definition                         | Unity Example                         |
|-----------|-------------------------------------|----------------------------------------|
| Program   | Code stored on disk                 | `MyGame.exe`                           |
| Process   | Running instance of a program       | Game running in the OS                 |
| Thread    | Unit of execution inside a process  | Main thread, job worker, async task    |
