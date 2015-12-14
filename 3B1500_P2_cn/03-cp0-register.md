CP0 控制寄存器
==============

本章的主要内容是介绍零号协处理器各个寄存器及其位域含义。
零号协处理器（Coprocessor 0， 简称 CP0），作为计算机处理器重要的组成部分，
是获取处理器的当前运行状态的主要信息来源，并可以用于控制及改变处理器的状态。
表 \ref{tab:cp0reg} 列出了龙芯 GS464 支持的所有 CP0 寄存器。

\begin{longtable}{|c|c|c|c|l|}
  \caption{CP0 寄存器表}\label{tab:cp0reg} \\
  \hline \cmcolvb{2}{寄存器号} &&& \\ \cline{1-2}
  总号 & 子号 & 寄存器名 & 位宽 & \cellalign{c|}{描述} \\ \hhline \endfirsthead
  \caption{CP0 寄存器表（续）} \\
  \hline \cmcolvb{2}{寄存器号} &&& \\ \cline{1-2}
  总号 & 子号 & 寄存器名 & 位宽 & \cellalign{c|}{描述} \\ \hhline \endhead
  \hline \multicolumn{5}{r}{\tiny 未完待续} \endfoot \hline \endlastfoot

  0  & 0   & Index      & 32 & TLB 表项索引寄存器                             \\ 
  1  & 0   & Random     & 32 & TLB 表项伪随机计数寄存器                       \\ 
  2  & 0   & EntryLo0   & 64 & TLB 表项低半部分偶虚页入口寄存器               \\ 
  3  & 0   & EntryLo1   & 64 & TLB 表项低半部分奇虚页入口寄存器               \\ 
  4  & 0   & Context    & 64 & 页表入口（PTE）指针寄存器（32 位寻址模式）     \\ 
  5  & 0   & PageMask   & 32 & 页面掩码寄存器                                 \\ 
  5  & 1   & PageGrain  & 32 & 页面颗粒度寄存器                               \\ 
  6  & 0   & Wired      & 32 & 固定连线寄存器（不用随机替换的低端 TLB 表项数）\\ 
  7  & 0   & HWREna     & 32 & 硬件寄存器使能寄存器                           \\ 
  8  & 0   & BadVAddr   & 64 & 错误虚地址寄存器                               \\ 
  9  & 0   & Count      & 32 & 计数寄存器                                     \\ 
  10 & 0   & EntryHi    & 64 & TLB 表项高半部分入口寄存器（虚页号和 ASID）    \\ 
  11 & 0   & Compare    & 32 & 比较寄存器                                     \\ 
  12 & 0   & Status     & 32 & 状态寄存器                                     \\ 
  12 & 1   & IntCtl     & 32 & 向量中断控制寄存器                             \\ 
  12 & 2   & SRSCtl     & 32 & 影子寄存器组控制寄存器                         \\ 
  13 & 0   & Cause      & 32 & 例外原因寄存器                                 \\ 
  14 & 0   & EPC        & 64 & 例外程序计数寄存器                             \\ 
  15 & 0   & PRid       & 32 & 处理器版本标识寄存器                           \\ 
  15 & 1   & EBase      & 32 & 例外向量基地址寄存器                           \\ 
  16 & 0-3 & Config     & 32 & 配置寄存器，和辅助配置寄存器 1、2、3           \\ 
  17 & 0   & LLAddr     & 64 & 链接加载地址寄存器                             \\ 
  18 & --  & --         & -- & 保留                                           \\ 
  19 & --  & --         & -- & 保留                                           \\ 
  20 & 0   & Xcontext   & 64 & 页表入口（PTE）指针寄存器（64 位寻址模式）     \\ 
  21 & --  & --         & -- & 保留                                           \\ 
  22 & 0   & Diagnostic & 32 & 诊断寄存器： 使能/禁用 BTB，RAS 以及清空 ITLB  \\ 
  23 & 0   & Debug      & 64 & EJTAG 调试寄存器                               \\ 
  24 & 0   & DEPC       & 64 & EJTAG 调试例外程序计数器                       \\ 
  25 & 0,2 & PerfCtl    & 32 & 性能控制寄存器0，1                             \\ 
  25 & 1,3 & PerfCnt    & 64 & 性能计数寄存器0，1                             \\ 
  26 & 0   & ErrCtl     & 64 & Parity/ECC 校验控制寄存器                      \\ 
  27 & 0   & CacheErr   & 64 & Cache 校验错误寄存器                           \\ 
  27 & 1   & CacheErr1  & 64 & Cache 校验错误虚地址寄存器                     \\ 
  28 & 0   & TagLo      & 32 & Cache TAG 低半寄存器                           \\ 
  28 & 1   & DataLo     & 64 & 数据低半寄存器：Cache 数据队列交互和诊断       \\ 
  29 & 0   & TagHi      & 32 & Cache TAG 高半寄存器                           \\ 
  29 & 1   & DataHi     & 64 & 数据高半寄存器：Cache 数据队列交互和诊断       \\ 
  30 & 0   & ErrorEPC   & 64 & 错误例外程序计数寄存器                         \\ 
  31 & 0   & DESAVE     & 64 & 调试暂存寄存器器                               \\
\end{longtable}

这些 CP0 寄存器的值可以通过 MFC0/DMFC0 指令来获取，或者通过 MTC0/DMTC0 指令来设
置。 表 \ref{tab:mips64-cp0-ins} 列出了所有的龙芯 GS464 处理器核 CP0 指令。 注意
， 只有当处理器运行在核心模式时或状态寄存器（Status 寄存器）中的第 28 位 （CU[0]
）被设置时， 才可以使用 CP0 指令，否则将产生一个"协处理器不可用例外"。

CP0 寄存器详解
--------------

下面各小节将对每个寄存器进行详细说明。 以下对寄存器位域的注解中，如果一个位域为
保留，则该位域必须写入其保留值（一般为 0）， 并在读的时返回保留值： 在保留字段写
入非保留值的结果为**未定义**；如果一个域为只读， 则在读的时候，返回其保留值，
而任何写入值将被忽略。

龙芯 GS464 实现了对 48 位物理地址的支持（见 PageGrain 寄存器
\ref{subsec:pagegrain} 节），并可以在 40 位和 48 位物理地址支持间切换。在以下各
章节中， 所有的描述主要基于 48 位物理地址模式，包括所有的示意图及 CP0 寄存器的位
域解释。在\ref{sec:40vs48} 节中，我们将简述 40 位和 48 位物理地址模式，可能影响
到的寄存器位域。

### Index 寄存器（0）

Index 寄存器是一个 32 位可读写寄存器。该寄存器的最高位表示最近的 TLB 探测 (TLBP)
指令执行是否成功， 其最后六位为 Index 域， 用于在 TLBR 和 TLBWI 指令中指示操作的
TLB 表项。 表 \ref{tab:cp0-index} 给出了 Index 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-index}{CP0: Index 寄存器}
  P     & 探测失败位：最近一次 TLB 探测（TLBP）指令失败时置 1。 \\
  Index & TLB 表项索引域，用于指示 TLBR 和 TLBWI 指令操作。     \\
  0     & 保留：必须按 0 写入，读时返回 0。
\end{reglongtable}

### Random 寄存器（1）

Random 寄存器是一个 32 位只读寄存器， 其低六位为 Random 域，每执行完一
条指令，该寄存器值减 1。 它被用作伪随机数，用于指示 TLB 随机写指令操作的 TLB 项。
Random 域的值在一个上下界之间浮动：

1. 上界为 TLB 最大表项索引值，即总项数减 1，在 GS464 上其值为 63；
1. 下界为 Wired 寄存器的值， 即保留给操作系统专用的 TLB 表项数。

