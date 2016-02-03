接口描述
========

接口信号模块
------------

龙芯 3B1500 的接口信号与龙芯 3A/3B 接口信号引脚定义兼容（注：电源部分不兼容），
如图 2-1 所示。

                                 MC0/1_DDR2_RESETn                     HTCLK
                                MC0/1_DDR2_CLKp/n[5:0]                HT0/1_8x2
                                 MC0/1_DDR2_CKE[3:0]            HT0/1_HI_HOSTMODE
                                 MC0/1_DDR2_ODT[3:0]               HT0/1_HI_RSTn
                                 MC0/1_DDR2_SCSn[3:0]            HT0/1_HI_POWEROK
             CH0/1_DDR2/3信号

                                  MC0/1_DDR2_A[14:0]             HT0/1_HI_LDT_REQn
                                 MC0/1_DDR2_BA[2:0]             HT0/1_HI_LDT_STOPn

HyperTransport信号

                                  MC0/1_DDR2_RASn               HT0/1_LO_HOSTMODE
                                  MC0/1_DDR2_CASn                  HT0/1_LO_RSTn
                                   MC0/1_DDR2_WEn               HT0/1_LO_POWEROK
                                 MC0/1_DDR2_DQ[63:0]            HT0/1_LO_LDT_REQn
                                 MC0/1_DDR2_CB[7:0]             HT0/1_LO_LDT_STOPn
                                MC0/1_DDR2_DQSp/n[8:0]              HT0/1CLKp/n
                                MC0/1_DDR2_DQM[8:0]             HT0/1_RX_CLKp/n[1:0]
                                                                HT0/1_RX_CTLp/n[1:0]
                                     PCI_AD[31:0]               HT0/1_RX_CADp/n[15:0]
                                     PCI_CBEn[3:0]              HT0/1_TX_CLKp/n[1:0]
                                    PCI_REQn[6:0]               HT0/1_TX_CTLp/n[1:0]
                                    PCI_GNTn[6:0]               HT0/1_TX_CADp/n[15:0]
                                    PCI_IRQn[D:A]
                                      PCI_IDSEL                      EJTAG_TCK
                                       PCI_CLK                       EJTAG_TDI
                                                                     EJTAG

PCI_X信号

                                       PCI_PAR                       EJTAG_TMS
                                      PCI_PERR                      EJTAG_TRST
                                      PCI_SERR                       EJTAG_TDO
                                     PCI_RESETn          龙芯3C
                                     PCI_FRAMEn                         TCK
                                      PCI_IRDYn                         TDI
                                                                                        JTAG




                                      PCI_TRDYn                         TMS
                                     PCI_DEVSELn                        TRST
                                      PCI_STOPn                         TDO
                                   PCI_CONFIG[7:0]
                                                                    UART0/1_TXD
                                     LPC_LAD[3:0]                   UART0/1_RXD
                                    LPC_LFRAMEn                     UART0/1_RTS

LPC信号

UART信号

                                     LPC_SERIRQ                     UART0/1_CTS
                                    LPC_ROMINTEL                    UART0/1_DSR
                                   LPC_ROM8MBITS                    UART0/1_DCD
                                                                    UART0/1_DTR
                                      SYSRESETn                      UART0/1_RI
                                       SYSCLK

SYSTEM CONTROL信号

                                       MEMCLK
                                     CLKSEL[15:0]                     SPI_SCK
                                      GPIO[15:0]                      SPI_SDO
                                                                      SPI
                                       INTn[3:0]                       SPI_SDI
                                         NMIn
                                     NODE_ID[1:0]
                                       ICCC_EN
                                       TESTCLK
                                       DOTEST




图 2-1 龙芯 3B1500 处理器接口信号框图

注：箭头指示信号方向，有输入、输出和双向。

PCI 总线接口信号
----------------

龙芯 3B1500 的 PCI 总线信号包括：

 - 32 位地址数据总线信号；
 - 4 位命令数据 ID 总线信号；
 - 14 位总线仲裁信号；
 - 7 位接口控制信号；
 - 2 位错误报告信号；

龙芯 3B1500 处理器 PCI 控制器工作频率为 33MHz，处理器引脚电压为 1.8v。

    表 2-1 PCI 总线信号是龙芯 3B1500 处理器的 PCI 总线接口信号定义。
                                表 2-1 PCI 总线信号
      信号名称          类型                  描述           是否三态    电压域
    PCI_AD[31:0]     t/s    PCI 地址/数据信号                是    VDDE1V8
    PCI_CBEn[3:0]    t/s    PCI 命令/字节使能信号，使用时外部上拉      是    VDDE1V8
      PCI_PAR        t/s    地址/数据奇偶检测信号，使用时外部上拉        是    VDDE1V8
                            外部设备总线占用请求输入信号，使用时外部
    PCI_REQn[6:1]    t/s                               否    VDDE1V8
                            上拉
                            根据仲裁模式，可为外部设备总线请求输入，
                            或为到外部仲裁器的总线请求输出信号。使用
    PCI_REQn[0]      t/s                               是    VDDE1V8
                            时外部上拉。当使用外部仲裁器时，该信号作
                            为输出信号。
                            到外部设备的 PCI 总线允许输出信号，使用时
    PCI_GNTn[6:1]    t/s                               否    VDDE1V8
                            外部上拉
                            根据仲裁模式，可为外部仲裁器返回的总线允
                            许输入，或为到外部设备的 PCI 总线允许输出。
    PCI_GNTn[0]      t/s                               是    VDDE1V8
                            使用时外部上拉。当使用外部仲裁器时，该信
                            号作为输入信号。
    PCI_FRAMEn      s/t/s   PCI 帧周期信号，使用时外部上拉          是    VDDE1V8
     PCI_IRDYn      s/t/s   PCI 主设备准备好信号，使用时外部上拉       是    VDDE1V8
     PCI_TRDYn      s/t/s   PCI 目标设备准备好信号，使用时外部上拉      是    VDDE1V8
     PCI_STOPn      s/t/s   PCI 停止数据传送信号，使用时外部上拉       是    VDDE1V8
    PCI_DEVSELn     s/t/s   PCI 设备选择，使用时外部上拉           是    VDDE1V8
     PCI_IDSEL       in     PCI 配置片选，作为主桥时应拉低          否    VDDE1V8
     PCI_PERRn      s/t/s   PCI 数据奇偶错误报告信号，使用时外部上拉     是    VDDE1V8
     PCI_SERRn      o/d     PCI 系统错误报告，使用时外部上拉         否    VDDE1V8


