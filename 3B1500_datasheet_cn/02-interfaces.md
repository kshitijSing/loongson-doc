接口描述
========

接口信号模块
------------

龙芯 3B1500 的接口信号与龙芯 3A/3B 接口信号引脚定义兼容（注：电源部分不兼容），
如图 2-1 所示。

图 2-1 龙芯 3B1500 处理器接口信号框图

注：箭头指示信号方向，有输入、输出和双向。

\newpage

PCI 总线接口信号
----------------

龙芯 3B1500 的 PCI 总线信号包括：

 - 32 位地址数据总线信号；
 - 4 位命令数据 ID 总线信号；
 - 14 位总线仲裁信号；
 - 7 位接口控制信号；
 - 2 位错误报告信号。

\noindent 
龙芯 3B1500 处理器 PCI 控制器工作频率为 33MHz，处理器引脚电压为 1.8v。所有这些
信号的电压域都为 `VDDE1V8`。 表 \ref{tab:pcibus-signals} 列出了所有 PCI 总线接
口信号的具体定义及描述。

\begin{longtable}[c]{>{\tt}lccp{9.5cm}}
  \caption{PCI 总线信号} \label{tab:pcibus-signals} \\ \toprule
  \multicolumn{1}{c}{信号名称} & 类型 & 三状态 & \multicolumn{1}{c}{描述} \\
  \midrule \endfirsthead
  \caption{PCI 总线信号（续）} \\ \toprule
  \multicolumn{1}{c}{信号名称} & 类型 & 三状态 & \multicolumn{1}{c}{描述} \\
  \midrule \endhead
  \rmcol{4}{\tiny 未完待续} \endfoot
  \bottomrule \endlastfoot

  PCI\_AD[31:0]  & t/s   & 是 & PCI 地址/数据信号                                 \\
  PCI\_CBEn[3:0] & t/s   & 是 & PCI 命令/字节使能信号，使用时外部上拉             \\
  PCI\_PAR       & t/s   & 是 & 地址/数据奇偶检测信号，使用时外部上拉             \\
  PCI\_REQn[6:1] & t/s   & 否 & 外部设备总线占用请求输入信号，使用时外部上拉      \\
  PCI\_REQn[0]   & t/s   & 是 & 根据仲裁模式，可为外部设备总线请求输入，         
                                或为到外部仲裁器的总线请求输出信号。使用          
                                时外部上拉。当使用外部仲裁器时，该信号作          
                                为输出信号。                                       \\
  PCI\_GNTn[6:1] & t/s   & 否 & PCI 总线允许输出信号（到外部设备） ，使用时外部上拉 \\
  PCI\_GNTn[0]   & t/s   & 是 & 根据仲裁模式，可为外部仲裁器返回的总线允         
                                许输入，或为到外部设备的 PCI 总线允许输出。使用
                                时外部上拉。当使用外部仲裁器时，该信号作为输入信号。                                   \\
  PCI\_FRAMEn    & s/t/s & 是 & PCI 帧周期信号，使用时外部上拉                    \\
  PCI\_IRDYn     & s/t/s & 是 & PCI 主设备准备好信号，使用时外部上拉              \\
  PCI\_TRDYn     & s/t/s & 是 & PCI 目标设备准备好信号，使用时外部上拉            \\
  PCI\_STOPn     & s/t/s & 是 & PCI 停止数据传送信号，使用时外部上拉              \\
  PCI\_DEVSELn   & s/t/s & 是 & PCI 设备选择，使用时外部上拉                      \\
  PCI\_IDSEL     & in    & 否 & PCI 配置片选，作为主桥时应拉低                    \\
  PCI\_PERRn     & s/t/s & 是 & PCI 数据奇偶错误报告信号，使用时外部上拉          \\
  PCI\_SERRn     & o/d   & 否 & PCI 系统错误报告，使用时外部上拉                  \\
\end{longtable}


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

