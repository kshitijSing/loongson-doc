\chapter{低速 I/O 控制器配置}

龙芯 3 号的慢速 I/O 控制器包括 PCI/PCIX 控制器、LPC 控制器、UART 控制器、 SPI
控制器、GPIO 以及相关的配置寄存器等等。这些 I/O 控制器共享一个 AXI 端口，来自
CPU 的请求经过地址译码后发送到相应的设备。 表~\ref{tab:lsioAddrSpace}
给出了这些低速设备的内部地址空间划分图
(\remark{需要更低的地址空间也写出来吗？})。

\begin{table}[ht]
  \centering
  \begin{tabular}[h]{|c|c|c|} \hline
    地址名称           &   地址范围                   & 大小 \\ \hhline
    LPC Memory         & 0x1C00\_0000 – 0x1DFF\_FFFF & 32 MByte \\ \hline
    LPC Boot           & 0x1FC0\_0000 – 0x1FCF\_FFFF & 1 MByte \\ \hline
    PCI I/O 空间       & 0x1FD0\_0000 – 0x1FDF\_FFFF & 1 MByte \\ \hline
    PCI 控制器配置空间 & 0x1FE0\_0000 – 0x1FE0\_00FF & 256 Byte \\ \hline
    IO 控制器配置空间  & 0x1FE0\_0100 – 0x1FE0\_01DF & 256 Byte \\ \hline
    UART0 配置空间     & 0x1FE0\_01E0 – 0x1FE0\_01E7 & 8 Byte \\ \hline
    UART1 配置空间     & 0x1FE0\_01E8 – 0x1FE0\_01EF & 8 Byte \\ \hline
    SPI 配置空间       & 0x1FE0\_01F0 – 0x1FE0\_01FF & 16 Byte \\ \hline
    LPC 配置空间       & 0x1FE0\_0200 – 0x1FE0\_02FF & 256 Byte \\ \hline
    PCI 配置空间       & 0x1FE8\_0000 – 0x1FE8\_FFFF & 64 KByte \\ \hline
    LPC I/O 空间       & 0x1FF0\_0000 – 0x1FF0\_FFFF & 64 Kbyte \\ \hline
    PCI MEM            & 其它                         & \\ \hline
  \end{tabular}
  \caption{低速 I/O 设备地址空间}
  \label{tab:lsioAddrSpace}
\end{table}

\section{PCI/PCIX 控制器}

龙芯 3 号的 PCI/PCIX 控制器的实现符合 PCIX 1.0b 和 PCI 2.3 规范。
它的内部还内置了 PCI/PCIX 仲裁器， 既可以作为主桥控制整个 PCI/PCIX 总线，
也可以作为一个普通设备工作在 PCI/PCIX 总线上。

如表~\ref{tab:lsioAddrSpace} 显示， 龙芯 3 号的 PCI/PCIX 控制器的配置空间起始于
0x1FE0\_0000 开始的 256 字节。 表~\ref{tab:pcixConfHeader} 列出了所有的 PCIX
控制器配置寄存器， 而表~\ref{tab:pciISR}
则列出了所有和龙芯具体实现有关的寄存器（Implementation Specific Register,
ISR）位域及其说明。

\begin{longtable}{*{4}{|p{3.2cm}}|c|}
  \caption{PCIX 控制器配置头} \label{tab:pcixConfHeader} \\
  \hline 字节 3 & 字节 2 & 字节 1 & 字节 0 & 地址  \\ \hhline
  \endfirsthead
  \caption{PCIX 控制器配置头（续）} \label{tab:pcixConfHeader} \\
  \hline 字节 3 & 字节 2 & 字节 1 & 字节 0 & 地址  \\ \hhline
  \endhead
  \rmcol{5}{\tiny 未完待续} \endfoot
  \endlastfoot

  \cmcolvb{2}{Device ID} & \cmcolvb{2}{Vendor ID}                  & 00  \\ \hline 
  \cmcolvb{2}{Status} & \cmcolvb{2}{Command}                       & 04  \\ \hline
  \cmcolvb{3}{Class Code} & Revision ID                            & 08  \\ \hline
  BIST & Header Type & Latency Timer & CacheLine Size              & 0C  \\ \hline
  \cmcolvb{4}{Base Address Register 0 (BAR0)}                      & 10  \\ \hline
  \cmcolvb{4}{Base Address Register 1 (BAR1)}                      & 14  \\ \hline
  \cmcolvb{4}{Base Address Register 2 (BAR2)}                      & 18  \\ \hline
  \cmcolvb{4}{Base Address Register 3 (BAR3)}                      & 1C  \\ \hline
  \cmcolvb{4}{Base Address Register 4 (BAR4)}                      & 20  \\ \hline
  \cmcolvb{4}{Base Address Register 5 (BAR5)}                      & 24  \\ \hline
  \cmcolvb{4}{}                                                    & 28  \\ \hline
  \cmcolvb{2}{Subsystem ID} & \cmcolvb{2}{Subsystem Vendor ID}     & 2C  \\ \hline
  \cmcolvb{4}{}                                                    & 30  \\ \hline
  \cmcolvb{3}{} & Capabilities Pointer                             & 34  \\ \hline
  \cmcolvb{4}{}                                                    & 38  \\ \hline
  Maximum Latency & Minimum Grant & Interrupt Pin & Interrupt Line & 3C  \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR40)}            & 40  \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR44)}            & 44  \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR48)}            & 48  \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR4C)}            & 4C  \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR50)}            & 50  \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR54)}            & 54  \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR58)}            & 58  \\ \hline
  \cmcolvb{4}{}                                                    & ... \\ \hline
  \cmcolvb{4}{PCIX Command Register}                               & E0  \\ \hline
  \cmcolvb{4}{PCIX Status Register}                                & E4  \\ \hline
