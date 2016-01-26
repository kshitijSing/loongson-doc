系统配置与控制
==============

控制引脚说明
------------

龙芯 3B1500 的控制引脚总共包括 DO\_TEST、 ICCC\_EN、 NODE\_ID[1:0]、
CLKSEL[15:0]、PCI\_CONFIG 和 GPIO[1:0]。 它们的设置及位域含义见表
\ref{tab:sysPinControl}。

\begin{longtable}{cp{11cm}}
  \caption{控制引脚说明}\label{tab:sysPinControl} \tabularnewline \toprule
  引脚信号 & \multicolumn{1}{c}{描述} \tabularnewline \midrule \endfirsthead
  \caption{控制引脚说明（续）} \tabularnewline \toprule
  引脚信号 & \multicolumn{1}{c}{描述} \tabularnewline \midrule \endhead
  \hline \multicolumn{2}{r}{\tiny 未完待续} \endfoot \bottomrule \endlastfoot

  DO\_TEST      & 功能模式设置位（上拉）\newline
                  \hspace*{.5cm} 1: 功能模式; 0: 测试模式               \\[.1cm]

  ICCC\_EN      & 芯片一致性互连使能信号（下拉）\newline
                  \hspace*{.5cm} 1: 多芯片一致性互联模式; 0: 单芯片模式 \\[.1cm]

  NODE\_ID[1:0] & 多芯片一致性互连模式下处理器号 \newline
                  \hspace*{.5cm} 00: 主处理器; 10: 从处理器             \\[.1cm]

  \hypertarget{clksel15}{CLKSEL[15]}
               & HT 上电时钟控制 \newline
                  \hspace*{.5cm} 1: HT 上电时钟由 CLKSEL[14:10] 控制 \newline
                  \hspace*{.5cm} 0: 初始 1 倍频，软件可进行重新配置 \\[.1cm]

  CLKSEL[14:13] & HT 控制器时钟频率 \newline
                  \hspace*{.5cm} $00_2$：PHY 时钟频率除以 2\newline
                  \hspace*{.5cm} $01_2$：PHY 时钟频率除以 4\newline
                  \hspace*{.5cm} $10_2$：PHY 时钟频率除以 8\newline
                  \hspace*{.5cm} $11_2$：取决于 PCI\_CONF[7] \\[.1cm]

  CLKSEL[12:10] & PHY 时钟频率 \newline
                  \hspace*{.5cm} $000_2$：800M； $100_2$：2.4G \newline
                  \hspace*{.5cm} $001_2$：1.2G； $101_2$：2.8G \newline
                  \hspace*{.5cm} $010_2$：1.6G； $110_2$：3.2G \newline
                  \hspace*{.5cm} $011_2$：2.0G； $111_2$：取决于 PCI\_CONF[7] \\[0.1cm]

  CLKSEL[9:6]   & 内存控制器时钟控制(MEMCLK)设置 \newline
                  \hspace*{.5cm} 
                  \begin{tabular}{|c|c|c|c|}\hline
                  CLKSEL[9:6] & 倍频系数 & CLKSEL[9:6] & 倍频系数 \\ \hline
                  1111     &     1     &    1110    &     26     \\ \hline
                  1101     &     12    &    1100    &     24     \\ \hline
                  1011     &     11    &    1010    &     22     \\ \hline
                  1001     &     10    &    1000    &     20     \\ \hline
                  0xxx     & \multicolumn{3}{c|}{初始倍频为 1 倍频，可由软件进行重新配置}
                  \\ \hline
                  \end{tabular} \vspace{.1cm} \\

  CLKSEL[5:0]   & 处理器核及节点的时钟频率要求 \newline
                  \hspace*{.5cm} 
                  \begin{tabular}{|c|c|c|c|}\hline
                  CLKSEL[5:0] & 倍频系数 & CLKSEL[5:0] & 倍频系数 \\ \hline
                  110xx0  & 36   &   6’b1xx100  & 36 \\ \hline
                  101xx0  & 32   &   6’b1xx010  & 32 \\ \hline
                  100xx0  & 24   &   6’b1xx000  & 24 \\ \hline
                  110xx1  & 18   &   6’b1xx101  & 18 \\ \hline
                  101xx1  & 16   &   6’b1xx011  & 16 \\ \hline
                  100xx1  & 12   &   6’b1xx001  & 12 \\ \hline
                  111xx0  &  2   &   6’b1xx110  & 2  \\ \hline
                  111xx1  &  1   &   6’b1xx111  & 1  \\ \hline
                  0xxxxx  & \multicolumn{3}{c|}{初始倍频为 1 倍频，可由软件进行重新配置}
                  \\ \hline
                  \end{tabular} \vspace{.1cm} \\[.1cm]

  PCI\_CONFIG[7] & 输入时钟 \newline
                   \hspace*{.5cm} 1’b1 普通输入时钟 100MHz（HTCLK），\newline
                   \hspace*{.5cm} 1’b0 差分输入时钟 200MHz（HTnCLKp/n）\\[.1cm]

  PCI\_CONFIG[6:5] & PCIX 总线速度选择 \\[.1cm]

  PCI\_CONFIG[4] & PCIX 总线模式选择 \\[.1cm]

  PCI\_CONFIG[3] & PCI 主设备模式 \\[.1cm]

  PCI\_CONFIG[2] & 系统启动空间信号\newline
                   \hspace*{.5cm} 1: 系统从 PCI 空间启动 \newline
                   \hspace*{.5cm} 0: GPIO[0] 决定启动空间 \\[.1cm]

  PCI\_CONFIG[1] & 使用外部 PCI 仲裁 \\[.1cm]

  PCI\_CONFIG[0] & HT 控制信号引脚电压控制位 0 \\[.1cm]

  GPIO[1]        & 芯片内时钟延迟控制使能（调试模式），默认下拉 \\[.1cm]

  GPIO[0]        & GPIO 芯片启动设置 \newline
                   \hspace*{.5cm} 上拉表示从 SPI Flash 取指，
                   下拉表示从 LPC Flash 取指 \\