HyperTransport 总线接口信号
---------------------------

龙芯 3B1500 中拥有两组独立的的 HyperTransport 总线（分别称为 HT0 与 HT1），其中
每组 16 位的 HyperTransport 总线可独立配置为两组 8 位总线分别使用（分别称为
HTx_Lo 与 HTx_Hi）。其中每组 HyperTransport 总线信号包括：

 - 16 对差分发送数据命令总线；
 - 16 对差分接收数据命令总线；
 - 2 对差分发送控制信号；
 - 2 对差分接收控制信号；
 - 2 对差分发送时钟信号；
 - 2 对差分接收时钟信号；
 - 4 个 16 位/低 8 位总线控制信号；
 - 4 个高 8 位总线控制信号；

表 2-2 HT 总线信号是龙芯 3B1500 处理器的 HyperTransport 总线接口信号定义。

表 2-2 HT 总线信号

HT0 总线信号
                      输入/输                                                   默认上下
      信号名称                                         描述              电源域
                       出                                                       拉
HT0_REXT               IO 需要通过 400 欧姆（400 ohm+/-1%）电阻连接到地          VDDESB      -
                           为 1 时有效，表示将 HT0 分为 HT0_Lo 与 HT0_Hi 分别使用
HT0_8x2                 I                                           VDDESB    下拉
                           为 0 时无效，表示将 HT0 作为 16 位总线使用
                           为 1 时有效，表示将 HT0_Lo 控制器作为主模式，控制复位等信号
HT0_Lo_Hostmode         I  为 0 时无效，表示将 HT0_Lo 控制器作为从模式，复位等信号仅为输 VDDESB       上拉
                           入模式
                           为 1 时有效，表示将 HT0_Hi 控制器作为主模式，控制复位等信号
HT0_Hi_Hostmode         I  为 0 时无效，表示将 HT0_Hi 控制器作为从模式，复位等信号仅为输 VDDESB       上拉
                           入模式
                           当 HT0_8x2 无效时为 HT0 总线 PowerOK 信号，
                           当 HT0_8x2 有效时为 HT0_Lo 总线 PowerOK 信号。
HT0_Lo_PowerOK         I/O                                         VDDESB     上拉
                           当 HT0_Lo_Hostmode 有效时为双向信号，
                           当 HT0_Lo_Hostmode 无效时为输入信号。
                           当 HT0_8x2 无效时为 HT0 总线 Resetn 信号，
                           当 HT0_8x2 有效时为 HT0_Lo 总线 Resetn 信号。
HT0_Lo_Resetn          I/O                                         VDDESB     上拉
                           当 HT0_Lo_Hostmode 有效时为双向信号，
                           当 HT0_Lo_Hostmode 无效时为输入信号。
                           当 HT0_8x2 无效时为 HT0 总线 Ldt_Stopn 信号，
                           当 HT0_8x2 有效时为 HT0_Lo 总线 Ldt_Stopn 信号。
HT0_Lo_Ldt_Stopn       I/O                                         VDDESB     上拉
                           当 HT0_Lo_Hostmode 有效时为双向信号，
                           当 HT0_Lo_Hostmode 无效时为输入信号。
                           当 HT0_8x2 无效时为 HT0 总线 Ldt_Reqn 信号，
HT0_Lo_Ldt_reqn        I/O                                          VDDESB    上拉
                           当 HT0_8x2 有效时为 HT0_Lo 总线 Ldt_Reqn 信号。
                           当 HT0_8x2 无效时该信号无效，
                           当 HT0_8x2 有效时为 HT0_Hi 总线 PowerOK 信号。
HT0_Hi_PowerOK         I/O                                         VDDESB     上拉
                           当 HT0_Hi_Hostmode 有效时为双向信号，
                           当 HT0_Hi_Hostmode 无效时为输入信号。
                           当 HT0_8x2 无效时该信号无效，
                           当 HT0_8x2 有效时为 HT0_Hi 总线 Resetn 信号。
HT0_Hi_Resetn          I/O                                         VDDESB     上拉
                           当 HT0_Hi_Hostmode 有效时为双向信号，
                           当 HT0_Hi_Hostmode 无效时为输入信号。
                           当 HT0_8x2 无效时该信号无效，
                           当 HT0_8x2 有效时为 HT0_Hi 总线 Ldt_Stopn 信号。
HT0_Hi_LDT_Stopn       I/O                                         VDDESB     上拉
                           当 HT0_Hi_Hostmode 有效时为双向信号，
                           当 HT0_Hi_Hostmode 无效时为输入信号。
                           当 HT0_8x2 无效时该信号无效，
HT0_Hi_LDT_reqn        I/O                                          VDDESB    上拉
                           当 HT0_8x2 有效时为 HT0_Hi 总线 Ldt_Reqn 信号。
                           当 HT0_8x2 无效时，该总线为 HT0 总线发送数据命令总线，
HT0_Tx_CADp[15:0]       O  当 HT0_8x2 有效时，                          HT_VDDE    无
                               [7:0]位为 HT0_Lo 总线发送数据命令总线，
                             [15:0]位为 HT0_Hi 总线发送数据命令总线。
                          当 HT0_8x2 无效时，该总线为 HT0 总线发送数据命令总线，
                          当 HT0_8x2 有效时，
