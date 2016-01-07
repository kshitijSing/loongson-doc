HyperTransport 控制器
=====================

龙芯 3B1500 提供了两个 HyperTransport 控制器 (HT0 和 HT1)，用于连接外部设备及多
芯片互联。这两个 HT 控制器实现了对 IO Cache 一致性的支持。 在 Cache 一致性支持
模式下， IO 设备的 DMA 访问对于 Cache 层透明， 即不需要通过 Cache 指令，而是由
硬件自动维护其一致性。用于外设连接时，用户程序可选择是否支持 IO Cache 一致性（
通过地址窗口 Uncache 进行设置，详见 节）：当配置为支持 Cache 一致性模式时，IO
设备对内 DMA 的访问对于 Cache 层次透明，即由硬件自动维护其一致性 ,而无需软件通
过程序 Cache 指令进行维护。同时， 用户程序也可以通过对非缓存地址窗口设置（见
\ref{subsec:htuncachewin} 节）， 对某些特定内存段不提供 IO Cache 一致性支持，这
有助于提高某些设备如显卡等的效率。

当系统引脚 ICCC_EN 被置位时， HT0 控制器将会被用于多芯片互联，这时 HT0 控制器
硬件自动维护相联的 CPU 之间的 Cache 一致性 （即片间 Cache 一致性）。 HT1 控制器
不支持片间 Cache 一致性维护，而只能用于连接 IO 外设。

龙芯 3B1500 的 HT 控制器最高支持双向 16 位宽度，最高运行频率为 800Mhz。在系统自
动初始化建立连接后， HT 控制器总是工作在最低宽度、最低频率。用户可通过修改协议
中的配置寄存器对需要的运行频率与宽度进行修改， 并重新初始化。 具体细节见
\ref{subsec:htreinit}节。龙芯 3B1500  HyperTransport 控制器的主要特征如下：

 - 两个 HyperTransport 控制器： HT0 和 HT1；
 - 支持频率： 200/400/800Mhz；
 - 支持 8/16 位宽度，同时每个 HT 控制器可配置为两个 8 位 HT 控制器；
 - 外设 DMA 空间 Cache/Uncache 可配置；
 - 总线控制信号（包括 PowerOK，Rstn，LDT_Stopn）方向可配置。
 - HT0 控制器用于多片互联时可配置为片间 Cache 一致性模式；

HT 协议支持
-----------

龙芯 3B1500 的 HyperTransport 总线支持 HT 1.03 协议中的大部分命令，并增加了支持
多芯片互联的扩展一致性协议。 在这两种模式（标准及扩展）下，HyperTransport 接收
端可接收的命令， 以及发送端可发送的命令分别列在表\ref{tab:htrcmd} 和
\ref{tab:htscmd} 中。 注意，HT 总线的原子操作命令以及 EOI (End of Interrupt, 自
动中断结束) 未被支持。

Post Write： HyperTransport 协议中，这种写访问不需要 等待写完成响应，即在控制
器向总线发出这个写访问之后就将对处理器进行写访问完成响应。 

\begin{table}[htbp]
  \centering
  \caption{HyperTransport 接收端可接收的命令}\vspace{.2cm}
  \begin{tabular}{|c|c|c|p{4cm}|p{4cm}|} \hline
    编码   & 通道   & 命令         & \cellalign{c|}{标准模式} & \cellalign{c|}{扩展（一致性）} \\ \hhline
    000000 & ---    & NOP          & 空包或流控 & --- \\
    000001 & NPC    & Flush        & 无操作     & --- \\
    x01xxx & NPC/PC & Write        &
    \ptabincell{l}{[5]: 0 -- Nonposted; 1 -- Posted \\[0pt] [2]: 0 -- 字节; 1 -- 双字 \\[0pt] [1:0]: 忽略} &
    \ptabincell{l}{[5]: 必为 1，Posted \\[0pt] [2]: 0 -- 字节; 1 -- 双字 \\[0pt] [1]: 忽略； [0]: 必为 1} \\
    01xxxx & NPC    & Read         &
    \ptabincell{l}{ [3]: 忽略; \\[0pt] [2]: 0 -- 字节; 1 -- 双字 \\[0pt] [1:0]: 忽略} &
    \ptabincell{l}{ [3]: 忽略; \\[0pt] [2]: 0 -- 字节; 1 -- 双字 \\[0pt] [1]: 忽略; [0]: 必为 1} \\
    110000 & R      & RdResponse   & 读操作返回 & --- \\
    110011 & R      & TgtDone      & 写操作返回 & --- \\
    110100 & PC     & WrCoherent   & ---        & 写命令扩展 \\
    110101 & PC     & WrAddr       & ---        & 写地址扩展 \\
    111000 & R      & RespCoherent & ---        & 读响应扩展 \\
    111001 & NPC    & RdCoherent   & ---        & 读命令扩展 \\
    111010 & PC     & Broadcast    & 无操作     & --- \\
    111011 & NPC    & RdAddr       & ---        & 读地址扩展 \\
    111100 & PC     & Fence        & 保证序关系 & --- \\
    111111 & ---    & Sync/Error   & Sync/Error & --- \\ \hline
  \end{tabular}
  \label{tab:htrcmd}
\end{table}

\begin{table}[htbp]
  \centering
  \caption{HyperTransport 发送端可发送的命令}\vspace{.2cm}
  \begin{tabular}{|c|c|c|p{4cm}|p{4cm}|} \hline
    编码   & 通道   & 命令         & \cellalign{c|}{标准模式} & \cellalign{c|}{扩展（一致性）} \\ \hhline
    000000 &        & NOP          & 空包或流控 & -- \\
    x01x0x & NPC/PC & Write        &
    \ptabincell{l}{[5]: 0 -- Nonposted; 1 -- Posted \\[0pt] [2]: 0 -- 字节; 1 -- 双字 \\[0pt] [0]: 必为 0} &
    \ptabincell{l}{[5]: 必为 1，Posted \\[0pt] [2]: 0 -- 字节; 1 -- 双字 \\[0pt] [0]: 必为 1} \\
    010x0x & NPC    & Read         &
    \ptabincell{l}{[2]: 0 -- 字节; 1 -- 双字 \\[0pt] [0]: 忽略} &
    \ptabincell{l}{[2]: 0 -- 字节; 1 -- 双字 \\[0pt] [0]: 必为 1} \\
    110000 & R      & RdResponse   & 读操作返回 & --- \\
    110011 & R      & TgtDone      & 写操作返回 & --- \\
    110100 & PC     & WrCoherent   & ---        & 写命令扩展 \\
    110101 & PC     & WrAddr       & ---        & 写地址扩展 \\
    111000 & R      & RespCoherent & ---        & 读响应扩展 \\
    111001 & NPC    & RdCoherent   & ---        & 读命令扩展 \\
    111011 & NPC    & RdAddr       & ---        & 读地址扩展 \\
    111111 & ---    & Sync/Error   & 只会转发   & -- \\ \hline
  \end{tabular}
  \label{tab:htscmd}
\end{table}

HyperTransport 控制信号及初始化
-------------------------------

HyperTransport 总线由传输总线信号和控制信号引脚等组成。 这些控制信号包括
HT\_8x2，HT\_Mode， HT\_PowerOK，HT\_Rstn，HT\_Ldt\_Stopn，HT\_Ldt\_Reqn，
它们的电压值由系统 引脚 PCI\_Config[7], PCI\_Config[0]
设置（见表\ref{tab:sysPinControl})。 表\ref{tab:htSignals}
给出了这些控制引脚信号的说明及其用途。

