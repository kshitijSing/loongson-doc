系统配置与控制
==============

芯片工作模式
------------

\noindent 龙芯 3B1500 有两种工作模式：

 - 单芯片模式：系统集成 1 片龙芯 3B1500，构成一个两节点的非均匀访存多处理器系统
   （CC-NUMA）。
 - 多芯片互连模式：系统集成 2 片龙芯 3B1500，通过 HT0 端口进行连接，形成一个四节
   点的非均匀访存多处理器系统（CC-NUMA）。

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

  CLKSEL[15]    & HT 上电时钟控制 \newline
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

龙芯系统的每个节点拥有自己的控制寄存器块。每个节点的控制寄存器块的地址分别在上一
个节点的基础上增加 0x1000_0000_4000：

      节点 i 控制寄存器地址 = 节点 0 控制寄存器地址 + i * 0x1000_0000_4000

### 节点内物理地址空间分布

龙芯 3B1500 采用双节点 8 核配置。在节点内部， 地址空间通过 44 位地址的高 3 位（
[43:41]）将该节点拥有的 44 位地址均匀分配到节点内可能连接的 8 个设备上。每个处
理器芯片上集成的 DDR 内存控制器、 HT 总线、PCI 总线等将分享该节点分到的 44 位地
址空间。

<!--
龙芯 3B1500 芯片集成的 DDR 内存控制器、 HT 总线、PCI 总线的对应地址都包含在从
0x000_0000_0000 至 0x1FF_FFFF_FFFF 的 44 位 地址空间内，具体各设备地址分布请参
见后续相关章节。
-->

如表 \ref{tab:nodeAddr} 所示，在每个节点的内部，44 位地址空间又进一步均匀分布给
节点内连接的可能最多 8 个设备。其中低 43 位地址由四个二级 Cache 模块所拥有，而
高 43 位地址则进一步按地址的 [42:41] 位分布给连接在东南西北 4 个方向端口的设备
上。如果某端口上没有连接从设备，则其对应地址空间为保留地址空间，不允许访问。

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

举例说明如下：节点 0 的东端口设备的基地址为： 0x0800_0000_0000；节点 1 的南端口
设备的基地址为： 0x1A00_0000_0000。其他节点，其他方向设备的地址空间依次类推。

龙芯 3B1500 的四个二级 Cache 模块分享了一个 43 位的地址空间。为了平衡对每个
Cache 模块的访问以提高性能， 在龙芯 3B1500 上，可以根据实际应用的访问特性，通过
设置 SCID\_SEL 寄存器（地址：0x3FF00400）决定二级 Cache 的交叉寻址方式。这种交
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
两位决定对应的二级 Cache 编号。SCID\_SEL 寄存器，在节点 0 上的地址为：
0x0000\_3FF0\_0400，在节点 1 上的寄存器地址为 0x1000_3FF0\_4400 。两个节点上的
散列方式可以分别配置。


地址路由配置 \label{sec:htAddrRoute}
------------

龙芯 3B1500 的地址路由通过两级交叉开关（X1 和 X2）实现。 每一级交叉开关有若干端
口，每个端口都对应着 8 个地址窗口。交叉开关负责对端口接收到的请求进行路由配
置，并完成地址窗口的目标路由选择。

所有地址窗口的设置都通过三个 64 位寄存器 BASE、 MASK 和 MMAP 实现：

 - BASE 是窗口基地址，至少以 K 字节对齐（即基地址寄存器的低 10 位为 0）；
 - MASK 是窗口掩码，采用高位为 1 的网络掩码格式；
 - MMAP 是窗口映射地址，同时 MMAP 的低三位表示路由目标端口的编号，MMAP[4] 表示
   是否允许取指， MMAP[5] 表示是否允许块读，MMAP[7] 表示窗口是否使能。

\noindent 龙芯 3B1500 缺省采用固定路由。系统启动时，所有配置窗口都处于关闭状态
。需要系统软件进行使能配置，才可以使用。下面两节将分别描述这两级交叉开关各自的
路由配置，以及寄存器信息。

### 一级交叉开关地址路由

如图 \ref{fig:gs3-node} 所示，一个龙芯节点有 8 个主端口，同时每个主端口有 8 个
地址窗口。除了这 8 个地址窗口外， 龙芯 3B1500 还对每个主端口提供了一个"系统默认
路由"。这些地址窗口相互独立，并从配置窗口 0 到配置窗口 7，优先级依次下降。系统
默认路由有最低的优先级。 按优先级顺序，首先命中的窗口将对地址进行路由，所以默认
配置路由只有在所有 8 个配置窗口都没有对命中的情况下才会生效。也就是说，在没有对
地址窗口进行配置前，所有的读写请求都会按照系统默认路由的设定进行。

一级交叉开关窗口的命中公式如下所示。

      窗口命中: IN_ADDR & MASK == BASE

