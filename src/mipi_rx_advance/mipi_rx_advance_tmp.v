//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.10
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18
//Device Version: C
//Created Time: Sat Dec 14 15:25:35 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	MIPI_RX_Advance_Top your_instance_name(
		.reset_n(reset_n), //input reset_n
		.HS_CLK_P(HS_CLK_P), //inout HS_CLK_P
		.HS_CLK_N(HS_CLK_N), //inout HS_CLK_N
		.clk_byte_out(clk_byte_out), //output clk_byte_out
		.HS_DATA3_P(HS_DATA3_P), //inout HS_DATA3_P
		.HS_DATA3_N(HS_DATA3_N), //inout HS_DATA3_N
		.data_out3(data_out3), //output [7:0] data_out3
		.HS_DATA2_P(HS_DATA2_P), //inout HS_DATA2_P
		.HS_DATA2_N(HS_DATA2_N), //inout HS_DATA2_N
		.data_out2(data_out2), //output [7:0] data_out2
		.HS_DATA1_P(HS_DATA1_P), //inout HS_DATA1_P
		.HS_DATA1_N(HS_DATA1_N), //inout HS_DATA1_N
		.data_out1(data_out1), //output [7:0] data_out1
		.HS_DATA0_P(HS_DATA0_P), //inout HS_DATA0_P
		.HS_DATA0_N(HS_DATA0_N), //inout HS_DATA0_N
		.data_out0(data_out0), //output [7:0] data_out0
		.hs_en(hs_en), //input hs_en
		.clk_term_en(clk_term_en), //input clk_term_en
		.data_term_en(data_term_en), //input data_term_en
		.ready(ready) //output ready
	);

//--------Copy end-------------------