HT0_Tx_CADn[15:0]     O                                            HT_VDDE    无
                             [7:0]位为 HT0_Lo 总线发送数据命令总线，
                             [15:0]位为 HT0_Hi 总线发送数据命令总线。
                          当 HT0_8x2 无效时，
                             [0]位为 HT0 总线发送控制信号，
                             [1]位无效。
HT0_Tx_CTLp[1:0]      O                                            HT_VDDE    无
                          当 HT0_8x2 有效时，
                             [0]位为 HT0_Lo 总线发送控制信号，
                             [1]位为 HT0_Hi 总线发送控制信号。
                          当 HT0_8x2 无效时，
                             [0]位为 HT0 总线发送控制信号，
                             [1]位无效。
HT0_Tx_CTLn[1:0]      O                                            HT_VDDE    无
                          当 HT0_8x2 有效时，
                             [0]位为 HT0_Lo 总线发送控制信号，
                             [1]位为 HT0_Hi 总线发送控制信号。
                          当 HT0_8x2 无效时，该总线为 HT0 总线发送时钟总线，
                          当 HT0_8x2 有效时，
HT0_Tx_CLKp[1:0]      O                                            HT_VDDE    无
                             [0]位为 HT0_Lo 总线发送时钟信号，
                             [1]位为 HT0_Hi 总线发送时钟信号。
                          当 HT0_8x2 无效时，该总线为 HT0 总线发送时钟总线，
                          当 HT0_8x2 有效时，
HT0_Tx_CLKn[1:0]      O                                            HT_VDDE    无
                             [0]位为 HT0_Lo 总线发送时钟信号，
                             [1]位为 HT0_Hi 总线发送时钟信号。
                          当 HT0_8x2 无效时，该总线为 HT0 总线接收数据命令总线，
                          当 HT0_8x2 有效时，
HT0_Rx_CADp[15:0]     I                                            HT_VDDE    无
                             [7:0]位为 HT0_Lo 总线接收数据命令总线，
                             [15:0]位为 HT0_Hi 总线接收数据命令总线。
                          当 HT0_8x2 无效时，该总线为 HT0 总线接收数据命令总线，
                          当 HT0_8x2 有效时，
HT0_Rx_CADn[15:0]     I                                            HT_VDDE    无
                             [7:0]位为 HT0_Lo 总线接收数据命令总线，
                             [15:0]位为 HT0_Hi 总线接收数据命令总线。
                          当 HT0_8x2 无效时，
                             [0]位为 HT0 总线接收控制信号，
                             [1]位无效。
HT0_Rx_CTLp[1:0]      I                                            HT_VDDE    无
                          当 HT0_8x2 有效时，
                             [0]位为 HT0_Lo 总线接收控制信号，
                             [1]位为 HT0_Hi 总线接收控制信号。
                          当 HT0_8x2 无效时，
                             [0]位为 HT0 总线接收控制信号，
                             [1]位无效。
HT0_Rx_CTLn[1:0]      I                                            HT_VDDE    无
                          当 HT0_8x2 有效时，
                             [0]位为 HT0_Lo 总线接收控制信号，
                             [1]位为 HT0_Hi 总线接收控制信号。
                          当 HT0_8x2 无效时，该总线为 HT0 总线接收时钟总线，
                          当 HT0_8x2 有效时，
HT0_Rx_CLKp[1:0]      I                                            HT_VDDE    无
                             [0]位为 HT0_Lo 总线接收时钟信号，
                             [1]位为 HT0_Hi 总线接收时钟信号。
                          当 HT0_8x2 无效时，该总线为 HT0 总线接收时钟总线，
                          当 HT0_8x2 有效时，
HT0_Rx_CLKn[1:0]      I                                            HT_VDDE    无
                             [0]位为 HT0_Lo 总线接收时钟信号，
                             [1]位为 HT0_Hi 总线接收时钟信号。
                                          HT1 总线信号
                    输入/输                                                     默认上下
      信号名称                                   描述                    电源域
                     出                                                         拉
HT1_REXT             IO 需要通过 400 欧姆（400 ohm+/-1%）电阻连接到地            VDDESB      -
                         为 1 时有效，表示将 HT1 分为 HT0_Lo 与 HT0_Hi 分别使用
HT1_8x2              I                                             VDDESB     下拉
                         为 0 时无效，表示将 HT1 作为 16 位总线使用
                          为 1 时有效，表示将 HT1_Lo 控制器作为主模式，控制复位等信号
HT1_Lo_Hostmode     I     为 0 时无效，表示将 HT1_Lo 控制器作为从模式，复位等信号仅为输     VDDESB    上拉
                          入模式
                          为 1 时有效，表示将 HT1_Hi 控制器作为主模式，控制复位等信号
HT1_Hi_Hostmode     I     为 0 时无效，表示将 HT1_Hi 控制器作为从模式，复位等信号仅为输     VDDESB    上拉
                          入模式
                          当 HT1_8x2 无效时为 HT1 总线 PowerOK 信号，
                          当 HT1_8x2 有效时为 HT1_Lo 总线 PowerOK 信号。
HT1_Lo_PowerOK      I/O                                            VDDESB    上拉
                          当 HT1_Lo_Hostmode 有效时为双向信号，
                          当 HT1_Lo_Hostmode 无效时为输入信号。
                          当 HT1_8x2 无效时为 HT1 总线 Resetn 信号，
                          当 HT1_8x2 有效时为 HT1_Lo 总线 Resetn 信号。
HT1_Lo_Resetn       I/O                                            VDDESB    上拉
                          当 HT1_Lo_Hostmode 有效时为双向信号，
                          当 HT1_Lo_Hostmode 无效时为输入信号。
                          当 HT1_8x2 无效时为 HT1 总线 Ldt_Stopn 信号，
                          当 HT1_8x2 有效时为 HT1_Lo 总线 Ldt_Stopn 信号。
