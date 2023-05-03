-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/03/2023 13:21:30"

-- 
-- Device: Altera 10M25SAE144C8G Package EQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_16,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_18,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_19,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_129,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_136,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_138,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Stage2_Test IS
    PORT (
	PC_R1 : IN std_logic_vector(15 DOWNTO 0);
	Instr_R1 : IN std_logic_vector(15 DOWNTO 0);
	A_R1 : IN std_logic_vector(15 DOWNTO 0);
	clock : IN std_logic
	);
END Stage2_Test;

-- Design Ports Information
-- PC_R1[0]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[1]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[2]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[3]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[4]	=>  Location: PIN_22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[5]	=>  Location: PIN_92,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[6]	=>  Location: PIN_118,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[7]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[8]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[9]	=>  Location: PIN_62,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[10]	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[11]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[12]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[13]	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[14]	=>  Location: PIN_57,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[15]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[0]	=>  Location: PIN_78,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[1]	=>  Location: PIN_122,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[2]	=>  Location: PIN_48,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[3]	=>  Location: PIN_79,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[4]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[5]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[6]	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[7]	=>  Location: PIN_14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[8]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[9]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[10]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[11]	=>  Location: PIN_134,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[12]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[13]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[14]	=>  Location: PIN_17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[15]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[0]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[1]	=>  Location: PIN_131,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[2]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[3]	=>  Location: PIN_41,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[4]	=>  Location: PIN_27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[5]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[6]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[7]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[8]	=>  Location: PIN_123,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[9]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[10]	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[11]	=>  Location: PIN_21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[12]	=>  Location: PIN_130,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[13]	=>  Location: PIN_140,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[14]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_R1[15]	=>  Location: PIN_45,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Stage2_Test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_PC_R1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Instr_R1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_A_R1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_clock : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \PC_R1[0]~input_o\ : std_logic;
SIGNAL \PC_R1[1]~input_o\ : std_logic;
SIGNAL \PC_R1[2]~input_o\ : std_logic;
SIGNAL \PC_R1[3]~input_o\ : std_logic;
SIGNAL \PC_R1[4]~input_o\ : std_logic;
SIGNAL \PC_R1[5]~input_o\ : std_logic;
SIGNAL \PC_R1[6]~input_o\ : std_logic;
SIGNAL \PC_R1[7]~input_o\ : std_logic;
SIGNAL \PC_R1[8]~input_o\ : std_logic;
SIGNAL \PC_R1[9]~input_o\ : std_logic;
SIGNAL \PC_R1[10]~input_o\ : std_logic;
SIGNAL \PC_R1[11]~input_o\ : std_logic;
SIGNAL \PC_R1[12]~input_o\ : std_logic;
SIGNAL \PC_R1[13]~input_o\ : std_logic;
SIGNAL \PC_R1[14]~input_o\ : std_logic;
SIGNAL \PC_R1[15]~input_o\ : std_logic;
SIGNAL \Instr_R1[0]~input_o\ : std_logic;
SIGNAL \Instr_R1[1]~input_o\ : std_logic;
SIGNAL \Instr_R1[2]~input_o\ : std_logic;
SIGNAL \Instr_R1[3]~input_o\ : std_logic;
SIGNAL \Instr_R1[4]~input_o\ : std_logic;
SIGNAL \Instr_R1[5]~input_o\ : std_logic;
SIGNAL \Instr_R1[6]~input_o\ : std_logic;
SIGNAL \Instr_R1[7]~input_o\ : std_logic;
SIGNAL \Instr_R1[8]~input_o\ : std_logic;
SIGNAL \Instr_R1[9]~input_o\ : std_logic;
SIGNAL \Instr_R1[10]~input_o\ : std_logic;
SIGNAL \Instr_R1[11]~input_o\ : std_logic;
SIGNAL \Instr_R1[12]~input_o\ : std_logic;
SIGNAL \Instr_R1[13]~input_o\ : std_logic;
SIGNAL \Instr_R1[14]~input_o\ : std_logic;
SIGNAL \Instr_R1[15]~input_o\ : std_logic;
SIGNAL \A_R1[0]~input_o\ : std_logic;
SIGNAL \A_R1[1]~input_o\ : std_logic;
SIGNAL \A_R1[2]~input_o\ : std_logic;
SIGNAL \A_R1[3]~input_o\ : std_logic;
SIGNAL \A_R1[4]~input_o\ : std_logic;
SIGNAL \A_R1[5]~input_o\ : std_logic;
SIGNAL \A_R1[6]~input_o\ : std_logic;
SIGNAL \A_R1[7]~input_o\ : std_logic;
SIGNAL \A_R1[8]~input_o\ : std_logic;
SIGNAL \A_R1[9]~input_o\ : std_logic;
SIGNAL \A_R1[10]~input_o\ : std_logic;
SIGNAL \A_R1[11]~input_o\ : std_logic;
SIGNAL \A_R1[12]~input_o\ : std_logic;
SIGNAL \A_R1[13]~input_o\ : std_logic;
SIGNAL \A_R1[14]~input_o\ : std_logic;
SIGNAL \A_R1[15]~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_PC_R1 <= PC_R1;
ww_Instr_R1 <= Instr_R1;
ww_A_R1 <= A_R1;
ww_clock <= clock;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y34_N8
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOIBUF_X0_Y3_N22
\PC_R1[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(0),
	o => \PC_R1[0]~input_o\);

