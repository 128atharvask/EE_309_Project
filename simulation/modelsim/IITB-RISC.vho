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

-- DATE "04/30/2023 20:25:20"

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

ENTITY 	Stage2_ID IS
    PORT (
	PC_R1 : IN std_logic_vector(15 DOWNTO 0);
	Instr_R1 : IN std_logic_vector(15 DOWNTO 0);
	ct1 : IN std_logic_vector(2 DOWNTO 0);
	ct2 : IN std_logic_vector(2 DOWNTO 0);
	Hzd_in : IN std_logic;
	clock : IN std_logic;
	PC_R2 : BUFFER std_logic_vector(15 DOWNTO 0);
	Instr_R2 : BUFFER std_logic_vector(15 DOWNTO 0);
	Counter1_R2 : BUFFER std_logic_vector(2 DOWNTO 0);
	Hzd_out : BUFFER std_logic;
	PR1_en : BUFFER std_logic;
	ControlSig_R2_RFWR : BUFFER std_logic;
	ControlSig_R2_M2WR : BUFFER std_logic
	);
END Stage2_ID;

-- Design Ports Information
-- ct1[0]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct1[1]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct1[2]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct2[0]	=>  Location: PIN_92,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct2[1]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ct2[2]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[0]	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[1]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[2]	=>  Location: PIN_48,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[3]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[4]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[5]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[6]	=>  Location: PIN_140,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[7]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[8]	=>  Location: PIN_57,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[9]	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[10]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[11]	=>  Location: PIN_41,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[12]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[13]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[14]	=>  Location: PIN_26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R2[15]	=>  Location: PIN_79,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[0]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[1]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[2]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[3]	=>  Location: PIN_21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[4]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[5]	=>  Location: PIN_122,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[6]	=>  Location: PIN_93,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[7]	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[8]	=>  Location: PIN_130,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[9]	=>  Location: PIN_123,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[10]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[11]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[12]	=>  Location: PIN_96,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[13]	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[14]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R2[15]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Counter1_R2[0]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Counter1_R2[1]	=>  Location: PIN_97,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Counter1_R2[2]	=>  Location: PIN_17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hzd_out	=>  Location: PIN_62,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PR1_en	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ControlSig_R2_RFWR	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ControlSig_R2_M2WR	=>  Location: PIN_134,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[0]	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[1]	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[2]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[3]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[4]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[5]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[6]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[7]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[8]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[9]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[10]	=>  Location: PIN_45,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[11]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[12]	=>  Location: PIN_56,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[13]	=>  Location: PIN_81,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[14]	=>  Location: PIN_27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_R1[15]	=>  Location: PIN_78,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[0]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[13]	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[14]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[15]	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[1]	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[2]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[3]	=>  Location: PIN_102,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[4]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[5]	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[9]	=>  Location: PIN_118,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[6]	=>  Location: PIN_14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[10]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[7]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[11]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[8]	=>  Location: PIN_131,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Instr_R1[12]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hzd_in	=>  Location: PIN_61,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Stage2_ID IS
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
SIGNAL ww_ct1 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ct2 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Hzd_in : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_PC_R2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Instr_R2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Counter1_R2 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Hzd_out : std_logic;
SIGNAL ww_PR1_en : std_logic;
SIGNAL ww_ControlSig_R2_RFWR : std_logic;
SIGNAL ww_ControlSig_R2_M2WR : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Mux16~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ct1[0]~input_o\ : std_logic;
SIGNAL \ct1[1]~input_o\ : std_logic;
SIGNAL \ct1[2]~input_o\ : std_logic;
SIGNAL \ct2[0]~input_o\ : std_logic;
SIGNAL \ct2[1]~input_o\ : std_logic;
SIGNAL \ct2[2]~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \PC_R2[0]~output_o\ : std_logic;
SIGNAL \PC_R2[1]~output_o\ : std_logic;
SIGNAL \PC_R2[2]~output_o\ : std_logic;
SIGNAL \PC_R2[3]~output_o\ : std_logic;
SIGNAL \PC_R2[4]~output_o\ : std_logic;
SIGNAL \PC_R2[5]~output_o\ : std_logic;
SIGNAL \PC_R2[6]~output_o\ : std_logic;
SIGNAL \PC_R2[7]~output_o\ : std_logic;
SIGNAL \PC_R2[8]~output_o\ : std_logic;
SIGNAL \PC_R2[9]~output_o\ : std_logic;
SIGNAL \PC_R2[10]~output_o\ : std_logic;
SIGNAL \PC_R2[11]~output_o\ : std_logic;
SIGNAL \PC_R2[12]~output_o\ : std_logic;
SIGNAL \PC_R2[13]~output_o\ : std_logic;
SIGNAL \PC_R2[14]~output_o\ : std_logic;
SIGNAL \PC_R2[15]~output_o\ : std_logic;
SIGNAL \Instr_R2[0]~output_o\ : std_logic;
SIGNAL \Instr_R2[1]~output_o\ : std_logic;
SIGNAL \Instr_R2[2]~output_o\ : std_logic;
SIGNAL \Instr_R2[3]~output_o\ : std_logic;
SIGNAL \Instr_R2[4]~output_o\ : std_logic;
SIGNAL \Instr_R2[5]~output_o\ : std_logic;
SIGNAL \Instr_R2[6]~output_o\ : std_logic;
SIGNAL \Instr_R2[7]~output_o\ : std_logic;
SIGNAL \Instr_R2[8]~output_o\ : std_logic;
SIGNAL \Instr_R2[9]~output_o\ : std_logic;
SIGNAL \Instr_R2[10]~output_o\ : std_logic;
SIGNAL \Instr_R2[11]~output_o\ : std_logic;
SIGNAL \Instr_R2[12]~output_o\ : std_logic;
SIGNAL \Instr_R2[13]~output_o\ : std_logic;
SIGNAL \Instr_R2[14]~output_o\ : std_logic;
SIGNAL \Instr_R2[15]~output_o\ : std_logic;
SIGNAL \Counter1_R2[0]~output_o\ : std_logic;
SIGNAL \Counter1_R2[1]~output_o\ : std_logic;
SIGNAL \Counter1_R2[2]~output_o\ : std_logic;
SIGNAL \Hzd_out~output_o\ : std_logic;
SIGNAL \PR1_en~output_o\ : std_logic;
SIGNAL \ControlSig_R2_RFWR~output_o\ : std_logic;
SIGNAL \ControlSig_R2_M2WR~output_o\ : std_logic;
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
SIGNAL \Instr_R1[15]~input_o\ : std_logic;
SIGNAL \Instr_R1[14]~input_o\ : std_logic;
SIGNAL \Instr_R1[13]~input_o\ : std_logic;
SIGNAL \stage_proc:ct1[0]~0_combout\ : std_logic;
SIGNAL \Add1~1_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \stage_proc:ct1[1]~combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \stage_proc:ct1[2]~combout\ : std_logic;
SIGNAL \Instr_R1[6]~input_o\ : std_logic;
SIGNAL \Instr_R1[7]~input_o\ : std_logic;
SIGNAL \Instr_R1[5]~input_o\ : std_logic;
SIGNAL \Instr_R1[4]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Instr_R1[3]~input_o\ : std_logic;
SIGNAL \Instr_R1[2]~input_o\ : std_logic;
SIGNAL \Instr_R1[1]~input_o\ : std_logic;
SIGNAL \Instr_R1[0]~input_o\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Mux22~0_combout\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Mux16~0_combout\ : std_logic;
SIGNAL \Mux16~0clkctrl_outclk\ : std_logic;
SIGNAL \stage_proc:ct2[0]~combout\ : std_logic;
SIGNAL \ct2~0_combout\ : std_logic;
SIGNAL \Mux15~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \stage_proc:ct2[1]~combout\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \stage_proc:ct2[2]~combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Instr_R1[9]~input_o\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Instr_R1[10]~input_o\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Instr_R1[8]~input_o\ : std_logic;
SIGNAL \Instr_R1[11]~input_o\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Instr_R1[12]~input_o\ : std_logic;
SIGNAL \Mux20~0_combout\ : std_logic;
SIGNAL \Mux19~0_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Hzd_in~input_o\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Mux21~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_PC_R1 <= PC_R1;
ww_Instr_R1 <= Instr_R1;
ww_ct1 <= ct1;
ww_ct2 <= ct2;
ww_Hzd_in <= Hzd_in;
ww_clock <= clock;
PC_R2 <= ww_PC_R2;
Instr_R2 <= ww_Instr_R2;
Counter1_R2 <= ww_Counter1_R2;
Hzd_out <= ww_Hzd_out;
PR1_en <= ww_PR1_en;
ControlSig_R2_RFWR <= ww_ControlSig_R2_RFWR;
ControlSig_R2_M2WR <= ww_ControlSig_R2_M2WR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\Mux16~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Mux16~0_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y23_N24
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