一般而言，无需读取 Random 寄存器值。不过该寄存器是可读的， 主要用于验证处理器的
操作是否正确。 Random 寄存器在系统重起时将置为上界； 此外，当 Wired 寄存器被重写
时， 该寄存器也会被自动置为上界。 表 \ref{tab:cp0-random} 给出了 Random 寄存器的
格式， 及各域的含义。

\begin{reglongtable}{cp0-random}{CP0: Random 寄存器}
  Random & 伪随机 TLB 索引值域。 \\
  0      & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-random}
\end{reglongtable}

### EntryLo0、EntryLo1 寄存器（2，3）

EntryLo 寄存器组包括两个具有相同格式的 64 位可读写寄存器： EntryLo0 和 EntryLo1
。 龙芯的 TLB 表项是按成对页面组织的， EntryLo0 和 EntryLo1 分别对应 TLB 表项的
偶、奇虚页面。 当执行 TLB 读写操作时， 它们包含有当前 TLB 表项对应页面的页帧号（
Page-frame number, 简称 PFN）和其他页面信息。 表 \ref{tab:cp0-entrylo} 给出了
EntryLo 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-entrylo}{CP0: EntryLo 寄存器}
  PFN\footnotemark & 页帧号，即虚实地址转换中物理地址的高位。               \\ 
  C   & Cache 一致性属性位（具体细节见\ref{sec:cacheAttr} 节）。            \\ 
  D   & 脏位：该位置 1 时，对应页面脏，即可写； 亦可用作为数据写保护位。    \\ 
  V   & 有效位： TLB 表项是否有效；如未设置，TLB 访问将触发 TLBL/TLBS 例外。\\ 
  G   & 全局位： 如果为 1，TLB 查找时将忽略 ASID 域。                       \\ 
  0   & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-entrylo}
\end{reglongtable}
\footnotetext{在 MIPS64 的文档中，该域被写作 PFNX 和 PFN 域。我们这里将其合并在
一起，从概念和理解上都更直接。}

\noindent 由于一个 TLB 表项对应两个页面，却只有一个全局位。 所以在 TLB 写操作时，
只有当两个页面全局位都为 1 时， TLB 的全局位才会被写入 1。关于 TLB 表项格式
的具体信息见\ref{subsec:tlb-format} 节。

### Context 寄存器（4）

Context 寄存器是一个 64 位可读写寄存器， 在 32 位地址模式下， 包含一个指向页表（
Pagetable entry, PTE）的指针。 作为一个重要的操作系统数据结构，页表存储有虚拟地
址到物理地址转换的信息。 当 TLB 脱靶例外发生时，CPU 需要从页表中将缺失页的信息加
载到 TLB 中。这时， 操作系统将通过 Context 寄存器在页表中寻找当前缺失页的映射信
息： 这些信息一般存储在 KSEG0 段中。 同时， Context 寄存器还包含有 BadVAddr 寄存
器的部分信息，方便软件 TLB 例外的处理。 表 \ref{tab:cp0-context} 给出了 Context
寄存器的格式，及各域的含义。

\begin{reglongtable}{cp0-context}{CP0: Context 寄存器}
  PTEBase & 页表入口数列基地址域。                                   \\
  BadVPN2 & 待转换虚地址虚页号域（VPN2）： 由硬件在 TLB 例外时写入。 \\
  0       & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-context}
\end{reglongtable}

\noindent 这里，在 32 位地址模式下， BadVPN2（即未能转换的虚页 VPN2） 是一个 19
位的字段，它对应着待转换虚地址的 31:13 位：12 位被 排除在外，是因为每个 TLB 表项
对应着一个奇偶页面对。 如果页面大小为 4K 字节， 那么 VPN2 可以直接寻址按 8 个字
节长的，按对组织的页表入口数列。 对于更大尺寸的页面设置， 则需要屏蔽掉 VPN2 中相
应的多余位以产生合适的地址。

### PageMask 寄存器（5）

PageMask 寄存器是一个 32 位可读写的寄存器： 它包含了一个比较掩码域， 用于设置了
当前 TLB 表项对应的页面大小。 表 \ref{tab:cp0-pagemask} 给出了 PageMask 寄存器的
格式， 及 Mask 域的含义： 未在表 \ref{tab:cp0-pagemask} 中列出的 Mask 的值为无效
的； 寄存器的其他位保留，必须按 0 写入，读时返回 0。

\begin{floattable}
  \includegraphics[scale=0.875]{../images/cp0-pagemask.pdf} \\
  \begin{tabular}{|c*{12}{|>{\hspace{.170cm}}c<{\hspace{.170cm}}}|} \hline
    & \multicolumn{12}{c|}{Mask 位} \\ \cline{2-13}
    页面大小 & 24 & 23 & 22 & 21 & 20 & 19 & 18 & 17 & 15 & 16 & 14 & 13 \\ \hhline
    4KB    & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0 \\
    16KB   & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 1  & 1 \\
    64KB   & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 1  & 1  & 1  & 1 \\
    256KB  & 0  & 0  & 0  & 0  & 0  & 0  & 1  & 1  & 1  & 1  & 1  & 1 \\
    1MB    & 0  & 0  & 0  & 0  & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1 \\
    4MB    & 0  & 0  & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1 \\
    16MB   & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1  & 1 \\ \hline
  \end{tabular}
  \caption{CP0: PageMask 寄存器}
  \label{tab:cp0-pagemask}
\end{floattable}

进行虚实地址转换时， Mask 域的某位为 1 则表示虚地址的对应位将 不用于地址比较，即
页面地址在更高的位上对齐， 也就是说，更大的页面。 由上表可知， GS464 核支持的最
小页面为 4K， 最大为 16MB， 每级之间以 4 的倍数增加。

### PageGrain 寄存器（5）
\label{subsec:pagegrain}

PageGrain 寄存器是一个 32 位可读写的寄存器，龙芯 GS464 只定义了这个寄存器的 第 29
位：大物理地址支持位（Enable Large Physical Adress，简称 ELPA），其余位保留。 当
ELPA=1 时， 龙芯 GS464 支持 48 位物理地址； ELPA=0 时， GS464 只支持 40
位物理地址。 表 \ref{tab:cp0-pagegrain} 给出了 PageGrain 寄存器的格式，
及各域的含义。

\begin{reglongtable}{cp0-pagegrain}{CP0: PageGrain 寄存器}
  ELPA  & 大物理地址支持位。                \\
  0     & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-pagegrain}
\end{reglongtable}

在本手册中， 所有的描述和示例都主要以 48 位物理地址模式为标准给出。
关于不同物理地址模式的影响，请参见 \ref{sec:40vs48} 节。

### Wired 寄存器（6）

Wired 寄存器是一个 32 位可读写寄存器，该寄存器的值指定了 TLB 中固定连线表
项与随机表项之间的界限。 表 \ref{tab:cp0-wired}
给出了 Wired 寄存器的格式， 及各域含义。
\begin{reglongtable}{cp0-wired}{CP0: Wired 寄存器}
  Wired & TLB 固定表项大小域。 \\
  0     & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-wired}
\end{reglongtable}

如图 \ref{fig:wired} 所示， Wired 表项是固定的不会被 TLB 随机写操作修改的 TLB
表项。 Wired 寄存器在系统复位时置 0； 写该寄存器的同时，Random 寄存器的值也会被
置为其上限值（参阅前面 Random 寄存器的说明）。 

![Wired 寄存器示意图](../images/wired-illustration.pdf)

### HWREna 寄存器（7）