\end{longtable}

系统节点物理地址空间分布
------------------------

### 节点级物理地址空间分布

龙芯 3 号系列处理器的系统物理地址分布采用全局可访问的层次化寻址设计，以保证系统开发
的扩展兼容。系统支持的物理地址宽度为 48 位。如表 \ref{tab:sysnodeaddr} 所示，这 48
位物理地址空间按照地址的高 4 位被均匀分布到 16 个节点上。每个节点分配了 44 位地址空
间。

\begin{longtable}{|c|>{\tt}c|>{\tt}c|>{\tt}c|}
  \caption{节点级物理地址分布}\label{tab:sysnodeaddr} \\
  \hline 节点号 & 地址位[47:44] & 起始地址 & 结束地址 \\ \hline \endfirsthead
  \caption{系统全局节点级地址分布（续）} \\
  \hline 节点号 & 地址位[47:44] & 起始地址 & 结束地址 \\ \hline \endhead
  \hline \rmcol{4}{\tiny 未完待续} \endfoot
  \hline \endlastfoot

  0  & 0x0 & 0x0000\_0000\_0000 & 0x0FFF\_FFFF\_FFFF \\
  1  & 0x1 & 0x1000\_0000\_0000 & 0x1FFF\_FFFF\_FFFF \\
  2  & 0x2 & 0x2000\_0000\_0000 & 0x2FFF\_FFFF\_FFFF \\
  3  & 0x3 & 0x3000\_0000\_0000 & 0x3FFF\_FFFF\_FFFF \\
  4  & 0x4 & 0x4000\_0000\_0000 & 0x4FFF\_FFFF\_FFFF \\
  5  & 0x5 & 0x5000\_0000\_0000 & 0x5FFF\_FFFF\_FFFF \\
  6  & 0x6 & 0x6000\_0000\_0000 & 0x6FFF\_FFFF\_FFFF \\
  7  & 0x7 & 0x7000\_0000\_0000 & 0x7FFF\_FFFF\_FFFF \\
  8  & 0x8 & 0x8000\_0000\_0000 & 0x8FFF\_FFFF\_FFFF \\
  9  & 0x9 & 0x9000\_0000\_0000 & 0x9FFF\_FFFF\_FFFF \\
  10 & 0xA & 0xA000\_0000\_0000 & 0xAFFF\_FFFF\_FFFF \\
  11 & 0xB & 0xB000\_0000\_0000 & 0xBFFF\_FFFF\_FFFF \\
  12 & 0xC & 0xC000\_0000\_0000 & 0xCFFF\_FFFF\_FFFF \\
  13 & 0xD & 0xD000\_0000\_0000 & 0xDFFF\_FFFF\_FFFF \\
  14 & 0xE & 0xE000\_0000\_0000 & 0xEFFF\_FFFF\_FFFF \\
  15 & 0xF & 0xF000\_0000\_0000 & 0xFFFF\_FFFF\_FFFF \\
\end{longtable}

#### 节点控制寄存器地址规则 {-}

龙芯 3B1500 系统可能有多个节点，而每个节点拥有专门的控制寄存器，例如以下将会讲述
的 SCID\_SEL 寄存器，以及地址路由控制寄存器等等。这些控制寄存器块的地址都是按照
一定规则固定排列的。出发系统安排的需要，龙芯 3 号的点控制寄存器地址规则为： 一个
节点的控制寄存器地址是分别在上一个节点的控制寄存器地址基础上增加
0x1000_0000_4000。一般而言，寄存器地址规则可以表示为：

        节点 i 控制寄存器地址 = 节点 0 控制寄存器地址 + i * 0x1000_0000_4000

\noindent 节点 0 的控制寄存器地址一般在 0x3FFX_XXXX，也就是在低 1G 物理空间的
末端 1M 大小的区域。从控制寄存器的地址规则可以看出，每个节点最多拥有 16K 的控制
寄存器空间。

### 节点内物理地址空间分布

如表 \ref{tab:nodeAddr} 所示，在每个节点的内部，该节点拥有的 44 位地址又通过地址
的高 3 位 [43:41]，均匀分配到节点内可能连接的 8 个设备上。其中低 43 位地址由四个
二级 Cache 模块所拥有，而高 43 位地址则按地址的 [42:41] 位分布给连接在东南西北 4
个方向端口的设备上。如果某端口上没有连接从设备，则其对应地址空间为保留地
址空间，不允许访问。

\begin{table}[h]
  \centering
  \caption{节点内地址分布}
  \begin{tabular}{|c|c|c|c|} \hline
    设备       & 地址[43:41]位  & 节点内起始地址    & 节点结束地址 \\ \hhline
    二级 Cache & 0,1,2,3        & 0x000\_0000\_0000 & 0x7FF\_FFFF\_FFFF \\ \hline
    东         & 4              & 0x800\_0000\_0000 & 0x9FF\_FFFF\_FFFF \\ \hline
    南         & 5              & 0xA00\_0000\_0000 & 0xBFF\_FFFF\_FFFF \\ \hline
    西         & 6              & 0xC00\_0000\_0000 & 0xDFF\_FFFF\_FFFF \\ \hline
    北         & 7              & 0xE00\_0000\_0000 & 0xFFF\_FFFF\_FFFF \\ \hline
  \end{tabular}
  \label{tab:nodeAddr}