HT1_Lo_Ldt_Stopn    I/O                                            VDDESB    上拉
                          当 HT1_Lo_Hostmode 有效时为双向信号，
                          当 HT1_Lo_Hostmode 无效时为输入信号。
                          当 HT1_8x2 无效时为 HT1 总线 Ldt_Reqn 信号，
HT1_Lo_Ldt_reqn     I/O                                            VDDESB    上拉
                          当 HT1_8x2 有效时为 HT1_Lo 总线 Ldt_Reqn 信号。
                          当 HT1_8x2 无效时该信号无效，
                          当 HT1_8x2 有效时为 HT1_Hi 总线 PowerOK 信号。
HT1_Hi_PowerOK      I/O                                            VDDESB    上拉
                          当 HT1_Hi_Hostmode 有效时为双向信号，
                          当 HT1_Hi_Hostmode 无效时为输入信号。
                          当 HT1_8x2 无效时该信号无效，
                          当 HT1_8x2 有效时为 HT1_Hi 总线 Resetn 信号。
HT1_Hi_Resetn       I/O                                            VDDESB    上拉
                          当 HT1_Hi_Hostmode 有效时为双向信号，
                          当 HT1_Hi_Hostmode 无效时为输入信号。
                          当 HT1_8x2 无效时该信号无效，
                          当 HT1_8x2 有效时为 HT1_Hi 总线 Ldt_Stopn 信号。
HT1_Hi_LDT_Stopn    I/O                                            VDDESB    上拉
                          当 HT1_Hi_Hostmode 有效时为双向信号，
                          当 HT1_Hi_Hostmode 无效时为输入信号。
                          当 HT1_8x2 无效时该信号无效，
HT1_Hi_LDT_reqn     I/O                                            VDDESB    上拉
                          当 HT1_8x2 有效时为 HT1_Hi 总线 Ldt_Reqn 信号。
                          当 HT1_8x2 无效时，该总线为 HT1 总线发送数据命令总线，
                          当 HT1_8x2 有效时，
HT1_Tx_CADp[15:0]   O                                              HT_VDDE   无
                              [7:0]位为 HT1_Lo 总线发送数据命令总线，
                              [15:0]位为 HT1_Hi 总线发送数据命令总线。
                          当 HT1_8x2 无效时，该总线为 HT1 总线发送数据命令总线，
                          当 HT1_8x2 有效时，
HT1_Tx_CADn[15:0]   O                                              HT_VDDE   无
                              [7:0]位为 HT1_Lo 总线发送数据命令总线，
                          [15:0]位为 HT1_Hi 总线发送数据命令总线。
                          当 HT1_8x2 无效时，
                              [0]位为 HT1 总线发送控制信号，
                              [1]位无效。
HT1_Tx_CTLp[1:0]    O                                              HT_VDDE   无
                          当 HT1_8x2 有效时，
                              [0]位为 HT1_Lo 总线发送控制信号，
                              [1]位为 HT1_Hi 总线发送控制信号。
                          当 HT1_8x2 无效时，
                              [0]位为 HT1 总线发送控制信号，
                              [1]位无效。
HT1_Tx_CTLn[1:0]    O                                              HT_VDDE   无
                          当 HT1_8x2 有效时，
                              [0]位为 HT1_Lo 总线发送控制信号，
                              [1]位为 HT1_Hi 总线发送控制信号。
                          当 HT1_8x2 无效时，该总线为 HT0 总线发送时钟总线，
                          当 HT1_8x2 有效时，
HT1_Tx_CLKp[1:0]    O                                              HT_VDDE   无
                              [0]位为 HT1_Lo 总线发送时钟信号，
                              [1]位为 HT1_Hi 总线发送时钟信号。
HT1_Tx_CLKn[1:0]    O     当 HT1_8x2 无效时，该总线为 HT0 总线发送时钟总线，         HT_VDDE   无
                             当 HT1_8x2 有效时，
                                [0]位为 HT1_Lo 总线发送时钟信号，
                                [1]位为 HT1_Hi 总线发送时钟信号。
                             当 HT1_8x2 无效时，该总线为 HT1 总线接收数据命令总线，
                             当 HT1_8x2 有效时，
HT1_Rx_CADp[15:0]        I                                        HT_VDDE   无
                                [7:0]位为 HT1_Lo 总线接收数据命令总线，
                                [15:0]位为 HT1_Hi 总线接收数据命令总线。
                             当 HT1_8x2 无效时，该总线为 HT1 总线接收数据命令总线，
                             当 HT1_8x2 有效时，
HT1_Rx_CADn[15:0]        I                                        HT_VDDE   无
                                [7:0]位为 HT1_Lo 总线接收数据命令总线，
                                [15:0]位为 HT1_Hi 总线接收数据命令总线。
                             当 HT1_8x2 无效时，
                                [0]位为 HT1 总线接收控制信号，
                                [1]位无效。
HT1_Rx_CTLp[1:0]         I                                        HT_VDDE   无
                             当 HT1_8x2 有效时，
                                [0]位为 HT1_Lo 总线接收控制信号，
                                [1]位为 HT1_Hi 总线接收控制信号。
                             当 HT1_8x2 无效时，
                                [0]位为 HT1 总线接收控制信号，
                                [1]位无效。
HT1_Rx_CTLn[1:0]         I                                        HT_VDDE   无
                             当 HT1_8x2 有效时，
                                [0]位为 HT1_Lo 总线接收控制信号，
                                [1]位为 HT1_Hi 总线接收控制信号。
                             当 HT1_8x2 无效时，该总线为 HT0 总线发送时钟总线，
                             当 HT1_8x2 有效时，
HT1_Rx_CLKp[1:0]         I                                        HT_VDDE   无
                                [0]位为 HT1_Lo 总线发送时钟信号，
                                [1]位为 HT1_Hi 总线发送时钟信号。
                             当 HT1_8x2 无效时，该总线为 HT0 总线接收时钟总线，
                             当 HT1_8x2 有效时，
