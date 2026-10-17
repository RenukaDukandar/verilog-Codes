# FIFO Design Using Verilog HDL

**RTL Design | Digital Design | Functional Verification**

## 1. Project Overview

This project focuses on the design and simulation of **First-In, First-Out (FIFO) buffers** using Verilog HDL.

A FIFO is a data-storage structure that follows the First-In, First-Out principle, meaning the first data item written is the first data item read. FIFOs are commonly used in digital systems for buffering data and transferring information between hardware modules.

This project covers synchronous FIFO design and explores the concepts required for asynchronous FIFO architecture.

## 2. Types of FIFO

### Synchronous FIFO

A synchronous FIFO uses a common clock for read and write operations.

Key components:

* Memory array for storing data.
* Read and write pointers for tracking memory locations.
* FIFO counter for tracking the number of stored entries.
* Full and empty flags for indicating FIFO status.
* Read and write control logic.

### Asynchronous FIFO

An asynchronous FIFO uses independent read and write clocks. It is useful when data must be transferred between different clock domains.

Important design concepts include:

* Independent read and write pointers.
* Clock-domain crossing (CDC).
* Gray-code pointer synchronization.
* Reliable full and empty detection across clock domains.

The asynchronous FIFO is a separate planned implementation.

## 3. Synchronous FIFO Specifications

| Parameter                     | Specification            |
| ----------------------------- | ------------------------ |
| FIFO depth                    | 16 entries               |
| Data width                    | 8 bits                   |
| Total storage capacity        | 128 bits                 |
| Clock                         | Single clock             |
| Reset                         | Synchronous, active-high |
| Write enable                  | `we`                     |
| Read enable                   | `re`                     |
| Status flags                  | `full`, `empty`          |
| Hardware description language | Verilog HDL              |

## 4. Functional Description

The synchronous FIFO stores incoming data in memory and returns stored data in the order it was written.

* **Write operation:** Stores input data when write enable is asserted and the FIFO is not full.
* **Read operation:** Outputs stored data when read enable is asserted and the FIFO is not empty.
* **Write pointer:** Tracks the next memory location for an accepted write.
* **Read pointer:** Tracks the next memory location for an accepted read.
* **FIFO counter:** Tracks the number of entries currently stored.
* **Full flag:** Indicates that the FIFO has reached its storage capacity.
* **Empty flag:** Indicates that the FIFO contains no entries available to read.

## 5. Testbench and Simulation

A procedural Verilog testbench is used to apply input stimulus and observe the FIFO behavior in **ModelSim**.

The current testbench includes:

* Clock generation.
* Input initialization and reset.
* Reusable tasks for write and read operations.
* Randomized input data generation.
* Repeated write operations to exercise the full condition.
* Repeated read operations to exercise the empty condition.
* Additional write operations after the read sequence.

The current testbench is stimulus-based. It does not automatically compare expected data against actual output data or generate pass/fail results.

## 6. Project Structure

```text
FIFO/
├── README.md
├── Synchronous_FIFO/
│   ├── README.md
│   ├── sync_fifo_16_8.v
│   └── sync_fifo_16_8_tb.v
└── Asynchronous_FIFO/
    └── README.md
```

The asynchronous FIFO directory can be expanded with its RTL and testbench files when implementation begins.

## 7. Tools and Technologies

* **Verilog HDL** — RTL design and testbench development.
* **ModelSim** — RTL simulation and observation of design behavior.
* **Git and GitHub** — Source-code management and project documentation.

## 8. Key Learning Areas

* Sequential logic and clocked processes.
* FIFO memory organization.
* Read and write pointer management.
* FIFO occupancy counting.
* Full and empty status flag generation.
* Procedural Verilog testbench development.
* Simulation-based functional testing.
* Fundamentals of synchronous and asynchronous FIFO architectures.

## Author

**Renuka Dukandar**