-- Location: IOOBUF_X60_Y2_N23
\PC_R2[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[0]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[0]~output_o\);

-- Location: IOOBUF_X60_Y2_N16
\PC_R2[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[1]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[1]~output_o\);

-- Location: IOOBUF_X16_Y0_N30
\PC_R2[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[2]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[2]~output_o\);

-- Location: IOOBUF_X0_Y3_N16
\PC_R2[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[3]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[3]~output_o\);

-- Location: IOOBUF_X60_Y14_N23
\PC_R2[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[4]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[4]~output_o\);

-- Location: IOOBUF_X60_Y10_N2
\PC_R2[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[5]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[5]~output_o\);

-- Location: IOOBUF_X8_Y21_N16
\PC_R2[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[6]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[6]~output_o\);

-- Location: IOOBUF_X0_Y15_N16
\PC_R2[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[7]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[7]~output_o\);

-- Location: IOOBUF_X21_Y0_N2
\PC_R2[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[8]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[8]~output_o\);

-- Location: IOOBUF_X40_Y0_N23
\PC_R2[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[9]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[9]~output_o\);

-- Location: IOOBUF_X6_Y0_N2
\PC_R2[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[10]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[10]~output_o\);

-- Location: IOOBUF_X6_Y0_N9
\PC_R2[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[11]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[11]~output_o\);