HT1_Rx_CLKn[1:0]         I                                        HT_VDDE   无
                                [0]位为 HT1_Lo 总线接收时钟信号，
                                [1]位为 HT1_Hi 总线接收时钟信号。


DDR2/3 SDRAM 总线接口信号
-------------------------

龙芯 3B1500 集成了标准的 DDR2/3 SDRAM 内存控制器。该内存控制器接口包括有下列信
号：

 - 72 位双向数据总线信号（包括 ECC）；
 - 9 路双向数据选通差分信号（包括 ECC）；
 - 9 位数据掩码信号（包括 ECC）；
 - 16 位地址总线信号（注意：地址信号数量比龙芯 3A/3B 多出一位）；
 - 7 位逻辑 Bank 和物理片选信号；
 - 6 路差分时钟信号；
 - 4 位时钟使能信号；
 - 3 位命令总线信号；
 - 4 位 ODT(On Die Termination)信号；
 - 1 位复位控制信号。

表 2-3 DDR2 SDRAM 控制器接口信号是龙芯 3B1500 每一组 DDR2 SDRAM 控制器接口信号
。共有两组，分别在电源域上分为 0/1。

表 2-3 DDR2 SDRAM 控制器接口信号

             信号名称          输入/输出                    描述                    电源域
                                      需要通过 240 欧姆（240 ohm+/-1%）电阻连     MEM_VDDE_0/1
       MC*_DDR_REXT              IO
                                      接到地
       MC*_DDR_DQ[63:0]          IO   DDR2/3 SDRAM 数据总线信号              MEM_VDDE_0/1
       MC*_DDR_CB[7:0]           IO   DDR2/3 SDRAM 数据总线 ECC 信号         MEM_VDDE_0/1
       MC*_DDR_DQSp[8:0]         IO   DDR2/3 SDRAM 数据选通（包括 ECC）        MEM_VDDE_0/1
       MC*_DDR_DQSn[8:0]         IO   DDR2/3 SDRAM 数据选通（包括 ECC）        MEM_VDDE_0/1
       MC*_DDR_DQM[8:0]           O   DDR2/3 SDRAM 数据屏蔽（包括 ECC）        MEM_VDDE_0/1
       MC*_DDR_A[15:0]            O   DDR2/3 SDRAM 地址总线信号              MEM_VDDE_0/1
       MC*_DDR_BA[2:0]            O   DDR2/3 SDRAM 逻辑 Bank 地址信号        MEM_VDDE_0/1
       MC*_DDR_WEn                O   DDR2/3 SDRAM 写使能信号               MEM_VDDE_0/1
       MC*_DDR_CASn               O   DDR2/3 SDRAM 列地址选择信号             MEM_VDDE_0/1
       MC*_DDR_RASn               O   DDR2/3 SDRAM 行地址选择信号             MEM_VDDE_0/1
       MC*_DDR_CSn[3:0]           O   DDR2/3 SDRAM 片选信号                MEM_VDDE_0/1
       MC*_DDR_CKE[3:0]           O   DDR2/3 SDRAM 时钟使能信号              MEM_VDDE_0/1
                                      DDR2/3 SDRAM 差分时钟输出信号            MEM_VDDE_0/1
       MC*_DDR_CKp[5:0]          O    {1,3,5}为一组 DIMM 时钟，
                                      {0,2,4}为另一组 DIMM 时钟
                                      DDR2/3 SDRAM 差分时钟输出信号            MEM_VDDE_0/1
       MC*_DDR_CKn[5:0]          O    {1,3,5}为一组 DIMM 时钟，
                                      {0,2,4}为另一组 DIMM 时钟
       MC*_DDR_ODT[3:0]          O    DDR2/3 SDRAM ODT 信号              MEM_VDDE_0/1
       MC*_DDR_Resetn            O    DDR2/3 SDRAM 复位控制信号              MEM_VDDE_0/1


初始化信号
----------

表 2-4 初始化接口信号 提供了初始化信号的名称，方向和描述。 PCI 控制器只支持
1.8V 信号环境。

