//
//Written by GowinSynthesis
//Product Version "GowinSynthesis V1.9.7.02Beta"
//Thu Feb 25 15:36:12 2021

//Source file index table:
//file0 "\D:/Gowin/Gowin_V1.9.7.02Beta/IDE/ipcore/DVI_TX/data/dvi_tx_top.v"
//file1 "\D:/Gowin/Gowin_V1.9.7.02Beta/IDE/ipcore/DVI_TX/data/rgb2dvi.vp"
`timescale 100 ps/100 ps



// IP Decryptor begin

module \~TMDS8b10b.DVI_TX_Top  (
  I_rgb_clk,
  n36_6,
  I_rgb_de,
  I_rgb_r,
  de_d,
  c1_d,
  q_out_r
)
;
input I_rgb_clk;
input n36_6;
input I_rgb_de;
input [7:0] I_rgb_r;
output de_d;
output c1_d;
output [9:0] q_out_r;
wire n274_2;
wire n571_2;
wire n114_4;
wire n605_3;
wire n656_3;
wire n657_3;
wire n658_3;
wire n659_3;
wire n660_3;
wire n661_3;
wire n662_3;
wire n663_3;
wire n664_3;
wire cnt_one_9bit_0_18;
wire n402_7;
wire n401_7;
wire n400_5;
wire n580_5;
wire n579_5;
wire n578_5;
wire n655_5;
wire n114_5;
wire n114_6;
wire n114_7;
wire n605_4;
wire n605_5;
wire n605_6;
wire n605_7;
wire n628_4;
wire n628_5;
wire n657_4;
wire n657_5;
wire n658_5;
wire n661_4;
wire n663_4;
wire cnt_one_9bit_0_19;
wire cnt_one_9bit_1_21;
wire cnt_one_9bit_1_22;
wire cnt_one_9bit_1_23;
wire cnt_one_9bit_1_24;
wire cnt_one_9bit_3_15;
wire n580_6;
wire n580_7;
wire n579_6;
wire n579_7;
wire n578_6;
wire n578_7;
wire n114_9;
wire n114_10;
wire n114_11;
wire n114_12;
wire n605_8;
wire n658_6;
wire n660_5;
wire cnt_one_9bit_1_25;
wire n579_8;
wire n578_10;
wire n114_13;
wire n114_15;
wire n660_7;
wire n662_6;
wire n659_6;
wire n658_8;
wire n628_7;
wire n581_7;
wire n622_5;
wire n645_4;
wire n578_15;
wire n578_14;
wire sel_xnor;
wire n135_2;
wire n135_3;
wire n134_2;
wire n134_3;
wire n133_2;
wire n133_3;
wire n132_2;
wire n132_3;
wire n536_2;
wire n536_3;
wire n535_2;
wire n535_3;
wire n534_2;
wire n534_3;
wire n533_2;
wire n533_3;
wire n536_6;
wire n536_7;
wire n535_6;
wire n535_7;
wire n534_6;
wire n534_7;
wire n366_3;
wire n366_4;
wire n365_3;
wire n365_4;
wire n364_3;
wire n364_4;
wire n239_15;
wire n239_14;
wire n238_13;
wire n238_12;
wire n237_13;
wire n237_12;
wire n236_11;
wire n236_10;
wire n367_13;
wire n367_12;
wire n367_16;
wire n367_15;
wire n366_12;
wire n366_11;
wire n365_12;
wire n365_11;
wire n654_3;
wire n403_9;
wire [3:1] cnt_one_9bit;
wire [7:0] din_d;
wire [4:1] cnt;
wire VCC;
wire GND;
  LUT3 n274_s0 (
    .F(n274_2),
    .I0(n135_2),
    .I1(n239_15),
    .I2(sel_xnor) 
);
defparam n274_s0.INIT=8'h3A;
  LUT3 n571_s0 (
    .F(n571_2),
    .I0(n536_6),
    .I1(n367_16),
    .I2(n628_7) 
);
defparam n571_s0.INIT=8'hCA;
  LUT4 n114_s0 (
    .F(n114_4),
    .I0(I_rgb_r[0]),
    .I1(n114_5),
    .I2(n114_6),
    .I3(n114_7) 
);
defparam n114_s0.INIT=16'hCDF0;
  LUT4 n605_s0 (
    .F(n605_3),
    .I0(n605_4),
    .I1(n605_5),
    .I2(n605_6),
    .I3(n605_7) 
);
defparam n605_s0.INIT=16'hFAFC;
  LUT3 n656_s0 (
    .F(n656_3),
    .I0(c1_d),
    .I1(sel_xnor),
    .I2(de_d) 
);
defparam n656_s0.INIT=8'h35;
  LUT4 n657_s0 (
    .F(n657_3),
    .I0(c1_d),
    .I1(n657_4),
    .I2(n657_5),
    .I3(de_d) 
);
defparam n657_s0.INIT=16'hC3AA;
  LUT4 n658_s0 (
    .F(n658_3),
    .I0(c1_d),
    .I1(n658_8),
    .I2(n658_5),
    .I3(de_d) 
);
defparam n658_s0.INIT=16'h3C55;
  LUT4 n659_s0 (
    .F(n659_3),
    .I0(c1_d),
    .I1(n658_5),
    .I2(n659_6),
    .I3(de_d) 
);
defparam n659_s0.INIT=16'h3CAA;
  LUT4 n660_s0 (
    .F(n660_3),
    .I0(c1_d),
    .I1(n658_5),
    .I2(n660_7),
    .I3(de_d) 
);
defparam n660_s0.INIT=16'h3C55;
  LUT4 n661_s0 (
    .F(n661_3),
    .I0(c1_d),
    .I1(n661_4),
    .I2(n658_5),
    .I3(de_d) 
);
defparam n661_s0.INIT=16'h3CAA;
  LUT4 n662_s0 (
    .F(n662_3),
    .I0(c1_d),
    .I1(n658_5),
    .I2(n662_6),
    .I3(de_d) 
);
defparam n662_s0.INIT=16'h3C55;
  LUT4 n663_s0 (
    .F(n663_3),
    .I0(c1_d),
    .I1(n663_4),
    .I2(n657_4),
    .I3(de_d) 
);
defparam n663_s0.INIT=16'hC3AA;
  LUT3 n664_s0 (
    .F(n664_3),
    .I0(n654_3),
    .I1(c1_d),
    .I2(de_d) 
);
defparam n664_s0.INIT=8'hAC;
  LUT3 cnt_one_9bit_0_s13 (
    .F(cnt_one_9bit_0_18),
    .I0(sel_xnor),
    .I1(din_d[7]),
    .I2(cnt_one_9bit_0_19) 
);
defparam cnt_one_9bit_0_s13.INIT=8'h69;
  LUT4 cnt_one_9bit_1_s14 (
    .F(cnt_one_9bit[1]),
    .I0(cnt_one_9bit_1_21),
    .I1(cnt_one_9bit_1_22),
    .I2(cnt_one_9bit_1_23),
    .I3(cnt_one_9bit_1_24) 
);
defparam cnt_one_9bit_1_s14.INIT=16'h6992;
  LUT3 cnt_one_9bit_2_s15 (
    .F(cnt_one_9bit[2]),
    .I0(n605_7),
    .I1(n605_5),
    .I2(cnt_one_9bit[3]) 
);
defparam cnt_one_9bit_2_s15.INIT=8'h0E;
  LUT3 cnt_one_9bit_3_s11 (
    .F(cnt_one_9bit[3]),
    .I0(cnt_one_9bit_1_23),
    .I1(n605_5),
    .I2(cnt_one_9bit_3_15) 
);
defparam cnt_one_9bit_3_s11.INIT=8'h40;
  LUT2 n402_s3 (
    .F(n402_7),
    .I0(cnt[1]),
    .I1(cnt[2]) 
);
defparam n402_s3.INIT=4'h6;
  LUT3 n401_s3 (
    .F(n401_7),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]) 
);
defparam n401_s3.INIT=8'h78;
  LUT4 n400_s2 (
    .F(n400_5),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]),
    .I3(cnt[4]) 
);
defparam n400_s2.INIT=16'h7F80;
  LUT4 n580_s1 (
    .F(n580_5),
    .I0(n580_6),
    .I1(n580_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n580_s1.INIT=16'hC500;
  LUT4 n579_s1 (
    .F(n579_5),
    .I0(n579_6),
    .I1(n579_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n579_s1.INIT=16'hA300;
  LUT4 n578_s1 (
    .F(n578_5),
    .I0(n578_6),
    .I1(n578_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n578_s1.INIT=16'hC500;
  LUT2 n655_s1 (
    .F(n655_5),
    .I0(de_d),
    .I1(n658_5) 
);
defparam n655_s1.INIT=4'h7;
  LUT4 n114_s1 (
    .F(n114_5),
    .I0(I_rgb_r[0]),
    .I1(I_rgb_r[1]),
    .I2(I_rgb_r[2]),
    .I3(I_rgb_r[4]) 
);
defparam n114_s1.INIT=16'h8000;
  LUT3 n114_s2 (
    .F(n114_6),
    .I0(n114_15),
    .I1(I_rgb_r[7]),
    .I2(n114_9) 
);
defparam n114_s2.INIT=8'hDB;
  LUT4 n114_s3 (
    .F(n114_7),
    .I0(n114_10),
    .I1(n114_11),
    .I2(n114_12),
    .I3(n114_6) 
);
defparam n114_s3.INIT=16'h71EF;
  LUT4 n605_s1 (
    .F(n605_4),
    .I0(n605_8),
    .I1(cnt_one_9bit_1_21),
    .I2(cnt_one_9bit_1_22),
    .I3(cnt_one_9bit_1_23) 
);
defparam n605_s1.INIT=16'h4114;
  LUT4 n605_s2 (
    .F(n605_5),
    .I0(cnt_one_9bit_1_21),
    .I1(cnt_one_9bit_1_22),
    .I2(cnt_one_9bit_1_23),
    .I3(cnt_one_9bit_1_24) 
);
defparam n605_s2.INIT=16'h007D;
  LUT4 n605_s3 (
    .F(n605_6),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]),
    .I3(cnt[4]) 
);
defparam n605_s3.INIT=16'h0001;
  LUT4 n605_s4 (
    .F(n605_7),
    .I0(cnt_one_9bit_1_21),
    .I1(cnt_one_9bit_1_22),
    .I2(cnt_one_9bit_3_15),
    .I3(cnt_one_9bit_1_23) 
);
defparam n605_s4.INIT=16'hDDF4;
  LUT4 n628_s1 (
    .F(n628_4),
    .I0(cnt[4]),
    .I1(n605_4),
    .I2(n605_6),
    .I3(n605_7) 
);
defparam n628_s1.INIT=16'h0100;
  LUT3 n628_s2 (
    .F(n628_5),
    .I0(n605_5),
    .I1(n605_7),
    .I2(cnt[4]) 
);
defparam n628_s2.INIT=8'h10;
  LUT4 n657_s1 (
    .F(n657_4),
    .I0(n628_4),
    .I1(n628_5),
    .I2(n605_3),
    .I3(sel_xnor) 
);
defparam n657_s1.INIT=16'h010E;
  LUT2 n657_s2 (
    .F(n657_5),
    .I0(din_d[7]),
    .I1(n658_8) 
);
defparam n657_s2.INIT=4'h6;
  LUT4 n658_s2 (
    .F(n658_5),
    .I0(n605_3),
    .I1(sel_xnor),
    .I2(n628_4),
    .I3(n628_5) 
);
defparam n658_s2.INIT=16'h0007;
  LUT4 n661_s1 (
    .F(n661_4),
    .I0(sel_xnor),
    .I1(din_d[2]),
    .I2(din_d[3]),
    .I3(n663_4) 
);
defparam n661_s1.INIT=16'h6996;
  LUT2 n663_s1 (
    .F(n663_4),
    .I0(din_d[0]),
    .I1(din_d[1]) 
);
defparam n663_s1.INIT=4'h9;
  LUT4 cnt_one_9bit_0_s14 (
    .F(cnt_one_9bit_0_19),
    .I0(din_d[1]),
    .I1(sel_xnor),
    .I2(din_d[3]),
    .I3(din_d[5]) 
);
defparam cnt_one_9bit_0_s14.INIT=16'h9669;
  LUT4 cnt_one_9bit_1_s15 (
    .F(cnt_one_9bit_1_21),
    .I0(n658_8),
    .I1(din_d[4]),
    .I2(din_d[5]),
    .I3(cnt_one_9bit_0_19) 
);
defparam cnt_one_9bit_1_s15.INIT=16'hC3AA;
  LUT3 cnt_one_9bit_1_s16 (
    .F(cnt_one_9bit_1_22),
    .I0(din_d[4]),
    .I1(din_d[5]),
    .I2(n661_4) 
);
defparam cnt_one_9bit_1_s16.INIT=8'h09;
  LUT4 cnt_one_9bit_1_s17 (
    .F(cnt_one_9bit_1_23),
    .I0(din_d[0]),
    .I1(n660_5),
    .I2(cnt_one_9bit_1_25),
    .I3(sel_xnor) 
);
defparam cnt_one_9bit_1_s17.INIT=16'hA73C;
  LUT4 cnt_one_9bit_1_s18 (
    .F(cnt_one_9bit_1_24),
    .I0(sel_xnor),
    .I1(din_d[7]),
    .I2(cnt_one_9bit_0_19),
    .I3(n658_8) 
);
defparam cnt_one_9bit_1_s18.INIT=16'hF96F;
  LUT3 cnt_one_9bit_3_s12 (
    .F(cnt_one_9bit_3_15),
    .I0(din_d[1]),
    .I1(sel_xnor),
    .I2(din_d[0]) 
);
defparam cnt_one_9bit_3_s12.INIT=8'h90;
  LUT4 n580_s2 (
    .F(n580_6),
    .I0(n535_6),
    .I1(n366_12),
    .I2(n628_4),
    .I3(n628_5) 
);
defparam n580_s2.INIT=16'h3335;
  LUT4 n580_s3 (
    .F(n580_7),
    .I0(n134_2),
    .I1(n238_13),
    .I2(n239_15),
    .I3(sel_xnor) 
);
defparam n580_s3.INIT=16'h3CAA;
  LUT4 n579_s2 (
    .F(n579_6),
    .I0(n133_2),
    .I1(n579_8),
    .I2(n237_13),
    .I3(sel_xnor) 
);
defparam n579_s2.INIT=16'hC355;
  LUT4 n579_s3 (
    .F(n579_7),
    .I0(n534_6),
    .I1(n365_12),
    .I2(n628_4),
    .I3(n628_5) 
);
defparam n579_s3.INIT=16'hCCCA;
  LUT4 n578_s2 (
    .F(n578_6),
    .I0(n578_15),
    .I1(n578_14),
    .I2(n628_4),
    .I3(n628_5) 
);
defparam n578_s2.INIT=16'hCCC5;
  LUT4 n578_s3 (
    .F(n578_7),
    .I0(n578_10),
    .I1(n133_2),
    .I2(n132_2),
    .I3(sel_xnor) 
);
defparam n578_s3.INIT=16'h55C3;
  LUT4 n114_s5 (
    .F(n114_9),
    .I0(I_rgb_r[3]),
    .I1(I_rgb_r[5]),
    .I2(I_rgb_r[6]),
    .I3(n114_13) 
);
defparam n114_s5.INIT=16'h6996;
  LUT4 n114_s6 (
    .F(n114_10),
    .I0(I_rgb_r[0]),
    .I1(I_rgb_r[1]),
    .I2(I_rgb_r[2]),
    .I3(I_rgb_r[4]) 
);
defparam n114_s6.INIT=16'h7EE8;
  LUT2 n114_s7 (
    .F(n114_11),
    .I0(I_rgb_r[3]),
    .I1(I_rgb_r[5]) 
);
defparam n114_s7.INIT=4'h8;
  LUT4 n114_s8 (
    .F(n114_12),
    .I0(I_rgb_r[6]),
    .I1(n114_13),
    .I2(I_rgb_r[3]),
    .I3(I_rgb_r[5]) 
);
defparam n114_s8.INIT=16'hD44D;
  LUT4 n605_s5 (
    .F(n605_8),
    .I0(sel_xnor),
    .I1(din_d[7]),
    .I2(n658_8),
    .I3(cnt_one_9bit_0_19) 
);
defparam n605_s5.INIT=16'h6FF9;
  LUT4 n658_s3 (
    .F(n658_6),
    .I0(din_d[2]),
    .I1(din_d[3]),
    .I2(din_d[4]),
    .I3(din_d[5]) 
);
defparam n658_s3.INIT=16'h9669;
  LUT2 n660_s2 (
    .F(n660_5),
    .I0(din_d[3]),
    .I1(din_d[4]) 
);
defparam n660_s2.INIT=4'h9;
  LUT4 cnt_one_9bit_1_s19 (
    .F(cnt_one_9bit_1_25),
    .I0(din_d[0]),
    .I1(din_d[2]),
    .I2(din_d[1]),
    .I3(n660_5) 
);
defparam cnt_one_9bit_1_s19.INIT=16'h63FA;
  LUT2 n579_s4 (
    .F(n579_8),
    .I0(n238_13),
    .I1(n239_15) 
);
defparam n579_s4.INIT=4'h8;
  LUT4 n578_s6 (
    .F(n578_10),
    .I0(n238_13),
    .I1(n239_15),
    .I2(n237_13),
    .I3(n236_11) 
);
defparam n578_s6.INIT=16'hF807;
  LUT4 n114_s9 (
    .F(n114_13),
    .I0(I_rgb_r[0]),
    .I1(I_rgb_r[1]),
    .I2(I_rgb_r[2]),
    .I3(I_rgb_r[4]) 
);
defparam n114_s9.INIT=16'h9669;
  LUT4 n114_s10 (
    .F(n114_15),
    .I0(n114_10),
    .I1(I_rgb_r[3]),
    .I2(I_rgb_r[5]),
    .I3(n114_12) 
);
defparam n114_s10.INIT=16'h956A;
  LUT3 n660_s3 (
    .F(n660_7),
    .I0(din_d[3]),
    .I1(din_d[4]),
    .I2(n662_6) 
);
defparam n660_s3.INIT=8'h96;
  LUT3 n662_s2 (
    .F(n662_6),
    .I0(din_d[2]),
    .I1(din_d[0]),
    .I2(din_d[1]) 
);
defparam n662_s2.INIT=8'h69;
  LUT4 n659_s2 (
    .F(n659_6),
    .I0(sel_xnor),
    .I1(din_d[0]),
    .I2(din_d[1]),
    .I3(n658_6) 
);
defparam n659_s2.INIT=16'h6996;
  LUT4 n658_s4 (
    .F(n658_8),
    .I0(din_d[6]),
    .I1(din_d[0]),
    .I2(din_d[1]),
    .I3(n658_6) 
);
defparam n658_s4.INIT=16'h6996;
  LUT4 n628_s3 (
    .F(n628_7),
    .I0(n628_4),
    .I1(n605_5),
    .I2(n605_7),
    .I3(cnt[4]) 
);
defparam n628_s3.INIT=16'hABAA;
  LUT4 n581_s2 (
    .F(n581_7),
    .I0(de_d),
    .I1(n571_2),
    .I2(n274_2),
    .I3(n605_3) 
);
defparam n581_s2.INIT=16'hA088;
  LUT2 n654_s2 (
    .F(n622_5),
    .I0(din_d[0]),
    .I1(sel_xnor) 
);
defparam n654_s2.INIT=4'h6;
  LUT2 n654_s1 (
    .F(n645_4),
    .I0(din_d[0]),
    .I1(n628_7) 
);
defparam n654_s1.INIT=4'h6;
  LUT4 n578_s7 (
    .F(n578_15),
    .I0(n533_2),
    .I1(cnt_one_9bit[3]),
    .I2(n534_7),
    .I3(n534_6) 
);
defparam n578_s7.INIT=16'h9669;
  LUT4 n578_s8 (
    .F(n578_14),
    .I0(cnt_one_9bit[3]),
    .I1(n364_3),
    .I2(n365_11),
    .I3(n365_12) 
);
defparam n578_s8.INIT=16'h6996;
  DFFC din_d_6_s0 (
    .Q(din_d[6]),
    .D(I_rgb_r[6]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_5_s0 (
    .Q(din_d[5]),
    .D(I_rgb_r[5]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_4_s0 (
    .Q(din_d[4]),
    .D(I_rgb_r[4]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_3_s0 (
    .Q(din_d[3]),
    .D(I_rgb_r[3]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_2_s0 (
    .Q(din_d[2]),
    .D(I_rgb_r[2]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_1_s0 (
    .Q(din_d[1]),
    .D(I_rgb_r[1]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_0_s0 (
    .Q(din_d[0]),
    .D(I_rgb_r[0]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC de_d_s0 (
    .Q(de_d),
    .D(I_rgb_de),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFP c1_d_s0 (
    .Q(c1_d),
    .D(GND),
    .CLK(I_rgb_clk),
    .PRESET(n36_6) 
);
  DFFC sel_xnor_s0 (
    .Q(sel_xnor),
    .D(n114_4),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_4_s0 (
    .Q(cnt[4]),
    .D(n578_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_3_s0 (
    .Q(cnt[3]),
    .D(n579_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_2_s0 (
    .Q(cnt[2]),
    .D(n580_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_1_s0 (
    .Q(cnt[1]),
    .D(n581_7),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_9_s0 (
    .Q(q_out_r[9]),
    .D(n655_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_8_s0 (
    .Q(q_out_r[8]),
    .D(n656_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_7_s0 (
    .Q(q_out_r[7]),
    .D(n657_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_6_s0 (
    .Q(q_out_r[6]),
    .D(n658_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_5_s0 (
    .Q(q_out_r[5]),
    .D(n659_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_4_s0 (
    .Q(q_out_r[4]),
    .D(n660_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_3_s0 (
    .Q(q_out_r[3]),
    .D(n661_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_2_s0 (
    .Q(q_out_r[2]),
    .D(n662_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_1_s0 (
    .Q(q_out_r[1]),
    .D(n663_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_0_s0 (
    .Q(q_out_r[0]),
    .D(n664_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_7_s0 (
    .Q(din_d[7]),
    .D(I_rgb_r[7]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  ALU n135_s (
    .SUM(n135_2),
    .COUT(n135_3),
    .I0(cnt[1]),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(GND) 
);
defparam n135_s.ALU_MODE=0;
  ALU n134_s (
    .SUM(n134_2),
    .COUT(n134_3),
    .I0(cnt[2]),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n135_3) 
);
defparam n134_s.ALU_MODE=0;
  ALU n133_s (
    .SUM(n133_2),
    .COUT(n133_3),
    .I0(cnt[3]),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n134_3) 
);
defparam n133_s.ALU_MODE=0;
  ALU n132_s (
    .SUM(n132_2),
    .COUT(n132_3),
    .I0(cnt[4]),
    .I1(cnt_one_9bit[3]),
    .I3(GND),
    .CIN(n133_3) 
);
defparam n132_s.ALU_MODE=0;
  ALU n536_s (
    .SUM(n536_2),
    .COUT(n536_3),
    .I0(n403_9),
    .I1(sel_xnor),
    .I3(GND),
    .CIN(GND) 
);
defparam n536_s.ALU_MODE=0;
  ALU n535_s (
    .SUM(n535_2),
    .COUT(n535_3),
    .I0(n402_7),
    .I1(VCC),
    .I3(GND),
    .CIN(n536_3) 
);
defparam n535_s.ALU_MODE=0;
  ALU n534_s (
    .SUM(n534_2),
    .COUT(n534_3),
    .I0(n401_7),
    .I1(VCC),
    .I3(GND),
    .CIN(n535_3) 
);
defparam n534_s.ALU_MODE=0;
  ALU n533_s (
    .SUM(n533_2),
    .COUT(n533_3),
    .I0(n400_5),
    .I1(VCC),
    .I3(GND),
    .CIN(n534_3) 
);
defparam n533_s.ALU_MODE=0;
  ALU n536_s1 (
    .SUM(n536_6),
    .COUT(n536_7),
    .I0(n536_2),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(VCC) 
);
defparam n536_s1.ALU_MODE=0;
  ALU n535_s1 (
    .SUM(n535_6),
    .COUT(n535_7),
    .I0(n535_2),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n536_7) 
);
defparam n535_s1.ALU_MODE=0;
  ALU n534_s1 (
    .SUM(n534_6),
    .COUT(n534_7),
    .I0(n534_2),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n535_7) 
);
defparam n534_s1.ALU_MODE=0;
  ALU n366_s (
    .SUM(n366_3),
    .COUT(n366_4),
    .I0(cnt[2]),
    .I1(GND),
    .I3(GND),
    .CIN(n367_12) 
);
defparam n366_s.ALU_MODE=0;
  ALU n365_s (
    .SUM(n365_3),
    .COUT(n365_4),
    .I0(cnt[3]),
    .I1(GND),
    .I3(GND),
    .CIN(n366_4) 
);
defparam n365_s.ALU_MODE=0;
  ALU n364_s (
    .SUM(n364_3),
    .COUT(n364_4),
    .I0(cnt[4]),
    .I1(GND),
    .I3(GND),
    .CIN(n365_4) 
);
defparam n364_s.ALU_MODE=0;
  ALU n239_s6 (
    .SUM(n239_15),
    .COUT(n239_14),
    .I0(cnt[1]),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(GND) 
);
defparam n239_s6.ALU_MODE=1;
  ALU n238_s5 (
    .SUM(n238_13),
    .COUT(n238_12),
    .I0(cnt[2]),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n239_14) 
);
defparam n238_s5.ALU_MODE=1;
  ALU n237_s5 (
    .SUM(n237_13),
    .COUT(n237_12),
    .I0(cnt[3]),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n238_12) 
);
defparam n237_s5.ALU_MODE=1;
  ALU n236_s4 (
    .SUM(n236_11),
    .COUT(n236_10),
    .I0(cnt[4]),
    .I1(cnt_one_9bit[3]),
    .I3(GND),
    .CIN(n237_12) 
);
defparam n236_s4.ALU_MODE=1;
  ALU n367_s4 (
    .SUM(n367_13),
    .COUT(n367_12),
    .I0(cnt[1]),
    .I1(sel_xnor),
    .I3(GND),
    .CIN(GND) 
);
defparam n367_s4.ALU_MODE=1;
  ALU n367_s5 (
    .SUM(n367_16),
    .COUT(n367_15),
    .I0(n367_13),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(VCC) 
);
defparam n367_s5.ALU_MODE=1;
  ALU n366_s3 (
    .SUM(n366_12),
    .COUT(n366_11),
    .I0(n366_3),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n367_15) 
);
defparam n366_s3.ALU_MODE=1;
  ALU n365_s3 (
    .SUM(n365_12),
    .COUT(n365_11),
    .I0(n365_3),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n366_11) 
);
defparam n365_s3.ALU_MODE=1;
  MUX2_LUT5 n654_s0 (
    .O(n654_3),
    .I0(n645_4),
    .I1(n622_5),
    .S0(n605_3) 
);
  INV n403_s5 (
    .O(n403_9),
    .I(cnt[1]) 
);
  VCC VCC_cZ (
    .V(VCC)
);
  GND GND_cZ (
    .G(GND)
);
endmodule /* \~TMDS8b10b.DVI_TX_Top  */
module \~TMDS8b10b.DVI_TX_Top_0  (
  I_rgb_clk,
  n36_6,
  c1_d,
  de_d,
  I_rgb_g,
  q_out_g
)
;
input I_rgb_clk;
input n36_6;
input c1_d;
input de_d;
input [7:0] I_rgb_g;
output [9:0] q_out_g;
wire n274_2;
wire n571_2;
wire n114_3;
wire n605_3;
wire n628_3;
wire n656_3;
wire n657_3;
wire n658_3;
wire n659_3;
wire n660_3;
wire n661_3;
wire n662_3;
wire n663_3;
wire n664_3;
wire cnt_one_9bit_0_18;
wire n402_7;
wire n401_7;
wire n400_5;
wire n580_5;
wire n579_5;
wire n578_5;
wire n114_4;
wire n114_5;
wire n114_6;
wire n605_4;
wire n605_5;
wire n628_4;
wire n657_4;
wire n657_5;
wire n658_4;
wire n658_5;
wire n663_4;
wire cnt_one_9bit_1_21;
wire cnt_one_9bit_2_23;
wire cnt_one_9bit_2_24;
wire cnt_one_9bit_2_25;
wire n580_6;
wire n580_7;
wire n579_6;
wire n579_7;
wire n578_6;
wire n578_7;
wire n114_7;
wire n114_8;
wire n114_9;
wire n114_10;
wire n605_6;
wire n658_6;
wire n658_7;
wire n660_5;
wire cnt_one_9bit_2_26;
wire cnt_one_9bit_2_27;
wire cnt_one_9bit_2_28;
wire cnt_one_9bit_2_29;
wire cnt_one_9bit_2_30;
wire n579_8;
wire n578_9;
wire n114_11;
wire cnt_one_9bit_2_31;
wire n660_7;
wire cnt_one_9bit_1_25;
wire n661_6;
wire n662_6;
wire cnt_one_9bit_1_29;
wire n659_6;
wire n655_7;
wire n581_7;
wire n622_4;
wire n645_4;
wire n578_11;
wire sel_xnor;
wire n135_2;
wire n135_3;
wire n134_2;
wire n134_3;
wire n133_2;
wire n133_3;
wire n132_2;
wire n132_3;
wire n536_2;
wire n536_3;
wire n535_2;
wire n535_3;
wire n534_2;
wire n534_3;
wire n533_2;
wire n533_3;
wire n536_6;
wire n536_7;
wire n535_6;
wire n535_7;
wire n534_6;
wire n534_7;
wire n366_3;
wire n366_4;
wire n365_3;
wire n365_4;
wire n364_3;
wire n364_4;
wire n239_15;
wire n239_14;
wire n238_13;
wire n238_12;
wire n237_13;
wire n237_12;
wire n236_11;
wire n236_10;
wire n367_13;
wire n367_12;
wire n367_16;
wire n367_15;
wire n366_12;
wire n366_11;
wire n365_12;
wire n365_11;
wire n364_12;
wire n364_11;
wire n654_3;
wire n403_9;
wire [3:1] cnt_one_9bit;
wire [7:0] din_d;
wire [4:1] cnt;
wire VCC;
wire GND;
  LUT3 n274_s0 (
    .F(n274_2),
    .I0(n135_2),
    .I1(n239_15),
    .I2(sel_xnor) 
);
defparam n274_s0.INIT=8'h3A;
  LUT3 n571_s0 (
    .F(n571_2),
    .I0(n536_6),
    .I1(n367_16),
    .I2(n628_3) 
);
defparam n571_s0.INIT=8'hCA;
  LUT4 n114_s0 (
    .F(n114_3),
    .I0(n114_4),
    .I1(n114_5),
    .I2(I_rgb_g[0]),
    .I3(n114_6) 
);
defparam n114_s0.INIT=16'hA3CC;
  LUT4 n605_s0 (
    .F(n605_3),
    .I0(n605_4),
    .I1(cnt_one_9bit[2]),
    .I2(cnt[4]),
    .I3(n605_5) 
);
defparam n605_s0.INIT=16'h4F44;
  LUT4 n628_s0 (
    .F(n628_3),
    .I0(n605_5),
    .I1(n605_4),
    .I2(cnt[4]),
    .I3(n628_4) 
);
defparam n628_s0.INIT=16'hF004;
  LUT3 n656_s0 (
    .F(n656_3),
    .I0(sel_xnor),
    .I1(c1_d),
    .I2(de_d) 
);
defparam n656_s0.INIT=8'h53;
  LUT4 n657_s0 (
    .F(n657_3),
    .I0(c1_d),
    .I1(n657_4),
    .I2(n657_5),
    .I3(de_d) 
);
defparam n657_s0.INIT=16'hC3AA;
  LUT4 n658_s0 (
    .F(n658_3),
    .I0(c1_d),
    .I1(n658_4),
    .I2(n658_5),
    .I3(de_d) 
);
defparam n658_s0.INIT=16'h3C55;
  LUT4 n659_s0 (
    .F(n659_3),
    .I0(c1_d),
    .I1(n658_5),
    .I2(n659_6),
    .I3(de_d) 
);
defparam n659_s0.INIT=16'h3CAA;
  LUT4 n660_s0 (
    .F(n660_3),
    .I0(c1_d),
    .I1(n658_5),
    .I2(n660_7),
    .I3(de_d) 
);
defparam n660_s0.INIT=16'h3C55;
  LUT4 n661_s0 (
    .F(n661_3),
    .I0(c1_d),
    .I1(n661_6),
    .I2(n658_5),
    .I3(de_d) 
);
defparam n661_s0.INIT=16'h3CAA;
  LUT4 n662_s0 (
    .F(n662_3),
    .I0(c1_d),
    .I1(n658_5),
    .I2(n662_6),
    .I3(de_d) 
);
defparam n662_s0.INIT=16'h3C55;
  LUT4 n663_s0 (
    .F(n663_3),
    .I0(c1_d),
    .I1(n663_4),
    .I2(n657_4),
    .I3(de_d) 
);
defparam n663_s0.INIT=16'hC3AA;
  LUT3 n664_s0 (
    .F(n664_3),
    .I0(n654_3),
    .I1(c1_d),
    .I2(de_d) 
);
defparam n664_s0.INIT=8'hAC;
  LUT4 cnt_one_9bit_0_s13 (
    .F(cnt_one_9bit_0_18),
    .I0(din_d[1]),
    .I1(din_d[3]),
    .I2(din_d[5]),
    .I3(din_d[7]) 
);
defparam cnt_one_9bit_0_s13.INIT=16'h6996;
  LUT4 cnt_one_9bit_2_s15 (
    .F(cnt_one_9bit[2]),
    .I0(cnt_one_9bit_1_21),
    .I1(cnt_one_9bit_2_23),
    .I2(cnt_one_9bit_2_24),
    .I3(cnt_one_9bit_2_25) 
);
defparam cnt_one_9bit_2_s15.INIT=16'hB27D;
  LUT3 cnt_one_9bit_3_s11 (
    .F(cnt_one_9bit[3]),
    .I0(cnt_one_9bit_2_25),
    .I1(cnt_one_9bit_1_25),
    .I2(cnt_one_9bit_1_21) 
);
defparam cnt_one_9bit_3_s11.INIT=8'h40;
  LUT2 n402_s3 (
    .F(n402_7),
    .I0(cnt[1]),
    .I1(cnt[2]) 
);
defparam n402_s3.INIT=4'h6;
  LUT3 n401_s3 (
    .F(n401_7),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]) 
);
defparam n401_s3.INIT=8'h78;
  LUT4 n400_s2 (
    .F(n400_5),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]),
    .I3(cnt[4]) 
);
defparam n400_s2.INIT=16'h7F80;
  LUT4 n580_s1 (
    .F(n580_5),
    .I0(n580_6),
    .I1(n580_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n580_s1.INIT=16'h5C00;
  LUT4 n579_s1 (
    .F(n579_5),
    .I0(n579_6),
    .I1(n579_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n579_s1.INIT=16'hAC00;
  LUT4 n578_s1 (
    .F(n578_5),
    .I0(n578_6),
    .I1(n578_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n578_s1.INIT=16'hC500;
  LUT3 n114_s1 (
    .F(n114_4),
    .I0(I_rgb_g[1]),
    .I1(I_rgb_g[2]),
    .I2(I_rgb_g[4]) 
);
defparam n114_s1.INIT=8'h80;
  LUT3 n114_s2 (
    .F(n114_5),
    .I0(n114_7),
    .I1(n114_8),
    .I2(I_rgb_g[7]) 
);
defparam n114_s2.INIT=8'h7E;
  LUT4 n114_s3 (
    .F(n114_6),
    .I0(n114_9),
    .I1(n114_10),
    .I2(n114_8),
    .I3(n114_5) 
);
defparam n114_s3.INIT=16'hB2FD;
  LUT4 n605_s1 (
    .F(n605_4),
    .I0(cnt_one_9bit_0_18),
    .I1(cnt_one_9bit_2_25),
    .I2(n605_6),
    .I3(cnt_one_9bit_1_21) 
);
defparam n605_s1.INIT=16'hF3AF;
  LUT3 n605_s2 (
    .F(n605_5),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]) 
);
defparam n605_s2.INIT=8'h01;
  LUT4 n628_s1 (
    .F(n628_4),
    .I0(cnt_one_9bit_1_21),
    .I1(cnt_one_9bit_2_23),
    .I2(cnt_one_9bit_2_24),
    .I3(cnt_one_9bit_2_25) 
);
defparam n628_s1.INIT=16'h4D00;
  LUT3 n657_s1 (
    .F(n657_4),
    .I0(n605_3),
    .I1(sel_xnor),
    .I2(n628_3) 
);
defparam n657_s1.INIT=8'h14;
  LUT2 n657_s2 (
    .F(n657_5),
    .I0(din_d[7]),
    .I1(n658_4) 
);
defparam n657_s2.INIT=4'h6;
  LUT4 n658_s1 (
    .F(n658_4),
    .I0(din_d[6]),
    .I1(n658_6),
    .I2(n658_7),
    .I3(n663_4) 
);
defparam n658_s1.INIT=16'h6996;
  LUT3 n658_s2 (
    .F(n658_5),
    .I0(n605_3),
    .I1(sel_xnor),
    .I2(n628_3) 
);
defparam n658_s2.INIT=8'h07;
  LUT2 n663_s1 (
    .F(n663_4),
    .I0(din_d[0]),
    .I1(din_d[1]) 
);
defparam n663_s1.INIT=4'h9;
  LUT3 cnt_one_9bit_1_s15 (
    .F(cnt_one_9bit_1_21),
    .I0(cnt_one_9bit_0_18),
    .I1(n661_6),
    .I2(cnt_one_9bit_1_29) 
);
defparam cnt_one_9bit_1_s15.INIT=8'h14;
  LUT4 cnt_one_9bit_2_s16 (
    .F(cnt_one_9bit_2_23),
    .I0(cnt_one_9bit_2_26),
    .I1(n658_7),
    .I2(din_d[0]),
    .I3(cnt_one_9bit_2_27) 
);
defparam cnt_one_9bit_2_s16.INIT=16'hACCA;
  LUT2 cnt_one_9bit_2_s17 (
    .F(cnt_one_9bit_2_24),
    .I0(cnt_one_9bit_2_28),
    .I1(cnt_one_9bit_2_29) 
);
defparam cnt_one_9bit_2_s17.INIT=4'h6;
  LUT4 cnt_one_9bit_2_s18 (
    .F(cnt_one_9bit_2_25),
    .I0(cnt_one_9bit_2_30),
    .I1(cnt_one_9bit_2_29),
    .I2(din_d[0]),
    .I3(cnt_one_9bit_2_28) 
);
defparam cnt_one_9bit_2_s18.INIT=16'h5FCC;
  LUT4 n580_s2 (
    .F(n580_6),
    .I0(n134_2),
    .I1(n238_13),
    .I2(n239_15),
    .I3(sel_xnor) 
);
defparam n580_s2.INIT=16'hC355;
  LUT3 n580_s3 (
    .F(n580_7),
    .I0(n366_12),
    .I1(n535_6),
    .I2(n628_3) 
);
defparam n580_s3.INIT=8'hAC;
  LUT4 n579_s2 (
    .F(n579_6),
    .I0(n133_2),
    .I1(n579_8),
    .I2(n237_13),
    .I3(sel_xnor) 
);
defparam n579_s2.INIT=16'hC355;
  LUT3 n579_s3 (
    .F(n579_7),
    .I0(n365_12),
    .I1(n534_6),
    .I2(n628_3) 
);
defparam n579_s3.INIT=8'h53;
  LUT4 n578_s2 (
    .F(n578_6),
    .I0(n578_11),
    .I1(n365_12),
    .I2(n364_12),
    .I3(n628_3) 
);
defparam n578_s2.INIT=16'hC3AA;
  LUT4 n578_s3 (
    .F(n578_7),
    .I0(n578_9),
    .I1(n133_2),
    .I2(n132_2),
    .I3(sel_xnor) 
);
defparam n578_s3.INIT=16'h55C3;
  LUT4 n114_s4 (
    .F(n114_7),
    .I0(I_rgb_g[3]),
    .I1(I_rgb_g[5]),
    .I2(I_rgb_g[6]),
    .I3(n114_11) 
);
defparam n114_s4.INIT=16'h9669;
  LUT4 n114_s5 (
    .F(n114_8),
    .I0(I_rgb_g[3]),
    .I1(I_rgb_g[5]),
    .I2(n114_9),
    .I3(n114_10) 
);
defparam n114_s5.INIT=16'h7887;
  LUT4 n114_s6 (
    .F(n114_9),
    .I0(I_rgb_g[6]),
    .I1(n114_11),
    .I2(I_rgb_g[3]),
    .I3(I_rgb_g[5]) 
);
defparam n114_s6.INIT=16'hD44D;
  LUT4 n114_s7 (
    .F(n114_10),
    .I0(I_rgb_g[0]),
    .I1(I_rgb_g[1]),
    .I2(I_rgb_g[2]),
    .I3(I_rgb_g[4]) 
);
defparam n114_s7.INIT=16'h7EE8;
  LUT3 n605_s3 (
    .F(n605_6),
    .I0(cnt_one_9bit_2_28),
    .I1(cnt_one_9bit_2_29),
    .I2(cnt_one_9bit_2_23) 
);
defparam n605_s3.INIT=8'h96;
  LUT2 n658_s3 (
    .F(n658_6),
    .I0(din_d[2]),
    .I1(din_d[3]) 
);
defparam n658_s3.INIT=4'h9;
  LUT2 n658_s4 (
    .F(n658_7),
    .I0(din_d[4]),
    .I1(din_d[5]) 
);
defparam n658_s4.INIT=4'h9;
  LUT2 n660_s2 (
    .F(n660_5),
    .I0(din_d[3]),
    .I1(din_d[4]) 
);
defparam n660_s2.INIT=4'h9;
  LUT4 cnt_one_9bit_2_s19 (
    .F(cnt_one_9bit_2_26),
    .I0(din_d[1]),
    .I1(sel_xnor),
    .I2(din_d[3]),
    .I3(din_d[4]) 
);
defparam cnt_one_9bit_2_s19.INIT=16'h9669;
  LUT4 cnt_one_9bit_2_s20 (
    .F(cnt_one_9bit_2_27),
    .I0(din_d[1]),
    .I1(din_d[2]),
    .I2(din_d[3]),
    .I3(din_d[6]) 
);
defparam cnt_one_9bit_2_s20.INIT=16'h9669;
  LUT4 cnt_one_9bit_2_s21 (
    .F(cnt_one_9bit_2_28),
    .I0(din_d[0]),
    .I1(n658_6),
    .I2(cnt_one_9bit_2_30),
    .I3(n658_7) 
);
defparam cnt_one_9bit_2_s21.INIT=16'hC95F;
  LUT4 cnt_one_9bit_2_s22 (
    .F(cnt_one_9bit_2_29),
    .I0(cnt_one_9bit_2_31),
    .I1(sel_xnor),
    .I2(din_d[1]),
    .I3(n660_5) 
);
defparam cnt_one_9bit_2_s22.INIT=16'h5AC3;
  LUT2 cnt_one_9bit_2_s23 (
    .F(cnt_one_9bit_2_30),
    .I0(din_d[1]),
    .I1(sel_xnor) 
);
defparam cnt_one_9bit_2_s23.INIT=4'h9;
  LUT2 n579_s4 (
    .F(n579_8),
    .I0(n238_13),
    .I1(n239_15) 
);
defparam n579_s4.INIT=4'h8;
  LUT4 n578_s5 (
    .F(n578_9),
    .I0(n238_13),
    .I1(n239_15),
    .I2(n237_13),
    .I3(n236_11) 
);
defparam n578_s5.INIT=16'hF807;
  LUT4 n114_s8 (
    .F(n114_11),
    .I0(I_rgb_g[0]),
    .I1(I_rgb_g[1]),
    .I2(I_rgb_g[2]),
    .I3(I_rgb_g[4]) 
);
defparam n114_s8.INIT=16'h9669;
  LUT2 cnt_one_9bit_2_s24 (
    .F(cnt_one_9bit_2_31),
    .I0(din_d[0]),
    .I1(din_d[2]) 
);
defparam cnt_one_9bit_2_s24.INIT=4'h9;
  LUT3 n660_s3 (
    .F(n660_7),
    .I0(din_d[3]),
    .I1(din_d[4]),
    .I2(n662_6) 
);
defparam n660_s3.INIT=8'h96;
  LUT3 cnt_one_9bit_1_s18 (
    .F(cnt_one_9bit_1_25),
    .I0(cnt_one_9bit_2_23),
    .I1(cnt_one_9bit_2_28),
    .I2(cnt_one_9bit_2_29) 
);
defparam cnt_one_9bit_1_s18.INIT=8'h69;
  LUT4 n661_s2 (
    .F(n661_6),
    .I0(sel_xnor),
    .I1(din_d[2]),
    .I2(din_d[3]),
    .I3(n663_4) 
);
defparam n661_s2.INIT=16'h6996;
  LUT3 n662_s2 (
    .F(n662_6),
    .I0(din_d[2]),
    .I1(din_d[0]),
    .I2(din_d[1]) 
);
defparam n662_s2.INIT=8'h69;
  LUT4 cnt_one_9bit_1_s19 (
    .F(cnt_one_9bit[1]),
    .I0(cnt_one_9bit_0_18),
    .I1(n661_6),
    .I2(cnt_one_9bit_1_29),
    .I3(cnt_one_9bit_1_25) 
);
defparam cnt_one_9bit_1_s19.INIT=16'hEB14;
  LUT4 cnt_one_9bit_1_s20 (
    .F(cnt_one_9bit_1_29),
    .I0(din_d[6]),
    .I1(din_d[7]),
    .I2(din_d[4]),
    .I3(din_d[5]) 
);
defparam cnt_one_9bit_1_s20.INIT=16'h9669;
  LUT3 n659_s2 (
    .F(n659_6),
    .I0(din_d[4]),
    .I1(din_d[5]),
    .I2(n661_6) 
);
defparam n659_s2.INIT=8'h96;
  LUT4 n655_s2 (
    .F(n655_7),
    .I0(de_d),
    .I1(n605_3),
    .I2(sel_xnor),
    .I3(n628_3) 
);
defparam n655_s2.INIT=16'hFFD5;
  LUT4 n581_s2 (
    .F(n581_7),
    .I0(de_d),
    .I1(n571_2),
    .I2(n274_2),
    .I3(n605_3) 
);
defparam n581_s2.INIT=16'hA088;
  LUT2 n654_s2 (
    .F(n622_4),
    .I0(din_d[0]),
    .I1(sel_xnor) 
);
defparam n654_s2.INIT=4'h6;
  LUT2 n654_s1 (
    .F(n645_4),
    .I0(din_d[0]),
    .I1(n628_3) 
);
defparam n654_s1.INIT=4'h6;
  LUT4 n578_s6 (
    .F(n578_11),
    .I0(n533_2),
    .I1(cnt_one_9bit[3]),
    .I2(n534_7),
    .I3(n534_6) 
);
defparam n578_s6.INIT=16'h6996;
  DFFC din_d_6_s0 (
    .Q(din_d[6]),
    .D(I_rgb_g[6]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_5_s0 (
    .Q(din_d[5]),
    .D(I_rgb_g[5]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_4_s0 (
    .Q(din_d[4]),
    .D(I_rgb_g[4]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_3_s0 (
    .Q(din_d[3]),
    .D(I_rgb_g[3]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_2_s0 (
    .Q(din_d[2]),
    .D(I_rgb_g[2]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_1_s0 (
    .Q(din_d[1]),
    .D(I_rgb_g[1]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_0_s0 (
    .Q(din_d[0]),
    .D(I_rgb_g[0]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC sel_xnor_s0 (
    .Q(sel_xnor),
    .D(n114_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_4_s0 (
    .Q(cnt[4]),
    .D(n578_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_3_s0 (
    .Q(cnt[3]),
    .D(n579_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_2_s0 (
    .Q(cnt[2]),
    .D(n580_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_1_s0 (
    .Q(cnt[1]),
    .D(n581_7),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_9_s0 (
    .Q(q_out_g[9]),
    .D(n655_7),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_8_s0 (
    .Q(q_out_g[8]),
    .D(n656_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_7_s0 (
    .Q(q_out_g[7]),
    .D(n657_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_6_s0 (
    .Q(q_out_g[6]),
    .D(n658_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_5_s0 (
    .Q(q_out_g[5]),
    .D(n659_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_4_s0 (
    .Q(q_out_g[4]),
    .D(n660_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_3_s0 (
    .Q(q_out_g[3]),
    .D(n661_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_2_s0 (
    .Q(q_out_g[2]),
    .D(n662_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_1_s0 (
    .Q(q_out_g[1]),
    .D(n663_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_0_s0 (
    .Q(q_out_g[0]),
    .D(n664_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_7_s0 (
    .Q(din_d[7]),
    .D(I_rgb_g[7]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  ALU n135_s (
    .SUM(n135_2),
    .COUT(n135_3),
    .I0(cnt[1]),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(GND) 
);
defparam n135_s.ALU_MODE=0;
  ALU n134_s (
    .SUM(n134_2),
    .COUT(n134_3),
    .I0(cnt[2]),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n135_3) 
);
defparam n134_s.ALU_MODE=0;
  ALU n133_s (
    .SUM(n133_2),
    .COUT(n133_3),
    .I0(cnt[3]),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n134_3) 
);
defparam n133_s.ALU_MODE=0;
  ALU n132_s (
    .SUM(n132_2),
    .COUT(n132_3),
    .I0(cnt[4]),
    .I1(cnt_one_9bit[3]),
    .I3(GND),
    .CIN(n133_3) 
);
defparam n132_s.ALU_MODE=0;
  ALU n536_s (
    .SUM(n536_2),
    .COUT(n536_3),
    .I0(n403_9),
    .I1(sel_xnor),
    .I3(GND),
    .CIN(GND) 
);
defparam n536_s.ALU_MODE=0;
  ALU n535_s (
    .SUM(n535_2),
    .COUT(n535_3),
    .I0(n402_7),
    .I1(VCC),
    .I3(GND),
    .CIN(n536_3) 
);
defparam n535_s.ALU_MODE=0;
  ALU n534_s (
    .SUM(n534_2),
    .COUT(n534_3),
    .I0(n401_7),
    .I1(VCC),
    .I3(GND),
    .CIN(n535_3) 
);
defparam n534_s.ALU_MODE=0;
  ALU n533_s (
    .SUM(n533_2),
    .COUT(n533_3),
    .I0(n400_5),
    .I1(VCC),
    .I3(GND),
    .CIN(n534_3) 
);
defparam n533_s.ALU_MODE=0;
  ALU n536_s1 (
    .SUM(n536_6),
    .COUT(n536_7),
    .I0(n536_2),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(VCC) 
);
defparam n536_s1.ALU_MODE=0;
  ALU n535_s1 (
    .SUM(n535_6),
    .COUT(n535_7),
    .I0(n535_2),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n536_7) 
);
defparam n535_s1.ALU_MODE=0;
  ALU n534_s1 (
    .SUM(n534_6),
    .COUT(n534_7),
    .I0(n534_2),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n535_7) 
);
defparam n534_s1.ALU_MODE=0;
  ALU n366_s (
    .SUM(n366_3),
    .COUT(n366_4),
    .I0(cnt[2]),
    .I1(GND),
    .I3(GND),
    .CIN(n367_12) 
);
defparam n366_s.ALU_MODE=0;
  ALU n365_s (
    .SUM(n365_3),
    .COUT(n365_4),
    .I0(cnt[3]),
    .I1(GND),
    .I3(GND),
    .CIN(n366_4) 
);
defparam n365_s.ALU_MODE=0;
  ALU n364_s (
    .SUM(n364_3),
    .COUT(n364_4),
    .I0(cnt[4]),
    .I1(GND),
    .I3(GND),
    .CIN(n365_4) 
);
defparam n364_s.ALU_MODE=0;
  ALU n239_s6 (
    .SUM(n239_15),
    .COUT(n239_14),
    .I0(cnt[1]),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(GND) 
);
defparam n239_s6.ALU_MODE=1;
  ALU n238_s5 (
    .SUM(n238_13),
    .COUT(n238_12),
    .I0(cnt[2]),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n239_14) 
);
defparam n238_s5.ALU_MODE=1;
  ALU n237_s5 (
    .SUM(n237_13),
    .COUT(n237_12),
    .I0(cnt[3]),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n238_12) 
);
defparam n237_s5.ALU_MODE=1;
  ALU n236_s4 (
    .SUM(n236_11),
    .COUT(n236_10),
    .I0(cnt[4]),
    .I1(cnt_one_9bit[3]),
    .I3(GND),
    .CIN(n237_12) 
);
defparam n236_s4.ALU_MODE=1;
  ALU n367_s4 (
    .SUM(n367_13),
    .COUT(n367_12),
    .I0(cnt[1]),
    .I1(sel_xnor),
    .I3(GND),
    .CIN(GND) 
);
defparam n367_s4.ALU_MODE=1;
  ALU n367_s5 (
    .SUM(n367_16),
    .COUT(n367_15),
    .I0(n367_13),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(VCC) 
);
defparam n367_s5.ALU_MODE=1;
  ALU n366_s3 (
    .SUM(n366_12),
    .COUT(n366_11),
    .I0(n366_3),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n367_15) 
);
defparam n366_s3.ALU_MODE=1;
  ALU n365_s3 (
    .SUM(n365_12),
    .COUT(n365_11),
    .I0(n365_3),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n366_11) 
);
defparam n365_s3.ALU_MODE=1;
  ALU n364_s3 (
    .SUM(n364_12),
    .COUT(n364_11),
    .I0(n364_3),
    .I1(cnt_one_9bit[3]),
    .I3(GND),
    .CIN(n365_11) 
);
defparam n364_s3.ALU_MODE=1;
  MUX2_LUT5 n654_s0 (
    .O(n654_3),
    .I0(n645_4),
    .I1(n622_4),
    .S0(n605_3) 
);
  INV n403_s5 (
    .O(n403_9),
    .I(cnt[1]) 
);
  VCC VCC_cZ (
    .V(VCC)
);
  GND GND_cZ (
    .G(GND)
);
endmodule /* \~TMDS8b10b.DVI_TX_Top_0  */
module \~TMDS8b10b.DVI_TX_Top_1  (
  I_rgb_clk,
  n36_6,
  I_rgb_vs,
  I_rgb_hs,
  de_d,
  I_rgb_b,
  q_out_b
)
;
input I_rgb_clk;
input n36_6;
input I_rgb_vs;
input I_rgb_hs;
input de_d;
input [7:0] I_rgb_b;
output [9:0] q_out_b;
wire n274_2;
wire n571_2;
wire n114_3;
wire n605_3;
wire n655_3;
wire n656_3;
wire n657_3;
wire n658_3;
wire n659_3;
wire n660_3;
wire n661_3;
wire n662_3;
wire n663_3;
wire n664_3;
wire cnt_one_9bit_0_18;
wire n402_7;
wire n401_7;
wire n400_5;
wire n580_5;
wire n579_5;
wire n578_5;
wire n114_4;
wire n114_5;
wire n114_6;
wire n605_4;
wire n605_5;
wire n628_4;
wire n655_4;
wire n657_4;
wire n657_5;
wire n658_4;
wire n659_4;
wire n661_4;
wire n663_4;
wire cnt_one_9bit_1_21;
wire cnt_one_9bit_1_22;
wire cnt_one_9bit_1_23;
wire cnt_one_9bit_2_23;
wire n580_6;
wire n580_7;
wire n579_6;
wire n579_7;
wire n578_6;
wire n578_7;
wire n114_7;
wire n114_8;
wire n114_9;
wire n114_10;
wire n660_5;
wire cnt_one_9bit_1_24;
wire cnt_one_9bit_1_25;
wire cnt_one_9bit_1_26;
wire cnt_one_9bit_2_24;
wire cnt_one_9bit_2_25;
wire n579_8;
wire n578_9;
wire n114_11;
wire cnt_one_9bit_1_27;
wire n662_6;
wire n660_7;
wire n628_6;
wire n581_7;
wire n622_4;
wire n645_4;
wire n578_11;
wire c1_d;
wire sel_xnor;
wire c0_d;
wire n135_2;
wire n135_3;
wire n134_2;
wire n134_3;
wire n133_2;
wire n133_3;
wire n132_2;
wire n132_3;
wire n536_2;
wire n536_3;
wire n535_2;
wire n535_3;
wire n534_2;
wire n534_3;
wire n533_2;
wire n533_3;
wire n536_6;
wire n536_7;
wire n535_6;
wire n535_7;
wire n534_6;
wire n534_7;
wire n533_6;
wire n533_7;
wire n366_3;
wire n366_4;
wire n365_3;
wire n365_4;
wire n364_3;
wire n364_4;
wire n239_15;
wire n239_14;
wire n238_13;
wire n238_12;
wire n237_13;
wire n237_12;
wire n236_11;
wire n236_10;
wire n367_13;
wire n367_12;
wire n367_16;
wire n367_15;
wire n366_12;
wire n366_11;
wire n365_12;
wire n365_11;
wire n654_3;
wire n403_9;
wire [3:1] cnt_one_9bit;
wire [7:0] din_d;
wire [4:1] cnt;
wire VCC;
wire GND;
  LUT3 n274_s0 (
    .F(n274_2),
    .I0(n135_2),
    .I1(n239_15),
    .I2(sel_xnor) 
);
defparam n274_s0.INIT=8'h3A;
  LUT3 n571_s0 (
    .F(n571_2),
    .I0(n536_6),
    .I1(n367_16),
    .I2(n628_6) 
);
defparam n571_s0.INIT=8'hCA;
  LUT4 n114_s0 (
    .F(n114_3),
    .I0(n114_4),
    .I1(n114_5),
    .I2(I_rgb_b[0]),
    .I3(n114_6) 
);
defparam n114_s0.INIT=16'hA3CC;
  LUT3 n605_s0 (
    .F(n605_3),
    .I0(cnt_one_9bit_0_18),
    .I1(n605_4),
    .I2(n605_5) 
);
defparam n605_s0.INIT=8'hF1;
  LUT4 n655_s0 (
    .F(n655_3),
    .I0(n655_4),
    .I1(c0_d),
    .I2(c1_d),
    .I3(de_d) 
);
defparam n655_s0.INIT=16'hAAC3;
  LUT3 n656_s0 (
    .F(n656_3),
    .I0(c0_d),
    .I1(sel_xnor),
    .I2(de_d) 
);
defparam n656_s0.INIT=8'h35;
  LUT4 n657_s0 (
    .F(n657_3),
    .I0(c0_d),
    .I1(n657_4),
    .I2(n657_5),
    .I3(de_d) 
);
defparam n657_s0.INIT=16'hC3AA;
  LUT4 n658_s0 (
    .F(n658_3),
    .I0(c0_d),
    .I1(n658_4),
    .I2(n655_4),
    .I3(de_d) 
);
defparam n658_s0.INIT=16'hC355;
  LUT4 n659_s0 (
    .F(n659_3),
    .I0(c0_d),
    .I1(n659_4),
    .I2(n655_4),
    .I3(de_d) 
);
defparam n659_s0.INIT=16'hC3AA;
  LUT4 n660_s0 (
    .F(n660_3),
    .I0(c0_d),
    .I1(n655_4),
    .I2(n660_7),
    .I3(de_d) 
);
defparam n660_s0.INIT=16'hC355;
  LUT4 n661_s0 (
    .F(n661_3),
    .I0(c0_d),
    .I1(n661_4),
    .I2(n657_4),
    .I3(de_d) 
);
defparam n661_s0.INIT=16'hC3AA;
  LUT4 n662_s0 (
    .F(n662_3),
    .I0(c0_d),
    .I1(n655_4),
    .I2(n662_6),
    .I3(de_d) 
);
defparam n662_s0.INIT=16'hC355;
  LUT4 n663_s0 (
    .F(n663_3),
    .I0(c0_d),
    .I1(n663_4),
    .I2(n657_4),
    .I3(de_d) 
);
defparam n663_s0.INIT=16'hC3AA;
  LUT3 n664_s0 (
    .F(n664_3),
    .I0(c0_d),
    .I1(n654_3),
    .I2(de_d) 
);
defparam n664_s0.INIT=8'hCA;
  LUT4 cnt_one_9bit_0_s13 (
    .F(cnt_one_9bit_0_18),
    .I0(din_d[1]),
    .I1(din_d[3]),
    .I2(din_d[5]),
    .I3(din_d[7]) 
);
defparam cnt_one_9bit_0_s13.INIT=16'h6996;
  LUT4 cnt_one_9bit_2_s15 (
    .F(cnt_one_9bit[2]),
    .I0(cnt_one_9bit_1_21),
    .I1(cnt_one_9bit_1_22),
    .I2(cnt_one_9bit_1_23),
    .I3(cnt_one_9bit_2_23) 
);
defparam cnt_one_9bit_2_s15.INIT=16'hF74D;
  LUT3 cnt_one_9bit_3_s11 (
    .F(cnt_one_9bit[3]),
    .I0(cnt_one_9bit_2_23),
    .I1(cnt_one_9bit_1_22),
    .I2(cnt_one_9bit_1_23) 
);
defparam cnt_one_9bit_3_s11.INIT=8'h08;
  LUT2 n402_s3 (
    .F(n402_7),
    .I0(cnt[1]),
    .I1(cnt[2]) 
);
defparam n402_s3.INIT=4'h6;
  LUT3 n401_s3 (
    .F(n401_7),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]) 
);
defparam n401_s3.INIT=8'h78;
  LUT4 n400_s2 (
    .F(n400_5),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]),
    .I3(cnt[4]) 
);
defparam n400_s2.INIT=16'h7F80;
  LUT4 n580_s1 (
    .F(n580_5),
    .I0(n580_6),
    .I1(n580_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n580_s1.INIT=16'h5C00;
  LUT4 n579_s1 (
    .F(n579_5),
    .I0(n579_6),
    .I1(n579_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n579_s1.INIT=16'hAC00;
  LUT4 n578_s1 (
    .F(n578_5),
    .I0(n578_6),
    .I1(n578_7),
    .I2(n605_3),
    .I3(de_d) 
);
defparam n578_s1.INIT=16'hCA00;
  LUT3 n114_s1 (
    .F(n114_4),
    .I0(I_rgb_b[1]),
    .I1(I_rgb_b[2]),
    .I2(I_rgb_b[4]) 
);
defparam n114_s1.INIT=8'h80;
  LUT3 n114_s2 (
    .F(n114_5),
    .I0(n114_7),
    .I1(n114_8),
    .I2(I_rgb_b[7]) 
);
defparam n114_s2.INIT=8'h7E;
  LUT4 n114_s3 (
    .F(n114_6),
    .I0(n114_9),
    .I1(n114_10),
    .I2(n114_8),
    .I3(n114_5) 
);
defparam n114_s3.INIT=16'hB2FD;
  LUT4 n605_s1 (
    .F(n605_4),
    .I0(cnt_one_9bit_2_23),
    .I1(cnt_one_9bit_1_21),
    .I2(cnt_one_9bit_1_22),
    .I3(cnt_one_9bit_1_23) 
);
defparam n605_s1.INIT=16'hC7BC;
  LUT4 n605_s2 (
    .F(n605_5),
    .I0(cnt[1]),
    .I1(cnt[2]),
    .I2(cnt[3]),
    .I3(cnt[4]) 
);
defparam n605_s2.INIT=16'h0001;
  LUT4 n628_s1 (
    .F(n628_4),
    .I0(cnt_one_9bit_1_21),
    .I1(cnt_one_9bit_1_23),
    .I2(cnt_one_9bit_2_23),
    .I3(cnt[4]) 
);
defparam n628_s1.INIT=16'h0EF1;
  LUT3 n655_s1 (
    .F(n655_4),
    .I0(n628_4),
    .I1(sel_xnor),
    .I2(n605_3) 
);
defparam n655_s1.INIT=8'hCA;
  LUT3 n657_s1 (
    .F(n657_4),
    .I0(n605_3),
    .I1(sel_xnor),
    .I2(n628_4) 
);
defparam n657_s1.INIT=8'h14;
  LUT2 n657_s2 (
    .F(n657_5),
    .I0(din_d[7]),
    .I1(n658_4) 
);
defparam n657_s2.INIT=4'h6;
  LUT4 n658_s1 (
    .F(n658_4),
    .I0(din_d[4]),
    .I1(din_d[5]),
    .I2(din_d[6]),
    .I3(n661_4) 
);
defparam n658_s1.INIT=16'h6996;
  LUT4 n659_s1 (
    .F(n659_4),
    .I0(sel_xnor),
    .I1(din_d[4]),
    .I2(din_d[5]),
    .I3(n661_4) 
);
defparam n659_s1.INIT=16'h6996;
  LUT4 n661_s1 (
    .F(n661_4),
    .I0(din_d[0]),
    .I1(din_d[1]),
    .I2(din_d[2]),
    .I3(din_d[3]) 
);
defparam n661_s1.INIT=16'h9669;
  LUT2 n663_s1 (
    .F(n663_4),
    .I0(din_d[0]),
    .I1(din_d[1]) 
);
defparam n663_s1.INIT=4'h9;
  LUT2 cnt_one_9bit_1_s15 (
    .F(cnt_one_9bit_1_21),
    .I0(din_d[4]),
    .I1(cnt_one_9bit_1_24) 
);
defparam cnt_one_9bit_1_s15.INIT=4'h6;
  LUT4 cnt_one_9bit_1_s16 (
    .F(cnt_one_9bit_1_22),
    .I0(cnt_one_9bit_0_18),
    .I1(sel_xnor),
    .I2(din_d[7]),
    .I3(n658_4) 
);
defparam cnt_one_9bit_1_s16.INIT=16'h1441;
  LUT4 cnt_one_9bit_1_s17 (
    .F(cnt_one_9bit_1_23),
    .I0(din_d[0]),
    .I1(din_d[1]),
    .I2(cnt_one_9bit_1_25),
    .I3(cnt_one_9bit_1_26) 
);
defparam cnt_one_9bit_1_s17.INIT=16'hE11E;
  LUT4 cnt_one_9bit_2_s16 (
    .F(cnt_one_9bit_2_23),
    .I0(din_d[1]),
    .I1(cnt_one_9bit_1_26),
    .I2(cnt_one_9bit_2_24),
    .I3(cnt_one_9bit_2_25) 
);
defparam cnt_one_9bit_2_s16.INIT=16'hCA5C;
  LUT4 n580_s2 (
    .F(n580_6),
    .I0(n134_2),
    .I1(n238_13),
    .I2(n239_15),
    .I3(sel_xnor) 
);
defparam n580_s2.INIT=16'hC355;
  LUT3 n580_s3 (
    .F(n580_7),
    .I0(n366_12),
    .I1(n535_6),
    .I2(n628_4) 
);
defparam n580_s3.INIT=8'hAC;
  LUT4 n579_s2 (
    .F(n579_6),
    .I0(n133_2),
    .I1(n579_8),
    .I2(n237_13),
    .I3(sel_xnor) 
);
defparam n579_s2.INIT=16'hC355;
  LUT3 n579_s3 (
    .F(n579_7),
    .I0(n365_12),
    .I1(n534_6),
    .I2(n628_4) 
);
defparam n579_s3.INIT=8'h53;
  LUT4 n578_s2 (
    .F(n578_6),
    .I0(n578_11),
    .I1(n534_6),
    .I2(n533_6),
    .I3(n628_4) 
);
defparam n578_s2.INIT=16'hAAC3;
  LUT4 n578_s3 (
    .F(n578_7),
    .I0(n578_9),
    .I1(n133_2),
    .I2(n132_2),
    .I3(sel_xnor) 
);
defparam n578_s3.INIT=16'hAAC3;
  LUT4 n114_s4 (
    .F(n114_7),
    .I0(I_rgb_b[3]),
    .I1(I_rgb_b[5]),
    .I2(I_rgb_b[6]),
    .I3(n114_11) 
);
defparam n114_s4.INIT=16'h9669;
  LUT4 n114_s5 (
    .F(n114_8),
    .I0(I_rgb_b[3]),
    .I1(I_rgb_b[5]),
    .I2(n114_9),
    .I3(n114_10) 
);
defparam n114_s5.INIT=16'h7887;
  LUT4 n114_s6 (
    .F(n114_9),
    .I0(I_rgb_b[6]),
    .I1(n114_11),
    .I2(I_rgb_b[3]),
    .I3(I_rgb_b[5]) 
);
defparam n114_s6.INIT=16'hD44D;
  LUT4 n114_s7 (
    .F(n114_10),
    .I0(I_rgb_b[0]),
    .I1(I_rgb_b[1]),
    .I2(I_rgb_b[2]),
    .I3(I_rgb_b[4]) 
);
defparam n114_s7.INIT=16'h7EE8;
  LUT2 n660_s2 (
    .F(n660_5),
    .I0(din_d[3]),
    .I1(din_d[4]) 
);
defparam n660_s2.INIT=4'h9;
  LUT4 cnt_one_9bit_1_s18 (
    .F(cnt_one_9bit_1_24),
    .I0(cnt_one_9bit_1_27),
    .I1(din_d[5]),
    .I2(din_d[6]),
    .I3(n661_4) 
);
defparam cnt_one_9bit_1_s18.INIT=16'hA33A;
  LUT4 cnt_one_9bit_1_s19 (
    .F(cnt_one_9bit_1_25),
    .I0(sel_xnor),
    .I1(din_d[2]),
    .I2(din_d[0]),
    .I3(n660_5) 
);
defparam cnt_one_9bit_1_s19.INIT=16'h63F5;
  LUT4 cnt_one_9bit_1_s20 (
    .F(cnt_one_9bit_1_26),
    .I0(sel_xnor),
    .I1(din_d[4]),
    .I2(din_d[5]),
    .I3(n661_4) 
);
defparam cnt_one_9bit_1_s20.INIT=16'h8241;
  LUT3 cnt_one_9bit_2_s17 (
    .F(cnt_one_9bit_2_24),
    .I0(sel_xnor),
    .I1(din_d[1]),
    .I2(din_d[0]) 
);
defparam cnt_one_9bit_2_s17.INIT=8'h5C;
  LUT4 cnt_one_9bit_2_s18 (
    .F(cnt_one_9bit_2_25),
    .I0(sel_xnor),
    .I1(din_d[0]),
    .I2(din_d[2]),
    .I3(n660_5) 
);
defparam cnt_one_9bit_2_s18.INIT=16'hC355;
  LUT2 n579_s4 (
    .F(n579_8),
    .I0(n238_13),
    .I1(n239_15) 
);
defparam n579_s4.INIT=4'h8;
  LUT4 n578_s5 (
    .F(n578_9),
    .I0(n238_13),
    .I1(n239_15),
    .I2(n237_13),
    .I3(n236_11) 
);
defparam n578_s5.INIT=16'h07F8;
  LUT4 n114_s8 (
    .F(n114_11),
    .I0(I_rgb_b[0]),
    .I1(I_rgb_b[1]),
    .I2(I_rgb_b[2]),
    .I3(I_rgb_b[4]) 
);
defparam n114_s8.INIT=16'h9669;
  LUT3 cnt_one_9bit_1_s21 (
    .F(cnt_one_9bit_1_27),
    .I0(din_d[1]),
    .I1(sel_xnor),
    .I2(din_d[3]) 
);
defparam cnt_one_9bit_1_s21.INIT=8'h69;
  LUT3 n662_s2 (
    .F(n662_6),
    .I0(din_d[2]),
    .I1(din_d[0]),
    .I2(din_d[1]) 
);
defparam n662_s2.INIT=8'h69;
  LUT3 n660_s3 (
    .F(n660_7),
    .I0(din_d[3]),
    .I1(din_d[4]),
    .I2(n662_6) 
);
defparam n660_s3.INIT=8'h96;
  LUT4 cnt_one_9bit_1_s22 (
    .F(cnt_one_9bit[1]),
    .I0(din_d[4]),
    .I1(cnt_one_9bit_1_24),
    .I2(cnt_one_9bit_1_22),
    .I3(cnt_one_9bit_1_23) 
);
defparam cnt_one_9bit_1_s22.INIT=16'h6996;
  LUT4 n628_s2 (
    .F(n628_6),
    .I0(cnt_one_9bit_0_18),
    .I1(n605_4),
    .I2(n605_5),
    .I3(n628_4) 
);
defparam n628_s2.INIT=16'h0E00;
  LUT4 n581_s2 (
    .F(n581_7),
    .I0(de_d),
    .I1(n571_2),
    .I2(n274_2),
    .I3(n605_3) 
);
defparam n581_s2.INIT=16'hA088;
  LUT2 n654_s2 (
    .F(n622_4),
    .I0(din_d[0]),
    .I1(sel_xnor) 
);
defparam n654_s2.INIT=4'h6;
  LUT2 n654_s1 (
    .F(n645_4),
    .I0(din_d[0]),
    .I1(n628_6) 
);
defparam n654_s1.INIT=4'h6;
  LUT4 n578_s6 (
    .F(n578_11),
    .I0(n364_3),
    .I1(cnt_one_9bit[3]),
    .I2(n365_11),
    .I3(n365_12) 
);
defparam n578_s6.INIT=16'h9669;
  DFFC din_d_6_s0 (
    .Q(din_d[6]),
    .D(I_rgb_b[6]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_5_s0 (
    .Q(din_d[5]),
    .D(I_rgb_b[5]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_4_s0 (
    .Q(din_d[4]),
    .D(I_rgb_b[4]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_3_s0 (
    .Q(din_d[3]),
    .D(I_rgb_b[3]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_2_s0 (
    .Q(din_d[2]),
    .D(I_rgb_b[2]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_1_s0 (
    .Q(din_d[1]),
    .D(I_rgb_b[1]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_0_s0 (
    .Q(din_d[0]),
    .D(I_rgb_b[0]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFP c1_d_s0 (
    .Q(c1_d),
    .D(I_rgb_vs),
    .CLK(I_rgb_clk),
    .PRESET(n36_6) 
);
  DFFC sel_xnor_s0 (
    .Q(sel_xnor),
    .D(n114_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_4_s0 (
    .Q(cnt[4]),
    .D(n578_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_3_s0 (
    .Q(cnt[3]),
    .D(n579_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_2_s0 (
    .Q(cnt[2]),
    .D(n580_5),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC cnt_1_s0 (
    .Q(cnt[1]),
    .D(n581_7),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_9_s0 (
    .Q(q_out_b[9]),
    .D(n655_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_8_s0 (
    .Q(q_out_b[8]),
    .D(n656_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_7_s0 (
    .Q(q_out_b[7]),
    .D(n657_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_6_s0 (
    .Q(q_out_b[6]),
    .D(n658_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_5_s0 (
    .Q(q_out_b[5]),
    .D(n659_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_4_s0 (
    .Q(q_out_b[4]),
    .D(n660_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_3_s0 (
    .Q(q_out_b[3]),
    .D(n661_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_2_s0 (
    .Q(q_out_b[2]),
    .D(n662_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_1_s0 (
    .Q(q_out_b[1]),
    .D(n663_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC dout_0_s0 (
    .Q(q_out_b[0]),
    .D(n664_3),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFC din_d_7_s0 (
    .Q(din_d[7]),
    .D(I_rgb_b[7]),
    .CLK(I_rgb_clk),
    .CLEAR(n36_6) 
);
  DFFP c0_d_s0 (
    .Q(c0_d),
    .D(I_rgb_hs),
    .CLK(I_rgb_clk),
    .PRESET(n36_6) 
);
  ALU n135_s (
    .SUM(n135_2),
    .COUT(n135_3),
    .I0(cnt[1]),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(GND) 
);
defparam n135_s.ALU_MODE=0;
  ALU n134_s (
    .SUM(n134_2),
    .COUT(n134_3),
    .I0(cnt[2]),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n135_3) 
);
defparam n134_s.ALU_MODE=0;
  ALU n133_s (
    .SUM(n133_2),
    .COUT(n133_3),
    .I0(cnt[3]),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n134_3) 
);
defparam n133_s.ALU_MODE=0;
  ALU n132_s (
    .SUM(n132_2),
    .COUT(n132_3),
    .I0(cnt[4]),
    .I1(cnt_one_9bit[3]),
    .I3(GND),
    .CIN(n133_3) 
);
defparam n132_s.ALU_MODE=0;
  ALU n536_s (
    .SUM(n536_2),
    .COUT(n536_3),
    .I0(n403_9),
    .I1(sel_xnor),
    .I3(GND),
    .CIN(GND) 
);
defparam n536_s.ALU_MODE=0;
  ALU n535_s (
    .SUM(n535_2),
    .COUT(n535_3),
    .I0(n402_7),
    .I1(VCC),
    .I3(GND),
    .CIN(n536_3) 
);
defparam n535_s.ALU_MODE=0;
  ALU n534_s (
    .SUM(n534_2),
    .COUT(n534_3),
    .I0(n401_7),
    .I1(VCC),
    .I3(GND),
    .CIN(n535_3) 
);
defparam n534_s.ALU_MODE=0;
  ALU n533_s (
    .SUM(n533_2),
    .COUT(n533_3),
    .I0(n400_5),
    .I1(VCC),
    .I3(GND),
    .CIN(n534_3) 
);
defparam n533_s.ALU_MODE=0;
  ALU n536_s1 (
    .SUM(n536_6),
    .COUT(n536_7),
    .I0(n536_2),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(VCC) 
);
defparam n536_s1.ALU_MODE=0;
  ALU n535_s1 (
    .SUM(n535_6),
    .COUT(n535_7),
    .I0(n535_2),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n536_7) 
);
defparam n535_s1.ALU_MODE=0;
  ALU n534_s1 (
    .SUM(n534_6),
    .COUT(n534_7),
    .I0(n534_2),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n535_7) 
);
defparam n534_s1.ALU_MODE=0;
  ALU n533_s1 (
    .SUM(n533_6),
    .COUT(n533_7),
    .I0(n533_2),
    .I1(cnt_one_9bit[3]),
    .I3(GND),
    .CIN(n534_7) 
);
defparam n533_s1.ALU_MODE=0;
  ALU n366_s (
    .SUM(n366_3),
    .COUT(n366_4),
    .I0(cnt[2]),
    .I1(GND),
    .I3(GND),
    .CIN(n367_12) 
);
defparam n366_s.ALU_MODE=0;
  ALU n365_s (
    .SUM(n365_3),
    .COUT(n365_4),
    .I0(cnt[3]),
    .I1(GND),
    .I3(GND),
    .CIN(n366_4) 
);
defparam n365_s.ALU_MODE=0;
  ALU n364_s (
    .SUM(n364_3),
    .COUT(n364_4),
    .I0(cnt[4]),
    .I1(GND),
    .I3(GND),
    .CIN(n365_4) 
);
defparam n364_s.ALU_MODE=0;
  ALU n239_s6 (
    .SUM(n239_15),
    .COUT(n239_14),
    .I0(cnt[1]),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(GND) 
);
defparam n239_s6.ALU_MODE=1;
  ALU n238_s5 (
    .SUM(n238_13),
    .COUT(n238_12),
    .I0(cnt[2]),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n239_14) 
);
defparam n238_s5.ALU_MODE=1;
  ALU n237_s5 (
    .SUM(n237_13),
    .COUT(n237_12),
    .I0(cnt[3]),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n238_12) 
);
defparam n237_s5.ALU_MODE=1;
  ALU n236_s4 (
    .SUM(n236_11),
    .COUT(n236_10),
    .I0(cnt[4]),
    .I1(cnt_one_9bit[3]),
    .I3(GND),
    .CIN(n237_12) 
);
defparam n236_s4.ALU_MODE=1;
  ALU n367_s4 (
    .SUM(n367_13),
    .COUT(n367_12),
    .I0(cnt[1]),
    .I1(sel_xnor),
    .I3(GND),
    .CIN(GND) 
);
defparam n367_s4.ALU_MODE=1;
  ALU n367_s5 (
    .SUM(n367_16),
    .COUT(n367_15),
    .I0(n367_13),
    .I1(cnt_one_9bit_0_18),
    .I3(GND),
    .CIN(VCC) 
);
defparam n367_s5.ALU_MODE=1;
  ALU n366_s3 (
    .SUM(n366_12),
    .COUT(n366_11),
    .I0(n366_3),
    .I1(cnt_one_9bit[1]),
    .I3(GND),
    .CIN(n367_15) 
);
defparam n366_s3.ALU_MODE=1;
  ALU n365_s3 (
    .SUM(n365_12),
    .COUT(n365_11),
    .I0(n365_3),
    .I1(cnt_one_9bit[2]),
    .I3(GND),
    .CIN(n366_11) 
);
defparam n365_s3.ALU_MODE=1;
  MUX2_LUT5 n654_s0 (
    .O(n654_3),
    .I0(n645_4),
    .I1(n622_4),
    .S0(n605_3) 
);
  INV n403_s5 (
    .O(n403_9),
    .I(cnt[1]) 
);
  VCC VCC_cZ (
    .V(VCC)
);
  GND GND_cZ (
    .G(GND)
);
endmodule /* \~TMDS8b10b.DVI_TX_Top_1  */
module \~rgb2dvi.DVI_TX_Top  (
  I_rgb_clk,
  I_serial_clk,
  I_rst_n,
  I_rgb_de,
  I_rgb_vs,
  I_rgb_hs,
  I_rgb_r,
  I_rgb_g,
  I_rgb_b,
  O_tmds_clk_p,
  O_tmds_clk_n,
  O_tmds_data_p,
  O_tmds_data_n
)
;
input I_rgb_clk;
input I_serial_clk;
input I_rst_n;
input I_rgb_de;
input I_rgb_vs;
input I_rgb_hs;
input [7:0] I_rgb_r;
input [7:0] I_rgb_g;
input [7:0] I_rgb_b;
output O_tmds_clk_p;
output O_tmds_clk_n;
output [2:0] O_tmds_data_p;
output [2:0] O_tmds_data_n;
wire sdataout_r;
wire sdataout_g;
wire sdataout_b;
wire sdataout_clk;
wire n36_6;
wire de_d;
wire c1_d;
wire [9:0] q_out_r;
wire [9:0] q_out_g;
wire [9:0] q_out_b;
wire VCC;
wire GND;
  TLVDS_OBUF u_LVDS_r (
    .O(O_tmds_data_p[2]),
    .OB(O_tmds_data_n[2]),
    .I(sdataout_r) 
);
  TLVDS_OBUF u_LVDS_g (
    .O(O_tmds_data_p[1]),
    .OB(O_tmds_data_n[1]),
    .I(sdataout_g) 
);
  TLVDS_OBUF u_LVDS_b (
    .O(O_tmds_data_p[0]),
    .OB(O_tmds_data_n[0]),
    .I(sdataout_b) 
);
  TLVDS_OBUF u_LVDS_clk (
    .O(O_tmds_clk_p),
    .OB(O_tmds_clk_n),
    .I(sdataout_clk) 
);
  OSER10 u_OSER10_r (
    .Q(sdataout_r),
    .D0(~q_out_r[0]),
    .D1(~q_out_r[1]),
    .D2(~q_out_r[2]),
    .D3(~q_out_r[3]),
    .D4(~q_out_r[4]),
    .D5(~q_out_r[5]),
    .D6(~q_out_r[6]),
    .D7(~q_out_r[7]),
    .D8(~q_out_r[8]),
    .D9(~q_out_r[9]),
    .PCLK(I_rgb_clk),
    .FCLK(I_serial_clk),
    .RESET(n36_6) 
);
defparam u_OSER10_r.GSREN="false";
defparam u_OSER10_r.LSREN="true";
  OSER10 u_OSER10_g (
    .Q(sdataout_g),
    .D0(q_out_g[0]),
    .D1(q_out_g[1]),
    .D2(q_out_g[2]),
    .D3(q_out_g[3]),
    .D4(q_out_g[4]),
    .D5(q_out_g[5]),
    .D6(q_out_g[6]),
    .D7(q_out_g[7]),
    .D8(q_out_g[8]),
    .D9(q_out_g[9]),
    .PCLK(I_rgb_clk),
    .FCLK(I_serial_clk),
    .RESET(n36_6) 
);
defparam u_OSER10_g.GSREN="false";
defparam u_OSER10_g.LSREN="true";
  OSER10 u_OSER10_b (
    .Q(sdataout_b),
    .D0(~q_out_b[0]),
    .D1(~q_out_b[1]),
    .D2(~q_out_b[2]),
    .D3(~q_out_b[3]),
    .D4(~q_out_b[4]),
    .D5(~q_out_b[5]),
    .D6(~q_out_b[6]),
    .D7(~q_out_b[7]),
    .D8(~q_out_b[8]),
    .D9(~q_out_b[9]),
    .PCLK(I_rgb_clk),
    .FCLK(I_serial_clk),
    .RESET(n36_6) 
);
defparam u_OSER10_b.GSREN="false";
defparam u_OSER10_b.LSREN="true";
  OSER10 u_OSER10_clk (
    .Q(sdataout_clk),
    .D0(GND),
    .D1(GND),
    .D2(GND),
    .D3(GND),
    .D4(GND),
    .D5(VCC),
    .D6(VCC),
    .D7(VCC),
    .D8(VCC),
    .D9(VCC),
    .PCLK(I_rgb_clk),
    .FCLK(I_serial_clk),
    .RESET(n36_6) 
);
defparam u_OSER10_clk.GSREN="false";
defparam u_OSER10_clk.LSREN="true";
  INV n36_s2 (
    .O(n36_6),
    .I(I_rst_n) 
);
  \~TMDS8b10b.DVI_TX_Top  TMDS8b10b_inst_r (
    .I_rgb_clk(I_rgb_clk),
    .n36_6(n36_6),
    .I_rgb_de(I_rgb_de),
    .I_rgb_r(I_rgb_r[7:0]),
    .de_d(de_d),
    .c1_d(c1_d),
    .q_out_r(q_out_r[9:0])
);
  \~TMDS8b10b.DVI_TX_Top_0  TMDS8b10b_inst_g (
    .I_rgb_clk(I_rgb_clk),
    .n36_6(n36_6),
    .c1_d(c1_d),
    .de_d(de_d),
    .I_rgb_g(I_rgb_g[7:0]),
    .q_out_g(q_out_g[9:0])
);
  \~TMDS8b10b.DVI_TX_Top_1  TMDS8b10b_inst_b (
    .I_rgb_clk(I_rgb_clk),
    .n36_6(n36_6),
    .I_rgb_vs(I_rgb_vs),
    .I_rgb_hs(I_rgb_hs),
    .de_d(de_d),
    .I_rgb_b(I_rgb_b[7:0]),
    .q_out_b(q_out_b[9:0])
);
  VCC VCC_cZ (
    .V(VCC)
);
  GND GND_cZ (
    .G(GND)
);
endmodule /* \~rgb2dvi.DVI_TX_Top  */


// IP Decryptor end

module DVI_TX_Top (
  I_rst_n,
  I_serial_clk,
  I_rgb_clk,
  I_rgb_vs,
  I_rgb_hs,
  I_rgb_de,
  I_rgb_r,
  I_rgb_g,
  I_rgb_b,
  O_tmds_clk_p,
  O_tmds_clk_n,
  O_tmds_data_p,
  O_tmds_data_n
)
;
input I_rst_n;
input I_serial_clk;
input I_rgb_clk;
input I_rgb_vs;
input I_rgb_hs;
input I_rgb_de;
input [7:0] I_rgb_r;
input [7:0] I_rgb_g;
input [7:0] I_rgb_b;
output O_tmds_clk_p;
output O_tmds_clk_n;
output [2:0] O_tmds_data_p;
output [2:0] O_tmds_data_n;
wire VCC;
wire GND;
  \~rgb2dvi.DVI_TX_Top  rgb2dvi_inst (
    .I_rgb_clk(I_rgb_clk),
    .I_serial_clk(I_serial_clk),
    .I_rst_n(I_rst_n),
    .I_rgb_de(I_rgb_de),
    .I_rgb_vs(I_rgb_vs),
    .I_rgb_hs(I_rgb_hs),
    .I_rgb_r(I_rgb_r[7:0]),
    .I_rgb_g(I_rgb_g[7:0]),
    .I_rgb_b(I_rgb_b[7:0]),
    .O_tmds_clk_p(O_tmds_clk_p),
    .O_tmds_clk_n(O_tmds_clk_n),
    .O_tmds_data_p(O_tmds_data_p[2:0]),
    .O_tmds_data_n(O_tmds_data_n[2:0])
);
  VCC VCC_cZ (
    .V(VCC)
);
  GND GND_cZ (
    .G(GND)
);
  GSR GSR (
    .GSRI(VCC) 
);
endmodule /* DVI_TX_Top */