\noindent 表 \ref{tab:htbus-signals} 列出了龙芯 3B1500 处理器的 HyperTransport
总线接口信号定义。

\setlength{\tabcolsep}{2pt}
\begin{longtable}[c]{>{\tt}lc>{\tt}ccp{8.8cm}}
  \caption{HT 总线信号} \label{tab:htbus-signals} \\ \toprule
  信号名称 & I/O & 电源域  & 上下拉 & 描述 \\
  \midrule \endfirsthead
  \caption{HT 总线信号（续）} \\ \toprule
  信号名称 & I/O & 电源域  & 上下拉 & 描述 \\
  \midrule \endhead
  \rmcol{5}{\tiny 未完待续} \endfoot
  \bottomrule \endlastfoot

 HT\textsl{x}\_REXT          & IO        & VDDESB  & -      & 需要通过 400 欧姆（$\pm1\%$）电阻接地 \\ \midrule
 HT0\_8x2           & I         & VDDESB  & 下拉   & 1：有效，将 HT0 分为 HT0\_Lo 与 HT0\_Hi 分别使用 \newline
                                                     0：无效，将 HT0 作为一个 16 位总线使用 \\ \midrule
 HT0\_Lo\_Mode   & I         & VDDESB  & 上拉   & 1：HT0\_Lo 控制器为主模式，控制复位等信号
                                                    0：HT0\_Lo 控制器为从模式，复位等信号为输入模式 \\ \midrule
 HT0\_Hi\_Mode   & I         & VDDESB  & 上拉   & 1：HT0\_Hi 控制器为主模式，控制复位等信号
                                                    0：HT0\_Hi 控制器为从模式，复位等信号仅为输入模式 \\ \midrule
 HT0\_Lo\_PowerOK    & I/O       & VDDESB  & 上拉   & 当 HT0\_8x2 无效时为 HT0 总线 PowerOK 信号，
                                                    当 HT0\_8x2 有效时为 HT0\_Lo 总线 PowerOK 信号。
                                                    当 HT0\_Lo\_Mode 有效时为双向信号，
                                                    当 HT0\_Lo\_Mode 无效时为输入信号。 \\ \midrule
 HT0\_Lo\_Resetn     & I/O       & VDDESB  & 上拉   & 当 HT0\_8x2 无效时为 HT0 总线 Resetn 信号，
                                                    当 HT0\_8x2 有效时为 HT0\_Lo 总线 Resetn 信号。
                                                    当 HT0\_Lo\_Mode 有效时为双向信号，
                                                    当 HT0\_Lo\_Mode 无效时为输入信号。 \\ \midrule
 HT0\_Lo\_Ldt\_Stopn  & I/O       & VDDESB  & 上拉   & 当 HT0\_8x2 无效时为 HT0 总线 Ldt\_Stopn 信号，
                                                    当 HT0\_8x2 有效时为 HT0\_Lo 总线 Ldt\_Stopn 信号。
                                                    当 HT0\_Lo\_Mode 有效时为双向信号，
                                                    当 HT0\_Lo\_Mode 无效时为输入信号。 \\ \midrule
 HT0\_Lo\_Ldt\_reqn   & I/O       & VDDESB  & 上拉   & 当 HT0\_8x2 无效时为 HT0 总线 Ldt\_Reqn 信号，
                                                    当 HT0\_8x2 有效时为 HT0\_Lo 总线 Ldt\_Reqn 信号。 \\ \midrule
 HT0\_Hi\_PowerOK    & I/O       & VDDESB  & 上拉   & 当 HT0\_8x2 无效时该信号无效，
                                                    当 HT0\_8x2 有效时为 HT0\_Hi 总线 PowerOK 信号。
                                                    当 HT0\_Hi\_Mode 有效时为双向信号，
                                                    当 HT0\_Hi\_Mode 无效时为输入信号。 \\ \midrule
 HT0\_Hi\_Resetn     & I/O       & VDDESB  & 上拉   & 当 HT0\_8x2 无效时该信号无效，
                                                    当 HT0\_8x2 有效时为 HT0\_Hi 总线 Resetn 信号。
                                                    当 HT0\_Hi\_Mode 有效时为双向信号，
                                                    当 HT0\_Hi\_Mode 无效时为输入信号。 \\ \midrule
 HT0\_Hi\_LDT\_Stopn  & I/O       & VDDESB  & 上拉   & 当 HT0\_8x2 无效时该信号无效，
                                                    当 HT0\_8x2 有效时为 HT0\_Hi 总线 Ldt\_Stopn 信号。
                                                    当 HT0\_Hi\_Mode 有效时为双向信号，
                                                    当 HT0\_Hi\_Mode 无效时为输入信号。 \\ \midrule
 HT0\_Hi\_LDT\_reqn   & I/O       & VDDESB  & 上拉   & 当 HT0\_8x2 无效时该信号无效，
                                                    当 HT0\_8x2 有效时为 HT0\_Hi 总线 Ldt\_Reqn 信号。 \\ \midrule
 HT0\_Tx\_CADp[15:0] & O         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，该总线为 HT0 总线发送数据命令总线，
                                                    当 HT0\_8x2 有效时，
                                                    [7:0]位为 HT0\_Lo 总线发送数据命令总线，
                                                    [15:0]位为 HT0\_Hi 总线发送数据命令总线。 \\ \midrule
 HT0\_Tx\_CADn[15:0] & O         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，该总线为 HT0 总线发送数据命令总线，
                                                    当 HT0\_8x2 有效时，
                                                    [7:0]位为 HT0\_Lo 总线发送数据命令总线，
                                                    [15:0]位为 HT0\_Hi 总线发送数据命令总线。 \\ \midrule
 HT0\_Tx\_CTLp[1:0]  & O         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，
                                                    [0]位为 HT0 总线发送控制信号，
                                                    [1]位无效。
                                                    当 HT0\_8x2 有效时，
                                                    [0]位为 HT0\_Lo 总线发送控制信号，
                                                    [1]位为 HT0\_Hi 总线发送控制信号。 \\ \midrule
 HT0\_Tx\_CTLn[1:0]  & O         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，
                                                    [0]位为 HT0 总线发送控制信号，
                                                    [1]位无效。
                                                    当 HT0\_8x2 有效时，
                                                    [0]位为 HT0\_Lo 总线发送控制信号，
                                                    [1]位为 HT0\_Hi 总线发送控制信号。 \\ \midrule
 HT0\_Tx\_CLKp[1:0]  & O         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，该总线为 HT0 总线发送时钟总线，
                                                    当 HT0\_8x2 有效时，
                                                    [0]位为 HT0\_Lo 总线发送时钟信号，
                                                    [1]位为 HT0\_Hi 总线发送时钟信号。 \\ \midrule
 HT0\_Tx\_CLKn[1:0]  & O         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，该总线为 HT0 总线发送时钟总线，
                                                    当 HT0\_8x2 有效时，
                                                    [0]位为 HT0\_Lo 总线发送时钟信号，
                                                    [1]位为 HT0\_Hi 总线发送时钟信号。 \\ \midrule
 HT0\_Rx\_CADp[15:0] & I         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，该总线为 HT0 总线接收数据命令总线，
                                                    当 HT0\_8x2 有效时，
                                                    [7:0]位为 HT0\_Lo 总线接收数据命令总线，
                                                    [15:0]位为 HT0\_Hi 总线接收数据命令总线。 \\ \midrule
 HT0\_Rx\_CADn[15:0] & I         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，该总线为 HT0 总线接收数据命令总线，
                                                    当 HT0\_8x2 有效时，
                                                    [7:0]位为 HT0\_Lo 总线接收数据命令总线，
                                                    [15:0]位为 HT0\_Hi 总线接收数据命令总线。 \\ \midrule
 HT0\_Rx\_CTLp[1:0]  & I         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，
                                                    [0]位为 HT0 总线接收控制信号，
                                                    [1]位无效。
                                                    当 HT0\_8x2 有效时，
                                                    [0]位为 HT0\_Lo 总线接收控制信号，
                                                    [1]位为 HT0\_Hi 总线接收控制信号。 \\ \midrule
 HT0\_Rx\_CTLn[1:0]  & I         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，
                                                    [0]位为 HT0 总线接收控制信号，
                                                    [1]位无效。
                                                    当 HT0\_8x2 有效时，
                                                    [0]位为 HT0\_Lo 总线接收控制信号，
                                                    [1]位为 HT0\_Hi 总线接收控制信号。 \\ \midrule
 HT0\_Rx\_CLKp[1:0]  & I         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，该总线为 HT0 总线接收时钟总线，
                                                    当 HT0\_8x2 有效时，
                                                    [0]位为 HT0\_Lo 总线接收时钟信号，
                                                    [1]位为 HT0\_Hi 总线接收时钟信号。 \\ \midrule
 HT0\_Rx\_CLKn[1:0]  & I         & HT\_VDDE & 无     & 当 HT0\_8x2 无效时，该总线为 HT0 总线接收时钟总线，
                                                    当 HT0\_8x2 有效时，
                                                    [0]位为 HT0\_Lo 总线接收时钟信号，
                                                    [1]位为 HT0\_Hi 总线接收时钟信号。