\end{longtable}

龙芯 3A 的 PCIX 控制器支持三个 64 位窗口。 这些窗口的基址是由三对 PCIX
控制寄存器 \{BAR1,~BAR0\}、\{BAR3,~BAR2\}、\{BAR5,~BAR4\} 决定的，
而这三个窗口的大小、 使能以及其它细节则是由做 I/O 控制器配置的三个寄存器
PCI\_Hit0\_Sel, PCI\_Hit1\_Sel, PCI\_Hit2\_Sel 控制的。
它们的具体位域说明见表~\ref{tab:ioConfigReg}。

\begin{longtable}{|c|c|c|c|p{8cm}|}
  \caption{龙芯 PCI 具体实现寄存器（ISR）}\label{tab:pciISR} \\
  \hline 位域 & 位域名 & 访问 & 复位值 & 说明 \\ \hhline
  \endfirsthead
  
  \caption{龙芯 PCI 具体实现寄存器（ISR）（续）}\label{tab:pciISR} \\
  \hline 位域 & 位域名 & 访问 & 复位值 & 说明 \\ \hhline
  \endhead

  \rmcol{5}{\tiny 未完待续} \endfoot
  \endlastfoot

  \lmcolvb{5}{REG\_40 \remark{用ISR\_40如何？}} \\* \hline
  31    & tar\_read\_io         & 读写 & 0    & target 端收到对 IO 或者是不可预取区域的访问 \\ \hline
  30    & tar\_read\_discard    & 读写 & 0    & target 端的 delay 请求被丢弃 \\ \hline
  29    & tar\_resp\_delay      & 读写 & 0    & target 访问何时给出 delay/split 0: 超时后 1: 马上 \\ \hline
  28    & tar\_delay\_retry     & 读写 & 0    & target 访问重试策略 0: 根据内部逻辑（见 29 位） 1: 马上重试 \\ \hline
  27    & tar\_read\_abort\_en  & 读写 & 0    & 若 target 对内部的读请求超时，是否让以 target-abort 回应 \\ \hline
  26:25 & Reserved              & --   & 0    & -- \\ \hline
  24    & tar\_write\_abort\_en & 读写 & 0    & 若 target 对内部的写请求超时，是否让以 target-abort 回应 \\ \hline
  23    & tar\_master\_abort    & 读写 & 0    & 是否允许 master-abort \\ \hline
  22:20 & tar\_subseq\_timeout  & 读写 & 000  & target 后续延迟超时 000: 8 周期 其它: 不支持 \\ \hline
  19:16 & tar\_init\_timeout    & 读写 & 0000 & target 初始延迟超时 PCI 模式下 0: 16 周期 1-7: 禁用计数器 8-15: 8-15 周期 PCIX 模式下超时计数固定为 8 周期，此处配置影响最大的 delay 访问数 0: 8 delay 访问 8: 1 delay 访问 9: 2 delay 访问 10: 3 delay 访问 11: 4 delay 访问 12: 5 delay 访问 13: 6 delay 访问 14: 7 delay 访问 15: 8 delay 访问 \\ \hline
  15:4  & tar\_pref\_boundary   & 读写 & 000h & 可预取边界配置（以 16 字节为单位） FFF: 64KB 到 16byte FFE: 64KB 到 32byte FF8: 64KB 到 128byte \\ \hline
  3     & tar\_pref\_bound\_en  & 读写 & 0    & -- \\ \hline
  2     & Reserved (??)         & --   & 0    & 使用 tar\_pref\_boundary 的配置 0: 预取到设备边界 1: 使用 tar\_pref\_boundary \\ \hline
  1     & tar\_splitw\_ctrl     & 读写 & 0    & target split 写控制 0: 阻挡除 Posted Memory Write 以外的访问 1: 阻挡所有访问，直至 split 完成 \\ \hline
  0     & mas\_lat\_timeout     & 读写 & 0    & 禁用 mater 访问超时 0: 允许 master 访问超时 1: 不允许 \\ \hline

  \lmcolvb{5}{REG\_44} \\* \hline
  31:0  & Reserved              & --   & --   & -- \\ \hline

  \lmcolvb{5}{REG\_48} \\* \hline
  31:0  & tar\_pending\_seq     & 读写 & 0    & target 未处理完的请求号位向量 对应位写 1 可清 \\ \hline

  \lmcolvb{5}{REG\_4C} \\* \hline
  31:30 & Reserved              & -    & -   & \\ \hline
  29    & mas\_write\_defer     & 读写 & 0   & 允许后续的读越过前面未完成的写 (只对 PCI 有效) \\ \hline
  28    & mas\_read\_defer      & 读写 & 0   & 允许后续的读写越过前面未完成的读 (只对 PCI 有效) \\ \hline
  27    & mas\_io\_defer\_cnt   & 读写 & 0   & 在外的最大 IO 请求数 0: 由控制, 1: 1 (?) \\ \hline
  26:24 & mas\_read\_defer\_cnt & 读写 & 010 & master 支持在外读的最大数(只对 PCI 有效） 0: 8 1-7: 1-7 注：一个双地址周期访问占两项 \\ \hline
  23:16 & err\_seq\_id          & 只读 & 00h & target/master 错误号 \\ \hline
  15    & err\_type             & 只读 & 0   & target/master 出错的命令类型 0: \\ \hline
  14    & err\_module           & 只读 & 0   & 出错的模块 0: target 1: master \\ \hline
  13    & system\_error         & 读写 & 0   & target/master 系统错（写 1 清） \\ \hline
  12    & data\_parity\_error   & 读写 & 0   & target/master 数据奇偶错（写 1 清） \\ \hline
  11    & ctrl\_parity\_error   & 读写 & 0   & target/master 地址奇偶错（写 1 清） \\ \hline
  10:0  & Reserved              & -    & -   & \\ \hline

  \lmcolvb{5}{REG\_50} \\* \hline
  31:0 & mas\_pending\_seq      & 读写 & 0   & master 未处理完的请求号位向量 对应位写 1 可清 \\ \hline

  \lmcolvb{5}{REG\_54} \\* \hline
  31:0 & mas\_split\_err        & 读写 & 0   & split 返回出错的请求号位向量 \\ \hline

  \lmcolvb{5}{REG\_58} \\* \hline
  31:30 & Reserved             & -    & -   & \\ \hline
  29:28 & tar\_split\_priority & 读写 & 0   & target split 返回优先级 0 最高, 3 最低 \\ \hline
  27:26 & mas\_req\_priority   & 读写 & 0   & master 对外的优先级 0 最高, 3 最低 \\ \hline
  25    & Priority\_en         & 读写 & 0   & 仲裁算法 （在 master 的访问和 target 的
                                              split 返回间做仲裁） 0: 固定优先级 1: 轮转 \\ \hline
  24:18 & 保留                 & -    & -   & \\ \hline
  17    & mas\_retry\_aborted  & 读写 & 0   & master 重试取消（写 1 清） \\ \hline
  16    & mas\_trdy\_timeout   & 读写 & 0   & master TRDY 超时计数 \\ \hline
  15:8  & mas\_retry\_value    & 读写 & 00h & master 重试次数 0: 无限重试 1-255: 1-255 次 \\ \hline
  7:0   & mas\_trdy\_count     & 读写 & 00h & master TRDY 超时计数器 0: 禁用 1-255: 1-255 拍 \\ \hline
\end{longtable}

FIXME: put more details about the PCI controller, copy some materials from the
2F document.

\subsection{PCIX I/O 控制器配置}

PCIX I/O 配置寄存器主要用于配置 PCI/PCIX 控制器的地址窗口、仲裁器以及 GPIO
控制器。表~\ref{tab:ioConfigReg} 列出了所有的 PCIX I/O
配置寄存器，而这些寄存器的详细说明则在表~\ref{tab:ioConfigRegDetail} 中给出。

\begin{longtable}{|c|l|l|}
  \caption{PCIX I/O 控制寄存器}\label{tab:ioConfigReg} \\
  \hline 地址偏移 & \cellalign{c|}{寄存器名} & \cellalign{c|}{说明} \\ \hhline \endfirsthead
  \caption{PCIX I/O 控制寄存器（续）}\label{tab:ioConfigReg} \\
  \hline 地址偏移 & \cellalign{c|}{寄存器名} & \cellalign{c|}{说明} \\ \hhline \endhead
  \rmcol{3}{\tiny 未完待续} \endfoot
  \endlastfoot

  00 & PonCfg & 上电配置 \\ \hline
  04 & GenCfg & 常规配置 \\ \hline
  08 & -- & 保留 \\ \hline
  0C & -- & 保留 \\ \hline
  10 & PCIMap & PCI 映射 \\ \hline
  14 & PCIX\_Bridge\_Cfg & PCIX 桥相关配置 \\ \hline
  18 & PCIMap\_Cfg & PCI 配置读写设备地址 \\ \hline
  1C & GPIO\_Data & GPIO数据 \\ \hline
  20 & GPIO\_EN & GPIO方向 \\ \hline
  24 & -- & 保留 \\ \hline
  28 & -- & 保留 \\ \hline
  2C & -- & 保留 \\ \hline
  30 & -- & 保留 \\ \hline
  34 & -- & 保留 \\ \hline
  38 & -- & 保留 \\ \hline
  3C & -- & 保留 \\ \hline
  40 & Mem\_Win\_Base\_L & 可预取窗口基址低32位 \\ \hline
  44 & Mem\_Win\_Base\_H & 可预取窗口基址高32位 \\ \hline
  48 & Mem\_Win\_Mask\_L & 可预取窗口掩码低32位 \\ \hline
  4C & Mem\_Win\_Mask\_H & 可预取窗口掩码高32位 \\ \hline
  50 & PCI\_Hit0\_Sel\_L & PCI窗口0控制低32位 \\ \hline
  54 & PCI\_Hit0\_Sel\_H & PCI窗口0控制高32位 \\ \hline
  58 & PCI\_Hit1\_Sel\_L & PCI窗口1控制低32位 \\ \hline
  5C & PCI\_Hit1\_Sel\_H & PCI窗口1控制高32位 \\ \hline
  60 & PCI\_Hit2\_Sel\_L & PCI窗口2控制低32位 \\ \hline
  64 & PCI\_Hit2\_Sel\_H & PCI窗口2控制高32位 \\ \hline
  68 & PXArb\_Config & PCIX仲裁器配置 \\ \hline
  6C & PXArb\_Status & PCIX仲裁器状态 \\ \hline
\end{longtable}

在发起配置空间读写前，应用程序应先配置好 PCIMap\_Cfg 寄存器，告诉控
制器欲发起的配置操作的类型和高 16 位地址线上的值。然后对 0x1fe80000 开始 的 2K
空间进行读写即可访问对应设备的配置头。 设备号由根据 PCIMap\_Cfg[15:0]
从低到高优先编码得到。 配置操作地址生成见图 10-1。

图 10-1 配置读写总线地址生成

\begin{longtable}{|c|l|c|l|p{7cm}|}
  \caption{IO 控制寄存器位域解释}\label{tab:ioConfigRegDetail} \\
  \hline 位域 & 字段名 & 访问 & 复位值 & 说明\\ \hhline \endfirsthead
  \caption{IO 控制寄存器位域解释（续）}\label{tab:ioConfigRegDetail} \\
  \hline 位域 & 字段名 & 访问 & 复位值 & 说明\\ \hhline \endhead
  \rmcol{5}{\tiny 未完待续} \endfoot
  \endlastfoot

  \lmcolvb{5}{CR00: PonCfg} \\* \hline
  31:24 & 保留 & 只读 &  &  \\ \hline
  23:16 & pon\_pci\_config & 只读 & pci\_config & PCI\_Config 引脚值 \\ \hline
  15:8 & 保留 & 只读 & lio\_ad[15:8] &  \\ \hline
  7:0 & pcix\_bus\_dev & 只读 & lio\_ad[7:0] & PCIX Agent模式下CPU取指所使用的总线、设备号 \\ \hline

  \lmcolvb{5}{CR04, CR08: 保留} \\* \hline
  31:0 & 保留 & 只读 & 0 &  \\ \hline

  \lmcolvb{5}{CR10: PCIMap} \\* \hline
  31:18 & 保留 & 只读 & 0 &  \\ \hline
  17:12 & trans\_lo2 & 读写 & 0 & PCI\_Mem\_Lo2窗口映射地址高6位 \\ \hline
  11:6 & trans\_lo1 & 读写 & 0 & PCI\_Mem\_Lo1窗口映射地址高6位 \\ \hline
  5:0 & trans\_lo0 & 读写 & 0 & PCI\_Mem\_Lo0窗口映射地址高6位 \\ \hline

  \lmcolvb{5}{CR14: PCIX\_Bridge\_Cfg} \\* \hline
  31:18 & 保留 & 只读 & 0 &  \\ \hline
  6 & pcix\_ro\_en & 读写 & 0 & PCIX桥是否允许写越过读 \\ \hline
  5:0 & pcix\_rgate & 读写 & 6'h18 & PCIX模式下向DDR2发读取数门限 \\ \hline

  \lmcolvb{5}{CR18: PCIMap\_Cfg} \\* \hline
  31:17 & 保留 & 只读 & 0 &  \\ \hline
  16 & conf\_type & 读写 & 0 & 配置读写的类型 \\ \hline
  15:0 & dev\_addr & 读写 & 0 & PCI配置读写时AD线高16位 \\ \hline

  \lmcolvb{5}{CR1C: GPIO\_Data} \\* \hline
  31:20 & 保留 & 只读 & 0 &  \\ \hline
  19:16 & gpio\_in & 读写 & 0 & GPIO输入数据 \\ \hline
  15:4 & 保留 & 只读 & 0 &  \\ \hline
  3:0 & gpio\_out & 读写 & 0 & GPIO输出数据 \\ \hline

  \lmcolvb{5}{CR20: GPIO\_EN} \\* \hline
  31:4 & 保留 & 只读 & 0 &  \\ \hline
  3:0 & gpio\_en & 读写 & F & 高为输入，低输出 \\ \hline

  \lmcolvb{5}{CR24,2C,30,34,38,3C:保留} \\ \hline
  31:0 & 保留 & 只读 & 0 & 保留 \\ \hline

  \lmcolvb{5}{CR50,54/58,5C/60,64: PCI\_Hit*\_Sel} \\* \hline
  63 & burst\_cap & 读写 & 1 & 是否允许突发传送 \\ \hline
  62:12 & bar\_mask & 读写 & 0 & 窗口大小掩码（高位1，低位0） \\ \hline
  11:4 & 保留 & 只读 & 0 &  \\ \hline
  3 & pref\_en & 读写 & 0 & 预取使能 \\ \hline
  2:1 & pci\_img\_size & 读写 & 2'b11 & 00: 32位；10: 64位；其它: 无效 \\ \hline
  0 & 保留 & 只读 & 0 &  \\ \hline

  \lmcolvb{5}{CR68:PXArb\_Config} \\* \hline
  31:13 & 保留 & 只读 & 0 &  \\ \hline
  23:16 & rude\_dev & 读写 & 0 &
  强制优先级设备为1的位对应的PCI设备在得到总线后可以通过持续请求来占住总线 \\
  \hline
  15:8 & level & 读写 & 8'h01 & 处于第一级的设备 \\ \hline
  7:6 & park\_delay & 读写 & 2'b11 &
  从没有设备请求总线开始到触发停靠默认设备行为的延迟 00: 0 周期 01: 8 周期 10:
  32 周期 11: 128 周期 \\ \hline
  5:3 & default\_master & 读写 & 0 & 总线停靠默认主设备号 \\ \hline
  2 & default\_mas\_en & 读写 & 1 & 总线停靠到默认主设备
  0：停靠到最后一个主设备 1：停靠到默认主设备 \\ \hline 1 & disable\_broken &
  读写 & 0 & 禁用损坏的主设备 \\ \hline
  0 & device\_en & 读写 & 1 & 外部设备允许 \\ \hline

  \lmcolvb{5}{CR6C: PXArb\_Status} \\* \hline
  31:11 & 保留 & 只读 & 0 &  \\ \hline
  10:8 & Last\_master & 只读 & 0 & 最后使用总线的主设备 \\ \hline
  7:0 & broken\_master & 只读 & 0 & 损坏的主设备（改变禁用策略时清零） \\ \hline
\end{longtable}

PCI/PCIX 仲裁器实现了两级轮转仲裁、总线停靠和损坏主设备的隔离：其配置和状态由
PXArb\_Config 和 PXArb\_Status 寄存器控制。PCI/PCIX
总线请求与应答线分配见表~\ref{tab:pciBusRAalloc}。
\begin{table}[ht]
  \centering
  \begin{tabular}{|c|l|} \hline
    请求与应答线 & 描述 \\ \hline
    0   & 内部集成 PCI/PCIX 控制器 \\ \hline
    7:1 & 外部请求 6~0 \\ \hline
  \end{tabular}
  \caption{PCI/PCIX 总线请求与应答线分配}
  \label{tab:pcibusraalloc}
\end{table}

基于轮转的 PCIX 仲裁算法对设备提供了两个不同级别，
其特点是第二级整体作为一个一级成员进行调度。
当多个设备同时申请总线时，轮转完一次第一级设备，如果第二级
整体被选中，那么第二级中优先级最高的设备将得到总线
(\remark{如果优先级相同呢，随机或者不可能出现？})。
仲裁器被设计成任何时候只要条件允许就可以切换： 对于一些不符合协议的 PCI
设备，这样做可能会使之不正常。 软件可以使用强制优先级
可以让这些设备通过持续请求来占有总线。
总线停靠是指当没有设备请求使用总线时是否选择其中一个给出允许信号。
对于已经得到允许的设备而言， 直接发起总线操作能够提高效率。 龙芯 3 号的 PCI
仲裁器提供两种停靠模式： 最后一个主设备和默认主设备。如果在特殊场合下没有设备
能够停靠，则可以将仲裁器设置为停靠到默认 0 号主设备（内部控制器），且设置依靠
延迟为 0。

\section{LPC 控制器}

\noindent LPC (Low-Pin Count) 控制器具有以下特性：
\begin{itemize}
  \item 符合 LPC1.1 规范；
  \item 支持 LPC 访问超时计数器；
  \item 支持 Memory Read、Memory write 访问类型；
  \item 支持 Firmware Memory Read、Firmware Memory Write 访问类型（单字节）；
  \item 支持 I/O read、I/O write 访问类型；
  \item 支持 Memory 访问类型地址转换；
  \item 支持 Serizlized IRQ 规范，提供 17 个中断源。
\end{itemize}

如表~\ref{tab:lsioAddrSpace} 显示，有四个与 LPC
控制器相关的地址空间，它们分别是 LPC Boot，LPC Memory，LPC I/O 空间，和 LPC
配置空间；同时 LPC 配置空间的基地址为 0x1FE0\_0200。 LPC 控制器配置寄存器由 4
个 32 位寄存器组成。这些配置寄存器的含义见表~\ref{tab:LPCreg}。

与 LPC 相关的地址空间中， LPC Boot
是系统启动时处理器最先访问的地址空间。这个地址空间支持 LPC Memory 或 Firmware
Memory 这两种不同访问类型。系统启动时发出哪种访问类型由 LPC\_ROM\_INTEL
引脚控制(\remark{where is the definition of this signal?})。LPC\_ROM\_INTEL
引脚上拉时发出 LPC Firmware Memory 访问，下拉时发出 LPC Memory 访问 类型。

LPC Memory 地址空间是系统用 Memory/Firmware Memory 访问的地址空间。 LPC
控制器发出哪种类型的内存访问，由 LPC 控制器的配置寄存器 REG1 的
LPC\_MEM\_IS\_FWH 位决定。 处理器发往这个地址空间的地址可以进行地址转换。
转换后的地址由 LPC 控制器的配置寄存器 REG0 的 LPC\_MEM\_TRANS 位设置。
处理器发往 LPC I/O 地址空间的访问按照 LPC I/O 访问类型发往 LPC 总线，
地址为地址空间的低 16 位。

\begin{table}
  \centering
  \begin{tabular}{|l|l|c|c|p{6cm}|} \hline
    位域        & 字段名             & 访问 & 复位值 & 说明 \\ \hhline
    \multicolumn{5}{|l|}{REG0} \\ \hline
    REG0[31] & SIRQ\_EN              & 读写 & 0      & SIRQ 使能控制 \\ \hline
    REG0[23:16] & LPC\_MEM\_TRANS    & 读写 & 0      & LPC Memory 空间地址转换控制 \\ \hline
    REG0[15:0]  & LPC\_SYNC\_TIMEOUT & 读写 & 0      & LPC 访问超时计数器 \\ \hhline
    \multicolumn{5}{|l|}{REG1} \\ \hline
    REG1[31] & LPC\_MEM\_IS\_FWH     & 读写 & 0      & LPC Memory 空间访问类型设置 \\ \hline
    REG1[17:0]  & LPC\_INT\_EN       & 读写 & 0      & LPC SIRQ 中断使能 \\ \hhline
    \multicolumn{5}{|l|}{REG2} \\ \hline
    REG2[17:0]  & LPC\_INT\_SRC      & 读写 & 0      & LPC SIRQ 中断源指示 \\ \hhline
    \multicolumn{5}{|l|}{REG3} \\ \hline
    REG3[17:0]  & LPC\_INT\_CLEAR    & 写   & 0      & LPC SIRQ 中断清除 \\ \hhline
  \end{tabular}
  \caption{LPC 配置寄存器含义}
  \label{tab:LPCreg}
\end{table}

\section{UART 控制器}

\noindent 龙芯 3 号的 UART 控制器具有以下特性
\begin{itemize}
  \item 全双工异步数据接收/发送；
  \item 可编程的数据格式；
  \item 16 位可编程时钟计数器；
  \item 支持接收超时检测；
  \item 带仲裁的多中断系统；
  \item 仅工作在 FIFO 方式；
  \item 在寄存器与功能上兼容 NS16550A。
\end{itemize}
本模块有两个并行工作 UART 接口， 它们的功能寄存器完全一样， 只是访问基址不同。
如表~\ref{tab:lsioAddrSpace} 显示， UART0 和 UART1 的寄存器物理地址基址分别为
0x1FE0\_01E0， 0x1FE0\_01E8。 每个 UART 控制器都有 10 个 8
位的控制寄存器，他们的详细信息列在表~\ref{tab:UARTConfigReg} 中。

\begin{table}
  \centering
  \begin{tabular}{|c|cc|cc|} \hline
             & \cmcolvb{2}{DLAB = 0} & \cmcolvb{2}{DLAB = 1} \\
    I/O 地址 &     读     &    写    &     读     &     写  \\ \hhline
    base   & DAT & DAT & LSB & LSB \\
    base+1 & IER & IER & MSB & MSB \\
    base+2 & IIR & FCR & IIR & FCR \\
    base+3 & LCR & LCR & LCR & LCR \\
    base+4 & MCR & MCR & MCR & MCR \\
    base+5 & LSR & --  & LSR & --  \\
    base+6 & MSR & --  & MSR & --  \\
    base+7 & SCR & SCR & SCR & SCR \\ \hline
  \end{tabular}
  \caption{UART 转换表：端口 vs 寄存器}
  \label{tab:UARTport2regTable}
\end{table}


\begin{longtable}{|c|c|c|c|p{9cm}|}
  \caption{UART 控制寄存器说明}\label{tab:UARTConfigReg} \\
  \hline 位域 & 位域名 & 位宽 & 访问 & 说明 \\ \hhline \endfirsthead
  \caption{UART 控制寄存器说明（续）} \\
  \hline 位域 & 位域名 & 位宽 & 访问 & 说明 \\ \hhline \endhead

  \rmcol{5}{\tiny 未完待续} \endfoot
  \endlastfoot

  \lmcolvb{5}{数据寄存器（DAT）；地址偏移：0x00；复位值：0x00} \\* \hline
  7:0 & Tx FIFO & 8 & W  & 数据传输寄存器 \\ \hhline

  \lmcolvb{5}{中断使能寄存器（IER）；地址偏移：0x01；复位值：0x00} \\* \hline
  7:4 & Reserved & 4 & RW & 保留 \\ \hline
  3   & IME      & 1 & RW & Modem 状态中断使能 `0' – 关闭 `1'   – 打开 \\ \hline
  2   & ILE      & 1 & RW & 接收器线路状态中断使能 `0' – 关闭  `1' – 打开 \\ \hline
  1   & ITxE     & 1 & RW & 传输保存寄存器为空中断使能 `0' – 关闭 `1' – 打开 \\ \hline
  0   & IRxE     & 1 & RW & 接收有效数据中断使能 `0' – 关闭 `1' – 打开       \\ \hhline

  \lmcolvb{5}{中断标识寄存器（IIR）；地址偏移：0x02；复位值：0xC1} \\* \hline
  7:4 & Reserved & 4 & R & 保留 \\ \hline
  3:1 & II       & 3 & R & 中断源表示位，详见下表 \\ \hline
  0   & INTp     & 1 & R & 中断表示位 \\ \hhline
  
  \lmcolvb{5}{FIFO控制寄存器（FCR）；地址偏移：0x03；复位值：0xC0} \\* \hline
  7:6 & TL & 2 & W & 接收 FIFO 提出中断申请的 trigger 值 ``00'' 1 字节 ``01'' 4 字节 ``10'' 8 字节 ``11'' 14 字节 \\ \hline
  5:3 & Reserved & 3 & W & 保留 \\ \hline
  2   & Txset    & 1 & W & ``1'' 清除发送 FIFO 的内容，复位其逻辑 \\ \hline
  1   & Rxset    & 1 & W & ``1'' 清除接收 FIFO 的内容，复位其逻辑 \\ \hline
  0   & Reserved & 1 & W & 保留 \\ \hhline

  \lmcolvb{5}{线路控制寄存器（LCR）；地址偏移：0x0；复位值：0x00} \\* \hline
  7   & dlab & 1 & RW & 分频锁存器访问位 `1' – 访问操作分频锁存器 `0' – 访问操作正常寄存器 \\ \hline
  6   & bcb  & 1 & RW & 打断控制位 `1' – 此时串口的输出被置为 0(打断状 态).  `0' – 正常操作 \\ \hline
  5   & spb  & 1 & RW & 指定奇偶校验位 `0' – 不用指定奇偶校验位 `1' – 如果 LCR[4]位是 1 则传输和检查奇 偶校验位为 0。如果 LCR[4]位是 0 则传输 和检查奇偶校验位为 1。 \\ \hline
  4   & eps  & 1 & RW &  奇偶校验位选择 `0' – 在每个字符中有奇数个 1（包括数 据和奇偶校验位） `1' –在每个字符中有偶数个 1 \\ \hline
  3   & pe   & 1 & RW & 奇偶校验位使能 `0' – 没有奇偶校验位 `1' – 在输出时生成奇偶校验位，输入则 判断奇偶校验位 \\ \hline
  2   & sb   & 1 & RW & 定义生成停止位的位数 `0' – 1 个停止位 `1' – 在 5 位字符长度时是 1.5 个停止位， 其他长度是 2 个停止位 \\ \hline
  1:0 & bec  & 2 & RW & 设定每个字符的位数 `00' – 5 位 `01' – 6 位 `10' – 7 位 `11' – 8 位 \\ \hhline

  \lmcolvb{5}{MODEM控制寄存器（MCR）；地址偏移：0x0；复位值：0x00} \\* \hline
  7:5 & Reserved & 3 & W & 保留 \\ \hline
  4   & Loop     & 1 & W & 回环模式控制位 `0' – 正常操作 `1' –回环模式。在在回环模式中，TXD 输出一直为 1，   输出移位寄存器直接连到 输入移位寄存器中。其他连接如下。 DTR  DSR RTS  CTS Out1 RI Out2  DCD \\ \hline
  3   & OUT2     & 1 & W & 在回环模式中连到 DCD 输入 \\ \hline
  2   & OUT1     & 1 & W & 在回环模式中连到 RI 输入 \\ \hline
  1   & RTSC     & 1 & W & RTS 信号控制位 \\ \hline
  0   & DTRC     & 1 & W & DTR 信号控制位 \\ \hhline

  \lmcolvb{5}{线路状态寄存器（LSR）；地址偏移：0x0；复位值：0x00} \\* \hline
  7 & ERROR & 1 & R & 错误表示位 `1' – 至少有奇偶校验位错误，帧错误或 打断中断的一个。 `0' – 没有错误 \\ \hline
  6 & TE    & 1 & R & 传输为空表示位 `1' – 传输 FIFO 和传输移位寄存器都为 空。给传输 FIFO 写数据时清零 `0' – 有数据 \\ \hline
  5 & TFE   & 1 & R & 传输 FIFO 位空表示位 `1' – 当前传输 FIFO 为空，给传输 FIFO 写数据时清零 `0' – 有数据 \\ \hline
  4 & BI    & 1 & R & 打断中断表示位 `1' –接收到 起始位＋数据＋奇偶位＋停 止位都是 0，即有打断中断 `0' – 没有打断 \\ \hline
  3 & FE    & 1 & R & 帧错误表示位 `1' – 接收的数据没有停止位 `0' – 没有错误 \\ \hline
  2 & PE    & 1 & R & 奇偶校验位错误表示位 `1' – 当前接收数据有奇偶错误 `0' – 没有奇偶错误 \\ \hline
  1 & OE    & 1 & R & 数据溢出表示位 `1' – 有数据溢出 `0' – 无溢出 \\ \hline
  0 & DR    & 1 & R & 接收数据有效表示位 `0' – 在 FIFO 中无数据 `1' – 在 FIFO 中有数据 \\ \hhline

  \lmcolvb{5}{MODEM状态寄存器（MSR）；地址偏移：0x0；复位值：0x00} \\* \hline
  7 & CDCD & 1 & R & DCD 输入值的反， 或者在回环模式中连到 Out2 \\ \hline
  6 & CRI  & 1 & R & RI 输入值的反，或者在回环模式中连到 OUT1 \\ \hline
  5 & CDSR & 1 & R & DSR 输入值的反， 或者在回环模式中连到 DTR \\ \hline
  4 & CCTS & 1 & R & CTS 输入值的反，或者在回环模式中连到 RTS \\ \hline
  3 & DDCD & 1 & R & DDCD 指示位 \\ \hline
  2 & TERI & 1 & R & RI 边沿检测。RI 状态从低到高变化 \\ \hline
  1 & DDSR & 1 & R & DDSR 指示位 \\ \hline
  0 & DCTS & 1 & R & DCTS 指示位 \\ \hhline

  \lmcolvb{5}{分频锁存器 1；地址偏移：0x0；复位值：0x00} \\* \hline
  7:0 & LSB & 8 & RW & 存放分频锁存器的低 8 位 \\ \hhline

  \lmcolvb{5}{分频锁存器 2；地址偏移：0x0；复位值：0x00} \\* \hline
  7:0 & MSB & 8 & RW & 存放分频锁存器的高 8 位 \\ \hhline
\end{longtable}

对 LSR 寄存器进行读操作时，LSR[4:1]和 LSR[7]被清零，LSR[6:5]在给传输 FIFO
写数据时清零，LSR[0]则对接收 FIFO 进行判断。

\begin{longtable}{|c|c|c|c|p{3cm}|p{4cm}|p{3cm}|}
  \caption{中断控制功能表} \label{tab:LPCInt} \\

  \hline Bit3 & Bit2 & Bit1 & 优先级 &  中断类型 & 中断源 & 中断复位控制 \\ \hhline
  \endhead
  \endfoot \endlastfoot

  0  &   1   &   1   &  1st   &  接收线路状态 &
  奇偶、溢出或帧错误，或打断中断     & 读 LSR \\ \hline

  0  &   1   &   0   &  2nd   &  接收到有效数据     &
  FIFO 的字符个数达到 trigger 的水平 & FIFO 的字符个数低于 trigger 的值 \\
  \hline

  1  &   1   &   0   &  2nd   &  接收超时 &
  在 FIFO 至少有一个字符，但在 4 个字符时间内没有任何操作，包括读和写操作 &
  读接收 FIFO \\ \hline

  0  &   0   &   1   &  3rd   &  传输保存寄存器为空 &
  传输保存寄存器为空 & 写数据到 THR 或者多 IIR \\ \hline

  0  &   0   &   0   &  4th   &  Modem 状态 &
  CTS, DSR, RI or DCD & 读 MSR \\ \hline
\end{longtable}

\section{SPI 控制器}

龙芯 3 号的 SPI (serial peripheral interface) 控制器具有以下特性：
\begin{itemize}
  \item 全双工同步串口数据传输；
  \item 支持到 4 个的变长字节传输；
  \item 主模式支持；
  \item 模式故障产生错误标志并发出中断请求；
  \item 双缓冲接收器；
  \item 极性和相位可编程的串行时钟；
  \item 可在等待模式下对 SPI 进行控制。
\end{itemize}

SPI 控制器模块寄存器物理地址基址为 0x1FE001F0。

\begin{longtable}{|c|c|c|c|p{6cm}|}
  \caption{SPI 控制器模块寄存器}\label{tab:spiReg} \\
  \hline 位域 & 位域名 & 位宽 & 访问 & 描述 \\ \hhline \endfirsthead
  \caption{SPI 控制器模块寄存器（续）}\label{tab:spiReg} \\
  \hline 位域 & 位域名 & 位宽 & 访问 & 描述 \\ \hhline \endhead
  \rmcol{5}{\tiny 未完待续} \endfoot
  \endlastfoot
 
  \lmcolvb{5}{控制寄存器（SPCR）  0x00 0x10} \\* \hline
  7 & Spie & 1 & RW & 中断输出使能信号 高有效 \\
  6 & spe & 1 & RW & 系统工作使能信号高有效 \\
  5 & -- & 1 & RW & 保留 \\
  4 & mstr & 1 & RW & master模式选择位，此位一直保持1 \\
  3 & cpol & 1 & RW & 时钟极性位 \\
  2 & cpha & 1 & RW & 时钟相位位1则相位相反，为0则相同 \\
  1:0 & spr & 2 & RW & 与SPER:spre一起设定sclk\_o分频 \\ \hhline

  \lmcolvb{5}{状态寄存器（SPSR）  0x01 0x05} \\* \hline
  7 & spif & 1 & RW & 中断标志位1表示有中断申请，写1则清零 \\
  6 & wcol & 1 & RW & 写寄存器溢出标志位 为1表示已经溢出,写1则清零 \\
  5:4 & -- & 2 & RW & 保留 \\
  3 & wffull & 1 & RW & 写寄存器满标志1表示已经满 \\
  2 & wfempty & 1 & RW & 写寄存器空标志1表示空 \\
  1 & rffull & 1 & RW & 读寄存器满标志1表示已经满 \\
  0 & rfempty & 1 & RW & 读寄存器空标志1表示空 \\ \hhline

  \lmcolvb{5}{数据寄存器（TxFIFO）0x02 0x00} \\* \hline
  7:0 & Tx FIFO & 8 & W & 数据传输寄存器 \\ \hhline

  \lmcolvb{5}{外部寄存器（SPER）  0x03 0x00} \\* \hline
  7:6 & icnt & 2 & RW &
  传输完多少个字节后送出中断申请信号。 00: 1字节; 01: 2字节; 10: 3字节; 11:
  3字节(??)。 \\ 5:2 & -- & 4 & RW & 保留 \\
  1:0 & spre & 2 & RW & 与SPCR:spr一起设定分频比率 \\ \hline
\end{longtable}

\begin{table}
  \centering
  \begin{tabular}{*{13}{|c}|} \hline
    SPER:spre & 00 & 01 & 10 & 11 & 00 & 01 & 10 & 11 & 00 & 01 & 10 & 11 \\ \hline
    SPCR:spr  & 00 & 00 & 00 & 00 & 01 & 01 & 01 & 01 & 10 & 10 & 10 & 10 \\ \hline
    分频系数 & 2 & 4 & 16 & 32 & 8 & 64 & 128 & 256 & 512 & 1024 & 2048 & 4096 \\ \hline
  \end{tabular}
  \caption{SPI 设备分频系数}
  \label{tab:SPIFreqTable}
\end{table}