\begin{longtable}{|c|c|p{9cm}|}
  \caption{HyperTransport 总线控制信号}\label{tab:htSignals} \\
  \hline 引脚信号 & 名称 & \cellalign{c|}{描述} \\ \hhline
  \endfirsthead

  \caption{HyperTransport 总线控制信号（续）} \\
  \hline 引脚信号 & 名称 & \cellalign{c|}{描述} \\ \hhline
  \endhead

  \rmcol{3}{\tiny 未完待续} \endfoot
  \endlastfoot

  HT\_8x2 & 总线宽度配置 &
  \ptabincell{l}{1：将总线配置为两个独立的 8 位 HT 总线 \\
  0：将总线作为单个 16 位总线使用。} \\ \hline

  HT\_Lo\_Homemode & 主设备模式 & \ptabincell{l}{
  1：将 HT\_Lo 设为主设备模式；\\ 0：将 HT\_Lo 设为从设备模式。} \\ \hline
  HT\_Lo\_PowerOK & 总线 PowerOK & HT\_Lo PowerOK 信号 \\ \hline
  HT\_Lo\_Rstn & 总线 Rstn & HT\_Lo 连接重置信号 \\ \hline
  HT\_Lo\_Ldt\_Stopn & 总线 Ldt\_Stopn & HT\_Lo 连接暂停信号 \\ \hline
  HT\_Lo\_Ldt\_Reqn & 总线 Ldt\_Reqn & HT\_Lo 连接请求信号 \\ \hline

  HT\_Hi\_Homemode &  主设备模式 & \ptabincell{l}{
  1：将 HT\_Hi 设为主设备模式；\\ 0：将 HT\_Hi 设为从设备模式。 (HT\_8x2=0时，无效)} \\ \hline
  HT\_Hi\_PowerOK & 总线 PowerOK & HT\_Hi PowerOK 信号 (HT\_8x2=0时，无效)\\ \hline
  HT\_Hi\_Rstn & 总线 Rstn & HT\_Hi 连接重置信号 (HT\_8x2=0时，无效) \\ \hline
  HT\_Hi\_Ldt\_Stopn & 总线 Ldt\_Stopn & HT\_Hi 连接暂停信号 (HT\_8x2=0时，无效) \\ \hline
  HT\_Hi\_Ldt\_Reqn & 总线 Ldt\_Reqn & HT\_Hi 连接请求信号 (HT\_8x2=0时，无效) \\ \hline
  
  \ptabincell{c}{HT\_Rx\_CLKp[1:0] \\ HT\_Rx\_CLKn[1:0] \\ HT\_Tx\_CLKp[1:0] \\
  HT\_Tx\_CLKn[1:0]} & CLK[1:0] &
  \ptabincell{r@{}l}{时钟信号。 
  HT\_8x2 为 1 时，& CLK[1]由 HT\_Hi 控制 \\
                     & CLK[0]由 HT\_Lo 控制 \\
  HT\_8x2 为 0 时，& CLK[1]无效 \\
                     & CLK[0]由 HT\_Lo 控制} \\ \hline

  \ptabincell{c}{HT\_Rx\_CTLp[1:0] \\ HT\_Rx\_CTLn[1:0] \\ HT\_Tx\_CTLp[1:0] \\
  HT\_Tx\_CTLn[1:0]} & CTL[1:0] &
  \ptabincell{r@{}l}{控制信号。 
  HT\_8x2 为 1 时，& CTL[1]由 HT\_Hi 控制 \\
                     & CTL[0]由 HT\_Lo 控制 \\
  HT\_8x2 为 0 时，& CTL[1]无效 \\
                     & CTL[0]由 HT\_Lo 控制} \\ \hline

  \ptabincell{c}{HT\_Rx\_CADp[15:0] \\ HT\_Rx\_CADn[15:0] \\ HT\_Tx\_CADp[15:0]
  \\ HT\_Tx\_CADn[15:0]} & CAD[15:0] &
  \ptabincell{r@{}l}{\multicolumn{2}{@{}l}{命令地址数据信号} \\ \mbox{\hspace{.6cm}}
  HT\_8x2 为 1 时，& CAD[15:8] 由 HT\_Hi 控制 \\
                   & CAD[7:0] 由 HT\_Lo 控制 \\
  HT\_8x2 为 0 时，& CAD[15:0] 由 HT\_Lo 控制} \\ \hline
\end{longtable}

在这些信号中，HT\_8x2、HT\_Lo\_Homemode、HT\_Hi\_Homemode 的设置又进一步决定了
其他的 HT 信号的作用及意义。 首先，HT\_8x2 决定了 16 位的 HT 总线是否作为两个
独立的 HT 控制器控制。

  - 当 HT\_8x2 = 1时，16 位的 HT 总线作为两个独立的 HT 控制器控制， 这时 HT 的
    40 位地址空间按如下规则划分：
    \begin{flushleft}
      \mbox{\hspace{2cm}}HT\_Lo：address[39] = 0； \\
      \mbox{\hspace{2cm}}HT\_Hi：address[39] = 1。
    \end{flushleft}
  - 当 HT\_8x2 = 0时，整个 HT 总线将作为一个 16 位总线使用， 由 HT\_Lo 控制，
    合法的地址空间为 HT\_Lo 的地址，即 address[39] =0；同时所有 HT\_Hi
    信号无效， 包括 Hi\_PowerOK、Hi\_Rstn、Hi\_Ldt\_Stopn。当然， 高位设备
    的主模式引脚 Hi\_Homemode 亦无效。

HT\_Lo\_Homemode、HT\_Hi\_Homemode 为主设备模式引脚。如果该引脚置位， 则对应的
HT 设备被设为主设备模式， 反之为从设备模式。

  - 在主设备模式下，总线控制信号等由该设备驱动：这些控制信号包括 PowerOK， Rstn
    ， 和 Ldt\_Stopn （注意：不包括 Reqn）；
  - 控制信号可以为双向驱动：即 HT 总线两端的设备都为主设备模式。
  - 主设备模式引脚同时也决定了对应的功能指针寄存器(见表\ref{tab:htcapreg1})的
    "Act As Slave" 位的初始值（取反）： (1) 当该位为 0 时，HyperTransport 总线
    上的包中的 Bridge 位为 1，否则为 0； (2) 同时， 当 Act\_As\_Slave 位为 0 时
    ，如果 HT 总线上的请求地址未命中控制器的接收窗口，将作为 P2P 请求重新发回总
    线；否则将作为错误请求做出响应。

需要注意的是，HyperTransport 总线两端的设备配置需要一一对应，
如果没有被正确设置并正确驱动， 将导致 HyperTransport 接口不能正常工作。

### HT 总线重初始化 {#subsec:htreinit}

HyperTransport 的初始化在每次复位完成后自动开始， 冷启动后 HyperTransport
总线将自动工作在最低频率 (200Mhz)与最小宽度(8bit)，并尝
试进行总线初始化握手。初始化是否完成的状态可以由寄存器“Init Complete” （见
9.6.2 节） 读出。 初始化完成后， 总线的宽度可以由寄存器“Link Width Out”
与“Link Width In” （见 9.6.2 节）读出。在初始化完成后，用户可以重新对
寄存器“Link Width Out”, “Link Width In”以及“Link Freq”进行编程，
同时需要对对方设备的相应寄存器也进行编程， 编程完成后需要重新热复位总线
或是通过 HT\_Ldt\_Stopn 信号对总线进行重新初始化操作，以使编程后的值在重
新初始化后生效。在重新初始化后 HyperTransport 总线将工作在新的频率和宽
度。需要注意的是， 对 HT 总线两端的设备配置需要一一对应，否则将导致
HyperTransport 接口不能正常工作。

HyperTransport 配置寄存器
-------------------------

HT 控制器配置寄存器模块主要用于控制从 AXI SLAVE 端或是 HT RECEIVER
端到达的配置寄存器访问，外部中断处理，并保存了大量软件可见用于控制系统各种
工作方式的配置寄存器。所有用于控制
HT 控制器各种行为的配置寄存器都在本模块中。本模块的访问地址在 AXI 端为
0xFD\_FB00\_0000 到 0xFD\_FBFF\_FFFF，表\ref{tab:htconfigreg}
列出了其所有软件可见寄存器。