-- Location: IOOBUF_X21_Y0_N30
\PC_R2[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[12]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[12]~output_o\);

-- Location: IOOBUF_X60_Y8_N2
\PC_R2[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[13]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[13]~output_o\);

-- Location: IOOBUF_X0_Y13_N16
\PC_R2[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[14]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[14]~output_o\);

-- Location: IOOBUF_X60_Y8_N23
\PC_R2[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_R1[15]~input_o\,
	devoe => ww_devoe,
	o => \PC_R2[15]~output_o\);

-- Location: IOOBUF_X10_Y21_N16
\Instr_R2[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~1_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[0]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\Instr_R2[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux14~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[1]~output_o\);

-- Location: IOOBUF_X14_Y21_N23
\Instr_R2[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux13~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[2]~output_o\);

-- Location: IOOBUF_X0_Y16_N16
\Instr_R2[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux12~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[3]~output_o\);

-- Location: IOOBUF_X60_Y31_N23
\Instr_R2[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux11~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[4]~output_o\);

-- Location: IOOBUF_X16_Y21_N16
\Instr_R2[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[5]~output_o\);

-- Location: IOOBUF_X60_Y15_N16
\Instr_R2[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[6]~output_o\);

-- Location: IOOBUF_X60_Y31_N16
\Instr_R2[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[7]~output_o\);

-- Location: IOOBUF_X12_Y21_N2
\Instr_R2[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[8]~output_o\);

-- Location: IOOBUF_X14_Y21_N2
\Instr_R2[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[9]~output_o\);

-- Location: IOOBUF_X28_Y36_N9
\Instr_R2[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[10]~output_o\);

-- Location: IOOBUF_X19_Y21_N23
\Instr_R2[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => \Instr_R2[11]~output_o\);

-- Location: IOOBUF_X60_Y22_N24
\Instr_R2[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Instr_R1[12]~input_o\,
	devoe => ww_devoe,
	o => \Instr_R2[12]~output_o\);

-- Location: IOOBUF_X25_Y29_N23
\Instr_R2[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Instr_R1[13]~input_o\,
	devoe => ww_devoe,
	o => \Instr_R2[13]~output_o\);

-- Location: IOOBUF_X40_Y36_N30
\Instr_R2[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Instr_R1[14]~input_o\,
	devoe => ww_devoe,
	o => \Instr_R2[14]~output_o\);

-- Location: IOOBUF_X60_Y23_N9
\Instr_R2[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Instr_R1[15]~input_o\,
	devoe => ww_devoe,
	o => \Instr_R2[15]~output_o\);

-- Location: IOOBUF_X58_Y36_N2
\Counter1_R2[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux20~0_combout\,
	devoe => ww_devoe,
	o => \Counter1_R2[0]~output_o\);

-- Location: IOOBUF_X60_Y22_N9
\Counter1_R2[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux19~0_combout\,
	devoe => ww_devoe,
	o => \Counter1_R2[1]~output_o\);

-- Location: IOOBUF_X0_Y18_N2
\Counter1_R2[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux18~0_combout\,
	devoe => ww_devoe,
	o => \Counter1_R2[2]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\Hzd_out~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Hzd_in~input_o\,
	devoe => ww_devoe,
	o => \Hzd_out~output_o\);

-- Location: IOOBUF_X60_Y23_N23
\PR1_en~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => \PR1_en~output_o\);

-- Location: IOOBUF_X25_Y26_N16
\ControlSig_R2_RFWR~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux17~0_combout\,
	devoe => ww_devoe,
	o => \ControlSig_R2_RFWR~output_o\);

