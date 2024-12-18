// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : PixBuf
// Date      : 15/12/2024, 21:18:49

`timescale 1ns/1ps

module PixBuf (
  input  wire          io_csiClk,
  input  wire          io_sof,
  input  wire          io_lpMatched,
  input  wire          io_pixData_valid,
  input  wire [31:0]   io_pixData_payload,
  output reg           io_ddrCmd_valid,
  input  wire          io_ddrCmd_ready,
  output reg  [0:0]    io_ddrCmd_payload_cmd,
  output reg  [27:0]   io_ddrCmd_payload_adr,
  output reg           io_ddrWrite_valid,
  input  wire          io_ddrWrite_ready,
  output reg  [127:0]  io_ddrWrite_payload,
  input  wire          io_ddrRead_valid,
  input  wire [127:0]  io_ddrRead_payload,
  input  wire          io_ddrInitComplete,
  input  wire          io_hdmiClk,
  output wire          io_hve_hsync,
  output wire          io_hve_vsync,
  output wire          io_hve_visible,
  output wire [23:0]   io_pixel,
  input  wire          clk,
  input  wire          reset
);
  localparam DdrCmd_WRITE = 1'd0;
  localparam DdrCmd_READ = 1'd1;

  wire                streamFifoCC_2_io_push_valid;
  wire       [127:0]  streamFifoCC_2_io_push_payload;
  reg                 lastFifo_io_push_valid;
  reg                 lastFifo_io_push_payload;
  wire                hdmiArea_hve_io_clear;
  wire                streamFifoCC_2_io_push_ready;
  wire                streamFifoCC_2_io_pop_valid;
  wire       [127:0]  streamFifoCC_2_io_pop_payload;
  wire       [9:0]    streamFifoCC_2_io_pushOccupancy;
  wire       [9:0]    streamFifoCC_2_io_popOccupancy;
  wire                streamFifoCC_2__zz_6;
  wire                flowCCUnsafeByToggle_1_io_output_valid;
  wire                lastFifo_io_push_ready;
  wire                lastFifo_io_pop_valid;
  wire                lastFifo_io_pop_payload;
  wire       [6:0]    lastFifo_io_occupancy;
  wire       [6:0]    lastFifo_io_availability;
  wire                readFifo_io_push_ready;
  wire                readFifo_io_pop_valid;
  wire                readFifo_io_pop_payload_last;
  wire       [127:0]  readFifo_io_pop_payload_fragment;
  wire       [9:0]    readFifo_io_pushOccupancy;
  wire       [9:0]    readFifo_io_popOccupancy;
  wire                hdmiArea_hve_io_hve_hsync;
  wire                hdmiArea_hve_io_hve_vsync;
  wire                hdmiArea_hve_io_hve_visible;
  wire                hdmiArea_hve_io_last;
  wire                hdmiArea_yuvConv_io_yuv_ready;
  wire                hdmiArea_yuvConv_io_rgb_valid;
  wire                hdmiArea_yuvConv_io_rgb_payload_last;
  wire       [23:0]   hdmiArea_yuvConv_io_rgb_payload_fragment;
  wire       [1:0]    _zz__zz_io_push_valid_3;
  wire       [0:0]    _zz__zz_io_push_valid_3_1;
  wire       [63:0]   _zz__zz_io_push_payload_1;
  wire       [1:0]    _zz_hdmiPixCC_readStream_widthAdapter_counter_valueNext;
  wire       [0:0]    _zz_hdmiPixCC_readStream_widthAdapter_counter_valueNext_1;
  reg        [31:0]   _zz_hdmiArea_stream1_payload_fragment_1;
  wire                _zz_1;
  wire                _zz_2;
  wire                _zz_io_push_valid;
  wire       [31:0]   _zz_io_push_payload;
  reg                 _zz_io_push_valid_1;
  wire                when_PixBuf_l100;
  wire                _zz_3;
  reg                 _zz_io_push_valid_2;
  reg        [1:0]    _zz_io_push_valid_3;
  reg        [1:0]    _zz_io_push_valid_4;
  wire                _zz_io_push_valid_5;
  reg        [95:0]   _zz_io_push_payload_1;
  wire                csiCC_csiWide_valid;
  reg                 csiCC_csiWide_ready;
  wire       [127:0]  csiCC_csiWide_payload;
  reg        [27:0]   readAdr;
  reg        [27:0]   writeAdr;
  wire                hdmiPixCC_readStream_valid;
  wire                hdmiPixCC_readStream_ready;
  wire                hdmiPixCC_readStream_payload_last;
  wire       [127:0]  hdmiPixCC_readStream_payload_fragment;
  wire                io_ddrRead_toStream_valid;
  wire                io_ddrRead_toStream_ready;
  wire       [127:0]  io_ddrRead_toStream_payload;
  wire                when_PixBuf_l147;
  wire                when_PixBuf_l148;
  wire                when_PixBuf_l156;
  wire                when_PixBuf_l164;
  wire                when_PixBuf_l158;
  wire                hdmiArea_stream1_valid;
  wire                hdmiArea_stream1_ready;
  wire                hdmiArea_stream1_payload_last;
  wire       [31:0]   hdmiArea_stream1_payload_fragment;
  wire                hdmiArea_stream1_fire;
  reg                 hdmiPixCC_readStream_widthAdapter_counter_willIncrement;
  wire                hdmiPixCC_readStream_widthAdapter_counter_willClear;
  reg        [1:0]    hdmiPixCC_readStream_widthAdapter_counter_valueNext;
  reg        [1:0]    hdmiPixCC_readStream_widthAdapter_counter_value;
  wire                hdmiPixCC_readStream_widthAdapter_counter_willOverflowIfInc;
  wire                hdmiPixCC_readStream_widthAdapter_counter_willOverflow;
  wire       [127:0]  _zz_hdmiArea_stream1_payload_fragment;
  wire                hdmiArea_outStream_valid;
  wire                hdmiArea_outStream_ready;
  wire                hdmiArea_outStream_payload_last;
  wire       [23:0]   hdmiArea_outStream_payload_fragment;
  wire                hdmiArea_outStream_fire;
  `ifndef SYNTHESIS
  reg [39:0] io_ddrCmd_payload_cmd_string;
  `endif


  assign _zz__zz_io_push_valid_3_1 = _zz_io_push_valid_2;
  assign _zz__zz_io_push_valid_3 = {1'd0, _zz__zz_io_push_valid_3_1};
  assign _zz__zz_io_push_payload_1 = (_zz_io_push_payload_1 >>> 6'd32);
  assign _zz_hdmiPixCC_readStream_widthAdapter_counter_valueNext_1 = hdmiPixCC_readStream_widthAdapter_counter_willIncrement;
  assign _zz_hdmiPixCC_readStream_widthAdapter_counter_valueNext = {1'd0, _zz_hdmiPixCC_readStream_widthAdapter_counter_valueNext_1};
  StreamFifoCC streamFifoCC_2 (
    .io_push_valid    (streamFifoCC_2_io_push_valid         ), //i
    .io_push_ready    (streamFifoCC_2_io_push_ready         ), //o
    .io_push_payload  (streamFifoCC_2_io_push_payload[127:0]), //i
    .io_pop_valid     (streamFifoCC_2_io_pop_valid          ), //o
    .io_pop_ready     (csiCC_csiWide_ready                  ), //i
    .io_pop_payload   (streamFifoCC_2_io_pop_payload[127:0] ), //o
    .io_pushOccupancy (streamFifoCC_2_io_pushOccupancy[9:0] ), //o
    .io_popOccupancy  (streamFifoCC_2_io_popOccupancy[9:0]  ), //o
    .io_csiClk        (io_csiClk                            ), //i
    ._zz_5            (1'b0                                 ), //i
    .clk              (clk                                  ), //i
    ._zz_6            (streamFifoCC_2__zz_6                 )  //o
  );
  FlowCCUnsafeByToggle flowCCUnsafeByToggle_1 (
    .io_input_valid  (io_sof                                ), //i
    .io_output_valid (flowCCUnsafeByToggle_1_io_output_valid), //o
    .io_csiClk       (io_csiClk                             ), //i
    ._zz_1           (1'b0                                  ), //i
    .clk             (clk                                   ), //i
    ._zz_2           (streamFifoCC_2__zz_6                  )  //i
  );
  StreamFifo lastFifo (
    .io_push_valid   (lastFifo_io_push_valid       ), //i
    .io_push_ready   (lastFifo_io_push_ready       ), //o
    .io_push_payload (lastFifo_io_push_payload     ), //i
    .io_pop_valid    (lastFifo_io_pop_valid        ), //o
    .io_pop_ready    (io_ddrRead_valid             ), //i
    .io_pop_payload  (lastFifo_io_pop_payload      ), //o
    .io_flush        (1'b0                         ), //i
    .io_occupancy    (lastFifo_io_occupancy[6:0]   ), //o
    .io_availability (lastFifo_io_availability[6:0]), //o
    .clk             (clk                          ), //i
    .reset           (reset                        )  //i
  );
  StreamFifoCC_1 readFifo (
    .io_push_valid            (io_ddrRead_toStream_valid              ), //i
    .io_push_ready            (readFifo_io_push_ready                 ), //o
    .io_push_payload_last     (lastFifo_io_pop_payload                ), //i
    .io_push_payload_fragment (io_ddrRead_toStream_payload[127:0]     ), //i
    .io_pop_valid             (readFifo_io_pop_valid                  ), //o
    .io_pop_ready             (hdmiPixCC_readStream_ready             ), //i
    .io_pop_payload_last      (readFifo_io_pop_payload_last           ), //o
    .io_pop_payload_fragment  (readFifo_io_pop_payload_fragment[127:0]), //o
    .io_pushOccupancy         (readFifo_io_pushOccupancy[9:0]         ), //o
    .io_popOccupancy          (readFifo_io_popOccupancy[9:0]          ), //o
    .clk                      (clk                                    ), //i
    .reset                    (reset                                  ), //i
    .io_hdmiClk               (io_hdmiClk                             )  //i
  );
  GenHve hdmiArea_hve (
    .io_hve_hsync   (hdmiArea_hve_io_hve_hsync  ), //o
    .io_hve_vsync   (hdmiArea_hve_io_hve_vsync  ), //o
    .io_hve_visible (hdmiArea_hve_io_hve_visible), //o
    .io_last        (hdmiArea_hve_io_last       ), //o
    .io_clear       (hdmiArea_hve_io_clear      ), //i
    .io_hdmiClk     (io_hdmiClk                 ), //i
    ._zz_1          (1'b0                       )  //i
  );
  Yuv422ToRgb hdmiArea_yuvConv (
    .io_yuv_valid            (hdmiArea_stream1_valid                        ), //i
    .io_yuv_ready            (hdmiArea_yuvConv_io_yuv_ready                 ), //o
    .io_yuv_payload_last     (hdmiArea_stream1_payload_last                 ), //i
    .io_yuv_payload_fragment (hdmiArea_stream1_payload_fragment[31:0]       ), //i
    .io_rgb_valid            (hdmiArea_yuvConv_io_rgb_valid                 ), //o
    .io_rgb_ready            (hdmiArea_outStream_ready                      ), //i
    .io_rgb_payload_last     (hdmiArea_yuvConv_io_rgb_payload_last          ), //o
    .io_rgb_payload_fragment (hdmiArea_yuvConv_io_rgb_payload_fragment[23:0]), //o
    .io_hdmiClk              (io_hdmiClk                                    ), //i
    ._zz_1                   (1'b0                                          )  //i
  );
  always @(*) begin
    case(hdmiPixCC_readStream_widthAdapter_counter_value)
      2'b00 : _zz_hdmiArea_stream1_payload_fragment_1 = _zz_hdmiArea_stream1_payload_fragment[31 : 0];
      2'b01 : _zz_hdmiArea_stream1_payload_fragment_1 = _zz_hdmiArea_stream1_payload_fragment[63 : 32];
      2'b10 : _zz_hdmiArea_stream1_payload_fragment_1 = _zz_hdmiArea_stream1_payload_fragment[95 : 64];
      default : _zz_hdmiArea_stream1_payload_fragment_1 = _zz_hdmiArea_stream1_payload_fragment[127 : 96];
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(io_ddrCmd_payload_cmd)
      DdrCmd_WRITE : io_ddrCmd_payload_cmd_string = "WRITE";
      DdrCmd_READ : io_ddrCmd_payload_cmd_string = "READ ";
      default : io_ddrCmd_payload_cmd_string = "?????";
    endcase
  end
  `endif

  assign _zz_1 = 1'b0;
  assign _zz_2 = 1'b0;
  assign when_PixBuf_l100 = (! io_pixData_valid);
  assign _zz_io_push_valid = (_zz_io_push_valid_1 && io_pixData_valid);
  assign _zz_io_push_payload = io_pixData_payload;
  assign _zz_3 = (_zz_io_push_valid && (! ((! streamFifoCC_2_io_push_ready) && _zz_io_push_valid_5)));
  always @(*) begin
    _zz_io_push_valid_2 = 1'b0;
    if(_zz_3) begin
      _zz_io_push_valid_2 = 1'b1;
    end
  end

  assign _zz_io_push_valid_5 = (_zz_io_push_valid_4 == 2'b11);
  always @(*) begin
    _zz_io_push_valid_3 = (_zz_io_push_valid_4 + _zz__zz_io_push_valid_3);
    if(1'b0) begin
      _zz_io_push_valid_3 = 2'b00;
    end
  end

  assign streamFifoCC_2_io_push_valid = (_zz_io_push_valid && _zz_io_push_valid_5);
  assign streamFifoCC_2_io_push_payload = {_zz_io_push_payload,_zz_io_push_payload_1};
  assign csiCC_csiWide_valid = streamFifoCC_2_io_pop_valid;
  assign csiCC_csiWide_payload = streamFifoCC_2_io_pop_payload;
  always @(*) begin
    csiCC_csiWide_ready = 1'b0;
    if(when_PixBuf_l147) begin
      if(when_PixBuf_l148) begin
        csiCC_csiWide_ready = 1'b1;
      end
    end
  end

  always @(*) begin
    io_ddrCmd_valid = 1'b0;
    if(when_PixBuf_l147) begin
      if(when_PixBuf_l148) begin
        io_ddrCmd_valid = 1'b1;
      end else begin
        if(when_PixBuf_l158) begin
          io_ddrCmd_valid = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    io_ddrCmd_payload_cmd = (1'bx);
    if(when_PixBuf_l147) begin
      if(when_PixBuf_l148) begin
        io_ddrCmd_payload_cmd = DdrCmd_WRITE;
      end else begin
        if(when_PixBuf_l158) begin
          io_ddrCmd_payload_cmd = DdrCmd_READ;
        end
      end
    end
  end

  always @(*) begin
    io_ddrCmd_payload_adr = 28'bxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_PixBuf_l147) begin
      if(when_PixBuf_l148) begin
        io_ddrCmd_payload_adr = writeAdr;
      end else begin
        if(when_PixBuf_l158) begin
          io_ddrCmd_payload_adr = readAdr;
        end
      end
    end
  end

  always @(*) begin
    io_ddrWrite_valid = 1'b0;
    if(when_PixBuf_l147) begin
      if(when_PixBuf_l148) begin
        io_ddrWrite_valid = 1'b1;
      end
    end
  end

  always @(*) begin
    io_ddrWrite_payload = 128'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_PixBuf_l147) begin
      if(when_PixBuf_l148) begin
        io_ddrWrite_payload = csiCC_csiWide_payload;
      end
    end
  end

  always @(*) begin
    lastFifo_io_push_valid = 1'b0;
    if(when_PixBuf_l147) begin
      if(!when_PixBuf_l148) begin
        if(when_PixBuf_l158) begin
          lastFifo_io_push_valid = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    lastFifo_io_push_payload = 1'bx;
    if(when_PixBuf_l147) begin
      if(!when_PixBuf_l148) begin
        if(when_PixBuf_l158) begin
          lastFifo_io_push_payload = when_PixBuf_l164;
        end
      end
    end
  end

  assign io_ddrRead_toStream_valid = io_ddrRead_valid;
  assign io_ddrRead_toStream_payload = io_ddrRead_payload;
  assign io_ddrRead_toStream_ready = readFifo_io_push_ready;
  assign hdmiPixCC_readStream_valid = readFifo_io_pop_valid;
  assign hdmiPixCC_readStream_payload_last = readFifo_io_pop_payload_last;
  assign hdmiPixCC_readStream_payload_fragment = readFifo_io_pop_payload_fragment;
  assign when_PixBuf_l147 = (io_ddrInitComplete && io_ddrCmd_ready);
  assign when_PixBuf_l148 = (io_ddrWrite_ready && csiCC_csiWide_valid);
  assign when_PixBuf_l156 = (28'h00e0ff8 <= writeAdr);
  assign when_PixBuf_l164 = (28'h00e0ff8 <= readAdr);
  assign when_PixBuf_l158 = (readFifo_io_pushOccupancy < 10'h190);
  assign hdmiArea_stream1_fire = (hdmiArea_stream1_valid && hdmiArea_stream1_ready);
  always @(*) begin
    hdmiPixCC_readStream_widthAdapter_counter_willIncrement = 1'b0;
    if(hdmiArea_stream1_fire) begin
      hdmiPixCC_readStream_widthAdapter_counter_willIncrement = 1'b1;
    end
  end

  assign hdmiPixCC_readStream_widthAdapter_counter_willClear = 1'b0;
  assign hdmiPixCC_readStream_widthAdapter_counter_willOverflowIfInc = (hdmiPixCC_readStream_widthAdapter_counter_value == 2'b11);
  assign hdmiPixCC_readStream_widthAdapter_counter_willOverflow = (hdmiPixCC_readStream_widthAdapter_counter_willOverflowIfInc && hdmiPixCC_readStream_widthAdapter_counter_willIncrement);
  always @(*) begin
    hdmiPixCC_readStream_widthAdapter_counter_valueNext = (hdmiPixCC_readStream_widthAdapter_counter_value + _zz_hdmiPixCC_readStream_widthAdapter_counter_valueNext);
    if(hdmiPixCC_readStream_widthAdapter_counter_willClear) begin
      hdmiPixCC_readStream_widthAdapter_counter_valueNext = 2'b00;
    end
  end

  assign hdmiArea_stream1_valid = hdmiPixCC_readStream_valid;
  assign _zz_hdmiArea_stream1_payload_fragment = hdmiPixCC_readStream_payload_fragment;
  assign hdmiArea_stream1_payload_fragment = _zz_hdmiArea_stream1_payload_fragment_1;
  assign hdmiArea_stream1_payload_last = (hdmiPixCC_readStream_payload_last && hdmiPixCC_readStream_widthAdapter_counter_willOverflowIfInc);
  assign hdmiPixCC_readStream_ready = (hdmiArea_stream1_ready && hdmiPixCC_readStream_widthAdapter_counter_willOverflowIfInc);
  assign hdmiArea_stream1_ready = hdmiArea_yuvConv_io_yuv_ready;
  assign hdmiArea_outStream_valid = hdmiArea_yuvConv_io_rgb_valid;
  assign hdmiArea_outStream_payload_last = hdmiArea_yuvConv_io_rgb_payload_last;
  assign hdmiArea_outStream_payload_fragment = hdmiArea_yuvConv_io_rgb_payload_fragment;
  assign hdmiArea_outStream_ready = io_hve_visible;
  assign hdmiArea_outStream_fire = (hdmiArea_outStream_valid && hdmiArea_outStream_ready);
  assign hdmiArea_hve_io_clear = (hdmiArea_outStream_fire && hdmiArea_outStream_payload_last);
  assign io_pixel = hdmiArea_outStream_payload_fragment;
  assign io_hve_hsync = hdmiArea_hve_io_hve_hsync;
  assign io_hve_vsync = hdmiArea_hve_io_hve_vsync;
  assign io_hve_visible = hdmiArea_hve_io_hve_visible;
  always @(posedge io_csiClk) begin
    if(io_lpMatched) begin
      _zz_io_push_valid_1 <= 1'b1;
    end else begin
      if(when_PixBuf_l100) begin
        _zz_io_push_valid_1 <= 1'b0;
      end
    end
    if(_zz_3) begin
      _zz_io_push_payload_1 <= {_zz_io_push_payload,_zz__zz_io_push_payload_1};
    end
  end

  always @(posedge io_csiClk or posedge _zz_1) begin
    if(_zz_1) begin
      _zz_io_push_valid_4 <= 2'b00;
    end else begin
      _zz_io_push_valid_4 <= _zz_io_push_valid_3;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      readAdr <= 28'h0;
      writeAdr <= 28'h0;
    end else begin
      if(when_PixBuf_l147) begin
        if(when_PixBuf_l148) begin
          writeAdr <= (writeAdr + 28'h0000008);
          if(when_PixBuf_l156) begin
            writeAdr <= 28'h0;
          end
        end else begin
          if(when_PixBuf_l158) begin
            readAdr <= (readAdr + 28'h0000008);
            if(when_PixBuf_l164) begin
              readAdr <= 28'h0;
            end
          end
        end
        if(flowCCUnsafeByToggle_1_io_output_valid) begin
          writeAdr <= 28'h0;
        end
      end
    end
  end

  always @(posedge io_hdmiClk or posedge _zz_2) begin
    if(_zz_2) begin
      hdmiPixCC_readStream_widthAdapter_counter_value <= 2'b00;
    end else begin
      hdmiPixCC_readStream_widthAdapter_counter_value <= hdmiPixCC_readStream_widthAdapter_counter_valueNext;
    end
  end


endmodule

module Yuv422ToRgb (
  input  wire          io_yuv_valid,
  output wire          io_yuv_ready,
  input  wire          io_yuv_payload_last,
  input  wire [31:0]   io_yuv_payload_fragment,
  output wire          io_rgb_valid,
  input  wire          io_rgb_ready,
  output wire          io_rgb_payload_last,
  output wire [23:0]   io_rgb_payload_fragment,
  input  wire          io_hdmiClk,
  input  wire          _zz_1
);

  wire                os_fifo_io_pop_ready;
  wire                os_fifo_io_push_ready;
  wire                os_fifo_io_pop_valid;
  wire                os_fifo_io_pop_payload_last;
  wire       [47:0]   os_fifo_io_pop_payload_fragment;
  wire       [3:0]    os_fifo_io_occupancy;
  wire       [3:0]    os_fifo_io_availability;
  wire       [8:0]    _zz__zz_when_SInt_l131_1;
  wire       [11:0]   _zz__zz_when_SInt_l131_4;
  wire       [9:0]    _zz__zz_when_SInt_l131_4_1;
  wire       [11:0]   _zz__zz_when_SInt_l131_4_2;
  wire       [1:0]    _zz_when_SInt_l132;
  wire       [0:0]    _zz_when_SInt_l138;
  wire       [8:0]    _zz__zz_when_SInt_l131_6;
  wire       [8:0]    _zz__zz_when_SInt_l131_8;
  wire       [18:0]   _zz__zz_when_SInt_l131_10;
  wire       [18:0]   _zz__zz_when_SInt_l131_10_1;
  wire       [17:0]   _zz__zz_when_SInt_l131_10_2;
  wire       [1:0]    _zz_when_SInt_l132_1;
  wire       [0:0]    _zz_when_SInt_l138_1;
  wire       [10:0]   _zz__zz_when_SInt_l131_14;
  wire       [9:0]    _zz__zz_when_SInt_l131_14_1;
  wire       [10:0]   _zz__zz_when_SInt_l131_14_2;
  wire       [1:0]    _zz_when_SInt_l132_2;
  wire       [0:0]    _zz_when_SInt_l138_2;
  wire       [8:0]    _zz__zz_when_SInt_l131_16;
  wire       [11:0]   _zz__zz_when_SInt_l131_19;
  wire       [9:0]    _zz__zz_when_SInt_l131_19_1;
  wire       [11:0]   _zz__zz_when_SInt_l131_19_2;
  wire       [1:0]    _zz_when_SInt_l132_3;
  wire       [0:0]    _zz_when_SInt_l138_3;
  wire       [8:0]    _zz__zz_when_SInt_l131_21;
  wire       [11:0]   _zz__zz_when_SInt_l131_24;
  wire       [9:0]    _zz__zz_when_SInt_l131_24_1;
  wire       [11:0]   _zz__zz_when_SInt_l131_24_2;
  wire       [1:0]    _zz_when_SInt_l132_4;
  wire       [0:0]    _zz_when_SInt_l138_4;
  wire       [8:0]    _zz__zz_when_SInt_l131_26;
  wire       [8:0]    _zz__zz_when_SInt_l131_28;
  wire       [18:0]   _zz__zz_when_SInt_l131_30;
  wire       [18:0]   _zz__zz_when_SInt_l131_30_1;
  wire       [17:0]   _zz__zz_when_SInt_l131_30_2;
  wire       [1:0]    _zz_when_SInt_l132_5;
  wire       [0:0]    _zz_when_SInt_l138_5;
  wire       [10:0]   _zz__zz_when_SInt_l131_34;
  wire       [9:0]    _zz__zz_when_SInt_l131_34_1;
  wire       [10:0]   _zz__zz_when_SInt_l131_34_2;
  wire       [1:0]    _zz_when_SInt_l132_6;
  wire       [0:0]    _zz_when_SInt_l138_6;
  wire       [8:0]    _zz__zz_when_SInt_l131_36;
  wire       [11:0]   _zz__zz_when_SInt_l131_39;
  wire       [9:0]    _zz__zz_when_SInt_l131_39_1;
  wire       [11:0]   _zz__zz_when_SInt_l131_39_2;
  wire       [1:0]    _zz_when_SInt_l132_7;
  wire       [0:0]    _zz_when_SInt_l138_7;
  wire       [7:0]    _zz_os_payload_fragment_12;
  wire       [7:0]    _zz_os_payload_fragment_13;
  wire       [7:0]    _zz_os_payload_fragment_14;
  wire       [7:0]    _zz_os_payload_fragment_15;
  wire       [7:0]    _zz_os_payload_fragment_16;
  wire       [7:0]    _zz_os_payload_fragment_17;
  reg        [23:0]   _zz_io_rgb_payload_fragment_1;
  wire       [7:0]    u0;
  wire       [7:0]    y0;
  wire       [7:0]    v0;
  wire       [7:0]    y1;
  reg        [7:0]    y0_regNext;
  reg        [7:0]    y0_regNext_regNext;
  reg        [7:0]    y0_regNext_regNext_regNext;
  wire       [8:0]    _zz_when_SInt_l131;
  reg        [8:0]    _zz_when_SInt_l131_1;
  reg        [18:0]   _zz_when_SInt_l131_2;
  reg        [10:0]   _zz_when_SInt_l131_3;
  wire       [11:0]   _zz_when_SInt_l131_4;
  reg        [10:0]   _zz_os_payload_fragment;
  wire                when_SInt_l131;
  wire                when_SInt_l132;
  wire                when_SInt_l138;
  reg        [10:0]   _zz_os_payload_fragment_1;
  reg        [7:0]    y0_regNext_1;
  reg        [7:0]    y0_regNext_1_regNext;
  reg        [7:0]    y0_regNext_1_regNext_regNext;
  wire       [8:0]    _zz_when_SInt_l131_5;
  reg        [8:0]    _zz_when_SInt_l131_6;
  wire       [17:0]   _zz_when_SInt_l131_7;
  reg        [8:0]    _zz_when_SInt_l131_8;
  wire       [16:0]   _zz_when_SInt_l131_9;
  wire       [18:0]   _zz_when_SInt_l131_10;
  reg        [17:0]   _zz_when_SInt_l131_11;
  wire                when_SInt_l131_1;
  wire                when_SInt_l132_1;
  wire                when_SInt_l138_1;
  reg        [17:0]   _zz_when_SInt_l131_12;
  reg        [9:0]    _zz_when_SInt_l131_13;
  wire       [10:0]   _zz_when_SInt_l131_14;
  reg        [9:0]    _zz_os_payload_fragment_2;
  wire                when_SInt_l131_2;
  wire                when_SInt_l132_2;
  wire                when_SInt_l138_2;
  reg        [9:0]    _zz_os_payload_fragment_3;
  reg        [7:0]    y0_regNext_2;
  reg        [7:0]    y0_regNext_2_regNext;
  reg        [7:0]    y0_regNext_2_regNext_regNext;
  wire       [8:0]    _zz_when_SInt_l131_15;
  reg        [8:0]    _zz_when_SInt_l131_16;
  reg        [18:0]   _zz_when_SInt_l131_17;
  reg        [10:0]   _zz_when_SInt_l131_18;
  wire       [11:0]   _zz_when_SInt_l131_19;
  reg        [10:0]   _zz_os_payload_fragment_4;
  wire                when_SInt_l131_3;
  wire                when_SInt_l132_3;
  wire                when_SInt_l138_3;
  reg        [10:0]   _zz_os_payload_fragment_5;
  reg        [7:0]    y1_regNext;
  reg        [7:0]    y1_regNext_regNext;
  reg        [7:0]    y1_regNext_regNext_regNext;
  wire       [8:0]    _zz_when_SInt_l131_20;
  reg        [8:0]    _zz_when_SInt_l131_21;
  reg        [18:0]   _zz_when_SInt_l131_22;
  reg        [10:0]   _zz_when_SInt_l131_23;
  wire       [11:0]   _zz_when_SInt_l131_24;
  reg        [10:0]   _zz_os_payload_fragment_6;
  wire                when_SInt_l131_4;
  wire                when_SInt_l132_4;
  wire                when_SInt_l138_4;
  reg        [10:0]   _zz_os_payload_fragment_7;
  reg        [7:0]    y1_regNext_1;
  reg        [7:0]    y1_regNext_1_regNext;
  reg        [7:0]    y1_regNext_1_regNext_regNext;
  wire       [8:0]    _zz_when_SInt_l131_25;
  reg        [8:0]    _zz_when_SInt_l131_26;
  wire       [17:0]   _zz_when_SInt_l131_27;
  reg        [8:0]    _zz_when_SInt_l131_28;
  wire       [16:0]   _zz_when_SInt_l131_29;
  wire       [18:0]   _zz_when_SInt_l131_30;
  reg        [17:0]   _zz_when_SInt_l131_31;
  wire                when_SInt_l131_5;
  wire                when_SInt_l132_5;
  wire                when_SInt_l138_5;
  reg        [17:0]   _zz_when_SInt_l131_32;
  reg        [9:0]    _zz_when_SInt_l131_33;
  wire       [10:0]   _zz_when_SInt_l131_34;
  reg        [9:0]    _zz_os_payload_fragment_8;
  wire                when_SInt_l131_6;
  wire                when_SInt_l132_6;
  wire                when_SInt_l138_6;
  reg        [9:0]    _zz_os_payload_fragment_9;
  reg        [7:0]    y1_regNext_2;
  reg        [7:0]    y1_regNext_2_regNext;
  reg        [7:0]    y1_regNext_2_regNext_regNext;
  wire       [8:0]    _zz_when_SInt_l131_35;
  reg        [8:0]    _zz_when_SInt_l131_36;
  reg        [18:0]   _zz_when_SInt_l131_37;
  reg        [10:0]   _zz_when_SInt_l131_38;
  wire       [11:0]   _zz_when_SInt_l131_39;
  reg        [10:0]   _zz_os_payload_fragment_10;
  wire                when_SInt_l131_7;
  wire                when_SInt_l132_7;
  wire                when_SInt_l138_7;
  reg        [10:0]   _zz_os_payload_fragment_11;
  reg                 io_yuv_valid_delay_1;
  reg                 io_yuv_valid_delay_2;
  reg                 io_yuv_valid_delay_3;
  reg                 valid;
  reg                 io_yuv_payload_last_delay_1;
  reg                 io_yuv_payload_last_delay_2;
  reg                 io_yuv_payload_last_delay_3;
  reg                 last;
  wire                os_valid;
  wire                os_ready;
  wire                os_payload_last;
  wire       [47:0]   os_payload_fragment;
  wire                hdmiArea_yuvConv_os_fifo_io_pop_fire;
  wire       [0:0]    adapter_dataMask;
  wire                io_rgb_fire;
  reg                 hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willIncrement;
  wire                hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willClear;
  reg        [0:0]    hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_valueNext;
  reg        [0:0]    hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_value;
  wire                hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willOverflowIfInc;
  wire                hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willOverflow;
  wire       [47:0]   _zz_io_rgb_payload_fragment;

  assign _zz__zz_when_SInt_l131_1 = {1'b0,v0};
  assign _zz__zz_when_SInt_l131_4_1 = {_zz_when_SInt_l131[8],_zz_when_SInt_l131};
  assign _zz__zz_when_SInt_l131_4 = {{2{_zz__zz_when_SInt_l131_4_1[9]}}, _zz__zz_when_SInt_l131_4_1};
  assign _zz__zz_when_SInt_l131_4_2 = {_zz_when_SInt_l131_3[10],_zz_when_SInt_l131_3};
  assign _zz_when_SInt_l132 = _zz_when_SInt_l131_4[11 : 10];
  assign _zz_when_SInt_l138 = _zz_when_SInt_l131_4[10 : 10];
  assign _zz__zz_when_SInt_l131_6 = {1'b0,v0};
  assign _zz__zz_when_SInt_l131_8 = {1'b0,u0};
  assign _zz__zz_when_SInt_l131_10 = {_zz_when_SInt_l131_7[17],_zz_when_SInt_l131_7};
  assign _zz__zz_when_SInt_l131_10_2 = {_zz_when_SInt_l131_9[16],_zz_when_SInt_l131_9};
  assign _zz__zz_when_SInt_l131_10_1 = {{1{_zz__zz_when_SInt_l131_10_2[17]}}, _zz__zz_when_SInt_l131_10_2};
  assign _zz_when_SInt_l132_1 = _zz_when_SInt_l131_10[18 : 17];
  assign _zz_when_SInt_l138_1 = _zz_when_SInt_l131_10[17 : 17];
  assign _zz__zz_when_SInt_l131_14_1 = {_zz_when_SInt_l131_5[8],_zz_when_SInt_l131_5};
  assign _zz__zz_when_SInt_l131_14 = {{1{_zz__zz_when_SInt_l131_14_1[9]}}, _zz__zz_when_SInt_l131_14_1};
  assign _zz__zz_when_SInt_l131_14_2 = {_zz_when_SInt_l131_13[9],_zz_when_SInt_l131_13};
  assign _zz_when_SInt_l132_2 = _zz_when_SInt_l131_14[10 : 9];
  assign _zz_when_SInt_l138_2 = _zz_when_SInt_l131_14[9 : 9];
  assign _zz__zz_when_SInt_l131_16 = {1'b0,u0};
  assign _zz__zz_when_SInt_l131_19_1 = {_zz_when_SInt_l131_15[8],_zz_when_SInt_l131_15};
  assign _zz__zz_when_SInt_l131_19 = {{2{_zz__zz_when_SInt_l131_19_1[9]}}, _zz__zz_when_SInt_l131_19_1};
  assign _zz__zz_when_SInt_l131_19_2 = {_zz_when_SInt_l131_18[10],_zz_when_SInt_l131_18};
  assign _zz_when_SInt_l132_3 = _zz_when_SInt_l131_19[11 : 10];
  assign _zz_when_SInt_l138_3 = _zz_when_SInt_l131_19[10 : 10];
  assign _zz__zz_when_SInt_l131_21 = {1'b0,v0};
  assign _zz__zz_when_SInt_l131_24_1 = {_zz_when_SInt_l131_20[8],_zz_when_SInt_l131_20};
  assign _zz__zz_when_SInt_l131_24 = {{2{_zz__zz_when_SInt_l131_24_1[9]}}, _zz__zz_when_SInt_l131_24_1};
  assign _zz__zz_when_SInt_l131_24_2 = {_zz_when_SInt_l131_23[10],_zz_when_SInt_l131_23};
  assign _zz_when_SInt_l132_4 = _zz_when_SInt_l131_24[11 : 10];
  assign _zz_when_SInt_l138_4 = _zz_when_SInt_l131_24[10 : 10];
  assign _zz__zz_when_SInt_l131_26 = {1'b0,v0};
  assign _zz__zz_when_SInt_l131_28 = {1'b0,u0};
  assign _zz__zz_when_SInt_l131_30 = {_zz_when_SInt_l131_27[17],_zz_when_SInt_l131_27};
  assign _zz__zz_when_SInt_l131_30_2 = {_zz_when_SInt_l131_29[16],_zz_when_SInt_l131_29};
  assign _zz__zz_when_SInt_l131_30_1 = {{1{_zz__zz_when_SInt_l131_30_2[17]}}, _zz__zz_when_SInt_l131_30_2};
  assign _zz_when_SInt_l132_5 = _zz_when_SInt_l131_30[18 : 17];
  assign _zz_when_SInt_l138_5 = _zz_when_SInt_l131_30[17 : 17];
  assign _zz__zz_when_SInt_l131_34_1 = {_zz_when_SInt_l131_25[8],_zz_when_SInt_l131_25};
  assign _zz__zz_when_SInt_l131_34 = {{1{_zz__zz_when_SInt_l131_34_1[9]}}, _zz__zz_when_SInt_l131_34_1};
  assign _zz__zz_when_SInt_l131_34_2 = {_zz_when_SInt_l131_33[9],_zz_when_SInt_l131_33};
  assign _zz_when_SInt_l132_6 = _zz_when_SInt_l131_34[10 : 9];
  assign _zz_when_SInt_l138_6 = _zz_when_SInt_l131_34[9 : 9];
  assign _zz__zz_when_SInt_l131_36 = {1'b0,u0};
  assign _zz__zz_when_SInt_l131_39_1 = {_zz_when_SInt_l131_35[8],_zz_when_SInt_l131_35};
  assign _zz__zz_when_SInt_l131_39 = {{2{_zz__zz_when_SInt_l131_39_1[9]}}, _zz__zz_when_SInt_l131_39_1};
  assign _zz__zz_when_SInt_l131_39_2 = {_zz_when_SInt_l131_38[10],_zz_when_SInt_l131_38};
  assign _zz_when_SInt_l132_7 = _zz_when_SInt_l131_39[11 : 10];
  assign _zz_when_SInt_l138_7 = _zz_when_SInt_l131_39[10 : 10];
  assign _zz_os_payload_fragment_12 = _zz_os_payload_fragment_11[7:0];
  assign _zz_os_payload_fragment_13 = _zz_os_payload_fragment_9[7:0];
  assign _zz_os_payload_fragment_14 = _zz_os_payload_fragment_7[7:0];
  assign _zz_os_payload_fragment_15 = _zz_os_payload_fragment_5[7:0];
  assign _zz_os_payload_fragment_16 = _zz_os_payload_fragment_3[7:0];
  assign _zz_os_payload_fragment_17 = _zz_os_payload_fragment_1[7:0];
  StreamFifo_1 os_fifo (
    .io_push_valid            (os_valid                             ), //i
    .io_push_ready            (os_fifo_io_push_ready                ), //o
    .io_push_payload_last     (os_payload_last                      ), //i
    .io_push_payload_fragment (os_payload_fragment[47:0]            ), //i
    .io_pop_valid             (os_fifo_io_pop_valid                 ), //o
    .io_pop_ready             (os_fifo_io_pop_ready                 ), //i
    .io_pop_payload_last      (os_fifo_io_pop_payload_last          ), //o
    .io_pop_payload_fragment  (os_fifo_io_pop_payload_fragment[47:0]), //o
    .io_flush                 (1'b0                                 ), //i
    .io_occupancy             (os_fifo_io_occupancy[3:0]            ), //o
    .io_availability          (os_fifo_io_availability[3:0]         ), //o
    .io_hdmiClk               (io_hdmiClk                           ), //i
    ._zz_4                    (_zz_1                                )  //i
  );
  always @(*) begin
    case(hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_value)
      1'b0 : _zz_io_rgb_payload_fragment_1 = _zz_io_rgb_payload_fragment[23 : 0];
      default : _zz_io_rgb_payload_fragment_1 = _zz_io_rgb_payload_fragment[47 : 24];
    endcase
  end

  assign u0 = io_yuv_payload_fragment[7 : 0];
  assign y0 = io_yuv_payload_fragment[15 : 8];
  assign v0 = io_yuv_payload_fragment[23 : 16];
  assign y1 = io_yuv_payload_fragment[31 : 24];
  assign _zz_when_SInt_l131 = {1'b0,y0_regNext_regNext_regNext};
  assign _zz_when_SInt_l131_4 = ($signed(_zz__zz_when_SInt_l131_4) + $signed(_zz__zz_when_SInt_l131_4_2));
  assign when_SInt_l131 = _zz_when_SInt_l131_4[11];
  assign when_SInt_l132 = (! (&_zz_when_SInt_l132));
  always @(*) begin
    if(when_SInt_l131) begin
      if(when_SInt_l132) begin
        _zz_os_payload_fragment = 11'h400;
      end else begin
        _zz_os_payload_fragment = _zz_when_SInt_l131_4[10 : 0];
      end
    end else begin
      if(when_SInt_l138) begin
        _zz_os_payload_fragment = 11'h3ff;
      end else begin
        _zz_os_payload_fragment = _zz_when_SInt_l131_4[10 : 0];
      end
    end
  end

  assign when_SInt_l138 = (|_zz_when_SInt_l138);
  assign _zz_when_SInt_l131_5 = {1'b0,y0_regNext_1_regNext_regNext};
  assign _zz_when_SInt_l131_7 = ($signed(9'h0b3) * $signed(_zz_when_SInt_l131_6));
  assign _zz_when_SInt_l131_9 = ($signed(8'h56) * $signed(_zz_when_SInt_l131_8));
  assign _zz_when_SInt_l131_10 = ($signed(_zz__zz_when_SInt_l131_10) + $signed(_zz__zz_when_SInt_l131_10_1));
  assign when_SInt_l131_1 = _zz_when_SInt_l131_10[18];
  assign when_SInt_l132_1 = (! (&_zz_when_SInt_l132_1));
  always @(*) begin
    if(when_SInt_l131_1) begin
      if(when_SInt_l132_1) begin
        _zz_when_SInt_l131_11 = 18'h20000;
      end else begin
        _zz_when_SInt_l131_11 = _zz_when_SInt_l131_10[17 : 0];
      end
    end else begin
      if(when_SInt_l138_1) begin
        _zz_when_SInt_l131_11 = 18'h1ffff;
      end else begin
        _zz_when_SInt_l131_11 = _zz_when_SInt_l131_10[17 : 0];
      end
    end
  end

  assign when_SInt_l138_1 = (|_zz_when_SInt_l138_1);
  assign _zz_when_SInt_l131_14 = ($signed(_zz__zz_when_SInt_l131_14) - $signed(_zz__zz_when_SInt_l131_14_2));
  assign when_SInt_l131_2 = _zz_when_SInt_l131_14[10];
  assign when_SInt_l132_2 = (! (&_zz_when_SInt_l132_2));
  always @(*) begin
    if(when_SInt_l131_2) begin
      if(when_SInt_l132_2) begin
        _zz_os_payload_fragment_2 = 10'h200;
      end else begin
        _zz_os_payload_fragment_2 = _zz_when_SInt_l131_14[9 : 0];
      end
    end else begin
      if(when_SInt_l138_2) begin
        _zz_os_payload_fragment_2 = 10'h1ff;
      end else begin
        _zz_os_payload_fragment_2 = _zz_when_SInt_l131_14[9 : 0];
      end
    end
  end

  assign when_SInt_l138_2 = (|_zz_when_SInt_l138_2);
  assign _zz_when_SInt_l131_15 = {1'b0,y0_regNext_2_regNext_regNext};
  assign _zz_when_SInt_l131_19 = ($signed(_zz__zz_when_SInt_l131_19) + $signed(_zz__zz_when_SInt_l131_19_2));
  assign when_SInt_l131_3 = _zz_when_SInt_l131_19[11];
  assign when_SInt_l132_3 = (! (&_zz_when_SInt_l132_3));
  always @(*) begin
    if(when_SInt_l131_3) begin
      if(when_SInt_l132_3) begin
        _zz_os_payload_fragment_4 = 11'h400;
      end else begin
        _zz_os_payload_fragment_4 = _zz_when_SInt_l131_19[10 : 0];
      end
    end else begin
      if(when_SInt_l138_3) begin
        _zz_os_payload_fragment_4 = 11'h3ff;
      end else begin
        _zz_os_payload_fragment_4 = _zz_when_SInt_l131_19[10 : 0];
      end
    end
  end

  assign when_SInt_l138_3 = (|_zz_when_SInt_l138_3);
  assign _zz_when_SInt_l131_20 = {1'b0,y1_regNext_regNext_regNext};
  assign _zz_when_SInt_l131_24 = ($signed(_zz__zz_when_SInt_l131_24) + $signed(_zz__zz_when_SInt_l131_24_2));
  assign when_SInt_l131_4 = _zz_when_SInt_l131_24[11];
  assign when_SInt_l132_4 = (! (&_zz_when_SInt_l132_4));
  always @(*) begin
    if(when_SInt_l131_4) begin
      if(when_SInt_l132_4) begin
        _zz_os_payload_fragment_6 = 11'h400;
      end else begin
        _zz_os_payload_fragment_6 = _zz_when_SInt_l131_24[10 : 0];
      end
    end else begin
      if(when_SInt_l138_4) begin
        _zz_os_payload_fragment_6 = 11'h3ff;
      end else begin
        _zz_os_payload_fragment_6 = _zz_when_SInt_l131_24[10 : 0];
      end
    end
  end

  assign when_SInt_l138_4 = (|_zz_when_SInt_l138_4);
  assign _zz_when_SInt_l131_25 = {1'b0,y1_regNext_1_regNext_regNext};
  assign _zz_when_SInt_l131_27 = ($signed(9'h0b3) * $signed(_zz_when_SInt_l131_26));
  assign _zz_when_SInt_l131_29 = ($signed(8'h56) * $signed(_zz_when_SInt_l131_28));
  assign _zz_when_SInt_l131_30 = ($signed(_zz__zz_when_SInt_l131_30) + $signed(_zz__zz_when_SInt_l131_30_1));
  assign when_SInt_l131_5 = _zz_when_SInt_l131_30[18];
  assign when_SInt_l132_5 = (! (&_zz_when_SInt_l132_5));
  always @(*) begin
    if(when_SInt_l131_5) begin
      if(when_SInt_l132_5) begin
        _zz_when_SInt_l131_31 = 18'h20000;
      end else begin
        _zz_when_SInt_l131_31 = _zz_when_SInt_l131_30[17 : 0];
      end
    end else begin
      if(when_SInt_l138_5) begin
        _zz_when_SInt_l131_31 = 18'h1ffff;
      end else begin
        _zz_when_SInt_l131_31 = _zz_when_SInt_l131_30[17 : 0];
      end
    end
  end

  assign when_SInt_l138_5 = (|_zz_when_SInt_l138_5);
  assign _zz_when_SInt_l131_34 = ($signed(_zz__zz_when_SInt_l131_34) - $signed(_zz__zz_when_SInt_l131_34_2));
  assign when_SInt_l131_6 = _zz_when_SInt_l131_34[10];
  assign when_SInt_l132_6 = (! (&_zz_when_SInt_l132_6));
  always @(*) begin
    if(when_SInt_l131_6) begin
      if(when_SInt_l132_6) begin
        _zz_os_payload_fragment_8 = 10'h200;
      end else begin
        _zz_os_payload_fragment_8 = _zz_when_SInt_l131_34[9 : 0];
      end
    end else begin
      if(when_SInt_l138_6) begin
        _zz_os_payload_fragment_8 = 10'h1ff;
      end else begin
        _zz_os_payload_fragment_8 = _zz_when_SInt_l131_34[9 : 0];
      end
    end
  end

  assign when_SInt_l138_6 = (|_zz_when_SInt_l138_6);
  assign _zz_when_SInt_l131_35 = {1'b0,y1_regNext_2_regNext_regNext};
  assign _zz_when_SInt_l131_39 = ($signed(_zz__zz_when_SInt_l131_39) + $signed(_zz__zz_when_SInt_l131_39_2));
  assign when_SInt_l131_7 = _zz_when_SInt_l131_39[11];
  assign when_SInt_l132_7 = (! (&_zz_when_SInt_l132_7));
  always @(*) begin
    if(when_SInt_l131_7) begin
      if(when_SInt_l132_7) begin
        _zz_os_payload_fragment_10 = 11'h400;
      end else begin
        _zz_os_payload_fragment_10 = _zz_when_SInt_l131_39[10 : 0];
      end
    end else begin
      if(when_SInt_l138_7) begin
        _zz_os_payload_fragment_10 = 11'h3ff;
      end else begin
        _zz_os_payload_fragment_10 = _zz_when_SInt_l131_39[10 : 0];
      end
    end
  end

  assign when_SInt_l138_7 = (|_zz_when_SInt_l138_7);
  assign os_valid = valid;
  assign os_payload_last = last;
  assign os_payload_fragment = {{_zz_os_payload_fragment_12,{_zz_os_payload_fragment_13,_zz_os_payload_fragment_14}},{_zz_os_payload_fragment_15,{_zz_os_payload_fragment_16,_zz_os_payload_fragment_17}}};
  assign os_ready = os_fifo_io_push_ready;
  assign hdmiArea_yuvConv_os_fifo_io_pop_fire = (os_fifo_io_pop_valid && os_fifo_io_pop_ready);
  assign io_yuv_ready = (hdmiArea_yuvConv_os_fifo_io_pop_fire || (! os_fifo_io_pop_valid));
  assign io_rgb_fire = (io_rgb_valid && io_rgb_ready);
  always @(*) begin
    hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willIncrement = 1'b0;
    if(io_rgb_fire) begin
      hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willIncrement = 1'b1;
    end
  end

  assign hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willClear = 1'b0;
  assign hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willOverflowIfInc = (hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_value == 1'b1);
  assign hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willOverflow = (hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willOverflowIfInc && hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willIncrement);
  always @(*) begin
    hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_valueNext = (hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_value + hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willIncrement);
    if(hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willClear) begin
      hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_valueNext = 1'b0;
    end
  end

  assign io_rgb_valid = os_fifo_io_pop_valid;
  assign _zz_io_rgb_payload_fragment = os_fifo_io_pop_payload_fragment;
  assign io_rgb_payload_fragment = _zz_io_rgb_payload_fragment_1;
  assign io_rgb_payload_last = (os_fifo_io_pop_payload_last && hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willOverflowIfInc);
  assign os_fifo_io_pop_ready = (io_rgb_ready && hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_willOverflowIfInc);
  assign adapter_dataMask = 1'b1;
  always @(posedge io_hdmiClk) begin
    y0_regNext <= y0;
    y0_regNext_regNext <= y0_regNext;
    y0_regNext_regNext_regNext <= y0_regNext_regNext;
    _zz_when_SInt_l131_1 <= ($signed(_zz__zz_when_SInt_l131_1) - $signed(9'h080));
    _zz_when_SInt_l131_2 <= ($signed(10'h15f) * $signed(_zz_when_SInt_l131_1));
    _zz_when_SInt_l131_3 <= (_zz_when_SInt_l131_2 >>> 4'd8);
    _zz_os_payload_fragment_1 <= _zz_os_payload_fragment;
    y0_regNext_1 <= y0;
    y0_regNext_1_regNext <= y0_regNext_1;
    y0_regNext_1_regNext_regNext <= y0_regNext_1_regNext;
    _zz_when_SInt_l131_6 <= ($signed(_zz__zz_when_SInt_l131_6) - $signed(9'h080));
    _zz_when_SInt_l131_8 <= ($signed(_zz__zz_when_SInt_l131_8) - $signed(9'h080));
    _zz_when_SInt_l131_12 <= _zz_when_SInt_l131_11;
    _zz_when_SInt_l131_13 <= (_zz_when_SInt_l131_12 >>> 4'd8);
    _zz_os_payload_fragment_3 <= _zz_os_payload_fragment_2;
    y0_regNext_2 <= y0;
    y0_regNext_2_regNext <= y0_regNext_2;
    y0_regNext_2_regNext_regNext <= y0_regNext_2_regNext;
    _zz_when_SInt_l131_16 <= ($signed(_zz__zz_when_SInt_l131_16) - $signed(9'h080));
    _zz_when_SInt_l131_17 <= ($signed(10'h1bb) * $signed(_zz_when_SInt_l131_16));
    _zz_when_SInt_l131_18 <= (_zz_when_SInt_l131_17 >>> 4'd8);
    _zz_os_payload_fragment_5 <= _zz_os_payload_fragment_4;
    y1_regNext <= y1;
    y1_regNext_regNext <= y1_regNext;
    y1_regNext_regNext_regNext <= y1_regNext_regNext;
    _zz_when_SInt_l131_21 <= ($signed(_zz__zz_when_SInt_l131_21) - $signed(9'h080));
    _zz_when_SInt_l131_22 <= ($signed(10'h15f) * $signed(_zz_when_SInt_l131_21));
    _zz_when_SInt_l131_23 <= (_zz_when_SInt_l131_22 >>> 4'd8);
    _zz_os_payload_fragment_7 <= _zz_os_payload_fragment_6;
    y1_regNext_1 <= y1;
    y1_regNext_1_regNext <= y1_regNext_1;
    y1_regNext_1_regNext_regNext <= y1_regNext_1_regNext;
    _zz_when_SInt_l131_26 <= ($signed(_zz__zz_when_SInt_l131_26) - $signed(9'h080));
    _zz_when_SInt_l131_28 <= ($signed(_zz__zz_when_SInt_l131_28) - $signed(9'h080));
    _zz_when_SInt_l131_32 <= _zz_when_SInt_l131_31;
    _zz_when_SInt_l131_33 <= (_zz_when_SInt_l131_32 >>> 4'd8);
    _zz_os_payload_fragment_9 <= _zz_os_payload_fragment_8;
    y1_regNext_2 <= y1;
    y1_regNext_2_regNext <= y1_regNext_2;
    y1_regNext_2_regNext_regNext <= y1_regNext_2_regNext;
    _zz_when_SInt_l131_36 <= ($signed(_zz__zz_when_SInt_l131_36) - $signed(9'h080));
    _zz_when_SInt_l131_37 <= ($signed(10'h1bb) * $signed(_zz_when_SInt_l131_36));
    _zz_when_SInt_l131_38 <= (_zz_when_SInt_l131_37 >>> 4'd8);
    _zz_os_payload_fragment_11 <= _zz_os_payload_fragment_10;
    io_yuv_valid_delay_1 <= io_yuv_valid;
    io_yuv_valid_delay_2 <= io_yuv_valid_delay_1;
    io_yuv_valid_delay_3 <= io_yuv_valid_delay_2;
    valid <= io_yuv_valid_delay_3;
    io_yuv_payload_last_delay_1 <= io_yuv_payload_last;
    io_yuv_payload_last_delay_2 <= io_yuv_payload_last_delay_1;
    io_yuv_payload_last_delay_3 <= io_yuv_payload_last_delay_2;
    last <= io_yuv_payload_last_delay_3;
  end

  always @(posedge io_hdmiClk or posedge _zz_1) begin
    if(_zz_1) begin
      hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_value <= 1'b0;
    end else begin
      hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_value <= hdmiArea_yuvConv_os_fifo_io_pop_widthAdapter_counter_valueNext;
    end
  end


endmodule

module GenHve (
  output wire          io_hve_hsync,
  output wire          io_hve_vsync,
  output wire          io_hve_visible,
  output wire          io_last,
  input  wire          io_clear,
  input  wire          io_hdmiClk,
  input  wire          _zz_1
);

  wire       [10:0]   _zz_hSync_cnt_valueNext;
  wire       [0:0]    _zz_hSync_cnt_valueNext_1;
  wire       [9:0]    _zz_vSync_cnt_valueNext;
  wire       [0:0]    _zz_vSync_cnt_valueNext_1;
  wire                when_Utils_l578;
  reg                 hSync_cnt_willIncrement;
  reg                 hSync_cnt_willClear;
  reg        [10:0]   hSync_cnt_valueNext;
  reg        [10:0]   hSync_cnt_value;
  wire                hSync_cnt_willOverflowIfInc;
  wire                hSync_cnt_willOverflow;
  wire                hSync_sync;
  wire                hSync_active;
  reg                 vSync_cnt_willIncrement;
  reg                 vSync_cnt_willClear;
  reg        [9:0]    vSync_cnt_valueNext;
  reg        [9:0]    vSync_cnt_value;
  wire                vSync_cnt_willOverflowIfInc;
  wire                vSync_cnt_willOverflow;
  wire                vSync_sync;
  wire                vSync_active;

  assign _zz_hSync_cnt_valueNext_1 = hSync_cnt_willIncrement;
  assign _zz_hSync_cnt_valueNext = {10'd0, _zz_hSync_cnt_valueNext_1};
  assign _zz_vSync_cnt_valueNext_1 = vSync_cnt_willIncrement;
  assign _zz_vSync_cnt_valueNext = {9'd0, _zz_vSync_cnt_valueNext_1};
  assign when_Utils_l578 = 1'b1;
  always @(*) begin
    hSync_cnt_willIncrement = 1'b0;
    if(when_Utils_l578) begin
      hSync_cnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    hSync_cnt_willClear = 1'b0;
    if(io_clear) begin
      hSync_cnt_willClear = 1'b1;
    end
  end

  assign hSync_cnt_willOverflowIfInc = (hSync_cnt_value == 11'h671);
  assign hSync_cnt_willOverflow = (hSync_cnt_willOverflowIfInc && hSync_cnt_willIncrement);
  always @(*) begin
    if(hSync_cnt_willOverflow) begin
      hSync_cnt_valueNext = 11'h0;
    end else begin
      hSync_cnt_valueNext = (hSync_cnt_value + _zz_hSync_cnt_valueNext);
    end
    if(hSync_cnt_willClear) begin
      hSync_cnt_valueNext = 11'h0;
    end
  end

  assign hSync_sync = (((11'h06e <= hSync_cnt_value) && (hSync_cnt_value < 11'h096)) ^ 1'b1);
  assign hSync_active = (11'h172 <= hSync_cnt_value);
  always @(*) begin
    vSync_cnt_willIncrement = 1'b0;
    if(hSync_cnt_willOverflow) begin
      vSync_cnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    vSync_cnt_willClear = 1'b0;
    if(io_clear) begin
      vSync_cnt_willClear = 1'b1;
    end
  end

  assign vSync_cnt_willOverflowIfInc = (vSync_cnt_value == 10'h2ed);
  assign vSync_cnt_willOverflow = (vSync_cnt_willOverflowIfInc && vSync_cnt_willIncrement);
  always @(*) begin
    if(vSync_cnt_willOverflow) begin
      vSync_cnt_valueNext = 10'h0;
    end else begin
      vSync_cnt_valueNext = (vSync_cnt_value + _zz_vSync_cnt_valueNext);
    end
    if(vSync_cnt_willClear) begin
      vSync_cnt_valueNext = 10'h0;
    end
  end

  assign vSync_sync = (((10'h005 <= vSync_cnt_value) && (vSync_cnt_value < 10'h00a)) ^ 1'b1);
  assign vSync_active = (10'h01e <= vSync_cnt_value);
  assign io_hve_hsync = hSync_sync;
  assign io_hve_vsync = vSync_sync;
  assign io_hve_visible = (hSync_active && vSync_active);
  assign io_last = vSync_cnt_willOverflow;
  always @(posedge io_hdmiClk or posedge _zz_1) begin
    if(_zz_1) begin
      hSync_cnt_value <= 11'h0;
      vSync_cnt_value <= 10'h0;
    end else begin
      hSync_cnt_value <= hSync_cnt_valueNext;
      vSync_cnt_value <= vSync_cnt_valueNext;
    end
  end


endmodule

module StreamFifoCC_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_last,
  input  wire [127:0]  io_push_payload_fragment,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_last,
  output wire [127:0]  io_pop_payload_fragment,
  output wire [9:0]    io_pushOccupancy,
  output wire [9:0]    io_popOccupancy,
  input  wire          clk,
  input  wire          reset,
  input  wire          io_hdmiClk
);

  wire                bufferCC_7_io_dataIn;
  reg        [128:0]  ram_spinal_port1;
  wire       [9:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_7_io_dataOut;
  wire       [9:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [9:0]    _zz_pushCC_pushPtrGray;
  wire       [8:0]    _zz_ram_port;
  wire       [128:0]  _zz_ram_port_1;
  wire                _zz_io_pushOccupancy_9;
  wire       [9:0]    _zz_popCC_popPtrGray;
  wire                _zz_io_popOccupancy_9;
  reg                 _zz_1;
  wire       [9:0]    popToPushGray;
  wire       [9:0]    pushToPopGray;
  reg        [9:0]    pushCC_pushPtr;
  wire       [9:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [9:0]    pushCC_pushPtrGray;
  wire       [9:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  wire                _zz_io_pushOccupancy_6;
  wire                _zz_io_pushOccupancy_7;
  wire                _zz_io_pushOccupancy_8;
  wire                reset_synchronized;
  reg        [9:0]    popCC_popPtr;
  (* keep , syn_keep *) wire       [9:0]    popCC_popPtrPlus /* synthesis syn_keep = 1 */ ;
  wire       [9:0]    popCC_popPtrGray;
  wire       [9:0]    popCC_pushPtrGray;
  wire                popCC_addressGen_valid;
  reg                 popCC_addressGen_ready;
  wire       [8:0]    popCC_addressGen_payload;
  wire                popCC_empty;
  wire                popCC_addressGen_fire;
  wire                popCC_readArbitation_valid;
  wire                popCC_readArbitation_ready;
  wire       [8:0]    popCC_readArbitation_payload;
  reg                 popCC_addressGen_rValid;
  reg        [8:0]    popCC_addressGen_rData;
  wire                when_Stream_l375;
  wire                popCC_readPort_cmd_valid;
  wire       [8:0]    popCC_readPort_cmd_payload;
  wire                popCC_readPort_rsp_last;
  wire       [127:0]  popCC_readPort_rsp_fragment;
  wire       [128:0]  _zz_popCC_readPort_rsp_last;
  wire                popCC_readArbitation_translated_valid;
  wire                popCC_readArbitation_translated_ready;
  wire                popCC_readArbitation_translated_payload_last;
  wire       [127:0]  popCC_readArbitation_translated_payload_fragment;
  wire                popCC_readArbitation_fire;
  reg        [9:0]    popCC_ptrToPush;
  reg        [9:0]    popCC_ptrToOccupancy;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  wire                _zz_io_popOccupancy_6;
  wire                _zz_io_popOccupancy_7;
  wire                _zz_io_popOccupancy_8;
  reg [128:0] ram [0:511];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[8:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtr >>> 1'b1);
  assign _zz_ram_port_1 = {io_push_payload_fragment,io_push_payload_last};
  assign _zz_io_pushOccupancy_9 = (pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy);
  assign _zz_io_popOccupancy_9 = (popCC_pushPtrGray[0] ^ _zz_io_popOccupancy);
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge io_hdmiClk) begin
    if(popCC_readPort_cmd_valid) begin
      ram_spinal_port1 <= ram[popCC_readPort_cmd_payload];
    end
  end

  (* keep_hierarchy = "TRUE" *) BufferCC popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[9:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[9:0]), //o
    .clk        (clk                                   ), //i
    .reset      (reset                                 )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_1 bufferCC_7 (
    .io_dataIn  (bufferCC_7_io_dataIn ), //i
    .io_dataOut (bufferCC_7_io_dataOut), //o
    .io_hdmiClk (io_hdmiClk           ), //i
    .reset      (reset                )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn          (pushToPopGray[9:0]                    ), //i
    .io_dataOut         (pushToPopGray_buffercc_io_dataOut[9:0]), //o
    .io_hdmiClk         (io_hdmiClk                            ), //i
    .reset_synchronized (reset_synchronized                    )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 10'h001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[9 : 8] == (~ pushCC_popPtrGray[9 : 8])) && (pushCC_pushPtrGray[7 : 0] == pushCC_popPtrGray[7 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = (pushCC_popPtrGray[6] ^ _zz_io_pushOccupancy_6);
  assign _zz_io_pushOccupancy_6 = (pushCC_popPtrGray[7] ^ _zz_io_pushOccupancy_7);
  assign _zz_io_pushOccupancy_7 = (pushCC_popPtrGray[8] ^ _zz_io_pushOccupancy_8);
  assign _zz_io_pushOccupancy_8 = pushCC_popPtrGray[9];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_8,{_zz_io_pushOccupancy_7,{_zz_io_pushOccupancy_6,{_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,_zz_io_pushOccupancy_9}}}}}}}}});
  assign bufferCC_7_io_dataIn = (1'b0 ^ 1'b0);
  assign reset_synchronized = bufferCC_7_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 10'h001);
  assign popCC_popPtrGray = (_zz_popCC_popPtrGray ^ popCC_popPtr);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign popCC_addressGen_valid = (! popCC_empty);
  assign popCC_addressGen_payload = popCC_popPtr[8:0];
  assign popCC_addressGen_fire = (popCC_addressGen_valid && popCC_addressGen_ready);
  always @(*) begin
    popCC_addressGen_ready = popCC_readArbitation_ready;
    if(when_Stream_l375) begin
      popCC_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l375 = (! popCC_readArbitation_valid);
  assign popCC_readArbitation_valid = popCC_addressGen_rValid;
  assign popCC_readArbitation_payload = popCC_addressGen_rData;
  assign _zz_popCC_readPort_rsp_last = ram_spinal_port1;
  assign popCC_readPort_rsp_last = _zz_popCC_readPort_rsp_last[0];
  assign popCC_readPort_rsp_fragment = _zz_popCC_readPort_rsp_last[128 : 1];
  assign popCC_readPort_cmd_valid = popCC_addressGen_fire;
  assign popCC_readPort_cmd_payload = popCC_addressGen_payload;
  assign popCC_readArbitation_translated_valid = popCC_readArbitation_valid;
  assign popCC_readArbitation_ready = popCC_readArbitation_translated_ready;
  assign popCC_readArbitation_translated_payload_last = popCC_readPort_rsp_last;
  assign popCC_readArbitation_translated_payload_fragment = popCC_readPort_rsp_fragment;
  assign io_pop_valid = popCC_readArbitation_translated_valid;
  assign popCC_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_last = popCC_readArbitation_translated_payload_last;
  assign io_pop_payload_fragment = popCC_readArbitation_translated_payload_fragment;
  assign popCC_readArbitation_fire = (popCC_readArbitation_valid && popCC_readArbitation_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = (popCC_pushPtrGray[4] ^ _zz_io_popOccupancy_4);
  assign _zz_io_popOccupancy_4 = (popCC_pushPtrGray[5] ^ _zz_io_popOccupancy_5);
  assign _zz_io_popOccupancy_5 = (popCC_pushPtrGray[6] ^ _zz_io_popOccupancy_6);
  assign _zz_io_popOccupancy_6 = (popCC_pushPtrGray[7] ^ _zz_io_popOccupancy_7);
  assign _zz_io_popOccupancy_7 = (popCC_pushPtrGray[8] ^ _zz_io_popOccupancy_8);
  assign _zz_io_popOccupancy_8 = popCC_pushPtrGray[9];
  assign io_popOccupancy = ({_zz_io_popOccupancy_8,{_zz_io_popOccupancy_7,{_zz_io_popOccupancy_6,{_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,_zz_io_popOccupancy_9}}}}}}}}} - popCC_ptrToOccupancy);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_ptrToPush;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushCC_pushPtr <= 10'h0;
      pushCC_pushPtrGray <= 10'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge io_hdmiClk or posedge reset_synchronized) begin
    if(reset_synchronized) begin
      popCC_popPtr <= 10'h0;
      popCC_addressGen_rValid <= 1'b0;
      popCC_ptrToPush <= 10'h0;
      popCC_ptrToOccupancy <= 10'h0;
    end else begin
      if(popCC_addressGen_fire) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
      if(popCC_addressGen_ready) begin
        popCC_addressGen_rValid <= popCC_addressGen_valid;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToPush <= popCC_popPtrGray;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToOccupancy <= popCC_popPtr;
      end
    end
  end

  always @(posedge io_hdmiClk) begin
    if(popCC_addressGen_ready) begin
      popCC_addressGen_rData <= popCC_addressGen_payload;
    end
  end


endmodule

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  output reg           io_pop_payload,
  input  wire          io_flush,
  output wire [6:0]    io_occupancy,
  output wire [6:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  wire       [0:0]    logic_ram_spinal_port1;
  wire       [0:0]    _zz_logic_ram_port;
  reg                 _zz_1;
  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [6:0]    logic_ptr_push;
  reg        [6:0]    logic_ptr_pop;
  wire       [6:0]    logic_ptr_occupancy;
  wire       [6:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1248;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [5:0]    logic_push_onRam_write_payload_address;
  wire                logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [5:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_async_readed;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;
  wire                logic_pop_addressGen_translated_payload;
  (* ram_style = "distributed" *) reg [0:0] logic_ram [0:63];

  assign _zz_logic_ram_port = logic_push_onRam_write_payload_data;
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  assign logic_ram_spinal_port1 = logic_ram[logic_pop_addressGen_payload];
  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1248 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 7'h40) == 7'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[5:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[5:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_async_readed = logic_ram_spinal_port1[0];
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  assign logic_pop_addressGen_translated_payload = logic_pop_async_readed;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  always @(*) begin
    io_pop_payload = logic_pop_addressGen_translated_payload;
    if(logic_ptr_empty) begin
      io_pop_payload = io_push_payload;
    end
  end

  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (7'h40 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 7'h0;
      logic_ptr_pop <= 7'h0;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1248) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 7'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 7'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 7'h0;
        logic_ptr_pop <= 7'h0;
      end
    end
  end


endmodule

module FlowCCUnsafeByToggle (
  input  wire          io_input_valid,
  output wire          io_output_valid,
  input  wire          io_csiClk,
  input  wire          _zz_1,
  input  wire          clk,
  input  wire          _zz_2
);

  wire                inputArea_target_buffercc_io_dataOut;
  reg                 inputArea_target;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  reg                 outputArea_flow_m2sPipe_valid;

  (* keep_hierarchy = "TRUE" *) BufferCC_3 inputArea_target_buffercc (
    .io_dataIn  (inputArea_target                    ), //i
    .io_dataOut (inputArea_target_buffercc_io_dataOut), //o
    .clk        (clk                                 ), //i
    ._zz_1      (_zz_2                               )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  always @(posedge io_csiClk or posedge _zz_1) begin
    if(_zz_1) begin
      inputArea_target <= 1'b0;
    end else begin
      if(io_input_valid) begin
        inputArea_target <= (! inputArea_target);
      end
    end
  end

  always @(posedge clk or posedge _zz_2) begin
    if(_zz_2) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
      outputArea_hit <= 1'b0;
    end else begin
      outputArea_hit <= outputArea_target;
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module StreamFifoCC (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [127:0]  io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [127:0]  io_pop_payload,
  output wire [9:0]    io_pushOccupancy,
  output wire [9:0]    io_popOccupancy,
  input  wire          io_csiClk,
  input  wire          _zz_5,
  input  wire          clk,
  output wire          _zz_6
);

  wire                bufferCC_7_io_dataIn;
  reg        [127:0]  ram_spinal_port1;
  wire       [9:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_7_io_dataOut;
  wire       [9:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [9:0]    _zz_pushCC_pushPtrGray;
  wire       [8:0]    _zz_ram_port;
  wire                _zz_io_pushOccupancy_9;
  wire       [9:0]    _zz_popCC_popPtrGray;
  wire                _zz_io_popOccupancy_9;
  reg                 _zz_1;
  wire       [9:0]    popToPushGray;
  wire       [9:0]    pushToPopGray;
  reg        [9:0]    pushCC_pushPtr;
  wire       [9:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [9:0]    pushCC_pushPtrGray;
  wire       [9:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  wire                _zz_io_pushOccupancy_6;
  wire                _zz_io_pushOccupancy_7;
  wire                _zz_io_pushOccupancy_8;
  wire                _zz_3;
  reg        [9:0]    popCC_popPtr;
  (* keep , syn_keep *) wire       [9:0]    popCC_popPtrPlus /* synthesis syn_keep = 1 */ ;
  wire       [9:0]    popCC_popPtrGray;
  wire       [9:0]    popCC_pushPtrGray;
  wire                popCC_addressGen_valid;
  reg                 popCC_addressGen_ready;
  wire       [8:0]    popCC_addressGen_payload;
  wire                popCC_empty;
  wire                popCC_addressGen_fire;
  wire                popCC_readArbitation_valid;
  wire                popCC_readArbitation_ready;
  wire       [8:0]    popCC_readArbitation_payload;
  reg                 popCC_addressGen_rValid;
  reg        [8:0]    popCC_addressGen_rData;
  wire                when_Stream_l375;
  wire                popCC_readPort_cmd_valid;
  wire       [8:0]    popCC_readPort_cmd_payload;
  wire       [127:0]  popCC_readPort_rsp;
  wire                popCC_readArbitation_translated_valid;
  wire                popCC_readArbitation_translated_ready;
  wire       [127:0]  popCC_readArbitation_translated_payload;
  wire                popCC_readArbitation_fire;
  reg        [9:0]    popCC_ptrToPush;
  reg        [9:0]    popCC_ptrToOccupancy;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  wire                _zz_io_popOccupancy_6;
  wire                _zz_io_popOccupancy_7;
  wire                _zz_io_popOccupancy_8;
  reg [127:0] ram [0:511];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[8:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtr >>> 1'b1);
  assign _zz_io_pushOccupancy_9 = (pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy);
  assign _zz_io_popOccupancy_9 = (popCC_pushPtrGray[0] ^ _zz_io_popOccupancy);
  always @(posedge io_csiClk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge clk) begin
    if(popCC_readPort_cmd_valid) begin
      ram_spinal_port1 <= ram[popCC_readPort_cmd_payload];
    end
  end

  (* keep_hierarchy = "TRUE" *) BufferCC_4 popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[9:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[9:0]), //o
    .io_csiClk  (io_csiClk                             ), //i
    ._zz_1      (_zz_5                                 )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_5 bufferCC_7 (
    .io_dataIn  (bufferCC_7_io_dataIn ), //i
    .io_dataOut (bufferCC_7_io_dataOut), //o
    .clk        (clk                  ), //i
    ._zz_1      (_zz_5                )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_6 pushToPopGray_buffercc (
    .io_dataIn  (pushToPopGray[9:0]                    ), //i
    .io_dataOut (pushToPopGray_buffercc_io_dataOut[9:0]), //o
    .clk        (clk                                   ), //i
    ._zz_1      (_zz_3                                 )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 10'h001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[9 : 8] == (~ pushCC_popPtrGray[9 : 8])) && (pushCC_pushPtrGray[7 : 0] == pushCC_popPtrGray[7 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = (pushCC_popPtrGray[6] ^ _zz_io_pushOccupancy_6);
  assign _zz_io_pushOccupancy_6 = (pushCC_popPtrGray[7] ^ _zz_io_pushOccupancy_7);
  assign _zz_io_pushOccupancy_7 = (pushCC_popPtrGray[8] ^ _zz_io_pushOccupancy_8);
  assign _zz_io_pushOccupancy_8 = pushCC_popPtrGray[9];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_8,{_zz_io_pushOccupancy_7,{_zz_io_pushOccupancy_6,{_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,_zz_io_pushOccupancy_9}}}}}}}}});
  assign bufferCC_7_io_dataIn = (1'b0 ^ 1'b0);
  assign _zz_3 = bufferCC_7_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 10'h001);
  assign popCC_popPtrGray = (_zz_popCC_popPtrGray ^ popCC_popPtr);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign popCC_addressGen_valid = (! popCC_empty);
  assign popCC_addressGen_payload = popCC_popPtr[8:0];
  assign popCC_addressGen_fire = (popCC_addressGen_valid && popCC_addressGen_ready);
  always @(*) begin
    popCC_addressGen_ready = popCC_readArbitation_ready;
    if(when_Stream_l375) begin
      popCC_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l375 = (! popCC_readArbitation_valid);
  assign popCC_readArbitation_valid = popCC_addressGen_rValid;
  assign popCC_readArbitation_payload = popCC_addressGen_rData;
  assign popCC_readPort_rsp = ram_spinal_port1;
  assign popCC_readPort_cmd_valid = popCC_addressGen_fire;
  assign popCC_readPort_cmd_payload = popCC_addressGen_payload;
  assign popCC_readArbitation_translated_valid = popCC_readArbitation_valid;
  assign popCC_readArbitation_ready = popCC_readArbitation_translated_ready;
  assign popCC_readArbitation_translated_payload = popCC_readPort_rsp;
  assign io_pop_valid = popCC_readArbitation_translated_valid;
  assign popCC_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = popCC_readArbitation_translated_payload;
  assign popCC_readArbitation_fire = (popCC_readArbitation_valid && popCC_readArbitation_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = (popCC_pushPtrGray[4] ^ _zz_io_popOccupancy_4);
  assign _zz_io_popOccupancy_4 = (popCC_pushPtrGray[5] ^ _zz_io_popOccupancy_5);
  assign _zz_io_popOccupancy_5 = (popCC_pushPtrGray[6] ^ _zz_io_popOccupancy_6);
  assign _zz_io_popOccupancy_6 = (popCC_pushPtrGray[7] ^ _zz_io_popOccupancy_7);
  assign _zz_io_popOccupancy_7 = (popCC_pushPtrGray[8] ^ _zz_io_popOccupancy_8);
  assign _zz_io_popOccupancy_8 = popCC_pushPtrGray[9];
  assign io_popOccupancy = ({_zz_io_popOccupancy_8,{_zz_io_popOccupancy_7,{_zz_io_popOccupancy_6,{_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,_zz_io_popOccupancy_9}}}}}}}}} - popCC_ptrToOccupancy);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_ptrToPush;
  assign _zz_6 = _zz_3;
  always @(posedge io_csiClk or posedge _zz_5) begin
    if(_zz_5) begin
      pushCC_pushPtr <= 10'h0;
      pushCC_pushPtrGray <= 10'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge clk or posedge _zz_3) begin
    if(_zz_3) begin
      popCC_popPtr <= 10'h0;
      popCC_addressGen_rValid <= 1'b0;
      popCC_ptrToPush <= 10'h0;
      popCC_ptrToOccupancy <= 10'h0;
    end else begin
      if(popCC_addressGen_fire) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
      if(popCC_addressGen_ready) begin
        popCC_addressGen_rValid <= popCC_addressGen_valid;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToPush <= popCC_popPtrGray;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToOccupancy <= popCC_popPtr;
      end
    end
  end

  always @(posedge clk) begin
    if(popCC_addressGen_ready) begin
      popCC_addressGen_rData <= popCC_addressGen_payload;
    end
  end


endmodule

module StreamFifo_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_last,
  input  wire [47:0]   io_push_payload_fragment,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_last,
  output wire [47:0]   io_pop_payload_fragment,
  input  wire          io_flush,
  output wire [3:0]    io_occupancy,
  output wire [3:0]    io_availability,
  input  wire          io_hdmiClk,
  input  wire          _zz_4
);

  reg        [48:0]   logic_ram_spinal_port1;
  wire       [48:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [3:0]    logic_ptr_push;
  reg        [3:0]    logic_ptr_pop;
  wire       [3:0]    logic_ptr_occupancy;
  wire       [3:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1248;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [2:0]    logic_push_onRam_write_payload_address;
  wire                logic_push_onRam_write_payload_data_last;
  wire       [47:0]   logic_push_onRam_write_payload_data_fragment;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [2:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [2:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [2:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l375;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [2:0]    logic_pop_sync_readPort_cmd_payload;
  wire                logic_pop_sync_readPort_rsp_last;
  wire       [47:0]   logic_pop_sync_readPort_rsp_fragment;
  wire       [48:0]   _zz_logic_pop_sync_readPort_rsp_last;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire                logic_pop_sync_readArbitation_translated_payload_last;
  wire       [47:0]   logic_pop_sync_readArbitation_translated_payload_fragment;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [3:0]    logic_pop_sync_popReg;
  reg [48:0] logic_ram [0:7];

  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_fragment,logic_push_onRam_write_payload_data_last};
  always @(posedge io_hdmiClk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge io_hdmiClk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1248 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 4'b1000) == 4'b0000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[2:0];
  assign logic_push_onRam_write_payload_data_last = io_push_payload_last;
  assign logic_push_onRam_write_payload_data_fragment = io_push_payload_fragment;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[2:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l375) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l375 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_last = logic_ram_spinal_port1;
  assign logic_pop_sync_readPort_rsp_last = _zz_logic_pop_sync_readPort_rsp_last[0];
  assign logic_pop_sync_readPort_rsp_fragment = _zz_logic_pop_sync_readPort_rsp_last[48 : 1];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload_last = logic_pop_sync_readPort_rsp_last;
  assign logic_pop_sync_readArbitation_translated_payload_fragment = logic_pop_sync_readPort_rsp_fragment;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_last = logic_pop_sync_readArbitation_translated_payload_last;
  assign io_pop_payload_fragment = logic_pop_sync_readArbitation_translated_payload_fragment;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (4'b1000 - logic_ptr_occupancy);
  always @(posedge io_hdmiClk or posedge _zz_4) begin
    if(_zz_4) begin
      logic_ptr_push <= 4'b0000;
      logic_ptr_pop <= 4'b0000;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 4'b0000;
    end else begin
      if(when_Stream_l1248) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 4'b0001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 4'b0001);
      end
      if(io_flush) begin
        logic_ptr_push <= 4'b0000;
        logic_ptr_pop <= 4'b0000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 4'b0000;
      end
    end
  end

  always @(posedge io_hdmiClk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module BufferCC_2 (
  input  wire [9:0]    io_dataIn,
  output wire [9:0]    io_dataOut,
  input  wire          io_hdmiClk,
  input  wire          reset_synchronized
);

  (* async_reg = "true" *) reg        [9:0]    buffers_0;
  (* async_reg = "true" *) reg        [9:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_hdmiClk or posedge reset_synchronized) begin
    if(reset_synchronized) begin
      buffers_0 <= 10'h0;
      buffers_1 <= 10'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_1 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_hdmiClk,
  input  wire          reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_hdmiClk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input  wire [9:0]    io_dataIn,
  output wire [9:0]    io_dataOut,
  input  wire          clk,
  input  wire          reset
);

  (* async_reg = "true" *) reg        [9:0]    buffers_0;
  (* async_reg = "true" *) reg        [9:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 10'h0;
      buffers_1 <= 10'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_3 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          clk,
  input  wire          _zz_1
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_6 (
  input  wire [9:0]    io_dataIn,
  output wire [9:0]    io_dataOut,
  input  wire          clk,
  input  wire          _zz_1
);

  (* async_reg = "true" *) reg        [9:0]    buffers_0;
  (* async_reg = "true" *) reg        [9:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 10'h0;
      buffers_1 <= 10'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_5 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          clk,
  input  wire          _zz_1
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_4 (
  input  wire [9:0]    io_dataIn,
  output wire [9:0]    io_dataOut,
  input  wire          io_csiClk,
  input  wire          _zz_1
);

  (* async_reg = "true" *) reg        [9:0]    buffers_0;
  (* async_reg = "true" *) reg        [9:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_csiClk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 10'h0;
      buffers_1 <= 10'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