\end{longtable}
\setlength{\tabcolsep}{6pt}

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

表 \ref{tab:ddr-signals} 列出了所有 DDR2 SDRAM 控制器接口信号。注意，龙芯
3B1500 每一组 DDR2 SDRAM 控制器接口信号，共有两组：表中的 `*` 可以分别为 0 或 1
。

Table: DDR2 SDRAM 控制器接口信号 \label{tab:ddr-signals}

| 信号名称            | I/O | 电源域         | 描述                              |
| ------------------- | --- | -------------- | --------------------------------- |
| `MC*_DDR_REXT`      | IO  | `MEM_VDDE_0/1` | 需要通过 240 欧姆（-1\%）电阻接地 |
| `MC*_DDR_DQ[63:0]`  | IO  | `MEM_VDDE_0/1` | DDR2/3 SDRAM 数据总线信号         |
| `MC*_DDR_CB[7:0]`   | IO  | `MEM_VDDE_0/1` | DDR2/3 SDRAM 数据总线 ECC 信号    |
| `MC*_DDR_DQSp[8:0]` | IO  | `MEM_VDDE_0/1` | DDR2/3 SDRAM 数据选通（包括 ECC） |
| `MC*_DDR_DQSn[8:0]` | IO  | `MEM_VDDE_0/1` | DDR2/3 SDRAM 数据选通（包括 ECC） |
| `MC*_DDR_DQM[8:0]`  | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 数据屏蔽（包括 ECC） |
| `MC*_DDR_A[15:0]`   | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 地址总线信号         |
| `MC*_DDR_BA[2:0]`   | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 逻辑 Bank 地址信号   |
| `MC*_DDR_WEn`       | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 写使能信号           |
| `MC*_DDR_CASn`      | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 列地址选择信号       |
| `MC*_DDR_RASn`      | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 行地址选择信号       |
| `MC*_DDR_CSn[3:0]`  | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 片选信号             |
| `MC*_DDR_CKE[3:0]`  | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 时钟使能信号         |
| `MC*_DDR_CKp[5:0]`  | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 差分时钟输出信号     |
|                     |     |                | {1,3,5}为一组 DIMM 时钟，         |
|                     |     |                | {0,2,4}为另一组 DIMM 时钟         |
| `MC*_DDR_CKn[5:0]`  | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 差分时钟输出信号     |
|                     |     |                | {1,3,5}为一组 DIMM 时钟，         |
|                     |     |                | {0,2,4}为另一组 DIMM 时钟         |
| `MC*_DDR_ODT[3:0]`  | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM ODT 信号             |
| `MC*_DDR_Resetn`    | O   | `MEM_VDDE_0/1` | DDR2/3 SDRAM 复位控制信号         |


