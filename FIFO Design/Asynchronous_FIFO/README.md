# Asynchronous FIFO Design Using Verilog HDL

## 1. Project Overview

This project is planned as an implementation of an **Asynchronous FIFO using Verilog HDL**.

An asynchronous FIFO is a storage structure that transfers data between two independent clock domains. Unlike a synchronous FIFO, it uses separate read and write clocks, which may operate at different frequencies and phases.

Asynchronous FIFOs are commonly used in digital systems to transfer data safely between modules that operate on different clocks.

## 2. Design Objectives

The planned design will focus on:

* Data storage and retrieval using FIFO ordering.
* Independent read and write clock domains.
* Separate read and write pointers.
* Full and empty status generation.
* Safe pointer synchronization across clock domains.
* Simulation-based functional verification.

## 3. Planned Architecture

### Memory array

Stores incoming data until it is read by the receiving clock domain.

### Write pointer

Tracks the next memory location for an accepted write and updates in the write-clock domain.

### Read pointer

Tracks the next memory location for an accepted read and updates in the read-clock domain.

### Pointer synchronization

Gray-coded pointers are commonly used to reduce the risk of incoherent multi-bit pointer transitions when synchronizing pointer information between clock domains.

The design will use an appropriate pointer synchronization scheme to support reliable status detection.

### Full and empty flags

* **Full flag:** Prevents accepted writes when the FIFO has no available storage.
* **Empty flag:** Prevents accepted reads when no stored data is available.

The exact pointer encoding, synchronization stages, and flag-generation logic will be documented after implementation.

## 4. Planned Design Specifications

The final parameters will be confirmed during RTL development.

| Parameter     | Planned specification             |
| ------------- | --------------------------------- |
| FIFO type     | Asynchronous FIFO                 |
| Clock domains | Independent read and write clocks |
| Data width    | To be defined                     |
| FIFO depth    | To be defined                     |
| Write control | Write enable                      |
| Read control  | Read enable                       |
| Status flags  | Full and empty                    |
| HDL           | Verilog                           |

## 5. Verification Plan

After the RTL is developed, the testbench will be designed to exercise the following scenarios:

* Reset behavior in both clock domains.
* Write and read operations using independent clocks.
* FIFO ordering and data integrity.
* Full and empty boundary conditions.
* Pointer wraparound.
* Different read and write clock frequencies.
* Simultaneous activity in both clock domains.
* Clock-domain crossing and pointer synchronization behavior.

A self-checking testbench with expected-data comparison and pass/fail reporting is a planned verification enhancement.

## 6. Project Structure

```text
Asynchronous_FIFO/
├── README.md
├── async_fifo_16_8.v
└── async_fifo_16_8_tb.v
```

The RTL and testbench files will be added when implementation begins. The proposed filenames and final specifications may be adjusted during development.

## 7. Tools and Technologies

* **Verilog HDL:** Planned RTL design and testbench development.
* **ModelSim:** Planned simulation and waveform analysis.
* **Git and GitHub:** Source-code management and documentation.

## 8. Key Engineering Concepts

* Asynchronous clock domains.
* Clock-domain crossing (CDC).
* Binary and Gray-code pointer representations.
* Pointer synchronization.
* FIFO full and empty detection.
* Data integrity across independent clock domains.
* Functional verification of asynchronous logic.

## Author

**Renuka Dukandar**