HWREna 寄存器是一个 32 位可读写寄存器， GS464 只定义了该寄存器的 Mask 域，用于表
示在用户态下， 指令 \verb+RDHWR+ 可以得到的硬件寄存器信息。 当前， GS464 提供了
四个硬件寄存器， 分别对应 Mask 域的四个位。 表 \ref{tab:cp0-hwrena} 给出了
HWREna寄存器的格式，及 Mask 域对应的硬件寄存器。 寄存器的其他位为保留，必须按 0
写入，读时返回 0。

\begin{floattable}
  \includegraphics[scale=0.875]{../images/cp0-hwrena} \\
  \begin{tabular}{*{4}{|>{\hspace{.3cm}}c<{\hspace{.3cm}}}|
                  >{\hspace{.4cm}}c<{\hspace{.5cm}}|p{7cm}|} \hline
     \cmcolvb{4}{Mask 位} &              & \\ \cline{1-4}
     3 & 2 & 1 & 0        &  硬件寄存器  & \cellalign{c|}{描述} \\ \hhline
     0 & 0 & 0 & 1        &  CPUnum      & 运行当前程序的 CPU 数寄存器 \\
     0 & 0 & 1 & 0        &  SYNCI\_Step & 一级 Cache 行数目寄存器 \\
     0 & 1 & 0 & 0        &  CC          & CP0 计数寄存器 \\
     1 & 0 & 0 & 0        &  CCRes       & 计数寄存器的精度 \\ \hline
  \end{tabular}
  \caption{CP0: HWREna 寄存器}
  \label{tab:cp0-hwrena}
\end{floattable}

### BadVAddr 寄存器（8）

BadVAddr 寄存器是一个 64 位只读寄存器。当软复位，NMI 或 Cache 错误例外 发生时，
BadVAddr 寄存器记录下导致 TLB 或寻址错误例外的虚拟地址， 否则寄存器值将一直保持
不变。在一般运行情况下，该寄存器的值为**未定义**。 表 \ref{tab:cp0-badvaddr}
给出了 BadVAddr 寄存器的格式。

\begin{reglongtable}{cp0-badvaddr}{CP0: BadVAddr 寄存器}
  BadVAddr & Cache 错误例外时导致 TLB 或寻址错误例外的虚拟地址
  \label{tab:cp0-badvaddr}
\end{reglongtable}

### Count、Compare 寄存器（9，11）

Count 和 Compare 寄存器是一对 32 位可读写寄存器： Count
寄存器是一个实时的计数器， 它的值每两个 CPU 时钟周期加 1； 而 Compare
寄存器则用来根据 Count 寄存器的值在特定的时刻生成一个中断。 当 Compare
寄存器被写入一个新值时， CPU 会不断地将其与 Count
寄存器中的值进行比较。 一旦这两个值相等时，便会产生一个中断请求， 同时将
Cause 寄存器的 TI 和
IP[7] 位置位。 当 Compare 寄存器被再次重写时， Cause 寄存器的 TI 位会被清零。
由于 GS464 核上实现了动态调频， Count 寄存器的计数频率不是固定的，
其值总为当前 CPU 频率的一半。

\begin{floattable}
  \regdesc{Count 寄存器} \\[.2cm] 
  \includegraphics[scale=0.875]{../images/cp0-count} \\[-.2cm]
  \regdesc{Compare 寄存器} \\[.2cm]
  \includegraphics[scale=0.875]{../images/cp0-compare}
  \caption{CP0: Count 和 Compare 寄存器}
  \label{tab:cp0-cntcmp}
\end{floattable}

### EntryHi（10） 寄存器

EntryHi 寄存器是一个 64 位可读写寄存器， 它用于在使用 TLB 指令时存放 TLB 表项的
高位。表\ \ref{tab:cp0-badvaddr} 给出了 EntryHi 寄存器的格式及各域的说明。注意，
其实 VPN2 域是 64 位虚拟地址的 47:13 位， 而 63:62 位为区域位。 当 TLB 重填，TLB
无效，或者 TLB 修改例外发生时， 引起例外的虚拟地址的虚拟页号（VPN2）和 ASID 将被
加载到 EntryHi 寄存器中。

\begin{reglongtable}{cp0-entryhi}{CP0: EntryHi 寄存器}
  \label{tab:cp0-entryhi}
  R    & 区域位: $00_2$, 用户； $01_2$, 管理； $11_2$, 核心 --- 匹配虚地址位 [63:62]。 \\
  VPN2 & 虚页号抹去地址的最低位，即虚拟地址的最高有效 35 位。 \\
  ASID & 地址空间标识域：用于区分不同进程， 及多进程数据共享。 \\
  0    & 保留：必须按 0 写入，读时返回 0。
\end{reglongtable}

### Status（12） 寄存器

Status 寄存器是一个 32 位可读写寄存器， 它包含有关于操作模式， 中断允许和处理器
状态诊断等丰富的信息。 在龙芯 GS464 上，Status 寄存器复位时的初始值为 0x30C0\_00E4。
表 \ref{tab:cp0-status} 给出了 Status 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-status}{CP0: Status 寄存器}
  CU  & 协处理器使能域：某位为 1 则表明对应协处理器可用； 初值是 $0011_2$。   \\ 
  FR  & 附加浮点寄存器使能位 --- 0: 16 个浮点寄存器； 1： 32 个浮点寄存器。   \\ 
  PX  & 用户模式下的 64 位操作使能位。 其余模式下的64 位操作无需使能。
        注意， 此时用户模式下 64 位操作是否可用仍需要判断 UX 位。             \\ 
  BEV & 启动向量（boot-entry vector）指示位 --- 0: 正常运行； 1： 启动运行。  \\ 
  SR  & 软复位例外指示位。                                                    \\ 
  NMI & NMI 例外指示位： 注意，软件不能把这位由 0 写为 1。                    \\ 
  IM  & 中断屏蔽域：如果某位被使能，则将允许对应中断触发。                    \\ 
  KSU & 运行模式位 --- $11_1$:未定义；$10_2$:用户；$01_2$:管理；$00_2$:内核。 \\ 
  KX  & 64 位内核段访问使能位。                                               \\ 
  SX  & 64 位管理段访问使能位。                                               \\ 
  UX  & 64 位用户段访问使能位。                                               \\ 
  ERL & 错误级指示位：复位，软复位，NMI 或 Cache 错误发生时， 此位将置 1。    \\ 
  EXL & 例外级指示位：复位，软复位或 Cache 错误以外的例外发生时，此位将置 1。 \\ 
  IE  & 中断使能位 --- 0： 禁用所有中断； 1： 使能所有中断。                  \\ 
  0   & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-status}
\end{reglongtable}

\noindent 一些关于 Status 寄存器重要字段的说明：

1. 4 位的协处理器使能域，CU，控制着 4 个可能的协处理器的可用性。注意，不管 CU[0]
   位如何设置，在内核模式下 CP0 总是可用的。
1. 8 位的中断屏蔽域，IM，控制着 8 个中断的使能：一个中断必须被使能才可能被触发。
   同时， 中断屏蔽域 IM 和 Cause 寄存器的中断待定域（IP）位一一对应，并合作处理
   中断发生的信息。更多细节请参考 Cause 寄存器的中断待定域。
1. 中断的使能被多个条件控制。只有在以下条件符合时， IM 位中的设置才会生效：
       IE == 1 && EXL == 0 && ERL ==  0。
1. 操作模式。龙芯 GS464 处理器有三种操作模式，他们分别是：用户模式，管理模式，和
   内核模式。由Status 寄存器的值决定了处理器的工作模式，这些模式的设置在表
   \ref{tab:cpu-mode}中列出。