初始化信号
----------

表 2-4 初始化接口信号 提供了初始化信号的名称，方向和描述。 PCI 控制器只支持
1.8V 信号环境。                电压域            VDDE1V8

表 2-4 初始化接口信号

\begin{longtable}[c]{>{\tt}lcp{10cm}}
  \caption{控制引脚说明}\label{tab:sysPinControl} \tabularnewline \toprule
  \multicolumn{1}{c}{信号名称} & \multicolumn{1}{c}{I/O} & \multicolumn{1}{c}{描述}
  \tabularnewline \midrule \endfirsthead
  \caption{控制引脚说明（续）} \tabularnewline \toprule
  \multicolumn{1}{c}{信号名称} & \multicolumn{1}{c}{I/O} & \multicolumn{1}{c}{描述}
  \tabularnewline \midrule \endhead
  \hline \multicolumn{3}{r}{\tiny 未完待续} \endfoot \bottomrule \endlastfoot
                               
  SYSRESETn        & I    & 系统复位信号，该信号的低电平状态需要维持多于一个
                            SYSCLK 周期，它可异步于 SYSCLK 信号。 \\

  PCI\_RESETn       & I/O  & PCI 接口复位信号 \\

  PCI\_CONFIG[7]   & I & 输入时钟 \newline
                     \hspace*{.5cm} 1：普通输入时钟 100MHz（HTCLK），\newline
                     \hspace*{.5cm} 0：差分输入时钟 200MHz（HTnCLKp/n）\\

  PCI\_CONFIG[6:5] & I & PCIX 总线速度选择 \\

  PCI\_CONFIG[4]   & I & PCIX 总线模式选择 \\

  PCI\_CONFIG[3]   & I & PCI 主设备模式 \newline
                     0：从设备；1：主设备 \\

  PCI\_CONFIG[2]   & I & 系统启动空间信号\newline
                     \hspace*{.5cm} 1: 系统从 PCI 空间（\texttt{0x1FC0\_0000}）启动 \newline
                     \hspace*{.5cm} 0: GPIO[0] 决定启动空间 \\

  PCI\_CONFIG[1]   & I & 外部仲裁选择 \newline
                      \hspace*{.5cm} 0   使用内部 PCI 仲裁器 \newline
                      \hspace*{.5cm} 1   使用外部 PCI 仲裁器 \\

  PCI\_CONFIG[0]   & I & HT 控制信号引脚电压控制位 0 \\[.1cm]

  GPIO[1]          & I & 芯片内时钟延迟控制使能（调试模式），默认下拉 \\

  GPIO[0]          & I & 芯片启动设置 \newline
                     \hspace*{.5cm} 上拉表示从 SPI Flash 取指，
                     下拉表示从 LPC Flash 取指 \\
