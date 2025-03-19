# Lab 2: Digital Design Flow

Welcome to the **Digital Design Flow Lab** for the Hardware and Embedded Security course. This lab guides you through the complete digital design process—from writing HDL to synthesizing, placing, routing, and verifying a CMOS design. The lab emphasizes open source tools and technologies, providing hands‐on experience with modern digital design flows.
  
For more details, please refer to the documents in the `resources/` directory:
- [FromCode toMOS.pdf](resources/FromCode%20toMOS.pdf) (Theoretical Background)
- [lab_description.pdf](resources/lab_description.pdf) (Lab Instructions)

## Theoretical Background

The theoretical material provided in **FromCode toMOS.pdf** covers:
- **Hardware Description Languages (HDL):** An introduction to languages like Verilog, SystemVerilog, and VHDL, used to model digital circuits.
- **Abstraction Levels:** Transitioning from behavioral descriptions to gate-level and transistor-level implementations.
- **Digital Design Flow:** Overview of the entire flow—from initial HDL description, logic synthesis, and physical design (place and route) to tapeout.
- **Technology and PDK:** Insights into using an open Process Design Kit (PDK), such as the Google-Skywater 130nm PDK, including simulation, timing, and layout aspects.

For full details, please review [FromCode toMOS.pdf](resources/FromCode%20toMOS.pdf).

## Lab Description and Objectives

The **lab_description.pdf** explains the practical aspects of this lab, including:
- **Open Technology & CAD Tools:** An introduction to using open source tools such as Icarus Verilog, Yosys, GTKWave, and OpenROAD.
- **Environment Setup:** Instructions for configuring a Virtual Machine (VM) with all necessary tools pre-installed.
- **Simulation and Synthesis:** Step-by-step instructions for simulating an HDL design, performing logic synthesis to generate a netlist, and verifying the design.
- **Place and Route Flow:** Detailed guidance on floorplanning, placement, clock tree synthesis, routing, and design signoff.
  
Review [lab_description.pdf](resources/lab_description.pdf) for the complete set of instructions and detailed command sequences.

## Setup and Environment

To streamline your lab experience, a pre-configured Virtual Machine is available. Follow these steps:

- **Download the Virtual Machine:**  
  [Download Virtual Machine](https://www.dropbox.com/scl/fi/gnhqii8pvcwwu3w9s7jec/openroad-tutorial-micro2022.ova?rlkey=o6vfo5cyyslvzw69f8x306qg1&e=1)

- **VM Details:**  
  The VM is based on Ubuntu and includes all required software:
  - **HDL Simulator:** Icarus Verilog  
  - **Waveform Viewer:** GTKWave  
  - **Logic Synthesizer:** Yosys  
  - **Physical Design Tool:** OpenROAD

Import the Virtual Machine into VirtualBox and follow the lab instructions to complete the setup.

## Directory Structure

This repository is organized to support the different stages of the digital design flow:

- **pnr/**: Files and scripts for the Place and Route phase.
- **sim/**: Simulation files and test benches to verify your HDL designs.
- **sky130_fd_sc_hd/**: The SkyWater 130nm Process Design Kit libraries (including Verilog, Liberty, LEF, and GDS files).
- **src/**: Source files containing your HDL designs.
- **syn/**: Files related to logic synthesis (Yosys scripts and synthesized netlists).
- **tb/**: Test benches for simulating the designs.

This organization is designed to help you follow the design flow from simulation to physical layout.

## Running the Lab

Follow these steps to complete the lab:

1. **Simulation:**
   - **Compile and Simulate:**  
     Use Icarus Verilog to compile the HDL files and run the simulation. For example:
     ```bash
     iverilog -o tb_counter_gen.vvp ../src/counter_gen.v ../tb/tb_counter_gen.v
     vvp tb_counter_gen.vvp
     gtkwave tb_counter_gen.vcd
     ```
   - **Verification:**  
     Check the generated VCD file with GTKWave to ensure your design behaves as expected.

2. **Logic Synthesis:**
   - **Run Yosys:**  
     Execute synthesis scripts to convert your HDL description into a gate-level netlist.
     ```tcl
     read_verilog ../src/counter_gen.v
     synth -top counter_gen
     write_verilog counter_gen.v
     ```
   - **Parameter Setting:**  
     Adjust parameters (e.g., counter bit-width) as needed before synthesis.

3. **Place and Route:**
   - **Initialize OpenROAD:**  
     Launch OpenROAD with the GUI:
     ```bash
     openroad -gui
     ```
   - **Floorplanning and Placement:**  
     Follow the TCL scripts provided in the lab instructions to perform floorplanning, placement, clock tree synthesis, and routing.
   - **Final Verification:**  
     Re-simulate the post-route netlist to confirm timing and functionality.

For full command details and further guidance, see [lab_description.pdf](resources/lab_description.pdf).

## References

- **Google-Skywater 130nm PDK:** [GitHub Repository](https://github.com/google/skywater-pdk)
- **OpenROAD Project:** [OpenROAD Website](https://theopenroadproject.org/)
- **VirtualBox:** [VirtualBox Website](https://www.virtualbox.org/)
- **Pre-configured VM Download:**  
  [Download Virtual Machine](https://www.dropbox.com/scl/fi/gnhqii8pvcwwu3w9s7jec/openroad-tutorial-micro2022.ova?rlkey=o6vfo5cyyslvzw69f8x306qg1&e=1)

Additional details and step-by-step instructions are provided in the resources:
- [FromCode toMOS.pdf](resources/FromCode%20toMOS.pdf)
- [lab_description.pdf](resources/lab_description.pdf)