1. 地址空间访问（具体空间划分见 \ref{sec:virtualspace} 节）。
       * 内核地址空间：当处理器处在内核模式时， 可以访问内核地址空间；
       * 管理地址空间：当处理器处在内核或管理模式时，可以访问管理地址空间；
       * 用户地址空间：处理器在三种操作模式下都可以访问用户地址空间。

\begin{table}[htbp]
  \centering
  \begin{tabular}{|c|c|c|>{\centering}p{5cm}|} \hline
    KSU    & ERL & EXL & 运行模式 \tabularnewline \hhline
    $10_2$ & 0   & 0   & 用户模式 \tabularnewline 
    $01_2$ & 0   & 0   & 管理模式 \tabularnewline 
    $00_2$ & 0   & 0   & 内核模式 \tabularnewline 
           & 0   & 1   & 内核模式（例外状态） \tabularnewline 
           & 1   &     & 内核模式（错误状态） \tabularnewline \hline
  \end{tabular}
  \caption{CP0： 处理器的工作模式}
  \label{tab:cpu-mode}
\end{table}

### IntCtl（12/1） 寄存器

龙芯 GS464 实现了 MIPS64 R2 体系中扩充的向量中断（vectored interrupt）支持。
IntCtl 是一个 32 位可读写寄存器，它的 VS 域用来指示中断向量的向量空间。表
\ref{tab:cp0-intctl} 给出了 IntCtl 寄存器的格式， 及VS 域的编码与向量空间对应关
系。寄存器的其他域： 1 域为只读域；0 域为保留域，必须按 0 写入，读时返回 0。

\begin{floattable}
  \includegraphics[scale=0.875]{../images/cp0-intctl} \\
  \begin{tabular}{|>{\centering}p{4.2cm}|>{\centering}p{5.5cm}|>{\centering}p{5cm}|} \hline
    编码 & 向量空间（16 进制） & 向量空间（10 进制） \tabularnewline \hhline
    0x00 & 0x000               & 0                   \tabularnewline 
    0x01 & 0x020               & 32                  \tabularnewline 
    0x02 & 0x040               & 64                  \tabularnewline 
    0x04 & 0x080               & 128                 \tabularnewline 
    0x08 & 0x100               & 256                 \tabularnewline 
    0x10 & 0x200               & 512                 \tabularnewline \hline
  \end{tabular}
  \caption{CP0: IntCtl 寄存器}
  \label{tab:cp0-intctl}
\end{floattable}

### SRSCtl（12/2） 寄存器

SRSCtl 寄存器是一个 32 位可读写寄存器， 用于管理处理器的影子寄存器组。
龙芯 GS464 中的 SRSCtl 寄存器只实现两个域：PSS 和 ESS。 同时，因为龙芯
GS464 还没有实现影子寄存器，而只有一组通用寄存器， 所以通用寄存器的影
子即为该寄存器本身。表 \ref{tab:cp0-srsctl} 给出了 SRSCtl 寄存器的格式，
及各域的含义。

\begin{reglongtable}{cp0-sysctl}{CP0: SRSCtl 寄存器}
  \label{tab:cp0-srsctl}
  ESS  & 用于例外的影子寄存器组，在龙芯 GS464 上只能为 0。 \\
  PSS  & 前一个影子寄存器组，在龙芯 GS464 上只能为 0。     \\
  0    & 保留：必须按 0 写入，读时返回 0。
\end{reglongtable}

### Cause（13） 寄存器

Cause 寄存器是一个 32 位的可读写寄存器， 所有关于最近发生的例外的
相关信息都存储在这个寄存器中。 表 \ref{tab:cp0-cause}
给出了 Cause 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-cause}{CP0: Cause 寄存器}
  BD      & 例外分支延时槽指示位。 1: 最近的例外发生在延时槽中。                   \\ 
  TI      & 时钟中断指示位。 1：时间中断等待处理。                                 \\ 
  CE      & 引发协处理器不可用例外的协处理器单元编号。                             \\ 
  DC      & 计数寄存器禁用位。 1：计数寄存器禁用。                                 \\ 
  PCI     & 性能计数中断指示位。 1： 性能计数器中断等待处理。                      \\ 
  IV      & 中断例外入口位。 0：通用例外向量（0x180）； 1：特殊中断向量（0x200）。 \\ 
  IP      & 中断指示位： 某位为 1 表明对应中断等待。 其值将保持不变直到
            中断撤除。其中 IP0, IP1 是软中断位，可由软件设置与清除。               \\ 
  ExcCode & 例外码域 （编码及含义见表 \ref{tab:exccode}）。                        \\ 
  0       & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-cause}
\end{reglongtable}

例外码（ExcCode）是一个5位的位域； 表 \ref{tab:exccode} 列出了所有例外码的编码及
其含义。

\begin{longtable}{|c|c|p{3.8cm}||c|c|p{3.8cm}|}
  \caption{Cause 寄存器 ExcCode 域} \label{tab:exccode} \\ \hline
  例外代码 & 助记符 & \cellalign{c|}{描述} &
  例外代码 & 助记符 & \cellalign{c|}{描述} \\ \hhline \endfirsthead
  \caption{Cause 寄存器 ExcCode 域（续）}  \\ \hline
  例外代码 & 助记符 & \cellalign{c|}{描述} &
  例外代码 & 助记符 & \cellalign{c|}{描述} \\ \hhline \endhead
  \hline \multicolumn{6}{r}{\tiny 未完待续} \endfoot \endlastfoot
  0  & Int       & 中断                & 16 & IS        & 栈例外 \\
  1  & Mod       & TLB 修改例外        & 17 & ---       & 保留 \\
  2  & TLBL      & TLB 例外（读取）    & 18 & ---       & 保留 \\
  3  & TLBS      & TLB 例外（存储）    & 19 & DIB       & Debug 指令例外 \\
  4  & AdEL      & 地址错误例外（读取）& 20 & DDBS      & Debug 存数据例外 \\
  5  & AdES      & 地址错误例外（存储）& 21 & DDBL      & Debug 取数据例外 \\
  6  & IBE       & 指令总线错误例外    & 22 & ---       & 保留 \\
  7  & DBE       & 数据总线错误例外    & 23 & WATCH     & Watch 例外 \\
  8  & Sys       & 系统调用例外        & 24 & ---       & 保留 \\
  9  & Bp        & 断点例外            & 25 & ---       & 保留 \\
  10 & RI        & 保留指令例外        & 26 & DBP       & Debug 断点例外 \\
  11 & CpU       & 协处理器不可用例外  & 27 & DINT      & Debug 调试例外 \\
  12 & Ov        & 算术溢出例外        & 28 & DSS       & Debug 单步例外 \\
  13 & Tr        & 陷阱例外            & 29 & ---       & 保留 \\
  14 & ---       & 保留                & 30 & {\small CacheErr}& Cache 错例外 \\
  15 & FPE       & 浮点例外            & 31 & ---       & 保留 \\ \hline
\end{longtable}

### EPC（14） 寄存器

EPC（Exception Program Counter，例外程序计数器）寄存器是一个 64 位可读写寄存
器，它的内容是例外处理结束后的程序恢复运行的地址。 表 \ref{tab:cp0-epc} 给出了 EPC
寄存器的格式。

\begin{floattable}
  \includegraphics[scale=0.875]{../images/cp0-epc}
  \caption{CP0: EPC 寄存器}
  \label{tab:cp0-epc}
\end{floattable}