\begin{longtable}{|c|c|c|l|}
  \caption{配置寄存器模块寄存器列表}\label{tab:htconfigreg} \\
  \hline 偏移 & 名称 & 位宽 & \cellalign{c|}{描述} \\ \hhline
  \endfirsthead
  \caption{配置寄存器模块寄存器列表（续）} \\
  \hline 偏移 & 名称 & 位宽 & \cellalign{c|}{描述} \\ \hhline
  \endhead
  \rmcol{4}{\tiny 未完待续} \endfoot
  \endlastfoot

  0x3C & 桥控制寄存器           & 32  & 总线重置控制                                      \\ \hline
  0x40 & 功能寄存器组           & 32  & 命令功能指针                                      \\ 
  0x44 &                        & 32  & 连接控制                                          \\ 
  0x48 &                        & 32  & Revision ID，Link Freq，Link Error，Link Freq Cap \\ 
  0x4C &                        & 32  & 特征功能寄存器                                    \\ \hline
  0x50 & 自定义寄存器           & 32  & Misc                                              \\ 
  0x54 & 接收诊断寄存器         & 32  & 用于诊断接收端采样的信号                          \\ 
  0x58 & 中断路由方式选择寄存器 & 32  & 对应于 3 种中断路由方式                           \\ 
  0x5C & 接收缓存寄存器         & 32  &                                                   \\ 
  0x60 & 接收地址窗口寄存器     & 32  & 接收地址窗口 0 使能（外部访问）                   \\ 
  0x64 &                        & 32  & 接收地址窗口 0 基址（外部访问）                   \\ 
  0x68 &                        & 32  & 接收地址窗口 1 使能（外部访问）                   \\ 
  0x6C &                        & 32  & 接收地址窗口 1 基址（外部访问）                   \\ 
  0x70 &                        & 32  & 接收地址窗口 2 使能（外部访问）                   \\ 
  0x74 &                        & 32  & 接收地址窗口 2 基址（外部访问）                   \\ \hline
  0x78 &                        & 32  &                                                   \\
  0x7C &                        & 32  &                                                   \\ \hline
  0x80 & 中断向量寄存器         & 256 & 中断向量寄存器                                    \\ \hline
  0xA0 & 中断使能寄存器         & 256 & 中断使能寄存器                                    \\ \hline
  0xC0 & 中断检测配置寄存器     & 32  & Interrupt Capability                              \\
  0xC4 &                        & 32  & DataPort                                          \\
  0xC8 &                        & 64  & IntrInfo                                          \\ \hline
  0xD0 & POST 地址窗口寄存器    & 32  & POST 地址窗口 0 使能（内部访问）                  \\ 
  0xD4 &                        & 32  & POST 地址窗口 0 基址（内部访问）                  \\ 
  0xD8 &                        & 32  & POST 地址窗口 1 使能（内部访问）                  \\ 
  0xDC &                        & 32  & POST 地址窗口 1 基址（内部访问）                  \\ \hline
  0xE0 & 可预取地址窗口寄存器   & 32  & 可预取地址窗口 0 使能（内部访问）                 \\ 
  0xE4 &                        & 32  & 可预取地址窗口 0 基址（内部访问）                 \\ 
  0xE8 &                        & 32  & 可预取地址窗口 1 使能（内部访问）                 \\ 
  0xEC &                        & 32  & 可预取地址窗口 1 基址（内部访问）                 \\ \hline
  0xF0 & 非缓存地址窗口寄存器   & 32  & 非缓存地址窗口 0 使能（内部访问）                 \\ 
  0xF4 &                        & 32  & 非缓存地址窗口 0 基址（内部访问）                 \\ 
  0xF8 &                        & 32  & 非缓存地址窗口 1 使能（内部访问）                 \\ 
  0xFC &                        & 32  & 非缓存地址窗口 1 基址（内部访问）                 \\ \hline
 0x100 & 发送端缓存大小寄存器   & 32  & 发送端命令缓存大小寄存器                          \\ 
 0x104 &                        & 32  & 发送端数据缓存大小寄存器                          \\ 
 0x108 & 发送端缓存调试寄存器   & 32  & 用于人工设置发送端缓存的大小（调试用）            \\ \hline
\end{longtable}

在以下的小节中， 将给出 HT 控制器配置寄存器模块的桥控制寄存器(bridge control)，
功能寄存器组 (capability registers) 和自定义寄存器 (MISC) 的具体解释和说明。
其他的寄存器， 如中断向量寄存器、 中断使能寄存器、 中断检测配置寄存器将在 HT
中断支持 (\ref{sec:htIntConfig}) 一节中解释；而接收地址窗口、 POST 地址窗口、
可预取地址窗口、非缓存地址窗口将在 HT 地址空间及窗口配置
(\ref{sec:htAddrWinConf}) 中详述。

### 桥控制寄存器（Bridge Control）

\begin{table}[h]
  \centering
  \begin{tabular}{|c|c|c|c|c|l|} \hline
    \multicolumn{6}{|l|}{寄存器名：总线重置控制；偏移： 0x3C；复位值：0x0000\_0000} \\ \hline
    位域  & 位域名 & 位宽 & 复位值 & 访问 & \cellalign{c|}{描述} \\ \hhline
    31:23 & ---    & 4    & 0x0    &      & 保留 \\
    22    & reset  & 12   & 0x0    & RW   &
    \ptabincell{l}{总线复位控制 (bus reset control) \\
      \hspace{.5cm} $0\rightarrow1$：HT\_RSTn 置 0，总线复位 \\
      \hspace{.5cm} $1\rightarrow0$：HT\_RSTn 置 1，总线热复位} \\
    21:0  & ---    & 5    & 0x0    &      & 保留 \\ \hline
  \end{tabular}
  \caption{HT 桥控制（Bridge Control）寄存器组：总线重置控制}
  \label{tab:bridgecontrol}
\end{table}

### 功能寄存器组（Capability Registers）

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|c|c|p{6.5cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：命令功能指针、功能ID；偏移： 0x40；复位值：0x2001\_0008} \\ \hline
    位域 & 位域名            & 位宽 & 复位值 & 访问 & \cellalign{c|}{描述} \\ \hhline
    31:29  & HOST/Sec             & 3      & 0x1       & R      & 命令格式为 HOST/Sec \\
    28:27  & ---                  & 2      & 0x0       & R      & 保留 \\
    26     & Act as Slave         & 1      & ---       & RW     &
    设备是否采用从模式,初始值由对应的 HT\_Homemode 引脚决定 （见表\ref{tab:htSignals}） \\
    25     & ---                  & 1      & 0x0       & ---    & 保留 \\
    24     & Host Hide            & 1      & 0x0       & RW     & 是否禁止来自 HT 总线的寄存器访问 \\
    23     & ---                  & 1      & 0x0       & ---    & 保留 \\
    22:18  & Unit ID              & 5      & 0x0       & RW     & 主模式：记录使用的 ID 个数 \\
           &                      &        &           &        & 从模式：记录自身 Unit ID \\
    17     & Double Ended         & 1      & 0x0       & R      & 是否采用双主模式 \\
    16     & Warm Reset           & 1      & 0x1       & R      & 桥控制寄存器中采用热复位方式 \\
    15:8   & Capabilities Pointer & 8      & 0xA0      & R      & 下一个功能指针寄存器的偏移地址  \\
    7:0    & Capability ID        & 8      & 0x08      & R      & 功能 ID \\ \hline
  \end{tabular}
  \caption{功能寄存器：命令功能指针、功能ID}
  \label{tab:capreg1}
\end{table}

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|c|c|p{6.5cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：修改号、链接速度、错误；偏移： 0x48；复位值：0x2001\_0008} \\ \hline
    位域  & 位域名          & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    31:16 & Link Freq Cap   & 16   & 0x0025 & R    & 支持的 HT 总线频率 \\
    15:14 & ---             & 2    & 0x0    & ---  & 保留 \\
    13    & Over Flow Error & 1    & 0x0    & R    & HT 总线包溢出 \\
    12    & Protocol Error  & 1    & 0x0    & RW  & 协议错误：总线上收到不可识别的命令 \\
    11:8  & Link Freq       & 4    & 0x0    & RW  & HT 总线工作频率 \\
    7:0   & Revision ID     & 8    & 0x23   & RW  & 版本号：1.03 \\ \hline
  \end{tabular}
  \caption{功能寄存器：修改号、链接速度、错误}
  \label{tab:capreg3}
