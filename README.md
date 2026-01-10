# Efficient_Booth_Multiplier_For_FIR_Filter_Structure
This project is Specifically focused on Designing of efficient Booth Multiplier Module for FIR structure which is used for Signal Processing Purpose mainly in Audio Filtering and Image processing , here by provided are The Verilog Files for the Same so Go through README for Understanding,The primary objective is to optimize the Power, Performance, and Specifically Area (PPA) of computational blocks essential for signal processing applications like wearable devices, IoT, and TWS chips.

# This is the Conventional Design which other Research work and authors Proposed
<img width="1123" height="485" alt="image" src="https://github.com/user-attachments/assets/aecc0e47-9932-41ee-9226-10e14258f13c" />

# This is the Block diagram of Our Proposed Design
<img width="1073" height="479" alt="Screenshot 2026-01-10 212950" src="https://github.com/user-attachments/assets/97a2ee30-054e-4656-a32d-b760df06b0bf" />

The project explores various Booth Encoding schemes, specifically comparing Radix-4, Radix-8, and Radix-16 implementations.

* **Centralized Partial Product Generation (CPPG):** Implemented for parallel precomputation of partial products to improve scalability and performance.
                                                  ** So the Info Regarding CPPG which i have explained in PPT which give you better insights how we have Designed. 
* **Bit Append Method:** Utilizes a "bit append" technique instead of traditional RTL shift operators to eliminate extra shift logic and reduce propagation delay.
* **Adder Optimization:** Compares different adder topologies, including Ripple Carry Adders (RCA), Carry Look-Ahead Adders (CLA), and Carry Select Adders (CSLA), to find the best balance of speed and area.



The design was verified and benchmarked using a dual-methodology approach:
* **ASIC Verification:** Performed using Cadence Genus with a 180 nm standard cell library.
* **FPGA Implementation:** Executed in Xilinx Vivado 2024.1 targeting an Artix-7 evaluation board.

| Parameter | Radix-4 | Radix-8 | Radix-16 |
| :--- | :--- | :--- | :--- |
| **8-Bit Delay (ns)** | 8.70 | 9.11 | 10.26 |
| **64-Bit Area Savings** | 58.76% | 35.74% | 31.89% |
| **64-Bit Delay Imp.** | 45.77% | 11.99% | 21.32% |

Initial implementation results for the Radix-16p design revealed a Setup Time Violation with a Worst Negative Slack (WNS) of -0.742 ns.
* **Total Negative Slack (TNS):** -80.105 ns.
* **Failing Endpoints:** 233.
* **Analysis:** The negative WNS indicates the critical path—specifically the logic depth in the partial product summation—exceeds the clock period.
* **Proposed Solution:** Implementing pipelining to break the long combinational paths into smaller, synchronous segments to meet the required timing constraints.



* **Radix-4:** Best suited for compact, high-speed designs with minimal bit-widths (8-bit to 24-bit).
* **Radix-8:** Offers a balanced trade-off between area, speed, and power.
* **Radix-16:** Most power-efficient option, making it ideal for energy-sensitive applications.

* Integration of high-speed adders like Kogge-Stone or Brent-Kung to further accelerate partial product summation.
* Application of low-power approximate adders for highly energy-efficient signal processing.

* Deepak Nair (Sarvajanik College of Engineering and Technology)
* Jeet Gandhi
* Nehal Shah
* Niket Singla (SVNIT Surat)