\noindent 当同步例外发生时， 有两种可能：
\begin{itemize}
  \item 一般而言， EPC 寄存器的内容为例外发生时的指令虚地址，该指令为导致例外的直接原因；
  \item 如果例外发生时，指令在分支延时槽中，则 EPC
    内容为之前的分支或者跳转指令的虚地址， 同时 Cause 寄存器的
    指令延时位（BD）将被置位。
\end{itemize}
当 Status 寄存器中的 EXL 位被置 1，即例外在另外一个例外中被触发时，
处理器不会重写 EPC 寄存器。

### PRid（15） 寄存器

PRid (Processor Revision Identifier， 处理器修改版本标识) 寄存器是一个 32 的只读寄存器。
表 \ref{tab:cp0-PRid} 给出了 PRid 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-prid}{CP0: PRid 寄存器}
  Imp  & 实现版本号。 \\
  Rev  & 修订版本号。 \\
  0    & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-PRid}
\end{reglongtable}

版本号由 8 位信息表达，一般写作 \verb+Y.X+，其中 \verb+Y+（7:4
位）为主版本号，而 \verb+X+（3:0 位）为次版本号。 龙芯 GS464 核的实现版本号为
\verb+6.3+， 修订版本号为 \verb+0.3+。

注意， 版本号码可以区分一些处理器的版本， 但处理器的任何改动不能保证都体现在
PRid 寄存器中；另一方面， 版本号的改动也不能保证必须体现处理器的修改。
因此，软件不能过分依赖 PRid 寄存器中的版本号信息来标识处理器。

### EBase（15） 寄存器

EBase 寄存器是一个 32\footnote{32 位的 EBase
寄存器就足够决定例外向量基地址，这是因为出于兼容 32 位系统
的需要，例外向量基地址被放在 CKSEG0/CKSEG1 兼容段。这是一种
约定，对实际操作不构成任何实质的限制。} 位可读写寄存器：它包含有确定例外向量基地址的信息，以及
附加的只读处理器号信息。
当状态 (Status) 寄存器的 BEV=0，即程序在正常运行状态（而非启动运行时）， 系统将使用
EBase 寄存器中的例外向量基址域来决定向量入口。具体细节见 \ref{sec:excVectorLocation} 节。
表 \ref{tab:cp0-ebase} 给出了 EBase 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-ebase}{CP0: EBase 寄存器}
  [31:30] & MIPS64 架构定义的只读域，用于确认例外向量的地址段。 \\ 
  EBase   & 例外向量基地址域：与 31:30 位联合指明例外向量基址。 \\ 
  CPUNum  & 在多核系统中，用于指明处理器号。                    \\ 
  0       & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-ebase}
\end{reglongtable}

### Config 寄存器

Config 寄存器是一个 64 位寄存器，它存有龙芯 GS464 处理器核中各种配置选择项信息。

1. 寄存器位 31:3 所定义的配置选项， 由硬件复位时设置，作为只读状态位供软件访问；
1. 寄存器位 2:0 与 Cache 配置有关， 为可读写位， 由软件所控制。复位时这些位是没
   有定义的， 在 Cache 被使用之前由软件来初始化，并在任何改变后重新初始化。

Config 寄存器的初值为 0x0003\_0932(\remark{有问题！})。 表 \ref{tab:cp0-Config}
给出了 Config 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-config}{CP0: Config 寄存器}
  M    & Config1 寄存器存在位 --- 置 1 表示存在。                                \\ 
  BE   & 尾端类型位。1： 大尾端； 0： 小尾端。                                   \\ 
  AT   & 架构类型域。0： MIPS32； 1： MIPS64(32 位地址段)； 2：MIPS64；3：保留。 \\ 
  AR   & 架构发布版本域。0：Release 1； 1：Release 2； 其他： 保留。             \\ 
  MT   & 内存管理类型域。 0：无映射； 1：标准 TLB； 其他：保留。                 \\ 
  VI   & 虚拟指令 Cache 位。0： 无虚拟指令 Cache； 1： 有虚拟指令 Cache。        \\ 
  K0   & CKSEG0/KSEG0 段一致性算法属性位。                                       \\ 
  0    & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-Config}
\end{reglongtable}

### Config1 寄存器

Config1 寄存器是一个 32 位的只读寄存器。 作为 Config 寄存器的附加内容， 它含有龙
芯 GS464 处理器核的 Cache 配置，和各种其他附加信息。 该寄存器在复位时被自动设置
； 在 GS464 核上，该寄存器的值为 0xFEE3\_7193。 表 \ref{tab:cp0-config1} 给出了
Config1 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-configI}{CP0: Config1 寄存器}
  M        & Config2 寄存器存在位：置 1 表示存在。 \tabularnewline
  MMU Size & TLB 表项最大索引数（表项总数减 1）。 \tabularnewline
  IS       & Icache 每路组数。 \newline\mbox{\hspace{.5cm}}
  \begin{tabular}{|c|*{9}{>{\centering}p{.83cm}|}} \hline
    编码 & 0  & 1   & 2   & 3   & 4    & 5    & 6    & 7    \tabularnewline \hline
    含义 & 64 & 128 & 256 & 512 & 1024 & 2048 & 4096 & 保留 \tabularnewline \hline
  \end{tabular} \tabularnewline[.2cm]
  IL       & Icache 每组大小（字节）。 \newline\mbox{\hspace{.5cm}}
  \begin{tabular}{|c|*{9}{>{\centering}p{.83cm}|}} \hline
    编码 & 0  & 1 & 2 & 3  & 4  & 5  & 6   & 7    \tabularnewline \hline
    含义 & 无 & 4 & 8 & 16 & 32 & 64 & 128 & 保留 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  IA       & Icache 相联方式。 \newline\mbox{\hspace{.5cm}}
  \begin{tabular}{|c|*{9}{>{\centering}p{.83cm}|}} \hline
    编码 & 0    & 1    & 2    & 3    & 4    & 5    & 6    & 7    \tabularnewline \hline
    含义 & 直接 & 2 路 & 3 路 & 4 路 & 5 路 & 6 路 & 7 路 & 8 路 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  DS       & Dcache 每路组数。 \newline\mbox{\hspace{.5cm}}
  \begin{tabular}{|c|*{9}{>{\centering}p{.83cm}|}} \hline
    编码 & 0  & 1   & 2   & 3   & 4    & 5    & 6    & 7    \tabularnewline \hline
    含义 & 64 & 128 & 256 & 512 & 1024 & 2048 & 4096 & 保留 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  DL       & Dcache 每组大小（字节）。 \newline\mbox{\hspace{.5cm}}
  \begin{tabular}{|c|*{9}{>{\centering}p{.83cm}|}} \hline
    编码 & 0  & 1 & 2 & 3  & 4  & 5  & 6   & 7    \tabularnewline \hline
    含义 & 无 & 4 & 8 & 16 & 32 & 64 & 128 & 保留 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  DA       & Dcache 相联方式。 \newline\mbox{\hspace{.5cm}}
  \begin{tabular}{|c|*{9}{>{\centering}p{.83cm}|}} \hline
    编码 & 0    & 1    & 2    & 3    & 4    & 5    & 6    & 7    \tabularnewline \hline
    含义 & 直接 & 2 路 & 3 路 & 4 路 & 5 路 & 6 路 & 7 路 & 8 路 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  C2       & 2 号协处理器实现位 --- 0: 未实现; 1: 实现。 \tabularnewline
  MD       & MDMX ASE 实现位 --- 0: 未实现; 1: 实现。 \tabularnewline
  PC       & 性能计数器实现位 --- 0: 未实现 1: 实现。 \tabularnewline
  WR       & Watch 寄存器实现位 --- 0: 未实现 1: 实现。 \tabularnewline
  CA       & MIPS16e 实现位 --- 0: 未实现 1: 实现。 \tabularnewline
  EP       & EJTAG 实现位 --- 0: 未实现 1: 实现。 \tabularnewline
  FP       & FPU 实现位 --- 0: 未实现; 1: 实现。
  \label{tab:cp0-config1}