\end{table}

200Mhz，400Mhz，800Mhz

写入此寄存器的值后将在下次热复位或 是 HT Disconnect 之后生效 0000：200M 0010：
400M 0101：800M

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|c|c|p{6.5cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：Feature Capability；偏移： 0x4C} \\ \hline
    位域 & 位域名            & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    31:9 & ---               & 25 & 0x0 & --- & 保留 \\
    8    & Extended Register & 1  & 0x0 & R   & 没有扩展寄存器 \\
    7:4  & ---               & 3  & 0x0 & --- & 保留 \\
    3    & Extended CTL Time & 1  & 0x0 & R   & 扩展控制时间，不需要 \\
    2    & CRC Test Mode     & 1  & 0x0 & R   & 不支持 CRC 检验模式 \\
    1    & LDT\_Stopn        & 1  & 0x1 & R   & 支持 LDT\_Stopn 信号 \\
    0    & Isochronous Mode  & 1  & 0x0 & R   & 等时模式，不支持   \\ \hline
  \end{tabular}
  \caption{功能寄存器组：特征功能寄存器 (Feature Capability)}
  \label{tab:capreg4}
\end{table}

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|c|c|p{6.5cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：连接控制；偏移： 0x44；复位值：0x0011\_2000} \\ \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    31    & ---                  & 1 & 0x0 &     & 保留 \\
    30:28 & Link Width Out       & 3 & 0x0 & R/W &
    发送端宽度 \\
    27    & ---                  & 1 & 0x0 &     & 保留 \\
    26:24 & Link Width In        & 3 & 0x0 & R/W & 接收端宽度 \\
    23    & Dw Fc out            & 1 & 0x1 & R   & 发送端不支持双字流控 \\
    22:20 & Max Link Width out   & 3 & 0x0 & R   & HT 总线发送端最大宽度：16bits \\
    19    & Dw FC In             & 1 & 0x1 & R   & 接收端不支持双字流控 \\
    18:16 & Max Link Width In    & 3 & 0x0 & R   & HT 总线接收端最大宽度：16bits \\
    15:14 & ---                  & 2 & 0x1 &     & 保留 \\
    13    & \ptabincell{c}{Ldt\_Stopn \\ Tristate En}
                                 & 1 & 0x0 & R/W & 当 HT 总线断开时，是否关闭 HT PHY。 1：关闭 0：不关闭 \\
    12:10 & ---                  & 3 & 0x0 &     & 保留 \\
    9     & CRC Error (hi)       & 1 & 0x0 & R/W & 高 8 位发生 CRC 错 \\
    8     & CRC Error (lo)       & 1 & 0x0 & R/W & 低 8 位发生 CRC 错 \\
    7     & Trans off            & 1 & 0x0 & R/W & HT PHY 关闭控制。 运行 8 位协议时仅对低 8 位 PHY 有效 \\
    6     & End of Chain         & 1 & 0x0 & R   & HT 总线末端 \\
    5     & Init Complete        & 1 & 0x0 & R   & HT 总线初始化是否完成 \\
    4     & Link Fail            & 1 & 0x0 & R   & 指示连接失败 \\
    3:2   & ---                  & 2 & 0x0 &     & 保留 \\
    1     & CRC Flood Enable     & 1 & 0x0 & R/W & 发生 CRC 错误时，是否 flood HT 总线 \\
    0     & Trans off (hi)       & 1 & 0x0 & R/W & 运行 8 位协议时， 高 8 位
    PHY 控制。 1：关闭; 0：使能高 8 位 HT PHY \\ \hline
  \end{tabular}
  \caption{功能寄存器：连接控制}
  \label{tab:capreg2}
\end{table}

冷复位后的值为当前连接的最大宽度， 写入此寄存器的值将会在下次热复位或是 HT
Disconnect 之后生效 000：8 位方式 001：16 位方式

冷复位后的值为当前连接的最大宽度， 写入此寄存器的值将会在下次热复位或是 HT
Disconnect 之后生效

### 自定义寄存器（MISC）

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|c|c|p{7cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：MISC；偏移： 0x50；复位值：0x2001\_0008} \\ \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    31    & --- & 1 & 0x0 & --  & 保留 \\
    30    & Ldt Stop Gen    & 1 & 0x0 & R/W & 断开总线连接：先置 0 再置 1\\
    29    & Ldt Req Gen     & 1 & 0x0 & R/W & 断开中唤醒总线: 先置 0 再置 1。
    向总线直接发出读写请求也可 \\
    28:24 & Interrupt Index & 5 & 0x0 & RW & 中断映射索引 \\
    23    & Dword Write     & 1 & 0x1 & RW & 是否双字写。 1：使用双字写； 0：使用字节写（带 MASK） \\
    22    & Coherent Mode   & 1 & 0x0 & R  & 片间 Cache 一致性模式：引脚 ICCC\_EN 决定 \\
    21    & Not Care Seqid  & 1 & 0x0 & RW & 是否不关心 HT 包的序号 \\
    20    & Not AXI2Seqid   & 1 & 0x1 & R  & 是否用不同 SeqID 转换总线命令。
    0：转换; 1：不转换， 所有命令采用固定 ID 号 \\
    19:16 & Fixed Seqid     & 4 & 0x0 & RW & 固定 ID 号 \\
    15:12 & Priority NOP    & 4 & 0x4 & RW & NOP 流控包优先级 \\
    11:8  & Priority NPC    & 4 & 0x3 & RW & Non Post 通道读写优先级 \\
    7:4   & Priority RC     & 4 & 0x2 & RW & Response 通道读写先级 \\
    3:0   & Priority PC     & 4 & 0x1 & RW & Post 通道读写优先级 \\ \hline
  \end{tabular}
  \caption{自定义寄存器}
  \label{tab:misc}
\end{table}

将除了标准中断之外的其它中断重定向到哪个中断向量中（包括 SMI，NMI， INIT，INTA
，INTB，INTC，INTD） 总共 256 个中断向量， 本寄存器表示的是中断向量的高 5 位

HT 内部中断向量如下： 000：SMI 001：NMI 010：INIT 011：Reservered 100：INTA 101
：INTB 110：INTC 111：INTD

0x0：最高优先级 0xF：最低优先级.  对于各个通道的优先级均采用根据时间
变化提高的优先级策略，该组存器用于 配置各个通道的初始优先级

### 命令发送缓存大小寄存器

命令发送缓存大小寄存器用于观测发送端可用各个命令通道的缓存个数。