\end{table}

\noindent 举例说明如下：节点 0 的东端口设备的基地址为： 0x0800_0000_0000；节点 1
的南端口设备的基地址为： 0x1A00_0000_0000。其他节点，其他方向设备的地址空间依次
类推。每个芯片节点上集成的 DDR 内存控制器、 HT 总线、 PCI 总线等
将分享该节点分到的 44 位地址空间。各设备的具体地址分布请参见后续相关章节。

#### 二级 Cache 的交叉寻址 {-}

龙芯 3B1500 的四个二级 Cache 模块分享了一个 43 位的地址空间。为了平衡对每个
Cache 模块的访问以提高性能， 在龙芯 3B1500 上，可以根据实际应用的访问特性，通过
设置 SCID\_SEL 寄存器决定二级 Cache 的交叉寻址方式。这种交
叉寻址方式根据地址的某"特定两位"来确定被映射的二级 Cache 模块。也就是说，地址块
将会被轮流交错地对应到四个二级 Cache 模块中去。表 \ref{tab:scidsel} 列出了
SCID\_SEL 寄存器值与地址选择位的对应关系。

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c||c|c|} \hline
    SCID\_SEL & 地址位选择 & SCID\_SEL & 地址位选择 \\ \hhline
    0x0       & 6:5        & 0x8       & 23:22      \\ \hline
    0x1       & 9:8        & 0x9       & 25:24      \\ \hline
    0x2       & 11:10      & 0xA       & 27:26      \\ \hline
    0x3       & 13:12      & 0xB       & 29:28      \\ \hline
    0x4       & 15:14      & 0xC       & 31:30      \\ \hline
    0x5       & 17:16      & 0xD       & 33:32      \\ \hline
    0x6       & 19:18      & 0xE       & 35:34      \\ \hline
    0x7       & 21:20      & 0xF       & 37:36      \\ \hline
  \end{tabular}
  \caption{节点内地址地址选择位设置}
  \label{tab:scidsel}
\end{table}

这种设定可以通过软件进行动态配置修改。缺省情况下，寄存器值为 0，即地址的 [6:5]
两位决定对应的二级 Cache 编号。 交叉寻址寄存器 SCID\_SEL 的物理地址遵循
[节点控制寄存器地址规则][]：

         节点 0 的物理地址： 0x0000_3FF0_0400
         节点 1 的物理地址： 0x1000_3FF0_4400

\noindent 其他节点以此类推。每个节点上的散列方式可以分别配置。

地址路由配置 \label{sec:htAddrRoute}
------------

龙芯 3B1500 的地址路由通过两级交叉开关（X1 和 X2）实现。 每一级交叉开关有若干端
口，每个端口都对应着 8 个地址窗口。交叉开关负责对端口接收到的请求进行路由配置，
并完成地址窗口的目标路由选择。所有地址窗口的设置都通过三个 64 位寄存器 BASE、
MASK 和 MMAP 实现：

 - BASE 是窗口基地址，至少以 K 字节对齐（即基地址寄存器的低 10 位为 0）；
 - MASK 是窗口掩码，采用高位为 1 的网络掩码格式；
 - MMAP 是窗口映射地址，同时 MMAP 的低三位表示路由目标端口的编号，MMAP[4] 表示
   是否允许取指， MMAP[5] 表示是否允许块读，MMAP[7] 表示窗口是否使能。

\noindent 龙芯 3B1500 缺省采用固定路由。系统启动时，所有配置窗口都处于关闭状态
。需要系统软件进行使能配置，才可以使用。下面两节将分别描述这两级交叉开关各自的
路由配置，以及寄存器信息。

### 一级交叉开关地址路由

如图 \ref{fig:gs3-node} 所示，一个龙芯节点有 8 个主端口，同时每个主端口有 8 个地
址窗口。这些地址窗口相互独立，并从窗口 0 到窗口 7，优先级依次下降。按优先级顺序
，首先命中的窗口将对地址进行路由。一级交叉开关窗口的命中公式如下所示。

        窗口命中: IN_ADDR & MASK == BASE

\noindent 注意，一级交叉开关只有路由，而没有地址转换的功能。这是因为二级 Cache
连接在 X1 上：如果一级交叉开关对 Cache 一致性的请求了进行地址转换，将有可能造成
二级 Cache 与一级 Cache 的地址冲突，从而导致 Cache 一致性的维护错误。

除了这 8 个地址窗口外， 龙芯 3B1500 还对每个主端口提供了“系统默认路由”设置。系统
默认路由有最低的优先级，所以默认配置路由只有在所有 8 个配置窗口都没有对命中的情
况下才会生效。也就是说，在没有对地址窗口进行配置前，所有的读写请求都会按照系统默
认路由的设定进行。

#### 一级交叉开关寄存器地址 {-}

表 \ref{tab:X1MasterWinBases} 列出了一级交叉开关在**节点 0**的 8 个主端口的窗口寄
存器基地址，及其连接的设备。同时，表 \ref{tab:AXIWinOffset} 列出了每个端口的 8
个地址窗口的配置寄存器相对基地址的偏移。 