\end{reglongtable}

### Config2 寄存器

Config2 寄存器是一个 32 位的只读寄存器。 同样作为 Config 寄存器的附加内容，
它含有龙芯 GS464 处理器二、三级 Cache 的配置信息。 该寄存器在复位时被自动设置； 在
GS464 核上， 该寄存器的值为 0x8000\_1643。 表 \ref{tab:cp0-config2} 给出了
Config2 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-configII}{CP0: Config2 寄存器}
  M    & Config3 寄存器存在位： 置 1 表示存在。 \tabularnewline
  TU   & 二级 cache 控制状态位 \tabularnewline
  TS   & 三级 cache 每路组数。 \newline\mbox{\hspace{.3cm}}
  \begin{tabular}{|c|*{10}{>{\centering}p{.75cm}|}} \hline
    编码 & 0    & 1    & 2    & 3    & 4    & 5    & 6    & 7    & 8-15 \tabularnewline \hline
    含义 & 直接 & 2 路 & 3 路 & 4 路 & 5 路 & 6 路 & 7 路 & 8 路 & 保留 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  TL   & 三级 cache 每组大小（字节）。 \newline\mbox{\hspace{.3cm}}
  \begin{tabular}{|c|*{10}{>{\centering}p{.75cm}|}} \hline
    编码 & 0  & 1 & 2 & 3  & 4  & 5  & 6   & 7   & 8-15 \tabularnewline \hline
    含义 & 无 & 4 & 8 & 16 & 32 & 64 & 128 & 256 & 保留 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  TA   & 三级 cache 相联方式。 \newline\mbox{\hspace{.3cm}}
  \begin{tabular}{|c|*{10}{>{\centering}p{.75cm}|}} \hline
    编码 & 0    & 1    & 2    & 3    & 4    & 5    & 6    & 7    & 8-15 \tabularnewline \hline
    含义 & 直接 & 2 路 & 3 路 & 4 路 & 5 路 & 6 路 & 7 路 & 8 路 & 保留 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  SU   & 二级 cache 控制状态位。 \tabularnewline
  SS   & 二级 cache 每路组数。 \newline\mbox{\hspace{.3cm}}
  \begin{tabular}{|c|*{10}{>{\centering}p{.75cm}|}} \hline
    编码 & 0  & 1   & 2   & 3   & 4    & 5    & 6    & 7    & 8-15 \tabularnewline \hline
    含义 & 64 & 128 & 256 & 512 & 1024 & 2048 & 4096 & 8192 & 保留 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  SL   & 二级 cache 每组大小（字节）。 \newline\mbox{\hspace{.3cm}}
  \begin{tabular}{|c|*{10}{>{\centering}p{.75cm}|}} \hline
    编码 & 0  & 1 & 2 & 3  & 4  & 5  & 6   & 7   & 8-15 \tabularnewline \hline
    含义 & 无 & 4 & 8 & 16 & 32 & 64 & 128 & 256 & 保留 \tabularnewline \hline
  \end{tabular} \vspace{.2cm}\tabularnewline
  SA   & 二级 cache 相联方式。 \newline\mbox{\hspace{.3cm}}
  \begin{tabular}{|c|*{10}{>{\centering}p{.75cm}|}} \hline
    编码 & 0    & 1    & 2    & 3    & 4    & 5    & 6    & 7    & 8-15 \tabularnewline \hline
    含义 & 直接 & 2 路 & 3 路 & 4 路 & 5 路 & 6 路 & 7 路 & 8 路 & 保留 \tabularnewline \hline
  \end{tabular}\vspace{.2cm}
  \label{tab:cp0-config2}
\end{reglongtable}

### Config3 寄存器

Config3 寄存器是一个 32 位的只读寄存器。 作为 Config 寄存器的附加内容， 该寄存器
标记了龙芯 GS464 处理器核一些功能是否实现。在 GS464 核上，该寄存器的值为
$0x0000\_00A0$， 在硬件复位时被自动设置。表 \ref{tab:cp0-config3} 给出了 Config3
寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-configIII}{CP0: Config3 寄存器}
  M    & 保留：必须按 0 写入，读时返回 0。 \\ 
  0    & 保留：必须按 0 写入，读时返回 0。 \\ 
  DSPP & DSP ASE 实现指示位。              \\ 
  LPA  & 大物理地址实现指示位。            \\ 
  VEIC & 外部中断控制器实现指示位。        \\ 
  Vint & 向量中断实现指示位。              \\ 
  SP   & 小页面支持实现指示位。            \\ 
  MT   & MIPS MTASE 实现指示位。           \\ 
  SM   & SmartMIPS ASE 实现指示位。        \\ 
  TL   & Trace Logic 实现指示位。
  \label{tab:cp0-config3}
\end{reglongtable}

### LLAddr 寄存器

LLAddr (Load Link Address) 寄存器是一个 64 位只读寄存器, 用于存放最近发生的
load-linked 指令地址的页帧号（PFN）。当例外从 ERET 指令返回时， LLAddr 寄存器被
清零。表 \ref{tab:cp0-lladdr} 给出了 LLAddr 寄存器的格式。

\begin{reglongtable}{cp0-lladdr}{CP0: LLAddr 寄存器}
  PFN & 页帧号，即虚实地址转换中物理地址的高位。
  \label{tab:cp0-lladdr}
\end{reglongtable}

### XContext 寄存器

XContext 寄存器是一个 64 位的可读写寄存器。 它包含有一个指向页表入口的指针，
用于 XTLB 重填处理，处理 64 位地址空间的 TLB 表项加载操作。
表 \ref{tab:cp0-XContext} 给出了 XContext 寄存器的格式， 及各域的含义。

\begin{reglongtable}{cp0-xcontext}{CP0: XContext 寄存器}
  PTEBase & 页表入口基地址域： 其值为指向内存中当前页表的指针。            \\
  R       & 区域位 --- 00: 用户; 01: 管理; 11: 内核 --- 虚地址 63:62 位。  \\
  BadVPN2 & 未能有效转换的虚地址虚页号（VPN2）： 由硬件在 TLB 例外时写入。 \\
  0       & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-XContext}
\end{reglongtable}

操作系统会设置寄存器中的 PTEBase 域。 当 TLB 重填例外发生时，例外处理程序该寄存
器的内容从页表中加载缺失页信息到 TLB 表项中。 35 位的 BadVPN2/VPN2 域对应着引发
TLB 例外的虚拟地址的 47:13 位。 位 12 被排除在外，是因为一个 TLB 表项映射到两个
页面。 当页面大小为 4K 字节时， VPN2 可以直接寻址 8 字节长，成对组织的页表入口数
列（PTE array）。对于其他大小的页面，则需要掩去 VPN2 中多余的位以得到正确的页表
入口地址。

### Diagnostic 寄存器

Diagnostic 寄存器是一个 龙芯处理器特有的 64 位可读写寄存器，主要用于控制处理器的
一些内部队列和特殊操作。表 \ref{tab:cp0-Diagnostic} 给出了 Diagnostic 寄存器的格
式， 及各域的含义。