\begin{table}[htbp]
  \centering
  \caption{命令发送缓存大小寄存器}
  \begin{tabular}{|c|c|c|c|c|p{7cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：命令发送缓存大小寄存器；偏移：0x100；复位值：0x0000\_0000} \\ \hline
    位域  & 位域名             & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    31:24 & B\_CMD\_txbuffer   & 8    & 0x0    & R    & 发送端 B 通道命令缓存个数 \\
    2316  & R\_CMD\_txbuffer   & 8    & 0x0    & R    & 发送端 R 通道命令缓存个数 \\
    15:8  & NPC\_CMD\_txbuffer & 8    & 0x0    & R    & 发送端 NPC 通道命令缓存个数 \\
    7:0   & PC\_CMD\_txbuffer  & 8    & 0x0    & R    & 发送端 PC 通道命令缓存个数 \\
  \end{tabular}
  \label{tab:misc}
\end{table}


### 数据发送缓存大小寄存器

数据发送缓存大小寄存器用于观测发送端可用各个数据通道的缓存个数。

\begin{table}[htbp]
  \centering
  \caption{数据发送缓存大小寄存器}
  \begin{tabular}{|c|c|c|c|c|p{7cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：数据发送缓存大小寄存器；偏移：0x104；复位值：0x0000\_0000} \\ \hline
    位域  & 位域名              & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    31:24 & Reserved            & 8    & 0x0    & R    & 保留 \\
    2316  & R\_DATA\_txbuffer   & 8    & 0x0    & R    & 发送端 R 通道数据缓存个数 \\
    15:8  & NPC\_DATA\_txbuffer & 8    & 0x0    & R    & 发送端 NPC 通道数据缓存个数 \\
    7:0   & PC\_DATA\_txbuffer  & 8    & 0x0    & R    & 发送端 PC 通道数据缓存个数 \\
  \end{tabular}
  \label{tab:misc}
\end{table}

### 发送缓存调试寄存器

发送缓存调试寄存器用于人工设置 HT 控制器发送端缓冲区的个数，通过增或减的方式对
不同的发送缓存个数进行调整。

\begin{table}[htbp]
  \centering
  \caption{发送缓存调试寄存器}
  \begin{tabular}{|c|c|c|c|c|p{7cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：发送缓存调试寄存器；偏移：0x108；复位值：0x0000\_0000} \\ \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    31   &  B\_interleave    &     1  &  0x0 &  R/W &     一致性写响应通道交错使能
                                                      （片间互连模式时必须设置） \\
    30   &  NOP\_interleave  &      1 &  0x0 &  R/W &  流控包交错使能（片间互连模式时必须设置） \\
    29   &  Tx\_neg          &      1 &  0x0 &  R/W &  发送端缓存调试符号
                                                      0：增加相应个数
                                                      1：减少（相应寄存器个数+1）个 \\
    28   &  Tx\_buff\_adj\_en  &      1 &  0x0 &  R/W &  发送端缓存调试使能寄存器
                                                      0->1：使本寄存器的值产生一次增减效果 \\
    27:24&  R\_DATA\_txadj    &      4 &  0x0 &  R/W &  发送端 R 通道数据缓存增减个数
                                                      当 tx\_neg 为 0 时，增加 R\_DATA\_txadj 个；
                                                      当 tx\_neg 为 1 时，减少 R\_DATA\_txadj+1 个 \\
    23:20&  NPC\_DATA\_txadj  &      4 &  0x0 &  R/W &  发送端 NPC 通道数据缓存增减个数
                                                      当 tx\_neg 为 0 时，增加 NPC\_DATA\_txadj 个；
                                                      当 tx\_neg 为 1 时，减少 NPC\_DATA\_txadj+1 个 \\
    19:16&  PC\_DATA\_txadj   &      4 &  0x0 &  R/W &  发送端 PC 通道数据缓存增减个数
                                                      当 tx\_neg 为 0 时，增加 PC\_DATA\_txadj 个；
                                                      当 tx\_neg 为 1 时，减少 PC\_DATA\_txadj+1 个 \\
    15:12&  B\_CMD\_txadj     &      4 &  0x0 &  R/W &  发送端 B 通道命令缓存增减个数
                                                      当 tx\_neg 为 0 时，增加 B\_CMD\_txadj 个；
                                                      当 tx\_neg 为 1 时，减少 B\_CMD\_txadj+1 个 \\
    11:8 &  R\_CMD\_txadj     &      4 &  0x0 &  R/W &  发送端 R 通道命令缓存增减个数
                                                      当 tx\_neg 为 0 时，增加 R\_CMD\_txadj 个；
                                                      当 tx\_neg 为 1 时，减少 R\_CMD\_txadj+1 个 \\
    7:4  &  NPC\_CMD\_txadj   &      4 &  0x0 &  R/W &  发送端 NPC 通道命令/数据缓存增减个数
                                                      当 tx\_neg 为 0 时，增加 NPC\_CMD\_txadj 个；
                                                      当 tx\_neg 为 1 时，减少 NPC\_CMD\_txadj+1 个 \\
    3:0  &  PC\_CMD\_txadj    &      4 &  0x0 &  R/W &  发送端 PC 通道命令缓存增减个数
                                                  当 tx\_neg 为 0 时，增加 PC\_CMD\_txadj 个；
                                                  当 tx\_neg 为 1 时，减少 PC\_CMD\_txadj+1 个 \\
  \end{tabular}
  \label{tab:misc}
\end{table}

### 预加重和输出阻抗寄存器

\begin{table}[htbp]
  \centering
  \caption{预加重和输出阻抗寄存器}
  \begin{tabular}{|c|c|c|c|c|p{7cm}|} \hline
    \multicolumn{6}{|l|}{寄存器名：预加重和输出阻抗寄存器；偏移：0x10c；复位值：0x0000\_0030} \\ \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
     6    &  csr\_phy\_tx\_code\_en &   1  &   0x0 &  R/W &  0：输出阻抗自动校准 1：输出阻抗人工校准 \\
     5:4  &  csr\_phy\_tx\_ncode   &   2  &   0x3 &  R/W &  下拉阻抗
                                                         csr\_phy\_tx\_code\_en=0：not care
                                                         csr\_phy\_tx\_code\_en=1：人工设置 \\
     3:2  &  csr\_phy\_tx\_pcode   &   2  &   0x0 &  R/W &  上拉阻抗
                                                         csr\_phy\_tx\_code\_en=0：not care
                                                         csr\_phy\_tx\_code\_en=1：人工设置 \\
     1:0  &  csr\_phy\_tx\_de\_tap  &   2  &   0x0 &  R/W &  预加重 00：      normal 01 or 10: 3dB 11:     6dB \\
  \end{tabular}
  \label{tab:misc}
\end{table}

HT 地址空间及窗口配置 {#sec:htAddrWinConf}
---------------------

### HyperTransport空间

龙芯 3B1500 处理器中，默认的 4 个 HyperTransport 地址窗口如下：
\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|c|} \hline
    基地址             & 结束地址           & 大小     & 定义 \\ \hhline
    0x0C00\_0000\_0000 & 0x0CFF\_FFFF\_FFFF & 1 Tbytes & HT0\_LO 窗口 \\
    0x0D00\_0000\_0000 & 0x0DFF\_FFFF\_FFFF & 1 Tbytes & HT0\_HI 窗口 \\
    0x0E00\_0000\_0000 & 0x0EFF\_FFFF\_FFFF & 1 Tbytes & HT1\_LO 窗口 \\
    0x0F00\_0000\_0000 & 0x0FFF\_FFFF\_FFFF & 1 Tbytes & HT1\_HI 窗口 \\ \hline
  \end{tabular}
  \caption{HyperTransport 默认地址窗口地址}
  \label{tab:htdefaddrwin}
\end{table}
在默认情况下（未对系统地址窗口另行配置），软件通过上述地址空间对各个 HyperTransport
接口进行访问，除此之外，软件可以通过对交叉开关上的地址窗口进行配置以用其它的地址空间对其访问（见
\ref{sec:htAddrRoute}节）每个 HyperTransport。 接口内部 40
位地址空间的具体地址窗口分布如下表\ref{tab:htaddrspace}所述。

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|l|l|} \hline
    开始地址         & 结束地址         & 大小        & 定义 \\ \hhline
    0x00\_0000\_0000 & 0xFC\_FFFF\_FFFF & 1012 Gbytes & MEM 空间 \\
    0xFD\_0000\_0000 & 0xFD\_F7FF\_FFFF & 3968 Mbytes & 保留 \\
    0xFD\_F800\_0000 & 0xFD\_F8FF\_FFFF & 16 Mbytes   & 中断 \\
    0xFD\_F900\_0000 & 0xFD\_F90F\_FFFF & 1 Mbyte     & PIC 中断响应 \\
    0xFD\_F910\_0000 & 0xFD\_F91F\_FFFF & 1 Mbyte     & 系统信息 \\
    0xFD\_F920\_0000 & 0xFD\_FAFF\_FFFF & 30 Mbytes   & 保留 \\
    0xFD\_FB00\_0000 & 0xFD\_FBFF\_FFFF & 16 Mbytes   & HT 控制器配置空间 \\
    0xFD\_FC00\_0000 & 0xFD\_FDFF\_FFFF & 32 Mbytes   & I/O 空间 \\
    0xFD\_FE00\_0000 & 0xFD\_FFFF\_FFFF & 32 Mbytes   & HT 总线配置空间 \\
    0xFE\_0000\_0000 & 0xFF\_FFFF\_FFFF & 8 Gbytes    & 保留 \\ \hline
  \end{tabular}
  \caption{HT 接口协议的地址空间}
  \label{tab:htaddrspace}
\end{table}

### HT 地址窗口

龙芯 3B1500 处理器 HyperTransport 接口中提供了多种丰富的地址窗口供用户使用，
见表\ref{tab:htwindows}。这些接口窗口的设置都是通过对配置寄存器模块的
相应寄存器实现的。

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|p{2.5cm}|p{6.5cm}|} \hline
    地址窗口 & 窗口数 & 总线 & 作用 & 备注 \\ \hhline
    \ptabincell{c}{接收窗口 \\ （见 XXX 节）}      & 3 & HT       &
    是否接收 HT 总线的访问 &
    落在这些地址窗口中的访问会被内部总线所接收并处理。
    对落在这些地址窗口外的访问， 当 CPU 处于主桥模式时（即配置寄存器中
    ActAsSlave 位为 0）， 这些访问将会被以 P2P 方式重新发回到 HT 总线上；CPU
    处于设备模式时， 这些访问将会按照协议给出错误信息，并返回。 \\ \hline

    \ptabincell{c}{Post 窗口 \\（见 XXX 节）}      & 2 & 内部总线 &
    是否将内部总线对 HT 总线的写访问作为 Post Write &
    落在这些地址空间中的对外写访问将作为 Post Write。\\ \hline

    \ptabincell{c}{可预取窗口 2 \\ （见 XXX 节）}  & 2 & 内部总线 &
    判断是否接收内部的缓存访问，取指访问 &
    当处理器核乱序执行时，会对总线发出一些猜测读访问或是取指访问，这种访问对于某些
    IO 空间是错误的。 默认情况下，这种访问 HT 控制器将直接返回而不对 HT
    总线进行访问。通过这些窗口可以使能对 HT 总线的这类访问。 \\ \hline

    \ptabincell{c}{非缓存窗口 \\ （见 XXX 节）} & 2 & HT       & 判断是否使用非缓存
    模式访问 HT 总线 & 对龙芯 3B1500 处理器内部的 IO DMA 访问，硬件将
    维护其 IO 一致性信息。 而通过这些窗口的配置，可以使命中这些窗口的访
    问以非缓存方式直接访问内存，而不通过硬件维护其 IO 一致性信息。
    \\ \hline
  \end{tabular}
  \caption{HyperTransport 地址窗口}
  \label{tab:htwindows}
\end{table}

下面， 我们对每种地址窗口进行了具体的解释。 以下几节中， 所有地址窗口寄存器的
MASK 皆为网络掩码格式， 即高位为 1，低位为 0。 掩码中 0
的个数则表示了地址窗口的大小。

#### 接收地址窗口配置寄存器 

龙芯 3A 提供了 3 个接收地址窗口，用于外部访问。窗口的地址为 HT 总上接收的地址，
落在本窗口内的 HT 地址将被发往 CPU，而其它地址的命令将作为 P2P (Peer-to-peer)
命令被转发回 HT 总线。每个接受窗口都由两个寄存器（使能和基地址）控制。
表\ref{tab:htrxreg}给它们的地址及每个寄存器的具体解释。
\begin{table}[htbp]
  \centering
  \begin{tabular}{|c*{6}{|c}|} \hline
    & 窗口 0 使能 & 窗口 0 基址
    & 窗口 1 使能 & 窗口 1 基址
    & 窗口 2 使能 & 窗口 2 基址 \\ \cline{2-7}
    地址偏移 & 0x60 & 0x64 & 0x68 & 0x6C & 0x70 & 0x74 \\ \hline
  \end{tabular}
  \begin{tabular}{|c|c|c|c|c|p{6cm}|} \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：HT 总线接收地址窗口使能；复位值：0x0000\_0000} \\ \hline
    31    & ht\_rx\_image\_en           & 1  & 0x0 & R/W & 接收地址窗口使能信号 \\
    30    & ht\_rx\_image\_trans\_en    & 1  & 0x0 & R/W & 接收地址窗口映射使能信号 \\
    29:23 & ---                         & 14 & 0x0 & --  & 保留 \\
    15:0  & ht\_rx\_image\_trans[39:24] & 16 & 0x0 & R/W & 接收地址窗口映射后地址的 [39:24]