\begin{table}[htbp]
  \centering
  \caption{节点 0 一级交叉开关主端口窗口寄存器基地址}\vspace{.2cm}
  \begin{tabular}{cccccccc} \toprule
    端口 & 端口名 & 端口设备   & 基地址       & 端口 & 端口名 & 端口设备 & 基地址       \\ \midrule
    0    & Core0  & 二级缓存 0 & 0x3FF0\_2000 & 4    & East   & 相邻节点 & 0x3FF0\_2400 \\
    1    & Core1  & 二级缓存 1 & 0x3FF0\_2100 & 5    & South  & -- 保留-- & 0x3FF0\_2500 \\
    2    & Core2  & 二级缓存 2 & 0x3FF0\_2200 & 6    & West   & -- 保留-- & 0x3FF0\_2600 \\
    3    & Core3  & 二级缓存 3 & 0x3FF0\_2300 & 7    & North  & HT 设备  & 0x3FF0\_2700 \\ \bottomrule
  \end{tabular}
  \label{tab:X1MasterWinBases}
\end{table}

\begin{table}[htbp]
  \centering
  \caption{交叉开关地址窗口寄存器地址偏移表}\vspace{.2cm}
  \begin{tabular}{|c|c||c|c||c|c|} \hline
    寄存器     & 偏移 & 寄存器     & 偏移 & 寄存器     & 偏移  \\ \hhline
    WIN0\_BASE & 0x00 & WIN0\_MASK & 0x40 & WIN0\_MMAP & 0x80  \\
    WIN1\_BASE & 0x08 & WIN1\_MASK & 0x48 & WIN1\_MMAP & 0x88  \\
    WIN2\_BASE & 0x10 & WIN2\_MASK & 0x50 & WIN2\_MMAP & 0x90  \\
    WIN3\_BASE & 0x18 & WIN3\_MASK & 0x58 & WIN3\_MMAP & 0x98  \\
    WIN4\_BASE & 0x20 & WIN4\_MASK & 0x60 & WIN4\_MMAP & 0xA0  \\
    WIN5\_BASE & 0x28 & WIN5\_MASK & 0x68 & WIN5\_MMAP & 0xA8  \\
    WIN6\_BASE & 0x30 & WIN6\_MASK & 0x70 & WIN6\_MMAP & 0xB0  \\
    WIN7\_BASE & 0x38 & WIN7\_MASK & 0x78 & WIN7\_MMAP & 0xB8  \\ \hline
  \end{tabular}
  \label{tab:AXIWinOffset}
\end{table}

\noindent 由于龙芯 3 号系统可以有多个节点，每个节点的窗口寄存器基地址遵从
[节点控制寄存器地址规则][]，即分别在前一个节点的基础上增加 0x1000_0000_4000。例
如，根据表 \ref{tab:X1MasterWinBases}，节点 1 对应的 Core1 窗口寄存器的基地址为
： 0x1000_3FF0_6100。那么，节点 1 的 Core1_WIN1_MASK 寄存器地址为：

        节点 1： Core1_WIN1_MASK 地址 = 0x1000_3FF0_6148。

\noindent 任何节点的窗口寄存器地址以此类推。

表 \ref{tab:X1defaultAddrWin} 列出了一级交叉开关的系统默认路由配置。简单说来，
一级交叉开关的系统默认路由就是直接将主端口地址映射到对应的从端口，地址值不变。
同时，系统默认路由映射到二级 Cache 的地址也同样受到 SCID\_SEL 寄存器的影响。

\begin{table}[htbp]
  \centering
  \caption{一级交叉开关：系统默认路由配置} \vspace{.2cm}
  \begin{tabular}{|c|c|c|} \hline
  起始地址 & 结束地址 & 目标 \\ \hline
  0x0000\_0000\_0000 & 0x07FF\_FFFF\_FFFF & 二级Cache \\ \hline
  0x0C00\_0000\_0000 & 0x0DFF\_FFFF\_FFFF & HyperTransport 0 \\ \hline
  0x0E00\_0000\_0000 & 0x0FFF\_FFFF\_FFFF & HyperTransport 1 \\ \hline
  \end{tabular}
  \label{tab:X1defaultAddrWin}
\end{table}

\noindent 注意，在进行一级交叉开关的主端口窗口设置时，

 - MMAP[4] 与 MMAP[5] 必须为 1；
 - 如果使用一级交叉开关对二级 Cache 地址进行映射，映射后的地址
    （即“从端口地址”）必须与映射前地址（即“主端口地址”）保持一致： 这是维护
    Cache 一致性的需要。 而映射到 HyperTransport 地址的配置不受这个约束限制。

### 二级交叉开关地址路由

龙芯 3B1500 的二级交叉开关中有 CPU 地址空间（包括 HT 空间）、DDR2 地址空间、以及
PCI 地址空间共三个 IP 相关的地址空间，并提供 CPU 和 PCI 两个具有主功能的 IP 进行
路由选择和地址转换的功能。 从 3B1500 的连接结构可以看出， 来自 CPU 的访问是从二
级 Cache 发出的。 这两个主设备都拥有 8 个地址窗口，完成目标地址空间的选择以及从
源地址空间到目标地址空间的转换。

二级交叉开关的目的包括 DDR 地址空间、 PCI 等慢速外设地址空间，和配置寄存器块（
Xconf）共三个 IP 相关的地址空间。 3B1500 的实现中使用了两个内存控制器，这些模块
的标号对应关系如表 \ref{tab:X2SlaveLabel} 所示。 二级交叉开关的系统默认路由是将
所有的地址转送到系统配置寄存器模块，即从端口 3。