-- Location: IOOBUF_X10_Y21_N2
\ControlSig_R2_M2WR~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux21~0_combout\,
	devoe => ww_devoe,
	o => \ControlSig_R2_M2WR~output_o\);

-- Location: IOIBUF_X60_Y2_N8
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

-- Location: IOIBUF_X60_Y2_N1
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

-- Location: IOIBUF_X16_Y0_N8
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

-- Location: IOIBUF_X0_Y3_N22
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

-- Location: IOIBUF_X60_Y14_N15
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

-- Location: IOIBUF_X60_Y10_N8
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

-- Location: IOIBUF_X8_Y21_N22
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

-- Location: IOIBUF_X0_Y15_N22
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

-- Location: IOIBUF_X24_Y0_N29
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

-- Location: IOIBUF_X40_Y0_N29
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

-- Location: IOIBUF_X8_Y0_N8
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

-- Location: IOIBUF_X6_Y0_N29
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

-- Location: IOIBUF_X21_Y0_N22
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

-- Location: IOIBUF_X60_Y8_N15
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

-- Location: IOIBUF_X0_Y13_N22
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

-- Location: IOIBUF_X60_Y8_N8
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

-- Location: IOIBUF_X60_Y23_N15
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

-- Location: IOIBUF_X40_Y36_N15
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

-- Location: IOIBUF_X25_Y28_N15
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