\\ \hhline
    \multicolumn{6}{|l|}{HT 总线接收地址窗口基址；复位值：0x0000\_0000} \\ \hline
    31:16 & ht\_rx\_image\_base[39:24] & 16 & 0x0 & R/W & 接收地址窗口地址基址的 [39:24] \\
    15:0  & ht\_rx\_image\_mask[39:24] & 16 & 0x0 & R/W & 接收地址窗口地址屏蔽的 [39:24] \\
    \hline
  \end{tabular}
  \caption{HT 接收地址窗口寄存器}
  \label{tab:htrxreg}
\end{table}

接受地址窗口的命中公式如下：

         hit      = (BASE & MASK ) == ( ADDR & MASK )
         addr_out = TRANS_EN ? TRANS | ADDR & ~MASK : ADDR

#### Post 地址窗口配置寄存器 

龙芯 3A 提供了 2 个 POST 地址窗口。本窗口的地址是 AXI
总线上接收到的地址。落在本窗口的所有写访问将立即 在 AXI B (??) 通道返回，并以 POST
WRITE 的命令格式发给 HT 总线。而不在本窗口的 写请求则以 NONPOST WRITE
的方式发送到 HT 总线，并等待 HT 总线响应后再返回 AXI
总线。每个POST窗口都由两个寄存器（使能和基地址）控制。
列在表\ref{tab:htPOSTRegAddr}中。

表\ref{tab:htPostReg}给出了它们的地址及每个窗口寄存器的具体解释。
\begin{table}[ht]
  \centering
  \begin{tabular}{|c|c|c|c|c|} \hline
    & 窗口 0 使能 & 窗口 0 基址
    & 窗口 1 使能 & 窗口 1 基址 \\ \cline{2-5}
    地址偏移 & 0xD0 & 0xD4 & 0xD8 & 0xDC \\ \hline
  \end{tabular}
  \begin{tabular}{|c|c|c|c|c|p{6cm}|} \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：POST地址窗口使能；复位值：0x0000\_0000} \\ \hline
    31    & ht\_post\_en           & 1  & 0x0 & R/W & Post 地址窗口使能信号 \\
    30:16 & ---                     & 15 & 0x0 & --  & 保留 \\
    15:0  & ht\_post\_trans[39:24] & 16 & 0x0 & R/W & Post 地址窗口映射后地址的 [39:24] \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：POST地址窗口基址；复位值：0x0000\_0000} \\ \hline
    31:16 & ht\_post\_base[39:24] & 16 & 0x0 & R/W & Post 地址窗口地址基址的 [39:24] \\
    15:0  & ht\_post\_mask[39:24] & 16 & 0x0 & R/W & Post 地址窗口地址屏蔽的 [39:24] \\
    \hline
  \end{tabular}
  \caption{HT 总线 Post 地址窗口寄存器}
  \label{tab:htPOSTReg}
\end{table}

POST地址窗口的命中公式如下：

        hit = (BASE & MASK) == (ADDR & MASK)

#### 可预取地址窗口配置寄存器 

