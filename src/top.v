module top (
    input clk,
    input mipi_clk_p,
    input mipi_clk_n,
    input [3:0] mipi_dat_p,
    input [3:0] mipi_dat_n,
    input nrst,
    output mipi_clk,
    output [3:0] hdmi_tx_n,
    output [3:0] hdmi_tx_p,

    output [14-1:0] ddr_addr,
    output [ 3-1:0] ddr_bank,
    output          ddr_cs,
    output          ddr_ras,
    output          ddr_cas,
    output          ddr_we,
    output          ddr_ck,
    output          ddr_ck_n,
    output          ddr_cke,
    output          ddr_odt,
    output          ddr_reset_n,
    output [ 2-1:0] ddr_dm,
    inout  [16-1:0] ddr_dq,
    inout  [ 2-1:0] ddr_dqs,
    inout  [ 2-1:0] ddr_dqs_n
);


  /* MIPI RX */
  wire ready;
  wire clk_byte;
  wire [7:0] data_out0, data_out1, data_out2, data_out3;

  MIPI_RX_Advance_Top mipi_phy (
      .reset_n(nrst),
      .HS_CLK_P(mipi_clk_p),
      .HS_CLK_N(mipi_clk_n),
      .clk_byte_out(clk_byte),
      .HS_DATA3_P(mipi_dat_p[3]),
      .HS_DATA3_N(mipi_dat_n[3]),
      .data_out3(data_out3),
      .HS_DATA2_P(mipi_dat_p[2]),
      .HS_DATA2_N(mipi_dat_n[2]),
      .data_out2(data_out2),
      .HS_DATA1_P(mipi_dat_p[1]),
      .HS_DATA1_N(mipi_dat_n[1]),
      .data_out1(data_out1),
      .HS_DATA0_P(mipi_dat_p[0]),
      .HS_DATA0_N(mipi_dat_n[0]),
      .data_out0(data_out0),
      .hs_en(1'b1),
      .clk_term_en(1'b1),
      .data_term_en(1'b1),
      .ready(ready)
  );

  wire sot = (data_out0 == 'hb8) && (data_out1 == 'hb8) && (data_out2 == 'hb8) && (data_out3 == 'hb8);
  reg sot_d = 0;
  reg [15:0] cnt_pkt;
  always @(posedge clk_byte) begin
    sot_d <= sot;
    if (cnt_pkt) begin
      cnt_pkt <= cnt_pkt - 1;
    end else if (sot_d) begin
      cnt_pkt <= ({data_out2, data_out1} + 1) >> 2;
    end
  end
  wire ipkt = ~(!cnt_pkt);
  wire ready_f = ipkt | sot | sot_d;

  wire sp_en, lp_en, lp_av_en, ecc_ok;
  wire [ 7:0] ecc;
  wire [15:0] wc;
  wire [ 1:0] vc;
  wire [ 5:0] dt;
  wire [31:0] payload;
  wire [ 3:0] payload_valid;
  MIPI_DSI_CSI2_RX_Top mipi_rx (
      .I_RSTN(nrst),
      .I_BYTE_CLK(clk_byte),
      .I_REF_DT('h1e),
      .I_READY(ready_f),
      .I_DATA0(data_out0),
      .I_DATA1(data_out1),
      .I_DATA2(data_out2),
      .I_DATA3(data_out3),
      .O_SP_EN(sp_en),
      .O_LP_EN(lp_en),
      .O_LP_AV_EN(lp_av_en),
      .O_ECC_OK(ecc_ok),
      .O_ECC(ecc),
      .O_WC(wc),
      .O_VC(vc),
      .O_DT(dt),
      .O_PAYLOAD(payload),
      .O_PAYLOAD_DV(payload_valid)
  );

  wire sof = sp_en && (dt == 0);

  /* DDR3 */
  wire memory_clk;
  wire memory_clk_lock;
  pll_ddr pll_ddr3_inst (
      .clkout(memory_clk),
      .lock  (memory_clk_lock),
      .clkin (clk)
  );

  assign ddr_cs = 1'b0;

  wire         rst_n;
  wire         clk_x1;
  wire [ 27:0] app_addr;

  wire         app_cmd_en;
  wire [  2:0] app_cmd;
  wire         app_cmd_rdy;

  wire         app_wren;
  wire [127:0] app_data;
  wire         app_data_rdy;

  wire         app_rdata_valid;
  wire         app_rdata_end;
  wire [127:0] app_rdata;

  wire         init_calib_complete;

  DDR3_Memory_Interface_Top u_ddr3 (
      .clk(clk),
      .memory_clk(memory_clk),
      .pll_lock(memory_clk_lock),
      .rst_n(1'b1),
      .cmd_ready(app_cmd_rdy),
      .cmd(app_cmd),
      .cmd_en(app_cmd_en),
      .addr(app_addr),
      .wr_data_rdy(app_data_rdy),
      .wr_data(app_data),
      .wr_data_en(app_wren),
      .wr_data_end(app_wren),
      .wr_data_mask(16'h0000),
      .rd_data(app_rdata),
      .rd_data_valid(app_rdata_valid),
      .rd_data_end(app_rdata_end),
      .sr_req(1'b0),
      .ref_req(1'b0),
      .sr_ack(),
      .ref_ack(),
      .init_calib_complete(init_calib_complete),
      .clk_out(clk_x1),
      .burst(1'b1),

      .ddr_rst      (),
      .O_ddr_addr   (ddr_addr),
      .O_ddr_ba     (ddr_bank),
      .O_ddr_cs_n   (ddr_cs1),
      .O_ddr_ras_n  (ddr_ras),
      .O_ddr_cas_n  (ddr_cas),
      .O_ddr_we_n   (ddr_we),
      .O_ddr_clk    (ddr_ck),
      .O_ddr_clk_n  (ddr_ck_n),
      .O_ddr_cke    (ddr_cke),
      .O_ddr_odt    (ddr_odt),
      .O_ddr_reset_n(ddr_reset_n),
      .O_ddr_dqm    (ddr_dm),
      .IO_ddr_dq    (ddr_dq),
      .IO_ddr_dqs   (ddr_dqs),
      .IO_ddr_dqs_n (ddr_dqs_n)
  );

//reg [7:0] read_cnt = 0;
//reg [7:0] valid_cnt = 0;

  /* image gen */
  reg [15:0] cnt_cols = 0;
  reg [15:0] cnt_rows = 0;
  reg [19:0] cnt_cycles = 0;
  reg [10:0] tmr = 0;

  always @(posedge clk_byte) begin
    cnt_cols <= cnt_cols + payload_valid[0] + payload_valid[1] + payload_valid[2] + payload_valid[3];
    cnt_rows <= cnt_rows + lp_av_en;
    cnt_cycles <= cnt_cycles + 1;
    if (sof) begin
      cnt_cycles <= 0;
      cnt_rows <= 0;
      tmr <= 1000;
    end
    if (!payload_valid) begin
      cnt_cols <= 0;
    end
    if (tmr) tmr <= tmr - 1;
  end

  assign mipi_clk = clk_byte;

  reg [7:0] mipi_cnt = 0;
  always @(posedge mipi_clk) begin
    mipi_cnt <= mipi_cnt + 1;
  end

  /* HDMI clock gen */
  wire hdmi_clk_5x;
  pll_dvi pll_dvi_inst (
      .clkout(hdmi_clk_5x),
      .clkin (clk)
  );
  CLKDIV #(
      .DIV_MODE("5"),
      .GSREN("false")
  ) hdmi_clock_div (
      .CLKOUT(hdmi_clk),
      .HCLKIN(hdmi_clk_5x),
      .RESETN(1'b1),
      .CALIB (1'b1)
  );

  /* HDMI output */
  wire [2:0] hve;
  wire [23:0] pixel;

  PixBuf pixbuf_inst(
    .io_csiClk(clk_byte),
    .io_sof(sof),
    .io_lpMatched(lp_av_en),
    .io_pixData_valid(payload_valid),
    .io_pixData_payload(payload),
    .io_ddrCmd_valid(app_cmd_en),
    .io_ddrCmd_ready(app_cmd_rdy),
    .io_ddrCmd_payload_cmd(app_cmd),
    .io_ddrCmd_payload_adr(app_addr),
    .io_ddrWrite_valid(app_wren),
    .io_ddrWrite_ready(app_data_rdy),
    .io_ddrWrite_payload(app_data),
    .io_ddrRead_valid(app_rdata_valid),
    .io_ddrRead_payload(app_rdata),
    .io_ddrInitComplete(init_calib_complete),
    .io_hdmiClk(hdmi_clk),
    .io_hve_hsync(hve[0]),
    .io_hve_vsync(hve[1]),
    .io_hve_visible(hve[2]),
    .io_pixel(pixel),
    .clk(clk_x1),
    .reset(0)
);


  reg [28:0] cnt = 0;
  always @(posedge hdmi_clk) cnt <= cnt + 1;

  DVI_TX_Top dvi_tx (
      .I_rst_n(1'b1),
      .I_serial_clk(hdmi_clk_5x),
      .I_rgb_clk(hdmi_clk),
      .I_rgb_vs(hve[1]),
      .I_rgb_hs(hve[0]),
      .I_rgb_de(hve[2]),
      .I_rgb_r(pixel[7:0]),
      .I_rgb_g(pixel[15:8]),
      .I_rgb_b(pixel[23:16]),
      .O_tmds_clk_p(hdmi_tx_p[3]),
      .O_tmds_clk_n(hdmi_tx_n[3]),
      .O_tmds_data_p(hdmi_tx_p[2:0]),
      .O_tmds_data_n(hdmi_tx_n[2:0])
  );

endmodule