\noindent 注意，一级交叉开关只有路由，而没有地址转换的功能。这是因为二级 Cache
连接在 X1 上：如果一级交叉开关对 Cache 一致性的请求了进行地址转换，将有可能造成
二级 Cache 与一级 Cache 的地址不一致，从而导致 Cache 一致性的维护错误。

#### 一级交叉开关寄存器地址

表 \ref{tab:X1MasterWinBases} 列出了一级交叉开关在*节点 0*的 8 个主端口的窗口寄
存器基地址，及其连接的设备。

\begin{table}[htbp]
  \centering
  \caption{节点 0：一级交叉开关主端口窗口寄存器基地址}
  \begin{tabular}{|c|c|c|c||c|c|c|c|} \hline
    端口 & 端口名 & 端口设备   & 基地址       & 端口 & 端口名 & 端口设备 & 基地址       \\ \hhline
    0    & Core0  & 二级缓存 0 & 0x3FF0\_2000 & 4    & East   & 相邻节点 & 0x3FF0\_2400 \\
    1    & Core1  & 二级缓存 1 & 0x3FF0\_2100 & 5    & South  & --保留-- & 0x3FF0\_2500 \\
    2    & Core2  & 二级缓存 2 & 0x3FF0\_2200 & 6    & West   & --保留-- & 0x3FF0\_2600 \\
    3    & Core3  & 二级缓存 3 & 0x3FF0\_2300 & 7    & North  & HT 设备  & 0x3FF0\_2700 \\ \hline
  \end{tabular}
  \label{tab:X1MasterWinBases}
\end{table}

\noindnet 由于龙芯 3 号系统可以有多个节点，每个节点的窗口寄存器基地址分别在前一
个节点的基础上增加 0x1000_0000_4000。根据表 \ref{tab:X1MasterWinBases}，节点
1 对应的窗口寄存器的基地址为： 0x1000_3FF0_6000。

表 \ref{tab:AXIWinOffset} 列出了每个端口的 8 个地址窗口的配置寄存器相对基地址的
偏移。 龙芯 3B1500 一级交叉开关缺省采用固定路由， 在上电启动时，这些配置窗口都
处于关闭状态，需要软件对其进行使能配置。
\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c||c|c||c|c|} \hline
    偏移 & 寄存器     & 偏移 & 寄存器     & 偏移 & 寄存器      \\ \hhline
    0x00 & WIN0\_BASE & 0x40 & WIN0\_MASK & 0x80 & WIN0\_MMAP  \\
    0x08 & WIN1\_BASE & 0x48 & WIN1\_MASK & 0x88 & WIN1\_MMAP  \\
    0x10 & WIN2\_BASE & 0x50 & WIN2\_MASK & 0x90 & WIN2\_MMAP  \\
    0x18 & WIN3\_BASE & 0x58 & WIN3\_MASK & 0x98 & WIN3\_MMAP  \\
    0x20 & WIN4\_BASE & 0x60 & WIN4\_MASK & 0xA0 & WIN4\_MMAP  \\
    0x28 & WIN5\_BASE & 0x68 & WIN5\_MASK & 0xA8 & WIN5\_MMAP  \\
    0x30 & WIN6\_BASE & 0x70 & WIN6\_MASK & 0xB0 & WIN6\_MMAP  \\
    0x38 & WIN7\_BASE & 0x78 & WIN7\_MASK & 0xB8 & WIN7\_MMAP  \\ \hline
  \end{tabular}
  \caption{交叉开关地址窗口寄存器地址偏移表}
  \label{tab:AXIWinOffset}
\end{table}

表 \ref{tab:X1Slave} 列出了一级交叉开关的从端口， 即接受请求的设备端。
同时，映射二级 Cache 的地址还受到 SCID\_SEL 寄存器的影响：只有地址窗口和
SCID\_SEL 的条件都满足的情况下，地址访问才可得以进行。

表 \ref{tab:X1defaultAddrWin} 列出了一级交叉开关的系统默认路由配置。简单说来，
一级交叉开关的系统默认路由就是直接将主端口地址映射到对应的从端口，地址值不变。
系统默认路由映射到二级 Cache 的地址也同样受到 SCID\_SEL 寄存器的影响。
\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|} \hline
  起始地址 & 结束地址 & 目标 \\ \hline
  0x0000\_0000\_0000 & 0x07FF\_FFFF\_FFFF & 二级Cache \\ \hline
  0x0C00\_0000\_0000 & 0x0DFF\_FFFF\_FFFF & HyperTransport 0 \\ \hline
  0x0E00\_0000\_0000 & 0x0FFF\_FFFF\_FFFF & HyperTransport 1 \\ \hline
  \end{tabular}
  \caption{一级交叉开关：系统默认路由配置}
  \label{tab:X1defaultAddrWin}
\end{table}

\newpage
\noindent 注意，在进行一级交叉开关的主端口窗口设置时，
\begin{itemize}
  \item MMAP[4] 与 MMAP[5] 必须为 1；
  \item 如果使用一级交叉开关对二级 Cache 地址进行映射，映射后的地址
    （即``从端口地址''）必须与映射前地址（即``主端口地址''）保持一致： 这是维护
    Cache 一致性的需要。 而映射到 HyperTransport 地址的配置不受这个约束限制。