表 2-4 初始化接口信号

        信号名称          输入/输出                           描述                 电压域
                                      系统复位信号，该信号的低电平状态需要维持              VDDE1V8
    SYSRESETn               I         多于一个 SYSCLK 周期，它可异步于 SYSCLK
                                      信号。
    PCI_RESETn             I/O        PCI 接口复位信号                        VDDE1V8
                                      PCI 配置                            VDDE1V8
                                      7     HT 参考时钟选择
                                      6:5 PCIX 总线速度选择
                                      4     PCIX 总线模式选择
                                      3     PCI 主桥模式选择
                                      2     PCI 启动模式选择
                                      1     外部仲裁选择
                                      0     保留
                                      注:
    PCI_CONFIG[7:0]         I             6      5  4   PCIX 总线模式
                                          0      0  0   PCI 33

                                        3   PCI 主桥模式
                                        0   作为从设备
                                        1   作为主桥

                                        2   PCI 启动模式
                                        0   从 LPC/SPI 启动（GPIO0 决定）
                                        1   从 PCI 总线的 0x1fc00000 处启动
                                 1   外部仲裁选择
                                 0   使用内部 PCI 仲裁器
                                 1   使用外部 PCI 仲裁器

                                  7 HT 参考时钟选择
                                  1 使用单端 100MHz 参考时钟
                                  0 使用差分 200MHz 参考时钟
                             1   芯片内时钟延迟控制使能，默认情况需要
                                 下拉
    GPIO[1:0]         I/O
                             0   芯片启动设置，上拉表示从 SPI Flash 取指，
                                 下拉表示从 LPC Flash 取指

           SYSRESETn：这个复位信号是唯一能复位整个龙芯 3B1500 处理器的信号。
            SYSCLK 和 MEMCLK 必须在 SYSRESETn 释放到无效前就保持稳定。
                                                     SYSRESETn
            的有效时间必须大于一个时钟周期。处理器内部的复位控制逻辑在 SYSRESETn
            无效时才开始复位处理器。处理器内部复位将在 64K 个 SYSCLK 周期后完成，之
            后复位异常处理才可以被执行
           PCI_RESETn：当龙芯 3B1500 作为 PCI 总线主桥时，这个信号工作为输出，系统
            中的 PCI/PCI-X 设备的复位必须由该信号控制。当龙芯 3B1500 作为 PCI/PCI-X 设
            备工作时，该信号作为输入用来复位龙芯 3B1500 的 PCI 接口。
                注：当龙芯 3B1500 作为 PCI 总线主桥时，处理器仅在系统上电复位时会产生
                  PCI_RESETn 复位信号，龙芯 3B1500 软复位时，需使用 GPIO 和外部复位
                  电路配合，使处理器产生 PCI_RESETn 复位信号。
           PCI_CONFIG[7:0]：定义了龙芯 3B1500 PCI/PCI-X 接口的工作模式以及其它需要
            静态配置的信号，它在系统复位时必须保持稳定。系统开始运行时软件从内部寄
            存器中读取该值。如果系统设置成从 PCI 地址空间启动，则第一条指令的 PCI 地
            址是 0x1fc00000，否则系统将从 LPC 或 SPI 总线的 ROM 空间 0 地址处开始取指
            （由 GPIO00 决定）。
           GPIO[1:0]：这两个信号只有在 SYSRESETn 有效时在处理器内部进行采样。第 0
            位用于指定处理器的启动时使用的 Flash，上拉时表示使用 SPI Flash，下拉表示使
            用 LPC Flash。第 1 位用于控制是否采用 EJTAG 控制处理器内部各个不同部分的
            延迟，下拉时为正常延迟模式，上拉时使用 EJTAG 控制。

低速 I/O 接口
-------------

龙芯 3B1500 处理器的低速 I/O 接口包括 LPC 总线、SPI 总线和 UART。LPC 总线连接启
动 Flash 和 SuperIO 芯片。SPI 总线可连接 SPI flash（不支持启动）。

LPC 控制器具有以下特性：

 - 符合 LPC1.1 规范（引脚电压非标准，为 1.8v）
 - 支持 LPC 访问超时计数器
 - 支持 Memory Read 和 Memory write 访问类型
 - 支持 Firmware Memory Read 和 Firmware Memory Write 访问类型（单字节）
 - 支持 I/O read 和 I/O write 访问类型
 - 支持 Memory 访问类型地址转换
 - 支持 Serialized IRQ 规范，提供 17 个中断源


SPI 控制器具有以下特性：

 - 全双工同步串口数据传输
 - 支持到 4 个的变长字节传输
 - 主模式支持
 - 双缓冲接收器
 - 极性和相位可编程的串行时钟
 - 可在等待模式下对 SPI 进行控制
 - 支持处理器通过 SPI 启动
 - 引脚电压为 1.8v


UART 控制器具有以下特性

 - 全双工异步数据接收/发送
 - 可编程的数据格式
 - 16 位可编程时钟计数器
 - 支持接收超时检测
 - 带仲裁的多中断系统
 - 仅工作在 FIFO 方式
 - 在寄存器与功能上兼容 NS16550A
 - 引脚电压为 1.8v


这些低速 I/O 接口包含的信号如下：

表 2-5 LPC 接口信号

信号名称        输入/输出                          描述                    电压域
L_AD[3:0]    I/O      LPC 总线地址数据信号                              VDDE1V8
L_FRAME       O       LPC 总线数据开始/结束信号                           VDDE1V8
 L_SIRQ      I/O      LPC 总线 serial IRQ 信号，用于传输串行中断信号           VDDE1V8
                      LPC 启动 flash 8Mbits 和 4Mbits 设置。该信号为高表示
L_8MBits       I      LPC 所接的启动 flash 为 8Mbits，该信号为低表示 LPC      VDDE1V8
                      所接的启动 flash 为 4Mbits
                      LPC 启动 flash 类型设置。   该信号为高表示所接启动 flash
L_INTEL        I                                                VDDE1V8
                      为 INTEL 类型，否则为 AMD 类型

                              表 2-6 SPI 接口信号
 信号名称         输入/输出                  描述                  电压域
 SPI_SCK        O   SPI 总线时钟                            VDDE1V8
 SPI_SDO        O   SPI 总线数据输出                          VDDE1V8
 SPI_SDI        I   SPI 总线数据输入                          VDDE1V8



                             表 2-7 UART 接口信号
  信号名称           输入/输出                描述                电压域
   TXD             O      串口数据输出                       VDDE1V8
   RXD             I      串口数据输入                       VDDE1V8
   RTS             O      串口数据传输请求                     VDDE1V8
   CTS             I      设备接受数据就绪                     VDDE1V8
   DTR             O      串口初始化完成                      VDDE1V8
   DSR             I      设备初始化完成                      VDDE1V8
   DCD             I      外部 MODEM 探测到载波信号             VDDE1V8
    RI             I      外部 MODEM 探测到振铃信号             VDDE1V8


芯片引脚中断信号
----------------

龙芯 3B1500 处理器的引脚中断包括 4 个系统中断（INTn），4 个 PCI 中断（PCI_IRQ）
， 2 个 PCI 总线错误报告信号（PCI_SERRn 与 PCI_PERRn）和 1 个不可屏蔽中断（NMIn
）。表 2-8 引脚中断信号描述 显示了引脚中断信号的名称、方向和描述。

除了芯片引脚接入的中断外，龙芯 3B1500 还包括 16 个 HT 中断，3 个内部事件中断，
1 个 LPC 中断，以及 2 个内存控制器中断。这些中断通过内部的功能模块自己产生，没
  有专门的中断引脚。