\end{longtable}                     

  - SYSRESETn 是唯一能复位整个龙芯 3B1500 处理器的信号。 SYSCLK 和 MEMCLK 必须
    在 SYSRESETn 释放到无效前保持稳定。 SYSRESETn 的有效时间必须大于一个时钟周
    期。处理器内部的复位控制逻辑在 SYSRESETn 无效时才开始复位处理器。处理器内部
    复位将在 64K 个 SYSCLK 周期后完成，之后复位异常处理才可以被执行

  - PCI_RESETn：当龙芯 3B1500 作为 PCI 总线主桥时，这个信号工作为输出，系统
    中的 PCI/PCI-X 设备的复位必须由该信号控制。当龙芯 3B1500 作为 PCI/PCI-X 设备
    工作时，该信号作为输入用来复位龙芯 3B1500 的 PCI 接口。

    注意：当龙芯 3B1500 作为 PCI 总线主桥时，处理器仅在系统上电复位时会产生
    PCI_RESETn 复位信号，龙芯 3B1500 软复位时，需使用 GPIO 和外部复位电路配合，
    使处理器产生 PCI_RESETn 复位信号。

  - PCI_CONFIG[7:0]：定义了龙芯 3B1500 PCI/PCI-X 接口的工作模式以及其它需要
    静态配置的信号，它在系统复位时必须保持稳定。系统开始运行时软件从内部寄存器中
    读取该值。如果系统设置成从 PCI 地址空间启动，则第一条指令的 PCI 地址是
    0x1fc00000，否则系统将从 LPC 或 SPI 总线的 ROM 空间 0 地址处开始取指（由
    GPIO00 决定）。

  - GPIO[1:0]：这两个信号只有在 SYSRESETn 有效时在处理器内部进行采样。第 0 位用
    于指定处理器的启动时使用的 Flash，上拉时表示使用 SPI Flash，下拉表示使用 LPC
    Flash。第 1 位用于控制是否采用 EJTAG 控制处理器内部各个不同部分的延迟，下拉
    时为正常延迟模式，上拉时使用 EJTAG 控制。

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