龙芯 3A 提供了 2 个 可预取 地址窗口，用于内部访问。本窗口的地址是 AXI 总线上
接收到的地址。落在本窗口的取指指令，CACHE 访问才会被发往 HT 总线，
其它的取指或是 CACHE 访问将不会被发往 HT 总线，而是立即返回，
如果是读命令，则会返回相应个数的无效读数据。每个可预取窗口都由
两个寄存器（使能和基地址）控制。列在表\ref{tab:htPrefetchRegAddr}中。
表\ref{tab:htPrefetchReg}给出了它们的地址及每个窗口寄存器的具体位域解释。
\begin{table}[ht]
  \centering
  \begin{tabular}{|c|p{2cm}|p{2cm}|p{2cm}|p{2cm}|} \hline
    & 窗口 0 使能 & 窗口 0 基址
    & 窗口 1 使能 & 窗口 1 基址 \\ \cline{2-5}
    地址偏移 & 0xE0 & 0xE4 & 0xE8 & 0xEC \\ \hline
  \end{tabular}
  \begin{tabular}{|c|c|c|c|c|p{6cm}|} \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：可预取地址窗口使能；复位值：0x0000\_0000} \\ \hline
    31    & ht\_prefetch\_en           & 1  & 0x0 & RW & 可预取地址窗口使能信号 \\
    30:16 & ---                     & 15 & 0x0 & --  & 保留 \\
    15:0  & ht\_prefetch\_trans[39:24] & 16 & 0x0 & RW & 可预取地址窗口映射后地址的 [39:24] \\ \hhline
    \multicolumn{6}{|l|}{可预取地址窗口基址；复位值：0x0000\_0000} \\ \hline
    31:16 & ht\_prefetch\_base[39:24] & 16 & 0x0 & RW & 可预取地址窗口地址基址的 [39:24] \\
    15:0  & ht\_prefetch\_mask[39:24] & 16 & 0x0 & RW & 可预取地址窗口地址屏蔽的 [39:24] \\
    \hline
  \end{tabular}
  \caption{HT 可预取地址窗口寄存器}
  \label{tab:htPrefetchReg}
\end{table}

可预取地址窗口的命中公式如下：

        hit = (BASE & MASK) == (ADDR & MASK)

#### 非缓存地址窗口配置寄存器 \label{subsec:htuncachewin}

龙芯 3A 提供了 2 个非缓存地址窗口，用于内部访问。本窗口的地址是 HT
总线上接收到的地址。落在本窗口地址的读写命令，将 不会被送往二级 CACHE，
也不会使得一级 CACHE 发生失效， 而是被直接送至内存，
或是其它的地址空间。这也就是说这个地址窗口中的读写命令将不会维持 IO 的 CACHE
一致性。这一窗口主要针对一些不会在 CACHE 中命中而可以提高存问效率
的操作，如显存的访问等。每个Uncache窗口都由
两个寄存器（使能和基地址）控制。它们的地址列在表\ref{tab:htUncacheRegAddr}中。
表\ref{tab:htUncacheReg}给除了每个窗口的寄存器的具体解释。

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|c|c|} \hline
    & 窗口 0 使能 & 窗口 0 基址
    & 窗口 1 使能 & 窗口 1 基址 \\ \cline{2-5}
    地址偏移 & 0xF0 & 0xF4 & 0xF8 & 0xFC \\ \hline
  \end{tabular}
  \begin{tabular}{|c|c|c|c|c|p{6cm}|} \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：非缓存地址窗口使能；复位值：0x0000\_0000} \\ \hline
    31    & ht\_uncache\_en           & 1  & 0x0 & R/W & 非缓存地址窗口使能信号 \\
    30:16 & --- & 15 & 0x0 & ---  & 保留 \\
    15:0  & ht\_uncache\_trans[39:24] & 16 & 0x0 & R/W & 非缓存地址窗口映射后地址的 [39:24] \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：非缓存地址窗口基址；复位值：0x0000\_0000} \\ \hline
    31:16 & ht\_uncache\_base[39:24] & 16 & 0x0 & R/W & 非缓存地址窗口地址基址的 [39:24] \\
    15:0  & ht\_uncache\_mask[39:24] & 16 & 0x0 & R/W & 非缓存地址窗口地址屏蔽的 [39:24] \\
    \hline
  \end{tabular}
  \caption{HT 总线非缓存地址窗口寄存器}
  \label{tab:htUncacheReg}
\end{table}

非缓存地址窗口的命中公式如下：

         hit = (BASE & MASK) == (ADDR & MASK)
         addr_out = TRANS_EN ? TRANS | ADDR & MASK : ADDR


### HyperTransport 设备配置空间访问

HyperTransport 接口软件层的协议与 PCI
协议基本一致，配置访问由于直接与底层协议相关，访问的方法可能略有不同。如表 9-5
中所示，配置访问空间位于地址 (0xFD\_FE00\_0000 ～ 0xFD\_FFFF\_FFFF)。对于 HT
协议中的配置访问，在龙芯 3B1500 中如图\ref{fig:htconfig}实现。

\setlength{\bitwidth}{.4cm}
\begin{figure}[t]
  \caption{HT 协议的配置访问}
  Typer 0:\vspace{.2cm}\mbox{}

  \begin{bytefield}{40}
    \bitheader[b]{39,24,23,16,15,11,10,8,7,2} \\
    \bitbox{16}{FDFFh} & \bitbox{8}{保留} &
    \bitbox{5}{设备号} & \bitbox{3}{函数号} & \bitbox{6}{寄存器号}
  \end{bytefield}

  Typer 1:\vspace{.2cm}\mbox{}

  \begin{bytefield}{40}
    \bitheader[b]{39,24,23,16,15,11,10,8,7,2} \\
    \bitbox{16}{FDFFh} & \bitbox{8}{总线号} &
    \bitbox{5}{设备号} & \bitbox{3}{函数号} & \bitbox{6}{寄存器号}
  \end{bytefield}
  \label{fig:htconfig}
\end{figure}