任意一个中断源可以选择路由到处理器核中断引脚的 INT0-3 (对应 CP0 寄存器
CR_STATUS 的 IP2-5 位)四根中断中的任意一个。有关中断的详细说明请参考《龙芯
3B1500 处理器用户手册》第 7 章，第 11 章。

表 2-8 引脚中断信号描述

          信号名称          输入/输出               描述              电压域
                                不可屏蔽中断信号，（复位为低有效），
            NMIn          I                                VDDE1V8
                                需视实际情况上下拉。
                                4 个外部中断信号，这些信号分别连接到
          INTn[3:0]       I     处理器中断寄存器(CR_CAUSE IP 域)的   VDDE1V8
                                位 3 到位 0，需视实际情况上下拉。
                                这些中断信号应在中断控制器中使能，低
        PCI_IRQ[3:0]      I     电平有效。这些中断能够被路由到中断寄         VDDE1V8
                                存器的第 7 到 4 位，需外部上拉。
                                PCI 总线奇偶错信号，低电平有效。这些
        PCI_PERRn        I/O    中断能够被路由到中断寄存器的第 15 位，      VDDE1V8
                                需外部上拉。
                                PCI 总线系统错，低电平有效。这些中断
        PCI_SERRn        I/O    能够被路由到中断寄存器的第 15 位（与       VDDE1V8
                                PCI_SERRn 共享），需外部上拉。

JTAG 及 EJTAG 信号
------------------

龙芯 3B1500 提供了一个兼容 JTAG 的边界扫描接口。JTAG 接口用于测试处理器引脚是否
被正确连接。表 2-9 提供了 JTAG 信号的名称、方向和描述。

表 2-9 JTAG 接口信号

          信号名称        输入/输出`            描述                                 电压域
           TDI           I   JTAG 串行扫描数据输入。                               VDDE1V8
           TDO          O    JTAG 串行扫描数据输出。                               VDDE1V8
                             JTAG 命令，指示输入的串行数据是一个命
           TMS        I                                                VDDE1V8
                             令。
           TRST       I   JTAG 重启信号。                                   VDDE1V8
          TCK        I   JTAG 串行扫描时钟。                                 VDDE1V8



      JTAG 模式只有在配置了表 2-10 JTAG 模式的配置的管脚时有效。
                                      表 2-10 JTAG 模式的配置
          DOTEST          GPIO15     GPIO10   GPIO09   GPIO08    GPIO07     GPIO06
                0           1          0        1          1       1          0



      此外，龙芯 3B1500 还提供了 EJTAG 调试接口，用于调试底层应用软件。
      表 2-11 提供了 EJTAG 信号的名称，方向和描述。


                                       表 2-11 EJTAG 接口信号
           信号名称            输入/输出`                描述                        电压域
          EJTAG_TDI          I         EJTAG 串行扫描数据输入。                    VDDE1V8
          EJTAG_TDO          O         EJTAG 串行扫描数据输出。                    VDDE1V8
                                       EJTAG 命令，指示输入的串行数据是一
          EJTAG_TMS             I                                         VDDE1V8
                                       个命令。
          EJTAG_TRST            I      EJTAG 重启信号。                        VDDE1V8
          EJTAG_TCK             I      EJTAG 串行扫描时钟。                      VDDE1V8


测试和控制信号
--------------

龙芯 3B1500 芯片的测试信号仅仅用于芯片物理测试，如扫描链测试。当芯片正常工作，
这些信号应设置为无效。通常这些信号进行上拉处理。用于测试的控制信号为 DOTEST 信
号，管脚定义在表 2-12 中。

表 2-12 测试接口信号

     信号 名称           输入/输出                       描述                          默认上下拉
                                   DOTEST=0,芯片处于测试模式；DOTEST=1 芯片处
     DOTEST           I            于正常功能模式。芯片正常工作时，需通过 4.7K 电                     上拉
                                   阻上拉至 1.8V。

时钟信号
--------

龙芯 3B1500 关于时钟的信号参见表 2-13。处理器有五个系统输入时钟信号（包括
SYSCLK，MEMCLK，PCI_CLK，HTCLK， 差分时钟 HT0_CLKp/HT0_CLKn 及差分时钟
HT1_CLKp/HT1_CLKn）。龙芯 3B1500 的 Core 时钟通过 SYSCLK 产生，DDR2/3 时钟通过
MEMCLK 产生。HT 的时钟产生较为复杂。首先，差分时钟对 HT0_CLKp/HT0_CLKn 与
HT1_CLKp/HT1_CLKn 分别给 HT0 和 HT1 使用。此外，也可以使用单端时钟 HTCLK 替代
ht0_clkp/ht0_clkn，采用 CLKSEL[15:10]进行相关控制。CLKSEL 控制分频的方法参见表
2-14、MEMCLK 必须在 25MHz ~ 200MHz 之间。

内存控制器时钟是由 MEMCLK 的倍频决定，当 CLKSEL[9]为 1 时，倍频关系由
CLKSEL[8:6] 决定；当 CLKSEL[9]为 0 时，倍频关系由软件进行设置，此时的初始默认倍
频为 1 倍频。具体的倍频系数参见下表。

表 2-15 和表 2-16 。

表 2-13 时钟信号

               输入/输 频率范围                                                电压域
     信号名称                                           描述
                出    (MHz)

                                 系统输入时钟，驱动内置的 PLL 产生处理器的 Core 时钟及
     SYSCLK      I      25-200                                    VDDE1V8
                                 Node 时钟。它同时作为系统复位电路的时钟。
                                 DDR2 控制器的输入时钟，    驱动内置的 PLL 用来产生 DDR2
     MEMCLK      I      25-200                                         VDDE1V8
                                 时钟。
  PCI_CLK        I      25-33    PCI 、LPC、SPI、UART 总线的参考时钟。            VDDE1V8
 HT0_CLKp/               200
                 I               HT0 总线及控制器使用参考时钟。                     VDDE1V8
 HT0_CLKn
 HT1_CLKp/               200
                 I               HT1 总线及控制器使用参考时钟。                     VDDE1V8
 HT1_CLKn
   HTCLK         I       100     HT0 及 HT1 总线控制器使用的可选备份时钟              VDDE1V8
                          -      Core、Node、DDR 和 HT 的频率选择，参见表 2-14 处理器
