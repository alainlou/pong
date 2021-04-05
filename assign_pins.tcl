# Copyright (C) 2020  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions
# and other software and tools, and any partner logic
# functions, and any output files from any of the foregoing
# (including device programming or simulation files), and any
# associated documentation or information are expressly subject
# to the terms and conditions of the Intel Program License
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: assign_wires.tcl
# Generated on: Sat Feb  6 18:29:32 2021

# Load Quartus Prime Tcl Project package
package require ::quartus::project

# Make assignments
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE6E22C8
set_global_assignment -name ORIGINAL_QUARTUS_VERSION 20.1.1
set_global_assignment -name PROJECT_CREATION_TIME_DATE "18:22:15  FEBRUARY 06, 2021"
set_global_assignment -name LAST_QUARTUS_VERSION "20.1.1 Lite Edition"
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (SystemVerilog)"
set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "SYSTEMVERILOG HDL" -section_id eda_simulation
set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_timing
set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_symbol
set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_signal_integrity
set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_boundary_scan
set_location_assignment PIN_25 -to RESET
set_location_assignment PIN_23 -to FPGA_CLK
set_location_assignment PIN_88 -to KEY1
set_location_assignment PIN_89 -to KEY2
set_location_assignment PIN_90 -to KEY3
set_location_assignment PIN_91 -to KEY4
set_location_assignment PIN_110 -to BEEP
set_location_assignment PIN_88 -to CKEY1
set_location_assignment PIN_89 -to CKEY2
set_location_assignment PIN_90 -to CKEY3
set_location_assignment PIN_91 -to CKEY4
set_location_assignment PIN_87 -to LED1
set_location_assignment PIN_86 -to LED2
set_location_assignment PIN_85 -to LED3
set_location_assignment PIN_84 -to LED4
set_location_assignment PIN_114 -to UART_TXD
set_location_assignment PIN_115 -to UART_RXD
set_location_assignment PIN_112 -to TEMP_SCL
set_location_assignment PIN_113 -to TEMP_SDA
set_location_assignment PIN_99 -to I2C_SCL
set_location_assignment PIN_98 -to I2C_SDA
set_location_assignment PIN_119 -to PS2_CLOCK
set_location_assignment PIN_120 -to PS2_DATA
set_location_assignment PIN_100 -to IR
set_location_assignment PIN_101 -to VGA_HSYNC
set_location_assignment PIN_103 -to VGA_VSYNC
set_location_assignment PIN_104 -to VGA_B
set_location_assignment PIN_105 -to VGA_G
set_location_assignment PIN_106 -to VGA_R
set_location_assignment PIN_141 -to LCD_RS
set_location_assignment PIN_138 -to LCD_RW
set_location_assignment PIN_143 -to LCD_E
set_location_assignment PIN_142 -to LCD_D0
set_location_assignment PIN_1 -to LCD_D1
set_location_assignment PIN_144 -to LCD_D2
set_location_assignment PIN_3 -to LCD_D3
set_location_assignment PIN_2 -to LCD_D4
set_location_assignment PIN_10 -to LCD_D5
set_location_assignment PIN_7 -to LCD_D6
set_location_assignment PIN_11 -to LCD_D7
set_location_assignment PIN_133 -to SVNSEG_DIG1
set_location_assignment PIN_135 -to SVNSEG_DIG2
set_location_assignment PIN_136 -to SVNSEG_DIG3
set_location_assignment PIN_137 -to SVNSEG_DIG4
set_location_assignment PIN_128 -to SVNSEG_SEG0
set_location_assignment PIN_121 -to SVNSEG_SEG1
set_location_assignment PIN_125 -to SVNSEG_SEG2
set_location_assignment PIN_129 -to SVNSEG_SEG3
set_location_assignment PIN_132 -to SVNSEG_SEG4
set_location_assignment PIN_126 -to SVNSEG_SEG5
set_location_assignment PIN_124 -to SVNSEG_SEG6
set_location_assignment PIN_127 -to SVNSEG_SEG7
set_location_assignment PIN_28 -to SDRAM_DQ0
set_location_assignment PIN_30 -to SDRAM_DQ1
set_location_assignment PIN_31 -to SDRAM_DQ2
set_location_assignment PIN_32 -to SDRAM_DQ3
set_location_assignment PIN_33 -to SDRAM_DQ4
set_location_assignment PIN_34 -to SDRAM_DQ5
set_location_assignment PIN_38 -to SDRAM_DQ6
set_location_assignment PIN_39 -to SDRAM_DQ7
set_location_assignment PIN_54 -to SDRAM_DQ8
set_location_assignment PIN_53 -to SDRAM_DQ9
set_location_assignment PIN_52 -to SDRAM_DQ10
set_location_assignment PIN_51 -to SDRAM_DQ11
set_location_assignment PIN_50 -to SDRAM_DQ12
set_location_assignment PIN_49 -to SDRAM_DQ13
set_location_assignment PIN_46 -to SDRAM_DQ14
set_location_assignment PIN_44 -to SDRAM_DQ15
set_location_assignment PIN_76 -to SDRAM_A0
set_location_assignment PIN_77 -to SDRAM_A1
set_location_assignment PIN_80 -to SDRAM_A2
set_location_assignment PIN_83 -to SDRAM_A3
set_location_assignment PIN_68 -to SDRAM_A4
set_location_assignment PIN_67 -to SDRAM_A5
set_location_assignment PIN_66 -to SDRAM_A6
set_location_assignment PIN_65 -to SDRAM_A7
set_location_assignment PIN_64 -to SDRAM_A8
set_location_assignment PIN_60 -to SDRAM_A9
set_location_assignment PIN_75 -to SDRAM_A10
set_location_assignment PIN_59 -to SDRAM_A11
set_location_assignment PIN_73 -to SDRAM_BS0
set_location_assignment PIN_74 -to SDRAM_BS1
set_location_assignment PIN_42 -to SDRAM_LDQM
set_location_assignment PIN_55 -to SDRAM_UDQM
set_location_assignment PIN_58 -to SDRAM_CKE
set_location_assignment PIN_43 -to SDRAM_CLK
set_location_assignment PIN_72 -to SDRAM_CS
set_location_assignment PIN_71 -to SDRAM_RAS
set_location_assignment PIN_70 -to SDRAM_CAS
set_location_assignment PIN_69 -to SDRAM_WE

# Commit assignments
export_assignments
