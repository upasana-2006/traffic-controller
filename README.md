# traffic-controller
An FPGA-based smart traffic light controller designed using Verilog HDL and implemented as a Finite State Machine (FSM). The system manages normal traffic signal sequencing and includes an emergency vehicle priority override feature that instantly grants green signal access to emergency routes.

Features:
Traffic light control using FSM architecture
Verilog HDL implementation
Emergency vehicle priority override
Clock-based signal timing
Simulation support using Vivado/ModelSim
FPGA deployment compatible with Xilinx Spartan boards

Technologies Used:
Verilog HDL
Xilinx Vivado / ModelSim
FPGA (Xilinx Spartan Series)
Functional Overview

The controller operates in normal traffic sequencing mode:
Green → Yellow → Red

When an emergency signal is triggered:
Emergency lane immediately turns GREEN
Opposite lane switches to RED
System resumes normal operation after override ends

Applications:
Smart traffic management systems
Emergency vehicle routing
Intelligent transportation systems
FPGA-based digital design projects
Simulation

The project includes:
RTL design
Testbench
Waveform simulation for normal and emergency conditions
Future Improvements
Sensor-based adaptive timing
IoT-enabled monitoring
Multi-road intersection support
AI-based traffic optimization