\end{itemize}

### 二级交叉开关地址路由

龙芯 3B1500 的二级交叉开关是供 CPU 和 PCI 两个具有主功能的 IP 进行路由选择和地
址转换而设置的。 从 3B1500 的连接结构可以看出， 来自 CPU 的访问是从二级 Cache
发出的。 这两个主设备都拥有 8 个地址窗口，完成目标地址空间的选择以及从源地址空
间到目标地址空间的转换。

而对于二级交叉开关， 如果不允许 Cache 访问或取指访问的从端口可以将 MMAP[4] 或
MMAP[5] 设为 0。

          窗口命中: IN_ADDR & MASK == BASE
          输出地址: OUT_ADDR = (IN_ADDR & ~MASK) | {MMAP[63:10] || 0000000000b}

表 \ref{tab:X2MasterWinBases} 列出了这两个主设备的窗口寄存器基地址。
\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c||c|c|} \hline
    主端口 & 基地址       & 主端口 & 基地址       \\ \hline
    CPU    & 0x3FF0\_0000 & PCI    & 0x3FF0\_0100 \\ \hline
  \end{tabular}
  \caption{二级交叉开关主端口窗口寄存器基地址}
  \label{tab:X2MasterWinBases}
\end{table}

对每个主设备而言，二级交叉开关有和一级开关相同的寄存器偏移，
如表 \ref{tab:AXIWinOffset} 所示。

二级交叉开关的目的包括 DDR 地址空间、 PCI
等慢速外设地址空间，和配置寄存器块（Xconf）共三个 IP 相关的地址空间。 3B1500
的实现中使用了两个内存控制器，这些模块的标号对应关系如表 \ref{tab:X2SlaveLabel}
所示。 二级交叉开关的系统默认路由是将所有的地址转送到系统配置寄存器模块，
即从端口 3。
\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|} \hline
    从端口 & 端口设备                \\ \hhline
    0      & 0 号 DDR2/3 控制器      \\ 
    1      & 1 号 DDR2/3 控制器      \\ 
    2      & 低速 I/O（PCI，LPC 等） \\ 
    3      & 配置寄存器模块          \\ \hline
  \end{tabular}
  \caption{二级交叉开关：从端口设备编号}
  \label{tab:X2SlaveLabel}
\end{table}

与一级交叉开关相比，二级交叉开关的配置更加灵活。
一级交叉开关的窗口配置必须保证不对需要 Cache 一致性维护的（即二级 Cache）
访问进行地址转换，否则二级 Cache 的地址会与一级 Cache 的地址发生冲突，而导致
Cache 一致性维护错误。

表 \ref{tab:X2DefAddrConfig} 列出了系统启动时， 二级交叉开关的缺省地址窗口
配置值（其他寄存器缺省值皆为 0）。
\begin{table}
  \centering
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
  \caption{二级交叉开关：缺省地址窗口配置值}
  \label{tab:X2DefAddrConfig}
\end{table}

\newpage\noindent
根据缺省的寄存器配置，芯片启动后，
\begin{center}
  \begin{tabular}{|c|c|c|c|} \hline
    主端口 & 主端口地址              & 目标从端口   & 从端口地址         \\ \hline
    CPU    & \verb+0x0000_0000-0x0FFF_FFFF+ & 内存控制器 0 & \verb+0x0000_0000 - 0x0FFF_FFFF+ \\ \hline
    CPU    & \verb+0x1000_0000-0x1FFF_FFFF+ & PCI          & \verb+0x1000_0000 - 0x1FFF_FFFF+ \\ \hline
    PCI    & \verb+0x8000_0000-0x8FFF_FFFF+ & 内存控制器 0 & \verb+0x0000_0000 - 0x0FFF_FFFF+ \\ \hline
  \end{tabular}
\end{center}

此外，当出现由于 CPU 猜测执行引起对非法地址的读访问，所有地址窗口
都不命中时，由访存模块将返回全 0 的数据给 CPU，以防止 CPU 无限等待。

芯片配置及采样寄存器
--------------------

龙芯 3B1500 中的芯片配置寄存器(Chip\_config)及芯片采样寄存器(chip\_sample)
提供了对芯片的配置进行读写的机制。

\begin{longtable}{|c|c|c|c|p{6.5cm}|}
  \caption{芯片配置寄存器}\label{tab:chipConfigSample} \\
  \hline 位域 & 字段名 & 访问 & 复位值 &  描述 \\ \hhline \endfirsthead
  \caption{芯片配置寄存器（续）} \\
  \hline 位域 & 字段名 & 访问 & 复位值 &  描述 \\ \hhline \endhead

  \hline \multicolumn{5}{r}{\tiny 未完待续} \endfoot
  \endlastfoot

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