\begin{table}[htbp]
  \centering
  \caption{二级交叉开关：从端口设备编号}
  \begin{tabular}{|c|c|} \hline
    从端口 & 端口设备                \\ \hhline
    0      & 0 号 DDR2/3 控制器      \\ 
    1      & ---空---                \\ 
    2      & 低速 I/O（PCI，LPC 等） \\ 
    3      & 配置寄存器模块          \\ \hline
  \end{tabular}
  \label{tab:X2SlaveLabel}
\end{table}

二级交叉开关窗口的命中公式及地址转换公式如下所示。

          窗口命中: IN_ADDR & MASK == BASE
          输出地址: OUT_ADDR = (IN_ADDR & ~MASK) | {MMAP[63:10] || 10'b0}

\noindent 二级交叉开关的配置更加灵活：与一级开关相比增加了地址转换的功能。同时，
如果不允许 Cache 访问或取指访问的从端口可以将 MMAP[4] 或 MMAP[5] 设为 0。

表 \ref{tab:X2MasterWinBases} 列出了节点 0 的二级开关窗口寄存器块基地址。其他节
点的二级开关窗口寄存器基地址遵从 [节点控制寄存器地址规则][]，即分别在前一个节点
的基础上增加 0x1000_0000_4000。 二级交叉开关的寄存器地址偏移和一级开关相同：具体
偏移值参见表 \ref{tab:AXIWinOffset}。
\begin{table}[htbp]
  \centering
  \caption{节点 0 二级交叉开关窗口寄存器基地址}\vspace{.2cm}
  \begin{tabular}{|c|c||c|c|} \hline
    主端口 & 基地址       & 主端口 & 基地址       \\ \hline
    CPU    & 0x3FF0\_0000 & PCI    & 0x3FF0\_0100 \\ \hline
  \end{tabular}
  \label{tab:X2MasterWinBases}
\end{table}

#### 二级交叉开关的缺省地址窗口配置 {-}

表 \ref{tab:X2DefAddrConfig} 列出了系统启动时， 二级交叉开关的缺省地址窗口配置值
（其他寄存器缺省值皆为 0）。
\begin{table}[htbp]
  \centering
  \caption{二级交叉开关：缺省地址窗口配置值}
  \begin{tabular}{|c|l|c|} \hline
    寄存器          & \cellalign{c|}{寄存器含义} & 启动缺省值                 \\ \hhline
    CPU\_WIN0\_BASE & CPU 窗口 0 基地址   & {\tt 0x0000\_0000\_0000\_0000} \\ 
    CPU\_WIN0\_MASK & CPU 窗口 0 掩码     & {\tt 0xFFFF\_FFFF\_F000\_0000} \\ 
    CPU\_WIN0\_MMAP & CPU 窗口 0 新基地址 & {\tt 0x0000\_0000\_0000\_00F0} \\ \hline
    CPU\_WIN1\_BASE & CPU 窗口 1 基地址   & {\tt 0x1000\_0000\_0000\_0000} \\ 
    CPU\_WIN1\_MASK & CPU 窗口 1 掩码     & {\tt 0xFFFF\_FFFF\_F000\_0000} \\ 
    CPU\_WIN1\_MMAP & CPU 窗口 1 新基地址 & {\tt 0x0000\_0000\_1000\_00F2} \\ \hline
    PCI\_WIN0\_BASE & PCI 窗口 0 基地址   & {\tt 0x0000\_0000\_8000\_0000} \\ 
    PCI\_WIN0\_MASK & PCI 窗口 0 掩码     & {\tt 0xFFFF\_FFFF\_8000\_0000} \\ 
    PCI\_WIN0\_MMAP & PCI 窗口 0 新基地址 & {\tt 0x0000\_0000\_0000\_00F0} \\ \hline
  \end{tabular}
  \label{tab:X2DefAddrConfig}
\end{table}

\noindent
根据缺省的寄存器配置，芯片启动后，
\begin{center}
  \begin{tabular}{|c|c|c|c|} \hline
    主端口 & 主端口地址              & 从端口   & 从端口地址         \\ \hline
    CPU    & \verb+0x0000_0000-0x0FFF_FFFF+ & 内存控制器 0 & \verb+0x0000_0000-0x0FFF_FFFF+ \\ \hline
    CPU    & \verb+0x1000_0000-0x1FFF_FFFF+ & PCI          & \verb+0x1000_0000-0x1FFF_FFFF+ \\ \hline
    PCI    & \verb+0x8000_0000-0x8FFF_FFFF+ & 内存控制器 0 & \verb+0x0000_0000-0x0FFF_FFFF+ \\ \hline
  \end{tabular}
\end{center}

此外，当出现由于 CPU 猜测执行引起对非法地址的读访问，所有地址窗口都不命中时，由
访存模块将返回全 0 的数据给 CPU，以防止 CPU 无限等待。

倍频设置寄存器
--------------

龙芯 3B1500 提供了软件倍频设置寄存器用于设置在 CLKSEL 配置为软件控制模式下，各
个时钟的工作频率。

 - MEM CLOCK 配置对应内存控制器及总线时钟频率；
 - CORE CLOCK 对应处理器核时钟频率；
 - NODE CLOCK 对应片上互连网络及三级共享高速缓存频率；
 - HT CLOCK 对应 HT 控制器时钟频率。

\noindent 每个时钟配置一般有三个参数：DIV_REFC、DIV_LOOPC、DIV_OUT。

        最终的时钟频率 =  参考时钟 * DIV_LOOPC / (DIV_REFC * DIV_OUT)。

\noindent 软件控制模式下，默认对应的时钟频率为外部参考时钟的频率（对于 CORE
CLOCK 与 NODE CLOCK，都为引脚 SYS_CLK 的对应频率；对于 MEM CLOCK，为引脚
MEM_CLK 对应频率），需要在处理器启动过程中对时钟进行软件设置。各个时钟设置的过
程应该按照以下方式：

 1. 设置寄存器中除了 SEL_PLL_\* 及 SOFT_SET_PLL 之外的其它寄存器，也即这两个寄
    存器在设置的过程中写为 0；
 1. 其它寄存器值不变，将 SOFT_SET_PLL 设为 1；
 1. 等待寄存器中的锁定信号 LOCKED_ 为 1；
 1. 将 SEL_PLL_\* 设为 1，此时对应的时钟频率将切换为软件设置的频率

对于 HT CLOCK 来说，前两个参数是由引脚配置决定的，无法更改，只有 DIV_OUT （
HTx_DIV_HT_CORE）是可以软件配置的。其工作频率为 CLKSEL[12:10] 配置的 PHY 时钟频
率 / DIV_OUT。

\begin{longtable}{|c|c|c|c|p{7cm}|}
  \caption{芯片配置寄存器}\label{tab:chipConfigSample} \\
  \hline 位域 & 字段名 & 访问 & 复位值 &  描述 \\ \hhline \endfirsthead
  \caption{芯片配置寄存器（续）} \\
  \hline 位域 & 字段名 & 访问 & 复位值 &  描述 \\ \hhline \endhead
  \hline \multicolumn{5}{r}{\tiny 未完待续} \endfoot \endlastfoot

  \multicolumn{5}{|l|}{芯片结点和处理器核软件倍频设置寄存器（物理地址 0x1FE0\_01B0）} \\* \hline
    0   & SEL\_PLL\_NODE       & RW & 0x0  & Node 时钟非软件 bypass 整个 PLL \\
    1   & SEL\_PLL\_CORE       & RW & 0x0  & Core 时钟非软件 bypass 整个 PLL \\
    2   & SOFT\_SET\_PLL       & RW & 0x0  & 允许软件设置 PLL \\
    3   & BYPASS\_L1           & RW & 0x0  & 忽略 L1 PLL \\
    4   & BYPASS\_L2\_NODE     & RW & 0x0  & 忽略 L2 Node PLL \\
    5   & BYPASS\_L2\_CORE     & RW & 0x0  & 忽略 L2 Core PLL \\
    6   & BYPASS\_REFIN\_L2    & RW & 0x0  & L2 的输入是否 忽略 L1 PLL \\
    7   & LOCKEN\_L1           & RW & 0x0  & 允许锁定 L1 PLL \\
    8   & LOCKEN\_L2\_NODE     & RW & 0x0  & 允许锁定 L2 Node PLL \\
    9   & LOCKEN\_L2\_CORE     & RW & 0x0  & 允许锁定 L2 Core PLL \\
  11:10 & LOCKC\_L1            & RW & 0x0  & 判定 L1 PLL 是否锁定使用的相位的精度 \\
  13:12 & LOCKC\_L2\_NODE      & RW & 0x0  & 判定 L2 Node PLL 是否锁定相位精度 \\
  15:14 & LOCKC\_L2\_CORE      & RW & 0x0  & 判定 L2 Core PLL 是否锁定相位精度 \\
   16   & LOCKED\_L1           & R  & 0x0  & L1 PLL 是否锁定 \\
   17   & LOCKED\_L2\_NODE     & R  & 0x0  & L2 Node PLL 是否锁定 \\
   18   & LOCKED\_L2\_CORE     & R  & 0x0  & L2 Core PLL 是否锁定 \\
  31:26 & L1\_DIV\_REFC        & RW & 0x1  & L1 PLL 输入参数 \\
  41:32 & L1\_DIV\_LOOPC       & RW & 0x1  & L1 PLL 输入参数 \\
  47:42 & L1\_DIV\_OUT         & RW & 0x1  & L1 PLL 输入参数 \\
  53:48 & L2\_DIV\_REFC\_NODE  & RW & 0x1  & L2 Node PLL 输入参数 \\
  63:54 & L2\_DIV\_LOOPC\_NODE & RW & 0x1  & L2 Node PLL 输入参数 \\
  69:64 & L2\_DIV\_OUT\_NODE   & RW & 0x1  & L2 Node PLL 输入参数 \\
  75:70 & L2\_DIV\_REFC\_CORE  & RW & 0x5  & L2 Core PLL 输入参数 \\
  85:76 & L2\_DIV\_LOOPC\_CORE & RW & 0x0  & L2 Core PLL 输入参数 \\
  91:86 & L2\_DIV\_OUT\_CORE   & RW & 0x1  & L2 Core PLL 输入参数 \\
  其它  & ---                  & RW & 保留 & 保留 \\ \hline
  \multicolumn{5}{|l|}{内存和 HT 时钟软件倍频设置寄存器（物理地址 0x1FE0\_01C0）} \\* \hline
 0    & SEL\_MEM\_PLL        & RW & 0x0  & MEM 时钟非软件 bypass 整个 PLL \\
 1    & SOFT\_SET\_MEM\_PLL  & RW & 0x0  & 允许软件设置 MEM PLL \\
 2    & BYPASS\_MEM\_PLL     & RW & 0x0  & 忽略 MEM\_PLL \\
 3    & LOCKEN\_MEM\_PLL     & RW & 0x0  & 允许锁定 MEM\_PLL \\
 5:4  & LOCKC\_ MEM\_PLL     & RW & 0x0  & 判定 MEM PLL 是否锁定相位精度 \\
 6    & LOCKED\_MEM\_PLL     & R  & 0x0  & MEM\_PLL 是否锁定 \\
13:8  & MEM\_PLL\_DIV\_REFC  & RW & 0x1  & MEM PLL 输入参数 \\
23:14 & MEM\_PLL\_DIV\_LOOPC & RW & 0x41 & MEM PLL 输入参数 \\
29:24 & MEM\_PLL\_DIV\_OUT   & RW & 0x0  & MEM PLL 输入参数 \\
 32   & SEL\_HT0\_PLL        & RW & 0x0  & HT0 非软件 bypass PLL \\
 33   & SOFT\_SET\_HT0\_PLL  & RW & 0x0  & 允许软件设置 HT0 PLL \\
 34   & BYPASS\_HT0\_PLL     & RW & 0x0  & 忽略 HT0\_PLL \\
 35   & LOCKEN\_HT0\_PLL     & RW & 0x0  & 允许锁定 HT0 PLL \\
37:36 & LOCKC\_HT0\_PLL      & RW & 0x0  & 判定 HT0 PLL 是否锁定相位精度 \\
 38   & LOCKED\_HT0\_PLL     & R  & 0x0  & HT0\_PLL 是否锁定 \\
45:40 & HT0\_DIV\_HTCORE     & RW & 0x1  & HT0 Core PLL 输入参数 \\
 48   & SEL\_HT1\_PLL        & RW & 0x0  & HT1 非软件 bypass PLL \\
 49   & SOFT\_SET\_HT1\_PLL  & RW & 0x0  & 允许软件设置 HT1 PLL \\
 50   & BYPASS\_HT1\_PLL     & RW & 0x0  & 忽略 HT1\_PLL \\
 51   & LOCKEN\_HT1\_PLL     & RW & 0x0  & 允许锁定 HT1 PLL \\
53:52 & LOCKC\_HT1\_PLL      & RW & 0x0  & 判定 HT1 PLL 是否锁定相位精度 \\
 54   & LOCKED\_HT1\_PLL     & R  & 0x0  & HT1\_PLL 是否锁定 \\
61:56 & HT1\_DIV\_HTCORE     & RW & 0x1  & HT1 Core PLL 输入参数 \\
其它  &                      & RW &      & 保留 \\ \hline
  \multicolumn{5}{|l|}{芯片处理器核软件分频设置寄存器（物理地址 0x1FE0\_01D0）} \\* \hline
 2:0  & Core0\_freqctrl     & RW & 0x7   & 核 0 分频控制值 \\
 3    & Core0\_en           & RW & 0x1   & 核 0 时钟使能 \\
 6:4  & Core1\_freqctrl     & RW & 0x7   & 核 1 分频控制值 \\
 7    & Core1\_en           & RW & 0x1   & 核 1 时钟使能 \\
10:8  & Core2\_freqctrl     & RW & 0x7   & 核 2 分频控制值 \\
 11   & Core2\_en           & RW & 0x1   & 核 2 时钟使能 \\
14:12 & Core3\_freqctrl     & RW & 0x7   & 核 3 分频控制值 \\
 15   & Core3\_en           & RW & 0x1   & 核 3 时钟使能 \\
18:16 & Core4\_freqctrl     & RW & 0x7   & 核 4 分频控制值 \\
 19   & Core4\_en           & RW & 0x1   & 核 4 时钟使能 \\
22:20 & Core5\_freqctrl     & RW & 0x7   & 核 5 分频控制值 \\
 23   & Core5\_en           & RW & 0x1   & 核 5 时钟使能 \\
26:24 & Core6\_freqctrl     & RW & 0x7   & 核 6 分频控制值 \\
 27   & Core6\_en           & RW & 0x1   & 核 6 时钟使能 \\
30:28 & Core7\_freqctrl     & RW & 0x7   & 核 7 分频控制值 \\
 31   & Core7\_en           & RW & 0x1   & 核 7 时钟使能 \\
63:32 & Reserved            & RW & 32b'0 & 保留 \\
 64   & Core0\_pre\_resetn  & RW & 0x1   & 核 0 的预复位控制 \\
 65   & Core0\_soft\_resetn & RW & 0x1   & 核 0 的软件复位控制 \\
 66   & Core1\_pre\_resetn  & RW & 0x1   & 核 1 的预复位控制 \\
 67   & Core1\_soft\_resetn & RW & 0x1   & 核 1 的软件复位控制 \\
 68   & Core2\_pre\_resetn  & RW & 0x1   & 核 2 的预复位控制 \\
 69   & Core2\_soft\_resetn & RW & 0x1   & 核 2 的软件复位控制 \\
 70   & Core3\_pre\_resetn  & RW & 0x1   & 核 3 的预复位控制 \\
 71   & Core3\_soft\_resetn & RW & 0x1   & 核 3 的软件复位控制 \\
 72   & Core4\_pre\_resetn  & RW & 0x1   & 核 4 的预复位控制 \\
 73   & Core4\_soft\_resetn & RW & 0x1   & 核 4 的软件复位控制 \\
 74   & Core5\_pre\_resetn  & RW & 0x1   & 核 5 的预复位控制 \\
 75   & Core5\_soft\_resetn & RW & 0x1   & 核 5 的软件复位控制 \\
 76   & Core6\_pre\_resetn  & RW & 0x1   & 核 6 的预复位控制 \\
 77   & Core6\_soft\_resetn & RW & 0x1   & 核 6 的软件复位控制 \\
 78   & Core7\_pre\_resetn  & RW & 0x1   & 核 7 的预复位控制 \\
 79   & Core7\_soft\_resetn & RW & 0x1   & 核 7 的软件复位控制 \\ \hline
\end{longtable}

注：PLL ouput = （clk_ref / div_refc * div_loopc）/ div_out。
PLL constrain 指括号内的值：L1：450M~1.58G L2: 850M~3.23G
内存时钟约束同 L1，HT 时钟约束同 L2。

注:       软件分频后的时钟频率值等于原来的（分频控制值+1）/8

芯片配置及采样寄存器
--------------------

龙芯 3B1500 中的芯片配置寄存器(Chip\_config)及芯片采样寄存器(chip\_sample)
提供了对芯片的配置进行读写的机制。

\begin{longtable}{|c|c|c|c|p{6.5cm}|}
  \caption{芯片配置寄存器}\label{tab:chipConfigSample} \\
  \hline 位域 & 字段名 & 访问 & 复位值 &  描述 \\ \hhline \endfirsthead
  \caption{芯片配置寄存器（续）} \\
  \hline 位域 & 字段名 & 访问 & 复位值 &  描述 \\ \hhline \endhead
  \hline \multicolumn{5}{r}{\tiny 未完待续} \endfoot \endlastfoot

  \multicolumn{5}{|l|}{芯片配置寄存器（地址 0x1fe00180）} \\* \hline
    其它    & ---                      & R  &       & 保留                                                        \\ \hline
    34:32   & HT\_freq\_scale\_ctrl0   & RW & 111   & HT 控制器 1 分频                                            \\ \hline
    31:29   & HT\_freq\_scale\_ctrl0   & RW & 111   & HT 控制器 0 分频                                            \\ \hline
    28:24   & DDR\_Clksel              & RW & 11111 & 软件配置 DDR 时钟倍频关系
                                                      \footnote{当 DDR\_Clksel\_en 为 1 时有效。} \\ \hline
    19      & DDR\_reset1              & RW & 1     & 软件 reset DDR 控制器1                                      \\ \hline
    18      & DDR\_reset0              & RW & 1     & 软件 reset DDR 控制器0                                      \\ \hline
    17      & Mc1\_en                  & RW & 1     & 是否启用 DDR 控制器1                                        \\ \hline
    16      & Mc0\_en                  & RW & 1     & 是否启用 DDR 控制器0                                        \\ \hline
    15      & Core3\_en                & RW & 1     & 是否启用处理器核 3                                          \\ \hline
    14      & Core2\_en                & RW & 1     & 是否启用处理器核 2                                          \\ \hline
    13      & Core1\_en                & RW & 1     & 是否启用处理器核 1                                          \\ \hline
    12      & Core0\_en                & RW & 1     & 是否启用处理器核 0                                          \\ \hline
    9       & DDR\_buffer\_cpu         & RW & 0     & 是否打开 DDR 读访问缓冲                                     \\ \hline
    8       & Disable\_ddr2\_confspace & RW & 0     & 是否禁用 DDR 配置空间                                       \\ \hline
    3       & DDR\_Clksel\_en          & RW & 0     & 是否使用软件配置 DDR 倍频                                   \\ \hline
    2:0     & Freq\_scale\_ctrl        & RW & 111   & 处理器核分频                                                \\* \hhline
    \multicolumn{5}{|l|}{芯片采样寄存器（地址 0x1fe00190）} \\* \hline
    其它    &                          & R  &          & 保留                                                        \\ \hline
    111     & Thsens1\_overflow        & R  &          & 温度传感器 1 温度上溢（超过 128 度）                        \\ \hline
    110:104 & Thsens1\_out             & R  &          & 温度传感器 1 温度                                           \\ \hline
    103     & Thsens0\_overflow        & R  &          & 温度传感器 0 温度上溢（超过 128 度）                        \\ \hline
    102:96  & Thsens0\_out             & R  &          & 温度传感器 0 温度                                           \\ \hline
    57:56   & Bad\_ip\_ht              & R  &          & 2 个 HT 控制器是否坏                                        \\ \hline
    53:52   & Bad\_ip\_ddr             & R  &          & 2 个 DDR 控制器是否坏                                       \\ \hline
    51:48   & Bad\_ip\_core            & R  &          & 4 个处理器核是否坏                                          \\ \hline
    47:32   & Sys\_clksel              & R  &          & 板上倍频设置                                                \\ \hline
    31:16   & Pad3v3\_ctrl             & RW & 16'h780  & 3v3pad 控制                                                 \\ \hline
    15:0    & Pad2v5\_ctrl             & RW & 16'h780  & 2v5pad 控制                                                 \\ \hline
\end{longtable}


全局时钟
--------

龙芯 3B1500 芯片内部提供了两个 64 位全局时钟供软件使用。全局时钟的运行频率与节
点时钟（NODE CLOCK）相同，每个时钟周期自增 1。该时钟为只读，对该时钟的写
不产生任何效果。

全局时钟的物理地址沿袭[节点控制寄存器地址规则][]，如表 \ref{tab:gclk-phyaddr}
所示，并且访问它们时必须使用非缓存地址模式。

Table: 全局时钟物理地址 \label{tab:gclk-phyaddr}

| 节点 | 全局时钟地址     | 节点 | 全局时钟地址     |
| :--: | :--------------: | :--: | :--------------: |
| 0    | 0x0000_3FF0_0408 | 2    | 0x2000_3FF0_8408 |
| 1    | 0x1000_3FF0_4408 | 3    | 0x3000_3FF0_C408 |

