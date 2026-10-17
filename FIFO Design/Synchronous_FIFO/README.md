# Synchronous FIFO Design Using Verilog HDL

## 1. Project Overview

This project implements a **16-depth, 8-bit-wide synchronous FIFO** using Verilog HDL.

A synchronous FIFO is a sequential storage structure that follows the First-In, First-Out principle. It uses a common clock for read and write operations, ensuring that data is retrieved in the order it was written.

The project focuses on FIFO RTL design, memory organization, pointer management, status flag generation, and simulation using a procedural Verilog testbench.

## 2. Design Specifications

| Parameter        | Specification            |
| ---------------- | ------------------------ |
| FIFO type        | Synchronous FIFO         |
| FIFO depth       | 16 entries               |
| Data width       | 8 bits                   |
| Storage capacity | 128 bits                 |
| Clock            | Single clock             |
| Reset            | Synchronous, active-high |
| Write enable     | `we`                     |
| Read enable      | `re`                     |
| Data input       | `data_in[7:0]`           |
| Data output      | `data_out[7:0]`          |
| Status flags     | `full`, `empty`          |
| HDL              | Verilog                  |

## 3. RTL Architecture

The design consists of the following components:

* **Memory array:** Stores 16 data entries, each 8 bits wide.
* **Write pointer (`wr_pt`):** Selects the memory location for the next accepted write.
* **Read pointer (`rd_pt`):** Selects the memory location for the next accepted read.
* **FIFO counter (`fifo_counter`):** Tracks the number of stored entries.
* **Full flag (`full`):** Indicates that all 16 entries are occupied.
* **Empty flag (`empty`):** Indicates that no entries are available to read.

The 4-bit read and write pointers wrap around naturally across the 16 memory locations.

## 4. Functional Operation

### Write operation

When `we` is high and the FIFO is not full, the input data is stored in the memory location selected by the write pointer. The write pointer advances after an accepted write.

### Read operation

When `re` is high and the FIFO is not empty, the selected memory entry is transferred to `data_out`. The read pointer advances after an accepted read.

### Occupancy tracking

The FIFO counter increments after a valid write, decrements after a valid read, and remains unchanged when both a valid read and a valid write occur in the same clock cycle.

### Status flags

* `empty` is asserted when the FIFO counter is zero.
* `full` is asserted when the FIFO counter reaches 16.

## 5. Testbench and Simulation

A procedural Verilog testbench is used to apply stimulus and observe the FIFO's behavior in **ModelSim**.

The testbench includes:

* Clock generation and input initialization.
* Reset sequencing.
* Reusable tasks for write and read operations.
* Randomized input data generation.
* Repeated writes intended to exercise the full condition.
* Repeated reads intended to exercise the empty condition.
* Additional writes after the read sequence.

### Verification status

The current testbench is stimulus-based. It does not automatically compare expected data against actual output data or generate pass/fail results. The scenarios applied have not, by themselves, established that all FIFO functionality is correct.

## 6. Project Files

```text
Synchronous_FIFO/
├── README.md
├── sync_fifo_16_8.v
└── sync_fifo_16_8_tb.v
```

## 7. Tools and Technologies

* **Verilog HDL:** RTL design and testbench development.
* **ModelSim:** RTL simulation and waveform inspection.
* **Git and GitHub:** Source-code management and project documentation.

## 8. Future Improvements

* Implement a self-checking testbench with a reference FIFO model.
* Add automatic data-integrity checks and pass/fail reporting.
* Verify FIFO ordering and pointer wraparound.
* Test simultaneous read and write operations.
* Add explicit checks for full and empty behavior.
* Explore SystemVerilog assertions and functional coverage.

## Author

**Renuka Dukandar**
