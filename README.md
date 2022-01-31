# Verilog Projects

This repository contains various small Verilog projects that have real-life applications. Each project is contained in its own folder with all modules and implementations included. Some projects use Espresso and/or Yosys and have corresponding files included as well.
---
## 7 Segment Display
###### The 7 Segment Display project is a small implementation that takes encoded input and outputs signals designed to light up a 7 segment display. This module only requires inputs and leads to a 7 segment display to work, no hierarchical modules have been used.
## LS74163 Counter
###### This project replicates the LS74163 Counter IC and provides both a Register Transfer Language version and Gate-Level version created by Yosys. The counter does not require any hierarchical modules to run.
## Elevator
###### This project represents the logic of an elevator on a 3-story building. It simulates button presses in order to call the elevator to a certain floor and allows the users to operate the elevator, going through each floor sequentially. No hierarchical modules are required for this program.
---
## Traffic Light Controller
###### The traffic light controller simulates the function of a traffic light with induction loop detectors. It enforces that all lights must be red before allowing a change in flow of traffic. Timing windows are also enforced to prevent traffic backups on particular routes. Included are all parts of the process from conceptualization to implementation. This project does not require any hierarchical files.
## USB Interface
###### This final project mimics the fundamental layout of the USB interface. It takes parallel data in, converts it into serial data out, and translates it back into parallel data on the receiving end. This project was designed on a Lattice FPGA and will not run as expected without it. Included are the required hierarchical modules `piposr_rtl.v` and `bin_7seg_disp_rtl.v` which represent a parallel in parallel out shift register and 7 segment display driver respectively.
# Dependencies
######
1. Icarus Verilog
--* Version 11-20190809
--* Required to run Verilog code
2. Yosys (Not required to run)
--* Version 0.5
--* Used for Gate-Level Synthesis
3. Espresso (Not required to run)
--* Version 2.3
--* Used for RTL representations of a truth table