\begin{reglongtable}{cp0-diagnostic}{CP0: Diagnostic 寄存器}
  W-CAC & 取消 Wait-cache 操作的限制。  \\ 
  W-ISS & 取消 Wait-issue 操作的限制。  \\ 
  S-ISS & 取消 Store-issue 操作的限制。 \\ 
  S-FET & 取消 Store-fetch 操作的限制。 \\ 
  ITLB  & 写入 1 时清空 ITLB。          \\ 
  BTB   & 写入 1 时清空 BTB。           \\ 
  RAS   & 写入 1 时禁止使用 RAS。       \\ 
  0     & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-Diagnostic}
\end{reglongtable}


### Debug 寄存器

Debug 寄存器是一个 32 位的可读写寄存器。 它包含有最近发生的调试例外或者在调试
模式下发生的例外的信息，它同时还控制单步中断，并指明了调试模式的可用资源和其他调试相关的
内部状态。

表 \ref{tab:cp0-Debug} 给出了 Debug 寄存器的格式， 及各域的含义。注意，该寄存器
只有 LSNM 域和 SSt 域可写；而在非调试模式下，则只有 DM 位和 EJTAGver 域可读。系
统复位时， Debug 寄存器的初始值为： 0x0201\_8000。 Debug 寄存器中的各位域，只有
在调试例外或调试模式下例外发生时才会被更新。

龙芯 GS464 处理器核未实现调试例外时的省电模式。

\begin{reglongtable}{cp0-debug}{CP0: Debug 寄存器}
  DBD      & 调试例外指令延迟槽指示位。                                      \\ 
  DM       & 调试模式位： 0 - 非调试模式; 1 - 调试模式。                     \\ 
  NoDCR    & DSEG 段存在位： 1: 不存在; 0: 存在。                            \\ 
  LSNM     & DSEG 段存在时，存取可用地址位： 0 - DSEG 段; 1: 系统内存。      \\ 
  CountDM  & 调试模式下 Count 寄存器工作状态位： 1: 继续计数。               \\ 
  EJTAGver & EJTAG 版本域： 0: 版本 1/2.0; 1: 2.5; 2: 2.6; 3: 3.1; 4: 保留。 \\ 
  DexcCode & 调试模式下的例外原因域。                                        \\ 
  NoSSt    & 单步中断指示位： 0 - 支持单步; 1 - 不支持。                     \\ 
  SSt      & 单步中断使能位： 1 - 使能单步中断。                             \\ 
  DINT     & 调试中断例外发生位： 进入调试模式后自动清零。                   \\ 
  DIB      & 调试指令中断例外发生位： 进入调试模式后自动清零。               \\ 
  DDBS     & 调试数据中断例外发生位： 进入调试模式后自动清零。               \\ 
  DBp      & 调试断点例外发生位： 进入调试模式后自动清零。                   \\ 
  DSS      & 调试单步中断例外发生位： 进入调试模式后自动清零。               \\ 
  0        & 保留：必须按 0 写入，读时返回 0。\label{tab:cp0-Debug}
\end{reglongtable}

### DEPC 寄存器

DEPC（Debug Exception Program Counter, 调试例外程序计数）是一个 64 位的可读写寄
存器，它包含有调试例外处理结束后的继续处理地址。 此寄存器由硬件在调试例外或调试
模式下的例外时更新。表 \ref{tab:cp0-DEPC} 给出了 DEPC 寄存器的格式。

\begin{reglongtable}{cp0-depc}{CP0: DEPC 寄存器}
  DEPC & 调试例外处理结束后的继续处理地址
  \label{tab:cp0-DEPC}
\end{reglongtable}

\noindent 对于精确的调试例外和调试模式下的精确例外，DEPC 寄存器的内容是下面之一
：

1. 指令虚地址，这是导致例外的直接原因，或者
1. 当指令在分支延时槽中， 则为之前的分支或者跳转指令的虚地址。 同时，Debug 寄存
   器的指令延时槽指示位 DBD 被置 1。

### PerfCnt 寄存器(25，0/1/2/3)

龙芯 GS464 处理器定义了四个（两组）性能计数器 (Performance Counter)，他们分别映
射到 CP0 寄存器的 25 号的选择子号 0，1，2，3。表 \ref{tab:perfcnt-sel} 列出了这
四个选择子号对应的性能计数器含义。
\begin{floattable}
  \begin{tabular}{|c||c|c|c|c|} \hline
    选择号 & 0            & 1            & 2            & 3            \\ \hline
    寄存器 & 控制寄存器 0 & 计数寄存器 0 & 控制寄存器 1 & 计数寄存器 1 \\ \hline
  \end{tabular}
  \label{tab:perfcnt-sel}
  \caption{CP0: PerfCnt 控制、计数寄存器选择号列表}
\end{floattable}

这两组计数器格式相同：其中性能控制是 32 位的寄存器，而 性能计数器则为 64 位。表
\ref{tab:cp0-PerfCnt} 给出了 PerfCnt 寄存器的格式， 及各域的含义。龙芯 GS464 在
复位时， PerfCnt 寄存器的两个控制寄存器赋的初始值分别为：
\begin{itemize}
  \item PerfCnt0 (select 0) = 0xC000\_0000
  \item PerfCnt1 (select 2) = 0x4000\_0000 
\end{itemize}

每组计数器都可以独立对一种事件计数，并且在相关的事件域（Event）中对应的
可数事件发生时自增。当性能计数器溢出，即首位（63 位）变成 1，则将触发一个中断：
Cause 寄存器中的 PCI 位被置 1 （如果有多组计数器，则 PCI 位的值为多组计数器的
溢出位取或）。计数器溢出后，无论中断是否被处理，计数都将继续。表 3-26 描述计数使能位的 定义。表
计数器 0 和计数器 1 各自的事件。

\begin{floattable}
  \regdesc{性能控制寄存器} \\[.2cm]
  \includegraphics[scale=0.875]{../images/cp0-perfctl} \\[-.2cm]
  \regdesc{性能计数寄存器} \\[.1cm] 
  \includegraphics[scale=0.875]{../images/cp0-perfcnt} \\
  \begin{regtabular}
      M    & 扩展计数器存在位：为 1 则还有另一组计数器。 \tabularnewline
      W    & 计数寄存器宽度位 --- 0: 32 位; 1: 64 位。 \tabularnewline
      K    & 内核模式位。 \tabularnewline
      S    & 管理模式位。 \tabularnewline
      U    & 用户模式位。 \tabularnewline
      EXL  & 例外级指示位。
  \end{regtabular}
  \caption{CP0: PerfCnt 寄存器}
  \label{tab:cp0-PerfCnt}
\end{floattable}

\begin{longtable}{|c|p{8cm}|p{5cm}|}
  \caption{PerfCnt: 计数器 0 事件} \label{tab:perfcnt-cnt0-event} \\
  \hline 事件 & 信号 & 描述 \\ \hhline \endfirsthead
  \caption{PerfCnt: 计数器 0 事件（续）} \\
  \hline 事件 & 信号 & 描述 \\ \hhline \endhead
  \hline \multicolumn{3}{r}{\tiny 未完待续} \endfoot \endlastfoot

  0000 & Cycles                             & 周期 \\
  0001 & Brbus.valid                        & 分支指令 \\
  0010 & Jrcount                            & JR 指令 \\
  0011 & Jr31count                          & JR 指令并且域 rs=31 \\
  0100 & Imemread.valid \& Imemread\_allow  & 一级 I-cache 缺失 \\
  0101 & Rissuebus0.valid                   & Alu1 操作已发射 \\
  0110 & Rissuebus2.valid                   & Mem 操作已发射 \\
  0111 & Rissuebus3.valid                   & Falu1 操作已发射 \\
  1000 & Brbus\_bht                         &  BHT 猜测指令 \\
  1001 & Mreadreq.valid \& Mreadreq\_allow  & 从主存中读 \\
  1010 & Fxqfull                            & 固定发射队列满的次数 \\
  1011 & Roqfull                            & 重排队列满的次数 \\
  1100 & Cp0qfull                           & CP0 队列满的次数 \\
  1101 & Exbus.ex \& ExcCode=34,35          & Tlb 重填例外 \\
  1110 & Exbus.ex \& ExcCode=0              & 例外 (??) \\
  1111 & Exbus.ex \& ExcCode=63 (how come?) & 内部例外 \\ \hline