HT 中断支持 {#sec:htIntConfig}
-----------

HyperTransport 控制器提供了 256 个中断向量，可以支持 Fix，Arbitor 等
类型的中断，但是，没有对硬件自动中断结束（EOI）提供支持。对于这两种(??)类型的中断，控
制器在接收之后会自动写入中断寄存器中， 并根据中断屏蔽寄存器的设置对系统
中断控制器进行中断通知。 具体的中断控制请见第 5 小节中的中断控制寄存器组。

另外，HT 控制器对 PIC 中断做了专门的支持，以加速这种类型的中断处理。 一个典型的
PIC 中断由下述步骤完成：

 - PIC 控制器向系统发送 PIC 中断请求；
 - 系统向 PIC 控制器发送中断向量查询；
 - PIC 控制器向系统发送中断向量 号；
 - 系统清除 PIC 控制器上的对应中断。

只有上述 4 步都完成后，PIC 控制器 才会对系统发出下一个中断。 对于龙芯 3B1500 
HyperTransport 控制器，将自动进行前 3 步的处理， 并将 PIC 中断向量写入 256
个中断向量中的对应位置。而软件系统在处理了该中断之后，需要进行第 4 步处理，即向
PIC 控制器发出清中断，之后开始下一个中断的处理过程。

### HT 中断向量寄存器

中断向量寄存器共有 256 位，其中除去 HT 总线上 Fixed 与 Arbitrated，PIC
中断直接映射到此 256 个中断向量之中， 其它的中断， SMI， 如 NMI， INIT， INTA，
INTB，INTC，INTD 可以通过自定义寄存器（MISC）的 [28:24] 映射到任何一个 8
位中断向 量上去，映射的顺序为{INTD，INTC，INTB，INTA，1’b0，INIT，NMI，SMI}。
此时中断向量对应值为 {Interrupt Index,内部向量[2:0]}。

\begin{table}
  \centering
  \begin{tabular}{|c|c|c|c|c|p{6cm}|} \hline
    偏移  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    0x80 & Interrupt\_case[31:0]    & 32 & 0x0 & R/W & 中断向量寄存器[31:0]，   对应中断线 0 /HT HI 对应中断线 4 \\
    0x84 & Interrupt\_case[63:32]   & 32 & 0x0 & R/W & 中断向量寄存器[63:32]，  对应中断线 0 /HT HI 对应中断线 4 \\
    0x88 & Interrupt\_case[95:64]   & 32 & 0x0 & R/W & 中断向量寄存器[95:64]，  对应中断线 1 /HT HI 对应中断线 5 \\
    0x8C & Interrupt\_case[127:96]  & 32 & 0x0 & R/W & 中断向量寄存器[127:96]， 对应中断线 1 /HT HI 对应中断线 5 \\
    0x90 & Interrupt\_case[159:128] & 32 & 0x0 & R/W & 中断向量寄存器[159:128]， 对应中断线 2 /HT HI 对应中断线 6 \\
    0x94 & Interrupt\_case[191:160] & 32 & 0x0 & R/W & 中断向量寄存器[191:160]， 对应中断线 2 /HT HI 对应中断线 6 \\
    0x98 & Interrupt\_case[223:192] & 32 & 0x0 & R/W & 中断向量寄存器[223:192]， 对应中断线 3 /HT HI 对应中断线 7 \\
    0x9C & Interrupt\_case[255:224] & 32 & 0x0 & R/W & 中断向量寄存器[255:224]， 对应中断线 3 /HT HI 对应中断线 7 \\
    \hline
  \end{tabular}
  \caption{HT 总线中断向量寄存器}
  \label{tab:htintvec}
\end{table}

### 中断使能寄存器

同样，HT 总线中断使能寄存器也有 256 位，与中断向量寄存器一一对应。 置 1 为对应中断 打开，置 0 则为中断屏蔽。

\begin{table}
  \centering
  \begin{tabular}{|c|c|c|c|c|p{6cm}|} \hline
    偏移  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    0xA0 & Interrupt\_mask[31:0]    & 32 & 0x0 & R/W & 中断使能寄存器[31:0]，   对应中断线 0 /HT HI 对应中断线 4 \\
    0xA4 & Interrupt\_mask[63:32]   & 32 & 0x0 & R/W & 中断使能寄存器[63:32]，  对应中断线 0 /HT HI 对应中断线 4 \\
    0xA8 & Interrupt\_mask[95:64]   & 32 & 0x0 & R/W & 中断使能寄存器[95:64]，  对应中断线 1 /HT HI 对应中断线 5 \\
    0xAC & Interrupt\_mask[127:96]  & 32 & 0x0 & R/W & 中断使能寄存器[127:96]， 对应中断线 1 /HT HI 对应中断线 5 \\
    0xB0 & Interrupt\_mask[159:128] & 32 & 0x0 & R/W & 中断使能寄存器[159:128]， 对应中断线 2 /HT HI 对应中断线 6 \\
    0xB4 & Interrupt\_mask[191:160] & 32 & 0x0 & R/W & 中断使能寄存器[191:160]， 对应中断线 2 /HT HI 对应中断线 6 \\
    0xB8 & Interrupt\_mask[223:192] & 32 & 0x0 & R/W & 中断使能寄存器[223:192]， 对应中断线 3 /HT HI 对应中断线 7 \\
    0xBC & Interrupt\_mask[255:224] & 32 & 0x0 & R/W & 中断使能寄存器[255:224]， 对应中断线 3 /HT HI 对应中断线 7 \\
    \hline
  \end{tabular}
  \caption{HT 总线中断使能寄存器}
  \label{tab:htintenable}
\end{table}

### 中断发现配置寄存器（Interrupt Discovery & Configuration）

\begin{table}
  \centering
  \begin{tabular}{|c|c|c|c|c|p{6cm}|} \hline
    位域  & 位域名   & 位宽 & 复位值 & 访问 & 描述 \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：Interrupt Capability；偏移： 0xC0；复位值：0x8000\_0008} \\
\hline
    31:24 & Capabilities Pointer & 8 & 0x80 & R   & Interrupt discovery
configuration block \\
    23:16 & Index                & 8 & 0x0  & R/W & 读寄存器偏移地址 \\
    15:8  & Capabilities Pointer & 8 & 0x0  & R   & Capabilities Pointer \\
    7:0   & Capability ID        & 8 & 0x08 & R   & Hypertransport Capablity ID
\\ \hhline
    \multicolumn{6}{|l|}{寄存器名：Dataport；偏移： 0xC4；复位值：0x0000\_0000} \\ \hline
    31:0 & Dataport & 32 & 0x0 & R/W & 当上一寄存器 Index 为 0x10 时，本寄存器读写结果为 0xA8 寄存器，
否则为 0xAC \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：IntroInfo[31:0]；偏移： 0xC8；复位值：0xF800\_0000} \\
\hline
    31:24 & IntrInfo[31:24] & 8  & 0xF8 & R   & 保留 \\
    23:2  & IntrInfo[23:2]  & 22 & 0x0  & R/W & 当发出 PIC 中断时， IntrInfo 的值用来表示中断向量
\\
    1:0   & ---             & 2  & 0x0  & R   & 保留 \\ \hhline
    \multicolumn{6}{|l|}{寄存器名：IntroInfo[63:31]；偏移： 0xCC；复位值：0x0000\_0000} \\
\hline
    31:0  & ---             & 32 & 0x0  & R   & 保留 \\ \hhline
  \end{tabular}
  \caption{中断发现配置寄存器（Interrupt Discovery \& Configuration）}
  \label{tab:htIntDiscConfig}
\end{table}

HT 多处理器支持
---------------

龙芯 3B1500 处理器使用 HyperTransport 接口进行多处理器互联，并且可以硬 件自动维
护 4 个芯片之间的一致性请求。下面提供两种多处理器互联方法：

### 四片龙芯 3B1500 互联结构

四片 CPU 两两相联构成环状结构。每个 CPU 利用 HT0 的两个 8
位控制器与相 邻两片相联，其中 HTx\_LO 作为主设备，HTx\_HI
作为从设备连接，由此而得到下 图的互联结构：

图 9-2 四片龙芯 3B1500 互联结构

龙芯 3B1500 互联路由 龙芯 3B1500 互联路由采用简单 X-Y 路由方法。即，路由时，先 X 后
Y，以四片 芯片为例，ID 号分别为 00，01，10，11。如果从 11 向 00 发出请求，则为
11 向 00 路由，首先走 X 方向，从 11 走到 10，再走 Y 方向，从 10 走到 00。而在请
求的响应从 00 返回 11 时，路由首先走 X 方向，从 00 到 01，再走 Y 方向，从 01 到
11。可以看到，这是两个不同的路由线路。由于这个算法的特征，我们在构
建两片芯片互联的时候，将采用不同的办法。

### 两片龙芯 3B1500 互联结构

由于固定路由算法的特性， 我们在构建两片芯片互联时，
有两种不同的方法。 首先是采用 8 位 HT
总线互联。这种互联方式下，两个处理器之间只能采用 8 位 HT 互联。两个芯片号分别为
00 与 01，由路由算法，我们可以知道，两个芯片相
互访问时都是通过与四片互联时一致的 8 位 HT 总线。如下所示：

图 9-3 两片龙芯 3B1500  8 位互联结构 (FIXME)

但是，我们的 HT 总线最宽可以采用 16 位模式，由此最大化带宽的连接方式 应该是采用
16 位互联结构。 在龙芯三号中， 只要把 HT0 控制器设置为 16 位模式， 所有发到 HT0
控制器的命令都会被发往 HT0\_LO，而不是以前的按照路由表分别 发至 HT0\_HI 或是
HT0\_LO，这样，我们就可以在互联时使用 16 位总线。所以， 我们只需要将 CPU0 与
CPU1 的 16 位模式正确配置并将高低位总线正确连接即可 使用 16 位 HT
总线互联。而这种互联结构同时也可以使用 8 位的 HT 总线协议进
行相互访问。所得到的互联结构如下：

图 9-4 两片龙芯 3B1500  16 位互联结构 (FIXME)