LPC 接口信号
SPI 接口信号
UART 接口信号




信号名称   输入/输出                          描述                           电压域

\begin{longtable}[c]{>{\tt}lc>{\tt}cp{9cm}}
  \caption{控制引脚说明}\label{tab:sysPinControl} \tabularnewline \toprule
  \multicolumn{1}{c}{信号名称} & \multicolumn{1}{c}{I/O} &
  \multicolumn{1}{c}{电压域}   & \multicolumn{1}{c}{描述}
  \tabularnewline \midrule \endfirsthead
  \caption{控制引脚说明（续）} \tabularnewline \toprule
  \multicolumn{1}{c}{信号名称} & \multicolumn{1}{c}{I/O} &
  \multicolumn{1}{c}{电压域}   & \multicolumn{1}{c}{描述}
  \tabularnewline \midrule \endhead
  \hline \multicolumn{4}{r}{\tiny 未完待续} \endfoot \bottomrule \endlastfoot
                               
 L\_AD[3:0] & I/O & VDDE1V8 & LPC 总线地址数据信号                                   \\
 L\_FRAME   & O   & VDDE1V8 & LPC 总线数据开始/结束信号                              \\
 L\_SIRQ    & I/O & VDDE1V8 & LPC 总线 Serial IRQ 信号，用于传输串行中断信号         \\
 L\_8MBits  & I   & VDDE1V8 & LPC 启动闪存设置。
                             高：LPC 启动闪存为 8Mbits；低： LPC启动闪存为 4Mbits   \\
 L\_INTEL   & I   & VDDE1V8 & LPC 启动 flash 类型设置。该信号为高表示所接启动 flash 
                             为 INTEL 类型，否则为 AMD 类型                         \\

 SPI\_SCK   & O   & VDDE1V8 & SPI 总线时钟                                           \\
 SPI\_SDO   & O   & VDDE1V8 & SPI 总线数据输出                                       \\
 SPI\_SDI   & I   & VDDE1V8 & SPI 总线数据输入                                       \\

 TXD       & O   & VDDE1V8 & 串口数据输出                                           \\
 RXD       & I   & VDDE1V8 & 串口数据输入                                           \\
 RTS       & O   & VDDE1V8 & 串口数据传输请求                                       \\
 CTS       & I   & VDDE1V8 & 设备接受数据就绪                                       \\
 DTR       & O   & VDDE1V8 & 串口初始化完成                                         \\
 DSR       & I   & VDDE1V8 & 设备初始化完成                                         \\
 DCD       & I   & VDDE1V8 & 外部 MODEM 探测到载波信号                              \\
 RI        & I   & VDDE1V8 & 外部 MODEM 探测到振铃信号                              \\