CLKSEL[15:0]     I                                                     VDDE1V8
                                 核时钟域及节点时钟域倍频-2.16.

      SYSCLK 必须在 25MHz ~ 200MHz 之间。

处理器核时钟及节点时钟由 SYSCLK 的倍频决定，当 CLKSEL[5]为 1 时，倍频关系由
CLKSEL[4:0]决定；当 CLKSEL[5]为 0 时，倍频关系由软件进行设置，此时的初始默认倍频
为 1 倍频。具体的倍频系数参见下表。

表 2-14 处理器核时钟域及节点时钟域倍频系统

          CLKSEL[5:0]      处理器核时钟倍频系数 CLKSEL[5:0] 节点时钟倍频系数
          6’b110xx0        36                6’b1xx100   36
          6’b101xx0        32                6’b1xx010   32
          6’b100xx0        24                6’b1xx000   24
          6’b110xx1        18                6’b1xx101   18
          6’b101xx1        16                6’b1xx011   16
          6’b100xx1        12                6’b1xx001   12
          6’b111xx0             2                  6’b1xx110        2
          6’b111xx1             1                  6’b1xx111        1
          6’b0xxxxx             初始倍频为 1 倍频，可由软件进行重新配置

      MEMCLK 必须在 25MHz ~ 200MHz 之间。

内存控制器时钟是由 MEMCLK 的倍频决定，当 CLKSEL[9]为 1 时，倍频关系由
CLKSEL[8:6] 决定；当 CLKSEL[9]为 0 时，倍频关系由软件进行设置，此时的初始默认倍
频为 1 倍频。具体的倍频系数参见下表。

表 2-15 DDR2/3 时钟域倍频

  CLKSEL[9:6]   倍频系数       CLKSEL[9:6]     倍频系数
  4’b1111       1          4’b1110         26
  4’b1101       12         4’b1100         24
  4’b1011       11         4’b1010         22
  4’b1001       10         4’b1000         20
  4’b0xxx       初始倍频为 1 倍频，可由软件进行重新配置

表 2-16 HT 时钟控制

        信号                                                作用
     CLKSEL[15]    1’b1：表示 HT 控制器时钟采用 CLKSEL[14:10]控制
                   1’b0：初始倍频为 1 倍频，可由软件进行重新配置
                   2’b00 表示控制器时钟为 PHY 时钟频率（PHY 时钟 bypass 时为 3.2G）除以 2
                   2’b01 表示控制器时钟为 PHY 时钟频率（PHY 时钟 bypass 时为 3.2G）除以 4
 CLKSEL[14:13]     2’b10 表示控制器时钟为 PHY 时钟频率（PHY 时钟 bypass 时为 3.2G）除以 8
                   2’b11 表示控制器时钟取决于 PCICONF[7]： 1’b1 普通输入时钟 100MHz，1’b0 差
                           分输入时钟 200MHz
                   3’b000 表示 PHY 时钟为 800M（HT 总线 200/400）
                   3’b001 表示 PHY 时钟为 1.2G（HT 总线 200/300/600）
                   3’b010 表示 PHY 时钟为 1.6G（HT 总线 200/400/800）
                   3’b011 表示 PHY 时钟为 2.0G（HT 总线 200/500/1000）
 CLKSEL[12:10]     3’b100 表示 PHY 时钟为 2.4G（HT 总线 200/300/400/600/1200）
                   3’b101 表示 PHY 时钟为 2.8G（HT 总线 200/1400）
                   3’b110 表示 PHY 时钟为 3.2G（HT 总线 200/400/800/1600）
                   3’b111 表示 PHY 时钟取决于 PCICONF[7]： 1’b1 普通输入时钟 100MHz，1’b0
                             差分输入时钟 200MHz



GPIO 信号
---------

龙芯 3B1500 处理器包含 16 个 GPIO，其引脚定义见下表。

表 2-17 GPIO 信号

      信号名称   输入/输出           描述     复位状态    电压域
       GPIO00    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO01    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO02    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO03    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO04    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO05    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO06    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO07    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO08    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO09    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO10    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO11    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO12    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO13    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO14    I/O         通用输入输出     输出高阻   VDDE1V8
       GPIO15    I/O         通用输入输出     输出高阻   VDDE1V8

电源引脚
--------

表 2-18 电源引脚

          Parameter               Description            Power Voltage
            VDD                  处理器核外电源                     1.1V
          VDD_N0/1               节点 0/1 电源                 1.1 – 1.3V
          VDDE1V8                处理器 IO 电源                   1.8V
                              DDR2 通道 0/1 IO 电源              1.8V
       MEM_VDDE_0/1
                              DDR3 通道 0/1 IO 电源              1.5V
                              DDR2 通道 0/1 参考电源               0.9V
       MEM_VREF_0/1
                              DDR3 通道 0/1 参考电源              0.75V
          HT_VDDE                 HT IO 电源                   1.2V
       CORE_PLL_AVDD           Core PLL 模拟电源                1.15V
       CORE_PLL_DVDD           Core PLL 数字电源                1.15V
       DDR_PLL_AVDD            DDR2 PLL 模拟电源                1.15V
       DDR_PLL_DVDD            DDR2 PLL 数字电源                1.15V
       HT0/1_PLL_AVDD          HT0/1 PLL 模拟电源               1.15V
       HT0/1_PLL_DVDD          HT0/1 PLL 数字电源               1.15V