-- Location: IOIBUF_X24_Y0_N29
\PC_R1[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(1),
	o => \PC_R1[1]~input_o\);

-- Location: IOIBUF_X60_Y31_N22
\PC_R1[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(2),
	o => \PC_R1[2]~input_o\);

-- Location: IOIBUF_X60_Y14_N15
\PC_R1[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(3),
	o => \PC_R1[3]~input_o\);

-- Location: IOIBUF_X0_Y16_N22
\PC_R1[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(4),
	o => \PC_R1[4]~input_o\);

-- Location: IOIBUF_X60_Y15_N22
\PC_R1[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(5),
	o => \PC_R1[5]~input_o\);

-- Location: IOIBUF_X28_Y36_N1
\PC_R1[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(6),
	o => \PC_R1[6]~input_o\);

-- Location: IOIBUF_X38_Y36_N15
\PC_R1[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(7),
	o => \PC_R1[7]~input_o\);

-- Location: IOIBUF_X60_Y8_N1
\PC_R1[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(8),
	o => \PC_R1[8]~input_o\);

-- Location: IOIBUF_X36_Y0_N8
\PC_R1[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(9),
	o => \PC_R1[9]~input_o\);

-- Location: IOIBUF_X3_Y0_N1
\PC_R1[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(10),
	o => \PC_R1[10]~input_o\);

-- Location: IOIBUF_X21_Y0_N29
\PC_R1[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(11),
	o => \PC_R1[11]~input_o\);

-- Location: IOIBUF_X8_Y0_N15
\PC_R1[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(12),
	o => \PC_R1[12]~input_o\);

-- Location: IOIBUF_X25_Y27_N22
\PC_R1[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(13),
	o => \PC_R1[13]~input_o\);

-- Location: IOIBUF_X21_Y0_N1
\PC_R1[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(14),
	o => \PC_R1[14]~input_o\);

-- Location: IOIBUF_X0_Y15_N22
\PC_R1[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_R1(15),
	o => \PC_R1[15]~input_o\);

-- Location: IOIBUF_X60_Y8_N8
\Instr_R1[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(0),
	o => \Instr_R1[0]~input_o\);

-- Location: IOIBUF_X16_Y21_N15
\Instr_R1[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(1),
	o => \Instr_R1[1]~input_o\);