\end{longtable}

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

\begin{longtable}[c]{>{\tt}lc>{\tt}cp{9.5cm}}
  \caption{控制引脚说明}\label{tab:sysPinControl} \tabularnewline \toprule
  \multicolumn{1}{c}{信号名称} & \multicolumn{1}{c}{I/O} &
  \multicolumn{1}{c}{电压域}   & \multicolumn{1}{c}{描述}
  \tabularnewline \midrule \endfirsthead
  \caption{控制引脚说明（续）} \tabularnewline \toprule
  \multicolumn{1}{c}{信号名称} & \multicolumn{1}{c}{I/O} &
  \multicolumn{1}{c}{电压域}   & \multicolumn{1}{c}{描述}
  \tabularnewline \midrule \endhead
  \hline \multicolumn{4}{r}{\tiny 未完待续} \endfoot \bottomrule \endlastfoot

 NMIn         & I   & VDDE1V8 & 不可屏蔽中断信号（复位为低有效），视实际情况上下拉 \\
 INTn[3:0]    & I   & VDDE1V8 & 4 个外部中断信号，这些信号分别连接到处理器中断
                                寄存器(CP0\_CAUSE IP 域)的位 3 到位 0，视实际情况上下拉 \\
 PCI\_IRQ[3:0] & I   & VDDE1V8 & 这些中断信号应在中断控制器中使能，低电平有效。
                                这些中断能够被路由到中断寄存器的第 7 到 4 位，需外部上拉 \\
 PCI\_PERRn    & I/O & VDDE1V8 & PCI 总线奇偶错信号，低电平有效。这些中断
                                被路由到中断寄存器的第 15 位需外部上拉 \\
 PCI\_SERRn    & I/O & VDDE1V8 & PCI 总线系统错，低电平有效。这些中断能够被路由到中断
                                寄存器的第 15 位（与 PCI\_SERRn 共享），需外部上拉 \\
\end{longtable}                                

JTAG 及 EJTAG 信号
------------------

龙芯 3B1500 提供了一个兼容 JTAG 的边界扫描接口。JTAG 接口用于测试处理器引脚是否
被正确连接。表 2-9 提供了 JTAG 信号的名称、方向和描述。

表 2-9 JTAG 接口信号

| 信号名称 | IO | 电压域  | 描述                                      |
|----------|----|---------|-------------------------------------------|
| TDI      | I  | VDDE1V8 | JTAG 串行扫描数据输入。                   |
| TDO      | O  | VDDE1V8 | JTAG 串行扫描数据输出。                   |
| TMS      | I  | VDDE1V8 | JTAG 命令，指示输入的串行数据是一个命令。 |
| TRST     | I  | VDDE1V8 | JTAG 重启信号。                           |
| TCK      | I  | VDDE1V8 | JTAG 串行扫描时钟。                       |


\noindent JTAG 模式只有在配置了表 2-10 JTAG 模式的配置的管脚时有效。

Table: JTAG 模式配置

| DOTEST | GPIO15 | GPIO10 | GPIO09 | GPIO08 | GPIO07 | GPIO06 |
|--------|--------|--------|--------|--------|--------|--------|
| 0      | 1      | 0      | 1      | 1      | 1      | 0      |


此外，龙芯 3B1500 还提供了 EJTAG 调试接口，用于调试底层应用软件。表 2-11 提供了
EJTAG 信号的名称，方向和描述。

表 2-11 EJTAG 接口信号

| 信号名称   | IO | 电压域  | 描述                                       |
|------------|----|---------|--------------------------------------------|
| EJTAG_TDI  | I  | VDDE1V8 | EJTAG 串行扫描数据输入。                   |
| EJTAG_TDO  | O  | VDDE1V8 | EJTAG 串行扫描数据输出。                   |
| EJTAG_TMS  | I  | VDDE1V8 | EJTAG 命令，指示输入的串行数据是一个命令。 |
| EJTAG_TRST | I  | VDDE1V8 | EJTAG 重启信号。                           |
| EJTAG_TCK  | I  | VDDE1V8 | EJTAG 串行扫描时钟。                       |


