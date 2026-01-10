# Radix-16 Booth Multiplier: FPGA Implementation & Timing Analysis

## Project Overview
This project implements a high-speed 8-bit **Radix-16 Booth Multiplier** in Verilog. By utilizing a high-radix encoding scheme, the design reduces the number of partial products to just two, minimizing the logic required for the final summation and improving area efficiency.

## FPGA Implementation Details
The design was synthesized and implemented using the **Vivado Design Suite** targeting the **Xilinx Artix-7** (XC7A200T) FPGA.



### Implementation Metrics:
* **Target Device:** XC7A200T-2
* **Logic Type:** Initially purely combinational
* **Number of Endpoints:** 2767

---

## Timing Analysis & Error Debugging
The implementation phase identified significant timing violations that prevented the design from operating at the target frequency.

### 1. Analysis of Timing Summary
The **Design Timing Summary** from Vivado implementation revealed a critical **Setup Time Violation**:

* **Worst Negative Slack (WNS):** -0.742 ns (FAILED)
* **Total Negative Slack (TNS):** -80.105 ns
* **Failing Endpoints:** 233
* **Worst Hold Slack (WHS):** +0.048 ns (PASSED)



### 2. Root Cause of Error
The negative WNS of **-0.742 ns** indicates that the **Critical Path**—the longest combinational delay between two registers—exceeds the clock period.
* **Logic Depth:** The path through the Radix-16 Partial Product Generation and the final 16-bit summation is too deep.
* **Result:** The data arrives 742 ps too late at the destination registers to satisfy the setup time requirement ($t_{su}$).

### 3. Proposed Resolution: Pipelining
To resolve these errors and ensure hardware reliability, the design was transitioned into a **Sequential Pipelined Architecture**:
* **Stage 1:** Partial Product Generation and Booth Multiplexing.
* **Stage 2:** Registering intermediate sums.
* **Stage 3:** Final 16-bit Product Summation.

By inserting registers at these strategic points, the combinational delay is broken into smaller segments, effectively turning the **Negative Slack** into **Positive Slack** and allowing the multiplier to meet the timing constraints required for real-time signal processing.

---

## Tools Used
* **HDL:** Verilog
* **Synthesis:** Cadence Genus
* **Implementation:** Vivado Design Suite
* **FPGA:** Xilinx Artix-7