\end{longtable}

\begin{longtable}{|c|p{8cm}|p{5cm}|}
  \caption{PerfCnt: 计数器 1 事件} \label{tab:perfcnt-cnt1-event} \\
  \hline 事件 & 信号 & 描述 \\ \hhline \endfirsthead
  \caption{PerfCnt: 计数器 1 事件（续）} \\
  \hline 事件 & 信号 & 描述 \\ \hhline \endhead
  \hline \multicolumn{3}{r}{\tiny 未完待续} \endfoot \endlastfoot
  0000 & Cmtbus.valid                        & 提交操作             \\ 
  0001 & Brbus.brerr                         & 分支预测失败         \\ 
  0010 & Jrmiss                              & Jr 预测失败          \\ 
  0011 & Jr31miss                            & Jr 且 rs=31 预测失败 \\ 
  0100 & Dmemread.valid \& Dmemread\_allow   & 一级 DCache 缺失     \\ 
  0101 & Rissuebus1.valid ALU2               & 操作已发射           \\ 
  0110 & Rissuebus4.valid FALU2              & 操作已发射           \\ 
  0111 & Duncache\_valid \& Duncache\_allow  & 访问未缓存           \\ 
  1000 & Brbus\_bhtmiss                      & BHT 猜测错误         \\ 
  1001 & Mwritereq.valid \& Mwritereq\_allow & 写到主存             \\ 
  1010 & Ftqfull                             & 浮点指针队列满的次数 \\ 
  1011 & Brqfull                             & 分支队列满的次数     \\ 
  1100 & Exbus.ex \& Op==OP\_TLBPI           & ITLB 缺失            \\ 
  1101 & Exbus.ex                            & 例外总数             \\ 
  1110 & Mispec                              & 载入投机缺失         \\ 
  1111 & CP0fwd\_valid                       & CP0 队列向前加载     \\ \hline
\end{longtable}

### ErrCtl 寄存器

ErrCtl 是一个 64 位可读写寄存器。龙芯 GS464 将这个 MIPS64 标准里可选的寄存器用于
ECC 校验。 表 \ref{tab:cp0-errctl} 给出了 ErrCtl 寄存器的格式。

\begin{reglongtable}{cp0-errctl}{CP0: ErrCtl 寄存器}
  ECC  & 相关 Cache 的一个双字校验码 \\
  0    & 保留：必须按 0 写入，读时返回 0。
  \label{tab:cp0-errctl}
\end{reglongtable}

### CacheErr、CacheErr1 寄存器

CacheErr 和 CacheErr1 是一对 64 位可读写寄存器。 MIPS64 标准里定义的 ECC 校验是
由软硬件共同完成：硬件负责检查错误，并将错误相关的内容保存在 CacheErr 和
CacheErr1 寄存器中，然后触发 Cache 错例外由软件来纠正错误。表
\ref{tab:cp0-CacheErr} 给出了这两个寄存器的格式， 及各域的含义。

\begin{floattable}
  \regdesc{CacheErr} \\[.2cm]
  \includegraphics[scale=0.875]{../images/cp0-cacheerr} \\[-.3cm]
  \regdesc{CacheErr1} \\[.2cm] 
  \includegraphics[scale=0.875]{../images/cp0-cacheerrI}
  \begin{regtabular}
    ECCWay  & 错误编码域：不同编码表示 Cache 的不同错误。                                 \\ 
    ECCType & 错误类型域 --- 00: 指令缓存; 01: 数据缓存; 10: 二级缓存; 11: 芯片接口总线。 \\ 
    ECCAddr & 校验错虚地址域。                                                            \\ 
    0       & 保留：必须按 0 写入，读时返回 0。
  \end{regtabular}
  \caption{CP0: CacheErr、 CacheErr1 寄存器}
  \label{tab:cp0-CacheErr}
\end{floattable}

### TagLo、TagHi 寄存器

TagLo 和 TagHi 寄存器是一对 32 位可读写寄存器，用于保存一、二级 Cache 的
标签和状态，并将在使用 CACHE 和 MTC0 指令时将其内容写入 Tag 寄存器。
\ref{tab:cp0-TagLoHi} 显示了这两个寄存器用于一级 Cache（P-Cache）操作时的
寄存器格式, 及相应 TagLo 和 TagHi 寄存器各域的定义。

\begin{floattable}
  \regdesc{TagLo} \\[.2cm]
  \includegraphics[scale=0.875]{../images/cp0-taglo} \\[-.3cm]
  \regdesc{TagHi} \\[.2cm]
  \includegraphics[scale=0.875]{../images/cp0-taghi}
  \begin{regtabular}
    PTAG   & 指定物理地址的 39:12 位。                               \\ 
    CS     & Cache 状态域。                                          \\ 
    SCSETI & 对应 Cache 行在二级 Cache 的组号（二级 Cache 该域为 0） \\ 
    0      & 保留：必须按 0 写入，读时返回 0。
  \end{regtabular}
  \caption{CP0: TagLo、 TagHi 寄存器}
  \label{tab:cp0-TagLoHi}
\end{floattable}

### DataLo、 DataHi 寄存器

DataLo 和 DataHi 是一对 64 位只读寄存器，用于 Cache 数据队列交互和诊断。 CACHE
指令的 IndexLoadTag 操作将读取相应数据到 DataLo 或 DataHi 寄存器。表
\ref{tab:cp0-DataLoHi} 给出了 DataLo 和 DataHi 寄存器的格式。

\begin{floattable}
  \regdesc{DataLo} \\[.1cm]
  \includegraphics[scale=0.875]{../images/cp0-datalohi} \\[-.3cm]
  \regdesc{DataHi} \\[.1cm]
  \includegraphics[scale=0.875]{../images/cp0-datalohi}
  \caption{CP0: DataLo、 DataHi 寄存器}
  \label{tab:cp0-DataLoHi}
\end{floattable}

### ErrorEPC 寄存器

ErrorEPC 是一个 64 位可读写寄存器。与 EPC 寄存器类似，ErrorEPC
寄存器含有错误例外后，指令重新开始执行的虚拟地址。 除了 ECC
和奇偶错误例外之外， 它还用于，在复位、软复位、和不可屏蔽中断（NMI）
例外发生时，存储程序返回的地址。 表 \ref{tab:cp0-ErrorEPC} 显示了 ErrorEPC
寄存器的格式。

\begin{reglongtable}{cp0-errorepc}{CP0: ErrorEPC 寄存器}
  ErrorEPC & 错误例外后，指令重新开始执行的虚拟地址
  \label{tab:cp0-ErrorEPC}
\end{reglongtable}

### DESAVE 寄存器

DESAVE 寄存器是一个 64 位可读写寄存器。它是一个功能简单的暂存器，用于在处理
Debug 异常处理时保存一个通用寄存器的值。 DESAVE 寄存器的格式显示在表
\ref{tab:cp0-DESAVE} 中。

\begin{reglongtable}{cp0-desave}{CP0: DESAVE 寄存器}
  DESAVE & 处理 Debug 异常处理时保存一个通用寄存器的值
  \label{tab:cp0-DESAVE}
\end{reglongtable}