测试和控制信号
--------------

龙芯 3B1500 芯片的测试信号仅仅用于芯片物理测试，如扫描链测试。当芯片正常工作，
这些信号应设置为无效。通常这些信号进行上拉处理。芯片正常工作时，需通过 4.7K 电
阻上拉至 1.8V。用于测试的控制信号为 `DO_TEST` 信号，管脚定义在表 2-12 中。

Table: 测试接口信号

| 信号 名称 | IO | 描述                            | 上下拉 |
|-----------|----|---------------------------------|--------|
| DOTEST    | I  | DOTEST=0,芯片处于测试模式；     | 上拉   |
|           |    | DOTEST=1 芯片处于正常功能模式。 |        |

时钟信号
--------

龙芯 3B1500 关于时钟的信号参见表 2-13。处理器有五个系统输入时钟信号（包括
SYSCLK，MEMCLK，PCI_CLK，HTCLK， 差分时钟 HT0_CLKp/HT0_CLKn 及差分时钟
HT1_CLKp/HT1_CLKn）。龙芯 3B1500 的 Core 时钟通过 SYSCLK 产生，DDR2/3 时钟通过
MEMCLK 产生。HT 的时钟产生较为复杂。首先，差分时钟对 HT0_CLKp/HT0_CLKn 与
HT1_CLKp/HT1_CLKn 分别给 HT0 和 HT1 使用。此外，也可以使用单端时钟 HTCLK 替代
ht2_clkp/ht0_clkn，采用 CLKSEL[15:10]进行相关控制。CLKSEL 控制分频的方法参见表
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

龙芯 3B1500 处理器包含 16 个通用输入输出 GPIO 信号，分别为 `GPIO00-GPIO15`。这
16 个信号的特征相同，都是通过“输出高阻”实现状态复位。
表 GPIO 列出了信号。

Table: GPIO 信号

| 信号名称 | 输入/输出 | 描述         | 复位状态 | 电压域  |
|----------|-----------|--------------|----------|---------|
| GPIO01   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO02   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO03   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO04   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO05   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO06   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO07   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO08   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO09   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO10   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO11   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO12   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO13   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO14   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |
| GPIO15   | I/O       | 通用输入输出 | 输出高阻 | VDDE1V8 |

电源引脚
--------

Table: 电源引脚

| Parameter      | Description            | Power Voltage |
|----------------|------------------------|---------------|
| VDD            | 处理器核外电源         | 1.1V          |
| VDD_N0/1       | 节点 0/1 电源          | 1.1 – 1.3V    |
| VDDE1V8        | 处理器 IO 电源         | 1.8V          |
| MEM_VDDE_0/1   | DDR2 通道 0/1 IO 电源  | 1.8V          |
|                | DDR3 通道 0/1 IO 电源  | 1.5V          |
| MEM_VREF_0/1   | DDR2 通道 0/1 参考电源 | 0.9V          |
|                | DDR3 通道 0/1 参考电源 | 0.75V         |
| HT_VDDE        | HT IO 电源             | 1.2V          |
| CORE_PLL_AVDD  | Core PLL 模拟电源      | 1.15V         |
| CORE_PLL_DVDD  | Core PLL 数字电源      | 1.15V         |
| DDR_PLL_AVDD   | DDR2 PLL 模拟电源      | 1.15V         |
| DDR_PLL_DVDD   | DDR2 PLL 数字电源      | 1.15V         |
| HT0/1_PLL_AVDD | HT0/1 PLL 模拟电源     | 1.15V         |
| HT0/1_PLL_DVDD | HT0/1 PLL 数字电源     | 1.15V         |