-- Location: LCCOMB_X26_Y28_N8
\stage_proc:ct1[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \stage_proc:ct1[0]~0_combout\ = \stage_proc:ct1[0]~0_combout\ $ (((!\Instr_R1[15]~input_o\ & (\Instr_R1[14]~input_o\ & \Instr_R1[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[15]~input_o\,
	datab => \Instr_R1[14]~input_o\,
	datac => \stage_proc:ct1[0]~0_combout\,
	datad => \Instr_R1[13]~input_o\,
	combout => \stage_proc:ct1[0]~0_combout\);

-- Location: LCCOMB_X27_Y28_N24
\Add1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~1_combout\ = \stage_proc:ct1[0]~0_combout\ $ (\stage_proc:ct1[1]~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \stage_proc:ct1[0]~0_combout\,
	datad => \stage_proc:ct1[1]~combout\,
	combout => \Add1~1_combout\);

-- Location: LCCOMB_X27_Y28_N22
\Mux15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\Instr_R1[14]~input_o\ & (!\Instr_R1[15]~input_o\ & \Instr_R1[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Instr_R1[14]~input_o\,
	datac => \Instr_R1[15]~input_o\,
	datad => \Instr_R1[13]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X27_Y28_N12
\stage_proc:ct1[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \stage_proc:ct1[1]~combout\ = (\Mux15~0_combout\ & (\Add1~1_combout\)) # (!\Mux15~0_combout\ & ((\stage_proc:ct1[1]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~1_combout\,
	datac => \Mux15~0_combout\,
	datad => \stage_proc:ct1[1]~combout\,
	combout => \stage_proc:ct1[1]~combout\);

-- Location: LCCOMB_X26_Y28_N14
\Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = \stage_proc:ct1[2]~combout\ $ (((\stage_proc:ct1[1]~combout\ & \stage_proc:ct1[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct1[2]~combout\,
	datab => \stage_proc:ct1[1]~combout\,
	datac => \stage_proc:ct1[0]~0_combout\,
	combout => \Add1~0_combout\);

-- Location: LCCOMB_X27_Y28_N10
\stage_proc:ct1[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \stage_proc:ct1[2]~combout\ = (\Mux15~0_combout\ & ((\Add1~0_combout\))) # (!\Mux15~0_combout\ & (\stage_proc:ct1[2]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct1[2]~combout\,
	datab => \Add1~0_combout\,
	datac => \Mux15~0_combout\,
	combout => \stage_proc:ct1[2]~combout\);

-- Location: IOIBUF_X25_Y26_N22
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

-- Location: IOIBUF_X12_Y21_N29
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

-- Location: IOIBUF_X25_Y27_N22
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

-- Location: IOIBUF_X25_Y27_N15
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

-- Location: LCCOMB_X26_Y28_N4
\Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\stage_proc:ct1[0]~0_combout\ & ((\Instr_R1[5]~input_o\) # ((\stage_proc:ct1[1]~combout\)))) # (!\stage_proc:ct1[0]~0_combout\ & (((\Instr_R1[4]~input_o\ & !\stage_proc:ct1[1]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[5]~input_o\,
	datab => \Instr_R1[4]~input_o\,
	datac => \stage_proc:ct1[0]~0_combout\,
	datad => \stage_proc:ct1[1]~combout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X26_Y28_N6
\Mux0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\stage_proc:ct1[1]~combout\ & ((\Mux0~0_combout\ & ((\Instr_R1[7]~input_o\))) # (!\Mux0~0_combout\ & (\Instr_R1[6]~input_o\)))) # (!\stage_proc:ct1[1]~combout\ & (((\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[6]~input_o\,
	datab => \Instr_R1[7]~input_o\,
	datac => \stage_proc:ct1[1]~combout\,
	datad => \Mux0~0_combout\,
	combout => \Mux0~1_combout\);

-- Location: IOIBUF_X60_Y23_N1
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

-- Location: IOIBUF_X25_Y28_N22
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

-- Location: IOIBUF_X25_Y29_N15
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

-- Location: IOIBUF_X14_Y21_N29
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

-- Location: LCCOMB_X26_Y28_N16
\Mux0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\stage_proc:ct1[0]~0_combout\ & ((\Instr_R1[1]~input_o\) # ((\stage_proc:ct1[1]~combout\)))) # (!\stage_proc:ct1[0]~0_combout\ & (((!\stage_proc:ct1[1]~combout\ & \Instr_R1[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[1]~input_o\,
	datab => \stage_proc:ct1[0]~0_combout\,
	datac => \stage_proc:ct1[1]~combout\,
	datad => \Instr_R1[0]~input_o\,
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X26_Y28_N2
\Mux0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\stage_proc:ct1[1]~combout\ & ((\Mux0~2_combout\ & (\Instr_R1[3]~input_o\)) # (!\Mux0~2_combout\ & ((\Instr_R1[2]~input_o\))))) # (!\stage_proc:ct1[1]~combout\ & (((\Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[3]~input_o\,
	datab => \Instr_R1[2]~input_o\,
	datac => \stage_proc:ct1[1]~combout\,
	datad => \Mux0~2_combout\,
	combout => \Mux0~3_combout\);

-- Location: LCCOMB_X26_Y28_N0
\Mux22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux22~0_combout\ = (!\ct2~0_combout\ & ((\stage_proc:ct1[2]~combout\ & (\Mux0~1_combout\)) # (!\stage_proc:ct1[2]~combout\ & ((\Mux0~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ct2~0_combout\,
	datab => \stage_proc:ct1[2]~combout\,
	datac => \Mux0~1_combout\,
	datad => \Mux0~3_combout\,
	combout => \Mux22~0_combout\);

-- Location: LCCOMB_X27_Y28_N30
\Mux0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = (\stage_proc:ct1[2]~combout\ & (\Mux0~1_combout\)) # (!\stage_proc:ct1[2]~combout\ & ((\Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct1[2]~combout\,
	datac => \Mux0~1_combout\,
	datad => \Mux0~3_combout\,
	combout => \Mux0~4_combout\);

-- Location: LCCOMB_X26_Y28_N20
\Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!\stage_proc:ct1[2]~combout\ & (!\stage_proc:ct1[0]~0_combout\ & !\stage_proc:ct1[1]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \stage_proc:ct1[2]~combout\,
	datac => \stage_proc:ct1[0]~0_combout\,
	datad => \stage_proc:ct1[1]~combout\,
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X27_Y28_N6
\Mux16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux16~0_combout\ = (\Mux15~0_combout\ & ((\Mux0~4_combout\) # (\Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~4_combout\,
	datac => \Mux15~0_combout\,
	datad => \Equal1~0_combout\,
	combout => \Mux16~0_combout\);

-- Location: CLKCTRL_G10
\Mux16~0clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Mux16~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Mux16~0clkctrl_outclk\);

-- Location: LCCOMB_X26_Y28_N12
\stage_proc:ct2[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \stage_proc:ct2[0]~combout\ = (GLOBAL(\Mux16~0clkctrl_outclk\) & (\Mux22~0_combout\)) # (!GLOBAL(\Mux16~0clkctrl_outclk\) & ((\stage_proc:ct2[0]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux22~0_combout\,
	datac => \Mux16~0clkctrl_outclk\,
	datad => \stage_proc:ct2[0]~combout\,
	combout => \stage_proc:ct2[0]~combout\);

-- Location: LCCOMB_X26_Y28_N26
\ct2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ct2~0_combout\ = (\stage_proc:ct2[0]~combout\ & ((\stage_proc:ct1[2]~combout\) # ((\stage_proc:ct1[1]~combout\) # (\stage_proc:ct1[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct1[2]~combout\,
	datab => \stage_proc:ct1[1]~combout\,
	datac => \stage_proc:ct1[0]~0_combout\,
	datad => \stage_proc:ct2[0]~combout\,
	combout => \ct2~0_combout\);

-- Location: LCCOMB_X26_Y21_N24
\Mux15~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~1_combout\ = (\Mux15~0_combout\ & (\ct2~0_combout\)) # (!\Mux15~0_combout\ & ((\Instr_R1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ct2~0_combout\,
	datab => \Instr_R1[0]~input_o\,
	datac => \Mux15~0_combout\,
	combout => \Mux15~1_combout\);

-- Location: LCCOMB_X26_Y28_N18
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \ct2~0_combout\ $ (((\Equal1~0_combout\) # (!\stage_proc:ct2[1]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct2[1]~combout\,
	datab => \Equal1~0_combout\,
	datad => \ct2~0_combout\,
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X26_Y28_N30
\Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\Add0~0_combout\) # ((\stage_proc:ct1[2]~combout\ & (!\Mux0~1_combout\)) # (!\stage_proc:ct1[2]~combout\ & ((!\Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct1[2]~combout\,
	datab => \Mux0~1_combout\,
	datac => \Add0~0_combout\,
	datad => \Mux0~3_combout\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X26_Y28_N10
\stage_proc:ct2[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \stage_proc:ct2[1]~combout\ = (GLOBAL(\Mux16~0clkctrl_outclk\) & ((!\Mux3~0_combout\))) # (!GLOBAL(\Mux16~0clkctrl_outclk\) & (\stage_proc:ct2[1]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct2[1]~combout\,
	datac => \Mux3~0_combout\,
	datad => \Mux16~0clkctrl_outclk\,
	combout => \stage_proc:ct2[1]~combout\);

-- Location: LCCOMB_X27_Y28_N26
\Mux14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (\Mux15~0_combout\ & (!\Equal1~0_combout\ & ((\stage_proc:ct2[1]~combout\)))) # (!\Mux15~0_combout\ & (((\Instr_R1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => \Mux15~0_combout\,
	datac => \Instr_R1[1]~input_o\,
	datad => \stage_proc:ct2[1]~combout\,
	combout => \Mux14~0_combout\);

-- Location: LCCOMB_X26_Y28_N28
\Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = (\stage_proc:ct2[1]~combout\ & (\ct2~0_combout\ $ (((\Equal1~0_combout\) # (!\stage_proc:ct2[2]~combout\))))) # (!\stage_proc:ct2[1]~combout\ & (((\Equal1~0_combout\) # (!\stage_proc:ct2[2]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011110000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct2[1]~combout\,
	datab => \ct2~0_combout\,
	datac => \stage_proc:ct2[2]~combout\,
	datad => \Equal1~0_combout\,
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X26_Y28_N24
\Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (!\Add0~1_combout\ & ((\stage_proc:ct1[2]~combout\ & ((\Mux0~1_combout\))) # (!\stage_proc:ct1[2]~combout\ & (\Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Mux0~3_combout\,
	datac => \stage_proc:ct1[2]~combout\,
	datad => \Mux0~1_combout\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X26_Y28_N22
\stage_proc:ct2[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \stage_proc:ct2[2]~combout\ = (GLOBAL(\Mux16~0clkctrl_outclk\) & ((\Mux2~0_combout\))) # (!GLOBAL(\Mux16~0clkctrl_outclk\) & (\stage_proc:ct2[2]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct2[2]~combout\,
	datac => \Mux2~0_combout\,
	datad => \Mux16~0clkctrl_outclk\,
	combout => \stage_proc:ct2[2]~combout\);

-- Location: LCCOMB_X27_Y28_N16
\Mux13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (\Mux15~0_combout\ & (!\Equal1~0_combout\ & ((\stage_proc:ct2[2]~combout\)))) # (!\Mux15~0_combout\ & (((\Instr_R1[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => \Mux15~0_combout\,
	datac => \Instr_R1[2]~input_o\,
	datad => \stage_proc:ct2[2]~combout\,
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X28_Y28_N28
\Mux12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (\Instr_R1[3]~input_o\ & (((\Instr_R1[15]~input_o\) # (!\Instr_R1[13]~input_o\)) # (!\Instr_R1[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[3]~input_o\,
	datab => \Instr_R1[14]~input_o\,
	datac => \Instr_R1[15]~input_o\,
	datad => \Instr_R1[13]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X28_Y28_N26
\Mux11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\Instr_R1[4]~input_o\ & (((\Instr_R1[15]~input_o\) # (!\Instr_R1[13]~input_o\)) # (!\Instr_R1[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[4]~input_o\,
	datab => \Instr_R1[14]~input_o\,
	datac => \Instr_R1[15]~input_o\,
	datad => \Instr_R1[13]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X28_Y28_N24
\Mux10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\Instr_R1[5]~input_o\ & (((\Instr_R1[15]~input_o\) # (!\Instr_R1[13]~input_o\)) # (!\Instr_R1[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[5]~input_o\,
	datab => \Instr_R1[14]~input_o\,
	datac => \Instr_R1[15]~input_o\,
	datad => \Instr_R1[13]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: IOIBUF_X28_Y36_N1
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

-- Location: LCCOMB_X28_Y28_N14
\Mux9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\Mux15~0_combout\ & (\Instr_R1[9]~input_o\)) # (!\Mux15~0_combout\ & ((\Instr_R1[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Instr_R1[9]~input_o\,
	datac => \Instr_R1[6]~input_o\,
	datad => \Mux15~0_combout\,
	combout => \Mux9~0_combout\);

-- Location: IOIBUF_X38_Y36_N15
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

-- Location: LCCOMB_X28_Y28_N4
\Mux8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\Mux15~0_combout\ & ((\Instr_R1[10]~input_o\))) # (!\Mux15~0_combout\ & (\Instr_R1[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux15~0_combout\,
	datac => \Instr_R1[7]~input_o\,
	datad => \Instr_R1[10]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: IOIBUF_X12_Y21_N8
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

-- Location: IOIBUF_X19_Y21_N29
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

-- Location: LCCOMB_X21_Y20_N4
\Mux7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\Mux15~0_combout\ & ((\Instr_R1[11]~input_o\))) # (!\Mux15~0_combout\ & (\Instr_R1[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Instr_R1[8]~input_o\,
	datac => \Instr_R1[11]~input_o\,
	datad => \Mux15~0_combout\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X28_Y28_N2
\Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Mux15~0_combout\ & ((\stage_proc:ct1[0]~0_combout\))) # (!\Mux15~0_combout\ & (\Instr_R1[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Instr_R1[9]~input_o\,
	datac => \stage_proc:ct1[0]~0_combout\,
	datad => \Mux15~0_combout\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X28_Y28_N8
\Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\Mux15~0_combout\ & (\stage_proc:ct1[1]~combout\)) # (!\Mux15~0_combout\ & ((\Instr_R1[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux15~0_combout\,
	datac => \stage_proc:ct1[1]~combout\,
	datad => \Instr_R1[10]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X26_Y21_N14
\Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\Mux15~0_combout\ & (\stage_proc:ct1[2]~combout\)) # (!\Mux15~0_combout\ & ((\Instr_R1[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux15~0_combout\,
	datac => \stage_proc:ct1[2]~combout\,
	datad => \Instr_R1[11]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: IOIBUF_X60_Y22_N15
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

-- Location: LCCOMB_X28_Y28_N6
\Mux20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux20~0_combout\ = (\stage_proc:ct1[0]~0_combout\ & (!\Instr_R1[15]~input_o\ & (\Instr_R1[14]~input_o\ & \Instr_R1[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct1[0]~0_combout\,
	datab => \Instr_R1[15]~input_o\,
	datac => \Instr_R1[14]~input_o\,
	datad => \Instr_R1[13]~input_o\,
	combout => \Mux20~0_combout\);

-- Location: LCCOMB_X28_Y28_N20
\Mux19~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux19~0_combout\ = (\Instr_R1[13]~input_o\ & (!\Instr_R1[15]~input_o\ & (\stage_proc:ct1[1]~combout\ & \Instr_R1[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Instr_R1[13]~input_o\,
	datab => \Instr_R1[15]~input_o\,
	datac => \stage_proc:ct1[1]~combout\,
	datad => \Instr_R1[14]~input_o\,
	combout => \Mux19~0_combout\);

-- Location: LCCOMB_X28_Y28_N22
\Mux18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (\stage_proc:ct1[2]~combout\ & (!\Instr_R1[15]~input_o\ & (\Instr_R1[14]~input_o\ & \Instr_R1[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct1[2]~combout\,
	datab => \Instr_R1[15]~input_o\,
	datac => \Instr_R1[14]~input_o\,
	datad => \Instr_R1[13]~input_o\,
	combout => \Mux18~0_combout\);

-- Location: IOIBUF_X36_Y0_N29
\Hzd_in~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Hzd_in,
	o => \Hzd_in~input_o\);

-- Location: LCCOMB_X28_Y28_N12
\Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ((\stage_proc:ct1[0]~0_combout\ & (\stage_proc:ct1[1]~combout\ & \stage_proc:ct1[2]~combout\))) # (!\Mux15~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stage_proc:ct1[0]~0_combout\,
	datab => \Mux15~0_combout\,
	datac => \stage_proc:ct1[1]~combout\,
	datad => \stage_proc:ct1[2]~combout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X27_Y28_N14
\Mux17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (\Mux15~0_combout\ & (\Mux0~4_combout\ & !\Instr_R1[12]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux15~0_combout\,
	datac => \Mux0~4_combout\,
	datad => \Instr_R1[12]~input_o\,
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X27_Y28_N18
\Mux21~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux21~0_combout\ = (\Mux15~0_combout\ & (\Mux0~4_combout\ & \Instr_R1[12]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux15~0_combout\,
	datac => \Mux0~4_combout\,
	datad => \Instr_R1[12]~input_o\,
	combout => \Mux21~0_combout\);

-- Location: IOIBUF_X60_Y10_N23
\ct1[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ct1(0),
	o => \ct1[0]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\ct1[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ct1(1),
	o => \ct1[1]~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\ct1[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ct1(2),
	o => \ct1[2]~input_o\);

-- Location: IOIBUF_X60_Y15_N22
\ct2[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ct2(0),
	o => \ct2[0]~input_o\);

-- Location: IOIBUF_X8_Y0_N15
\ct2[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ct2(1),
	o => \ct2[1]~input_o\);

-- Location: IOIBUF_X60_Y10_N15
\ct2[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ct2(2),
	o => \ct2[2]~input_o\);

-- Location: IOIBUF_X58_Y36_N8
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

ww_PC_R2(0) <= \PC_R2[0]~output_o\;

ww_PC_R2(1) <= \PC_R2[1]~output_o\;

ww_PC_R2(2) <= \PC_R2[2]~output_o\;

ww_PC_R2(3) <= \PC_R2[3]~output_o\;

ww_PC_R2(4) <= \PC_R2[4]~output_o\;

ww_PC_R2(5) <= \PC_R2[5]~output_o\;

ww_PC_R2(6) <= \PC_R2[6]~output_o\;

ww_PC_R2(7) <= \PC_R2[7]~output_o\;

ww_PC_R2(8) <= \PC_R2[8]~output_o\;

ww_PC_R2(9) <= \PC_R2[9]~output_o\;

ww_PC_R2(10) <= \PC_R2[10]~output_o\;

ww_PC_R2(11) <= \PC_R2[11]~output_o\;

ww_PC_R2(12) <= \PC_R2[12]~output_o\;

ww_PC_R2(13) <= \PC_R2[13]~output_o\;

ww_PC_R2(14) <= \PC_R2[14]~output_o\;

ww_PC_R2(15) <= \PC_R2[15]~output_o\;

ww_Instr_R2(0) <= \Instr_R2[0]~output_o\;

ww_Instr_R2(1) <= \Instr_R2[1]~output_o\;

ww_Instr_R2(2) <= \Instr_R2[2]~output_o\;

ww_Instr_R2(3) <= \Instr_R2[3]~output_o\;

ww_Instr_R2(4) <= \Instr_R2[4]~output_o\;

ww_Instr_R2(5) <= \Instr_R2[5]~output_o\;

ww_Instr_R2(6) <= \Instr_R2[6]~output_o\;

ww_Instr_R2(7) <= \Instr_R2[7]~output_o\;

ww_Instr_R2(8) <= \Instr_R2[8]~output_o\;

ww_Instr_R2(9) <= \Instr_R2[9]~output_o\;

ww_Instr_R2(10) <= \Instr_R2[10]~output_o\;

ww_Instr_R2(11) <= \Instr_R2[11]~output_o\;

ww_Instr_R2(12) <= \Instr_R2[12]~output_o\;

ww_Instr_R2(13) <= \Instr_R2[13]~output_o\;

ww_Instr_R2(14) <= \Instr_R2[14]~output_o\;

ww_Instr_R2(15) <= \Instr_R2[15]~output_o\;

ww_Counter1_R2(0) <= \Counter1_R2[0]~output_o\;

ww_Counter1_R2(1) <= \Counter1_R2[1]~output_o\;

ww_Counter1_R2(2) <= \Counter1_R2[2]~output_o\;

ww_Hzd_out <= \Hzd_out~output_o\;

ww_PR1_en <= \PR1_en~output_o\;

ww_ControlSig_R2_RFWR <= \ControlSig_R2_RFWR~output_o\;

ww_ControlSig_R2_M2WR <= \ControlSig_R2_M2WR~output_o\;
END structure;