-- Location: IOIBUF_X16_Y0_N29
\Instr_R1[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(2),
	o => \Instr_R1[2]~input_o\);

-- Location: IOIBUF_X60_Y8_N22
\Instr_R1[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(3),
	o => \Instr_R1[3]~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\Instr_R1[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(4),
	o => \Instr_R1[4]~input_o\);

-- Location: IOIBUF_X60_Y10_N15
\Instr_R1[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(5),
	o => \Instr_R1[5]~input_o\);

-- Location: IOIBUF_X40_Y0_N22
\Instr_R1[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(6),
	o => \Instr_R1[6]~input_o\);

-- Location: IOIBUF_X25_Y26_N22
\Instr_R1[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(7),
	o => \Instr_R1[7]~input_o\);

-- Location: IOIBUF_X60_Y14_N22
\Instr_R1[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(8),
	o => \Instr_R1[8]~input_o\);

-- Location: IOIBUF_X8_Y21_N22
\Instr_R1[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(9),
	o => \Instr_R1[9]~input_o\);

-- Location: IOIBUF_X0_Y3_N15
\Instr_R1[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(10),
	o => \Instr_R1[10]~input_o\);

-- Location: IOIBUF_X10_Y21_N1
\Instr_R1[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(11),
	o => \Instr_R1[11]~input_o\);

-- Location: IOIBUF_X14_Y21_N29
\Instr_R1[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(12),
	o => \Instr_R1[12]~input_o\);

-- Location: IOIBUF_X40_Y36_N29
\Instr_R1[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(13),
	o => \Instr_R1[13]~input_o\);

-- Location: IOIBUF_X0_Y18_N1
\Instr_R1[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(14),
	o => \Instr_R1[14]~input_o\);

-- Location: IOIBUF_X14_Y21_N22
\Instr_R1[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Instr_R1(15),
	o => \Instr_R1[15]~input_o\);

-- Location: IOIBUF_X6_Y0_N29
\A_R1[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(0),
	o => \A_R1[0]~input_o\);

-- Location: IOIBUF_X12_Y21_N8
\A_R1[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(1),
	o => \A_R1[1]~input_o\);

-- Location: IOIBUF_X0_Y10_N1
\A_R1[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(2),
	o => \A_R1[2]~input_o\);

-- Location: IOIBUF_X6_Y0_N8
\A_R1[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(3),
	o => \A_R1[3]~input_o\);

-- Location: IOIBUF_X0_Y13_N22
\A_R1[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(4),
	o => \A_R1[4]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\A_R1[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(5),
	o => \A_R1[5]~input_o\);

-- Location: IOIBUF_X19_Y0_N22
\A_R1[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(6),
	o => \A_R1[6]~input_o\);

-- Location: IOIBUF_X19_Y21_N29
\A_R1[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(7),
	o => \A_R1[7]~input_o\);

-- Location: IOIBUF_X14_Y21_N1
\A_R1[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(8),
	o => \A_R1[8]~input_o\);

-- Location: IOIBUF_X0_Y11_N15
\A_R1[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(9),
	o => \A_R1[9]~input_o\);

-- Location: IOIBUF_X25_Y29_N22
\A_R1[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(10),
	o => \A_R1[10]~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\A_R1[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(11),
	o => \A_R1[11]~input_o\);

-- Location: IOIBUF_X12_Y21_N1
\A_R1[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(12),
	o => \A_R1[12]~input_o\);

-- Location: IOIBUF_X8_Y21_N15
\A_R1[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(13),
	o => \A_R1[13]~input_o\);

-- Location: IOIBUF_X0_Y15_N15
\A_R1[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(14),
	o => \A_R1[14]~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\A_R1[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_R1(15),
	o => \A_R1[15]~input_o\);

-- Location: IOIBUF_X25_Y29_N15
\clock~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: UNVM_X0_Y22_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X25_Y34_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X25_Y33_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);
END structure;


