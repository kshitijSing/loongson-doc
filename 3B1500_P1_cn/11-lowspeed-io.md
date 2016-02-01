低速 I/O 控制器配置
===================

龙芯 3 号的慢速 I/O 控制器包括 PCI/PCI-X 控制器、LPC 控制器、UART 控制器、 SPI
控制器、GPIO 以及相关的配置寄存器等等。这些 I/O 控制器共享一个二级交叉开关端口，
来自 CPU 的请求经过地址译码后发送到相应的设备。 表 \ref{tab:lsioAddrSpace}
给出了这些低速设备的内部地址空间划分图。

\begin{table}[ht]
  \centering
  \caption{低速 I/O 设备地址空间}
  \begin{tabular}[h]{|c|c|c|} \hline
    地址名称           &   地址范围                  & 大小     \\ \hhline
    LPC Memory         & 0x1C00\_0000 – 0x1DFF\_FFFF & 32 MByte \\ \hline
    LPC Boot           & 0x1FC0\_0000 – 0x1FCF\_FFFF & 1 MByte  \\ \hline
    PCI I/O 空间       & 0x1FD0\_0000 – 0x1FDF\_FFFF & 1 MByte  \\ \hline
    PCI 控制器配置空间 & 0x1FE0\_0000 – 0x1FE0\_00FF & 256 Byte \\ \hline
    IO 控制器配置空间  & 0x1FE0\_0100 – 0x1FE0\_01DF & 256 Byte \\ \hline
    UART0 配置空间     & 0x1FE0\_01E0 – 0x1FE0\_01E7 & 8 Byte   \\ \hline
    UART1 配置空间     & 0x1FE0\_01E8 – 0x1FE0\_01EF & 8 Byte   \\ \hline
    LPC 配置空间       & 0x1FE0\_0200 – 0x1FE0\_021F & 32 Byte  \\ \hline
    SPI 配置空间       & 0x1FE0\_0220 – 0x1FE0\_022F & 16 Byte  \\ \hline
    PCI 配置空间       & 0x1FE8\_0000 – 0x1FE8\_FFFF & 64 KByte \\ \hline
    LPC I/O 空间       & 0x1FF0\_0000 – 0x1FF0\_FFFF & 64 Kbyte \\ \hline
  \end{tabular}
  \label{tab:lsioAddrSpace}
\end{table}

PCI/PCI-X 控制器
----------------

龙芯 3 号的 PCI/PCI-X 控制器的实现符合 PCI-X 1.0b 和 PCI 2.3 规范。
它的内部还内置了 PCI/PCI-X 仲裁器， 既可以作为主桥控制整个 PCI/PCI-X 总线，
也可以作为一个普通设备工作在 PCI/PCI-X 总线上。

如表 \ref{tab:lsioAddrSpace} 显示， 龙芯 3 号的 PCI/PCI-X 控制器的配置空间起始于
0x1FE0\_0000 开始的 256 字节。 表 \ref{tab:pcixConfHeader} 列出了所有的 PCI-X
控制器配置寄存器。

\setlength{\tabcolsep}{2pt}
\begin{longtable}[c]{*{4}{|>{\centering}p{3.4cm}}|c|}
  \caption{PCI-X 控制器配置头} \label{tab:pcixConfHeader} \\ \hline
  字节 3 & 字节 2 & 字节 1 & 字节 0 & 偏移  \\ \hhline
  \endfirsthead
  \caption{PCI-X 控制器配置头（续）} \\ \hline
  字节 3 & 字节 2 & 字节 1 & 字节 0 & 偏移  \\ \hhline
  \endhead
  \rmcol{5}{\tiny 未完待续} \endfoot
  \endlastfoot

  \cmcolvb{2}{Device ID} & \cmcolvb{2}{Vendor ID}                  & 00 \\ \hline 
  \cmcolvb{2}{Status} & \cmcolvb{2}{Command}                       & 04 \\ \hline
  \cmcolvb{3}{Class Code} & Revision ID                            & 08 \\ \hline
  BIST & Header Type & Latency Timer & CacheLine Size              & 0C \\ \hline
  \cmcolvb{4}{Base Address Register 0 (BAR0)}                      & 10 \\ \hline
  \cmcolvb{4}{Base Address Register 1 (BAR1)}                      & 14 \\ \hline
  \cmcolvb{4}{Base Address Register 2 (BAR2)}                      & 18 \\ \hline
  \cmcolvb{4}{Base Address Register 3 (BAR3)}                      & 1C \\ \hline
  \cmcolvb{4}{Base Address Register 4 (BAR4)}                      & 20 \\ \hline
  \cmcolvb{4}{Base Address Register 5 (BAR5)}                      & 24 \\ \hline
  \cmcolvb{4}{}                                                    & 28 \\ \hline
  \cmcolvb{2}{Subsystem ID} & \cmcolvb{2}{Subsystem Vendor ID}     & 2C \\ \hline
  \cmcolvb{4}{}                                                    & 30 \\ \hline
  \cmcolvb{3}{} & Capabilities Pointer                             & 34 \\ \hline
  \cmcolvb{4}{}                                                    & 38 \\ \hline
  Maximum Latency & Minimum Grant & Interrupt Pin & Interrupt Line & 3C \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR40)}            & 40 \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR44)}            & 44 \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR48)}            & 48 \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR4C)}            & 4C \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR50)}            & 50 \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR54)}            & 54 \\ \hline
  \cmcolvb{4}{Implementation Specific Register (ISR58)}            & 58 \\ \hline
  \cmcolvb{4}{}                                                    & ...\\ \hline
  \cmcolvb{4}{PCI-X Command Register}                              & E0 \\ \hline
  \cmcolvb{4}{PCI-X Status Register}                               & E4 \\ \hline
\end{longtable}
\setlength{\tabcolsep}{6pt}

### 龙芯 PCI 实现有关寄存器位域说明

表 \ref{tab:pciISR} 列出了龙芯具体实现有关寄存器（Implementation
Specific Register）的位域及其说明。

\begin{iolongtable}{龙芯 PCI 具体实现寄存器（ISR）}{tab:pciISR}
  \lmcolvb{5}{ISR\_40} \\ \hline
  31    & tar\_read\_io         & 读写 & 0    & target 端收到对 IO 或者是不可预取区域的访问 \\
  30    & tar\_read\_discard    & 读写 & 0    & target 端的 delay 请求被丢弃 \\
  29    & tar\_resp\_delay      & 读写 & 0    & target 访问何时给出 delay/split 0: 超时后 1: 马上 \\
  28    & tar\_delay\_retry     & 读写 & 0    & target 访问重试策略 0: 根据内部逻辑（见 29 位） 1: 马上重试 \\
  27    & tar\_read\_abort\_en  & 读写 & 0    & 若 target 对内部的读请求超时，是否让以 target-abort 回应 \\
  26:25 & Reserved              & --   & 0    & -- \\
  24    & tar\_write\_abort\_en & 读写 & 0    & 若 target 对内部的写请求超时，是否让以 target-abort 回应 \\
  23    & tar\_master\_abort    & 读写 & 0    & 是否允许 master-abort \\
  22:20 & tar\_subseq\_timeout  & 读写 & 000  & target 后续延迟超时 000: 8 周期 其它: 不支持 \\
  19:16 & tar\_init\_timeout    & 读写 & 0000 & target 初始延迟超时 PCI 模式下 0: 16 周期 1-7: 禁用计数器 8-15: 8-15 周期 PCI-X 模式下超时计数固定为 8 周期，此处配置影响最大的 delay 访问数 0: 8 delay 访问 8: 1 delay 访问 9: 2 delay 访问 10: 3 delay 访问 11: 4 delay 访问 12: 5 delay 访问 13: 6 delay 访问 14: 7 delay 访问 15: 8 delay 访问 \\
  15:4  & tar\_pref\_boundary   & 读写 & 000h & 可预取边界配置（以 16 字节为单位） FFF: 64KB 到 16byte FFE: 64KB 到 32byte FF8: 64KB 到 128byte \\
  3     & tar\_pref\_bound\_en  & 读写 & 0    & -- \\
  2     & Reserved (??)         & --   & 0    & 使用 tar\_pref\_boundary 的配置 0: 预取到设备边界 1: 使用 tar\_pref\_boundary \\
  1     & tar\_splitw\_ctrl     & 读写 & 0    & target split 写控制 0: 阻挡除 Posted Memory Write 以外的访问 1: 阻挡所有访问，直至 split 完成 \\
  0     & mas\_lat\_timeout     & 读写 & 0    & 禁用 mater 访问超时 0: 允许 master 访问超时 1: 不允许 \\ \hhline

  \lmcolvb{5}{ISR\_44} \\* \hline
  31:0  & Reserved              & --   & --   & -- \\ \hhline

  \lmcolvb{5}{ISR\_48} \\* \hline
  31:0  & tar\_pending\_seq     & 读写 & 0    & target 未处理完的请求号位向量 对应位写 1 可清 \\ \hhline

  \lmcolvb{5}{ISR\_4C} \\ \hline
  31:30 & Reserved              & -    & -   & \\
  29    & mas\_write\_defer     & 读写 & 0   & 允许后续的读越过前面未完成的写 (只对 PCI 有效) \\
  28    & mas\_read\_defer      & 读写 & 0   & 允许后续的读写越过前面未完成的读 (只对 PCI 有效) \\
  27    & mas\_io\_defer\_cnt   & 读写 & 0   & 在外的最大 IO 请求数 0: 由控制, 1: 1 (?) \\
  26:24 & mas\_read\_defer\_cnt & 读写 & 010 & master 支持在外读的最大数(只对 PCI 有效） 0: 8 1-7: 1-7 注：一个双地址周期访问占两项 \\
  23:16 & err\_seq\_id          & 只读 & 00h & target/master 错误号 \\
  15    & err\_type             & 只读 & 0   & target/master 出错的命令类型 0: \\
  14    & err\_module           & 只读 & 0   & 出错的模块 0: target 1: master \\
  13    & system\_error         & 读写 & 0   & target/master 系统错（写 1 清） \\
  12    & data\_parity\_error   & 读写 & 0   & target/master 数据奇偶错（写 1 清） \\
  11    & ctrl\_parity\_error   & 读写 & 0   & target/master 地址奇偶错（写 1 清） \\
  10:0  & Reserved              & -    & -   & \\ \hhline

  \lmcolvb{5}{ISR\_50} \\* \hline
  31:0 & mas\_pending\_seq      & 读写 & 0   & master 未处理完的请求号位向量 对应位写 1 可清 \\ \hhline

  \lmcolvb{5}{ISR\_54} \\* \hline
  31:0 & mas\_split\_err        & 读写 & 0   & split 返回出错的请求号位向量 \\ \hhline

  \lmcolvb{5}{ISR\_58} \\ \hline
  31:30 & Reserved             & -    & -   & \\
  29:28 & tar\_split\_priority & 读写 & 0   & target split 返回优先级 0 最高, 3 最低 \\
  27:26 & mas\_req\_priority   & 读写 & 0   & master 对外的优先级 0 最高, 3 最低 \\
  25    & Priority\_en         & 读写 & 0   & 仲裁算法 （在 master 的访问和 target 的
                                              split 返回间做仲裁） 0: 固定优先级 1: 轮转 \\
  24:18 & 保留                 & -    & -   & \\
  17    & mas\_retry\_aborted  & 读写 & 0   & master 重试取消（写 1 清） \\
  16    & mas\_trdy\_timeout   & 读写 & 0   & master TRDY 超时计数 \\
  15:8  & mas\_retry\_value    & 读写 & 00h & master 重试次数 0: 无限重试 1-255: 1-255 次 \\
  7:0   & mas\_trdy\_count     & 读写 & 00h & master TRDY 超时计数器 0: 禁用 1-255: 1-255 拍 \\ \hline
\end{iolongtable}

\subsection{PCI-X I/O 控制器配置}

PCI-X I/O 配置寄存器主要用于配置 PCI/PCI-X 控制器的地址窗口、仲裁器以及 GPIO
控制器。表 \ref{tab:ioConfigReg} 列出了所有的 PCI-X I/O
配置寄存器。

\begin{longtable}[c]{*{4}{|>{\centering}p{3.4cm}}|@{}c@{}|}
  \caption{PCI-X I/O 控制寄存器}\label{tab:ioConfigReg} \\ \hline
  字节 3 & 字节 2 & 字节 1 & 字节 0 & 偏移  \\ \hhline
  \endfirsthead
  \caption{PCI-X 控制器配置头（续）} \\ \hline
  字节 3 & 字节 2 & 字节 1 & 字节 0 & 偏移  \\ \hhline
  \endhead
  \rmcol{5}{\tiny 未完待续} \endfoot
  \endlastfoot

  \cmcolvb{4}{PonCfg：上电配置}                    & 00 \\ \hline
  \cmcolvb{4}{GenCfg：常规配置}                    & 04 \\ \hline
  \cmcolvb{4}{--保留--}                            & 08 \\ \hline
  \cmcolvb{4}{--保留--}                            & 0C \\ \hline
  \cmcolvb{4}{PCIMap：PCI映射}                     & 10 \\ \hline
  \cmcolvb{4}{PCI-X\_Bridge\_Cfg：PCI-X桥相关配置} & 14 \\ \hline
  \cmcolvb{4}{PCIMap\_Cfg：PCI配置读写设备地址}    & 18 \\ \hline
  \cmcolvb{4}{GPIO\_Data：GPIO数据}                & 1C \\ \hline
  \cmcolvb{4}{GPIO\_EN：GPIO方向}                  & 20 \\ \hline
  \cmcolvb{4}{--保留--}                            & 24 \\ \hline
  \cmcolvb{4}{--保留--}                            & 28 \\ \hline
  \cmcolvb{4}{--保留--}                            & 2C \\ \hline
  \cmcolvb{4}{--保留--}                            & 30 \\ \hline
  \cmcolvb{4}{--保留--}                            & 34 \\ \hline
  \cmcolvb{4}{--保留--}                            & 38 \\ \hline
  \cmcolvb{4}{--保留--}                            & 3C \\ \hline
  \cmcolvb{4}{Mem\_Win\_Base：可预取窗口基址}      & \ftabincell{P{.7cm}}{40 \\ \hline 44} \\ \hline
  \cmcolvb{4}{Mem\_Win\_Mask：可预取窗口掩码}      & \ftabincell{P{.7cm}}{48 \\ \hline 4C} \\ \hline
  \cmcolvb{4}{PCI\_Hit0\_Sel：PCI窗口0控制}        & \ftabincell{P{.7cm}}{50 \\ \hline 54} \\ \hline
  \cmcolvb{4}{PCI\_Hit1\_Sel：PCI窗口1控制}        & \ftabincell{P{.7cm}}{58 \\ \hline 5C} \\ \hline
  \cmcolvb{4}{PCI\_Hit2\_Sel：PCI窗口2控制}        & \ftabincell{P{.7cm}}{60 \\ \hline 64} \\ \hline
  \cmcolvb{4}{PXArb\_Config：PCI-X仲裁器配置}      & 68 \\ \hline
  \cmcolvb{4}{PXArb\_Status：PCI-X仲裁器状态}      & 6C \\ \hline
  \cmcolvb{4}{--保留--}                            & 70 \\ \hline
  \cmcolvb{4}{--保留--}                            & 74 \\ \hline
  \cmcolvb{4}{--保留--}                            & 78 \\ \hline
  \cmcolvb{4}{--保留--}                            & 7C \\ \hline
  \cmcolvb{4}{Chip\_Config}      & \ftabincell{P{.7cm}}{80 \\ \hline 84 \\ \hline 88 \\ \hline 8C} \\ \hline
  \cmcolvb{4}{Chip\_Sample}      & \ftabincell{P{.7cm}}{90 \\ \hline 94 \\ \hline 98 \\ \hline 9C} \\ \hline
  \cmcolvb{4}{--保留--}                            & A0 \\ \hline
  \cmcolvb{4}{--保留--}                            & A4 \\ \hline
  \cmcolvb{4}{--保留--}                            & A8 \\ \hline
  \cmcolvb{4}{--保留--}                            & AC \\ \hline
  \cmcolvb{4}{Node\_ClkSel}      & \ftabincell{P{.7cm}}{B0 \\ \hline B4 \\ \hline B8 \\ \hline BC} \\ \hline
  \cmcolvb{4}{MEM\_HT\_ClkSel}   & \ftabincell{P{.7cm}}{C0 \\ \hline C4 \\ \hline C8 \\ \hline CC} \\ \hline
  \cmcolvb{4}{Core\_FreqCtrl}    & \ftabincell{P{.7cm}}{D0 \\ \hline D4 \\ \hline D8 \\ \hline DC} \\ \hline
\end{longtable}

其中，`Chip_Config` 和 `Chip_Sample` 这两个寄存器在[芯片配置及采样寄存器][]
一节有详细说明； 同时 `Node_ClkSel` 、 `MEM_HT_ClkSel`、 `Core_FreqCtrl` 这三个寄
存器的说明见[倍频设置寄存器][]一节。而其他寄存器的详细说明则在
表\ \ref{tab:ioConfigRegDetail} 中给出。

\begin{iolongtable}{IO 控制寄存器位域解释}{tab:ioConfigRegDetail}
  \lmcolvb{5}{CR00: PonCfg} \\* \hline
  31:24 & 保留 & 只读 &  &  \\ \hline
  23:16 & pon\_pci\_config & 只读 & pci\_config & PCI\_Config 引脚值 \\ \hline
  15:8 & 保留 & 只读 & lio\_ad[15:8] &  \\ \hline
  7:0 & pcix\_bus\_dev & 只读 & lio\_ad[7:0] & PCI-X Agent模式下CPU取指所使用的总线、设备号 \\ \hline

  \lmcolvb{5}{CR04, CR08: 保留} \\* \hline
  31:0 & 保留 & 只读 & 0 &  \\ \hline

  \lmcolvb{5}{CR10: PCIMap} \\* \hline
  31:18 & 保留 & 只读 & 0 &  \\ \hline
  17:12 & trans\_lo2 & 读写 & 0 & PCI\_Mem\_Lo2窗口映射地址高6位 \\ \hline
  11:6 & trans\_lo1 & 读写 & 0 & PCI\_Mem\_Lo1窗口映射地址高6位 \\ \hline
  5:0 & trans\_lo0 & 读写 & 0 & PCI\_Mem\_Lo0窗口映射地址高6位 \\ \hline

  \lmcolvb{5}{CR14: PCI-X\_Bridge\_Cfg} \\* \hline
  31:18 & 保留 & 只读 & 0 &  \\ \hline
  6 & pcix\_ro\_en & 读写 & 0 & PCI-X桥是否允许写越过读 \\ \hline
  5:0 & pcix\_rgate & 读写 & 6'h18 & PCI-X模式下向DDR2发读取数门限 \\ \hline

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
\end{iolongtable}

在发起配置空间读写前，应用程序应先配置好 `PCIMap_Cfg` 寄存器，告诉控
制器欲发起的配置操作的类型和高 16 位地址线上的值。然后对 0x1fe80000 开始 的 2K
空间进行读写即可访问对应设备的配置头。 设备号由根据 `PCIMap_Cfg`[15:0]
从低到高优先编码得到。 配置操作地址生成见图 。

图 配置读写总线地址生成

### PCI 地址窗口

龙芯 3B1500 的 PCI-X 控制器支持三个 64 位窗口。 这些窗口的基址是由三对 PCI-X
控制寄存器决定的：

        {BAR1, BAR0}、{BAR3, BAR2}、{BAR5, BAR4}

\noindent 而这三个窗口的大小、 使能以及其它细节则是由做 I/O 控制器配置的三个寄
存器 PCI_Hit0_Sel, PCI_Hit1_Sel, PCI_Hit2_Sel 控制的。 它们的具体位域说明见表
\ref{tab:ioConfigReg}。

### PCI 仲裁机制

PCI/PCI-X 仲裁器实现了两级轮转仲裁、总线停靠和损坏主设备的隔离：其配置和状态由
PXArb\_Config 和 PXArb\_Status 寄存器控制。PCI/PCI-X
总线请求与应答线分配见表 \ref{tab:pciBusRAalloc}。
\begin{table}[ht]
  \centering
  \begin{tabular}{|c|l|} \hline
    请求与应答线 & 描述 \\ \hline
    0   & 内部集成 PCI/PCI-X 控制器 \\ \hline
    7:1 & 外部请求 6 0 \\ \hline
  \end{tabular}
  \caption{PCI/PCI-X 总线请求与应答线分配}
  \label{tab:pcibusraalloc}
\end{table}

基于轮转的 PCI-X 仲裁算法对设备提供了两个不同级别，
其特点是第二级整体作为一个一级成员进行调度。
当多个设备同时申请总线时，轮转完一次第一级设备，如果第二级
整体被选中，那么第二级中优先级最高的设备将得到总线。
仲裁器被设计成任何时候只要条件允许就可以切换： 对于一些不符合协议的 PCI
设备，这样做可能会使之不正常。 软件可以使用强制优先级
可以让这些设备通过持续请求来占有总线。
总线停靠是指当没有设备请求使用总线时是否选择其中一个给出允许信号。
对于已经得到允许的设备而言， 直接发起总线操作能够提高效率。 龙芯 3 号的 PCI
仲裁器提供两种停靠模式： 最后一个主设备和默认主设备。如果在特殊场合下没有设备
能够停靠，则可以将仲裁器设置为停靠到默认 0 号主设备（内部控制器），且设置依靠
延迟为 0。

LPC 控制器
----------

\noindent LPC (Low-Pin Count) 控制器具有以下特性：

 - 符合 LPC1.1 规范；
 - 支持 LPC 访问超时计数器；
 - 支持 Memory Read、Memory write 访问类型；
 - 支持 Firmware Memory Read、Firmware Memory Write 访问类型（单字节）；
 - 支持 I/O read、I/O write 访问类型；
 - 支持 Memory 访问类型地址转换；
 - 支持 Serizlized IRQ 规范，提供 17 个中断源。

\noindent 如表 \ref{tab:lsioAddrSpace} 显示，有四个与 LPC
控制器相关的地址空间，它们分别是 LPC Boot，LPC Memory，LPC I/O 空间，和 LPC
配置空间；同时 LPC 配置空间的基地址为 0x1FE0\_0200。 LPC 控制器配置寄存器由 4
个 32 位寄存器组成。这些配置寄存器的含义见表 \ref{tab:LPCreg}。

与 LPC 相关的地址空间中， LPC Boot
是系统启动时处理器最先访问的地址空间。这个地址空间支持 LPC Memory 或 Firmware
Memory 这两种不同访问类型。系统启动时发出哪种访问类型由 LPC\_ROM\_INTEL
引脚控制。LPC\_ROM\_INTEL
引脚上拉时发出 LPC Firmware Memory 访问，下拉时发出 LPC Memory 访问 类型。

LPC Memory 地址空间是系统用 Memory/Firmware Memory 访问的地址空间。 LPC
控制器发出哪种类型的内存访问，由 LPC 控制器的配置寄存器 REG1 的
LPC\_MEM\_IS\_FWH 位决定。 处理器发往这个地址空间的地址可以进行地址转换。
转换后的地址由 LPC 控制器的配置寄存器 REG0 的 LPC\_MEM\_TRANS 位设置。
处理器发往 LPC I/O 地址空间的访问按照 LPC I/O 访问类型发往 LPC 总线，
地址为地址空间的低 16 位。

\begin{iolongtable}{LPC 配置寄存器含义}{tab:LPCreg}
  \multicolumn{5}{|l|}{REG0}                                          \\ \hline
  31 & SIRQ\_EN              & 读写 & 0 & SIRQ 使能控制               \\
  23:16 & LPC\_MEM\_TRANS    & 读写 & 0 & LPC Memory 空间地址转换控制 \\
  15:0  & LPC\_SYNC\_TIMEOUT & 读写 & 0 & LPC 访问超时计数器          \\ \hhline
  \multicolumn{5}{|l|}{REG1}                                          \\ \hline
  31 & LPC\_MEM\_IS\_FWH     & 读写 & 0 & LPC Memory 空间访问类型设置 \\
  17:0  & LPC\_INT\_EN       & 读写 & 0 & LPC SIRQ 中断使能           \\ \hhline
  \multicolumn{5}{|l|}{REG2}                                          \\ \hline
  17:0  & LPC\_INT\_SRC      & 读写 & 0 & LPC SIRQ 中断源指示         \\ \hhline
  \multicolumn{5}{|l|}{REG3}                                          \\ \hline
  17:0  & LPC\_INT\_CLEAR    & 写   & 0 & LPC SIRQ 中断清除           \\ \hline
\end{iolongtable}

UART 控制器
-----------

\noindent 龙芯 3 号的 UART 控制器具有以下特性

 - 全双工异步数据接收/发送；
 - 可编程的数据格式；
 - 16 位可编程时钟计数器；
 - 支持接收超时检测；
 - 带仲裁的多中断系统；
 - 仅工作在 FIFO 方式；
 - 在寄存器与功能上兼容 NS16550A。

\noindent 本模块有两个并行工作 UART 接口， 它们的功能寄存器完全一样， 只是访问
基址不同。如表 \ref{tab:lsioAddrSpace} 显示， UART0 和 UART1 的寄存器物理地址基
址分别为 0x1FE0\_01E0， 0x1FE0\_01E8。 每个 UART 控制器都有 8 个 8 位的控制寄
存器。这些控制寄存器的命名及其含义在[线路控制寄存器（LCR）](#uart-lcrreg)的
DLAB 位的不同而有差异。表 \ref{tab:UARTport2regTable} 列出了这些寄存器在不同
DLAB值下的设置。

\begin{table}[htpb]
  \centering
  \caption{UART 转换表：端口 vs 寄存器}
  \begin{tabular}{|c|cc|cc|} \hline
             & \cmcolvb{2}{DLAB=0} & \cmcolvb{2}{DLAB=1} \\
    地址偏移 & 读  & 写  & 读  & 写  \\ \hhline
    0        & DAT & DAT & LSB & LSB \\
    1        & IER & IER & MSB & MSB \\
    2        & IIR & FCR & IIR & FCR \\
    3        & LCR & LCR & LCR & LCR \\
    4        & MCR & MCR & MCR & MCR \\
    5        & LSR & --  & LSR & --  \\
    6        & MSR & --  & MSR & --  \\
    7        & SCR & SCR & SCR & SCR \\ \hline
  \end{tabular}
  \label{tab:UARTport2regTable}
\end{table}

表 \ref{tab:UARTConfigReg} 列出了所有 UART 控制寄存器的详细信息。

\begin{iolongtable}{UART 控制寄存器说明}{tab:UARTConfigReg}
  \lmcolvb{5}{数据寄存器（DAT）；地址偏移：0x00；复位值：0x00} \\* \hline
  7:0 & Tx FIFO & 8 & W  & 数据传输寄存器 \\ \hhline

  \lmcolvb{5}{中断使能寄存器（IER）；地址偏移：0x01；复位值：0x00}           \\ \hline
  7:4 & Reserved & 4 & RW & 保留                                             \\
  3   & IME      & 1 & RW & Modem 状态中断使能 `0' – 关闭 `1'   – 打开       \\
  2   & ILE      & 1 & RW & 接收器线路状态中断使能 `0' – 关闭  `1' – 打开    \\
  1   & ITxE     & 1 & RW & 传输保存寄存器为空中断使能 `0' – 关闭 `1' – 打开 \\
  0   & IRxE     & 1 & RW & 接收有效数据中断使能 `0' – 关闭 `1' – 打开       \\ \hhline

  \lmcolvb{5}{中断标识寄存器（IIR）；地址偏移：0x02；复位值：0xC1} \\ \hline
  7:4 & Reserved & 4 & R & 保留                                    \\
  3:1 & II       & 3 & R & 中断源表示位，详见下表                  \\
  0   & INTp     & 1 & R & 中断表示位                              \\ \hhline
  
  \lmcolvb{5}{FIFO控制寄存器（FCR）；地址偏移：0x03；复位值：0xC0}                                                \\ \hline
  7:6 & TL & 2 & W & 接收 FIFO 提出中断申请的 trigger 值 ``00'' 1 字节 ``01'' 4 字节 ``10'' 8 字节 ``11'' 14 字节 \\
  5:3 & Reserved & 3 & W & 保留                                                                                   \\
  2   & Txset    & 1 & W & ``1'' 清除发送 FIFO 的内容，复位其逻辑                                                 \\
  1   & Rxset    & 1 & W & ``1'' 清除接收 FIFO 的内容，复位其逻辑                                                 \\
  0   & Reserved & 1 & W & 保留                                                                                   \\ \hhline

  \lmcolvb{5}{\hypertarget{uart-lcrreg}{线路控制寄存器（LCR）}；地址偏移：0x0；复位值：0x00} \\ \hline
  7   & DLAB & 1 & RW & 分频锁存器访问位 `1' – 访问操作分频锁存器 `0' – 访问操作正常寄存器   \\
  6   & BCB  & 1 & RW & 打断控制位 `1' – 此时串口的输出被置为 0(打断状 态).  `0' – 正常操作  \\
  5   & SPB  & 1 & RW & 指定奇偶校验位 `0' – 不用指定奇偶校验位 `1' – 如果 LCR[4]位是 1 则传输和检查奇 偶校验位为 0。如果 LCR[4]位是 0 则传输和检查奇偶校验位为 1。 \\
  4   & EPS  & 1 & RW &  奇偶校验位选择 `0' – 在每个字符中有奇数个 1（包括数 据和奇偶校验位） `1' –在每个字符中有偶数个 1    \\
  3   & PE   & 1 & RW & 奇偶校验位使能 `0' – 没有奇偶校验位 `1' – 在输出时生成奇偶校验位，输入则 判断奇偶校验位              \\
  2   & SB   & 1 & RW & 定义生成停止位的位数 `0' – 1 个停止位 `1' – 在 5 位字符长度时是 1.5 个停止位， 其他长度是 2 个停止位 \\
  1:0 & BEC  & 2 & RW & 设定每个字符的位数 `00' – 5 位 `01' – 6 位 `10' – 7 位 `11' – 8 位                                   \\ \hhline

  \lmcolvb{5}{MODEM控制寄存器（MCR）；地址偏移：0x0；复位值：0x00}                                                                                                                                       \\ \hline
  7:5 & Reserved & 3 & W & 保留                                                                                                                                                                          \\
  4   & Loop     & 1 & W & 回环模式控制位 `0' – 正常操作 `1' –回环模式。在在回环模式中，TXD 输出一直为 1，   输出移位寄存器直接连到 输入移位寄存器中。其他连接如下。 DTR  DSR RTS  CTS Out1 RI Out2  DCD \\
  3   & OUT2     & 1 & W & 在回环模式中连到 DCD 输入                                                                                                                                                     \\
  2   & OUT1     & 1 & W & 在回环模式中连到 RI 输入                                                                                                                                                      \\
  1   & RTSC     & 1 & W & RTS 信号控制位                                                                                                                                                                \\
  0   & DTRC     & 1 & W & DTR 信号控制位                                                                                                                                                                \\ \hhline

  \lmcolvb{5}{线路状态寄存器（LSR）；地址偏移：0x0；复位值：0x00}                                                   \\ \hline
  7 & ERROR & 1 & R & 错误表示位 `1' – 至少有奇偶校验位错误，帧错误或 打断中断的一个。 `0' – 没有错误               \\
  6 & TE    & 1 & R & 传输为空表示位 `1' – 传输 FIFO 和传输移位寄存器都为 空。给传输 FIFO 写数据时清零 `0' – 有数据 \\
  5 & TFE   & 1 & R & 传输 FIFO 位空表示位 `1' – 当前传输 FIFO 为空，给传输 FIFO 写数据时清零 `0' – 有数据          \\
  4 & BI    & 1 & R & 打断中断表示位 `1' –接收到 起始位＋数据＋奇偶位＋停 止位都是 0，即有打断中断 `0' – 没有打断   \\
  3 & FE    & 1 & R & 帧错误表示位 `1' – 接收的数据没有停止位 `0' – 没有错误                                        \\
  2 & PE    & 1 & R & 奇偶校验位错误表示位 `1' – 当前接收数据有奇偶错误 `0' – 没有奇偶错误                          \\
  1 & OE    & 1 & R & 数据溢出表示位 `1' – 有数据溢出 `0' – 无溢出                                                  \\
  0 & DR    & 1 & R & 接收数据有效表示位 `0' – 在 FIFO 中无数据 `1' – 在 FIFO 中有数据                              \\ \hhline

  \lmcolvb{5}{MODEM状态寄存器（MSR）；地址偏移：0x0；复位值：0x00} \\ \hline
  7 & CDCD & 1 & R & DCD 输入值的反， 或者在回环模式中连到 Out2    \\
  6 & CRI  & 1 & R & RI 输入值的反，或者在回环模式中连到 OUT1      \\
  5 & CDSR & 1 & R & DSR 输入值的反， 或者在回环模式中连到 DTR     \\
  4 & CCTS & 1 & R & CTS 输入值的反，或者在回环模式中连到 RTS      \\
  3 & DDCD & 1 & R & DDCD 指示位                                   \\
  2 & TERI & 1 & R & RI 边沿检测。RI 状态从低到高变化              \\
  1 & DDSR & 1 & R & DDSR 指示位                                   \\
  0 & DCTS & 1 & R & DCTS 指示位                                   \\ \hhline

  \lmcolvb{5}{分频锁存器 1；地址偏移：0x0；复位值：0x00} \\ \hline
  7:0 & LSB & 8 & RW & 存放分频锁存器的低 8 位 \\ \hhline

  \lmcolvb{5}{分频锁存器 2；地址偏移：0x0；复位值：0x00} \\ \hline
  7:0 & MSB & 8 & RW & 存放分频锁存器的高 8 位 \\ \hline
\end{iolongtable}

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

SPI 控制器
----------

串行外围设备接口（serial peripheral interface，简称SPI）总线技术是 Motorola 公
司推出的多种微处理器、微控制器以及外围设备之间的一种全双工、同步、串行数据接口
标准。龙芯 SPI 控制器模块寄存器物理地址基址为 `0x1FE0_0220` [^1]。

[^1]: 龙芯 3A 上 SPI 控制器模块寄存器物理地址基址为 `0x1FE0_01F0`。

### SPI 总控制器结构

龙芯的 SPI 控制器，在一个单纯 SPI 主控制器的基础上，还增加了专门的硬件逻辑，实
现了 Flash 控制的功能。 SPI Flash 控制器使得 SPI 控制器对外除了有若干 IO 寄存器
外还有一段只读内存空间。而这段内存空间映射到 SPI Flash 中，复位后不需要软件干预
就可以直接访问。从而支持处理器从 SPI Flash 启动。图\ \ref{fig:spi-structure} 显
示了由 AXI 接口、简单的 SPI 主控制器、SPI Flash 读引擎和总线选择模块组成。根据
访问的地址和类型，AXI 上的合法请求转发到 SPI 主控制器或者 SPI Flash 读引擎中(非
法请求被丢弃)。

![SPI 总控制器结构\label{fig:spi-structure}](../images/spi-structure-cn.pdf)

SPI 主控制器只接收单字节的读写访问，实现了 SPI 主设备的功能，并为 SPI Flash 读
引擎提供参数配置。SPI 主控制器的系统寄存器包括控制寄存器，状态寄存器、外部寄存
器和 SPI Flash 相关控制寄存器。分频器生成 SPI 总线工作的时钟信号，数据读、写缓
冲器（FIFO）允许 SPI 同时进行串行发送和接收数据。

SPI Flash 读引擎将读请求打包成 SPI Flash 的读命令，读出数据后返回。为了加快接口
速度，SPI Flash 生产厂商在最早的 SPI Flash 协议基础上作了若干扩展。根据受支持的
情况和实现开销，本引擎实现了三种增强模式，分别为

 1. 连续地址读：在传送完一个字节数据后 SPI Flash 自动准备好下一个地址的数据，只
    要片选不拉高就可以继续传输。
 2. 快速读模式：可工作在高频率的读模式，在命令地址后还附了一个字节的空数据供数
    据读出。
 3. 双 I/O 模式：在发完命令编码后，SDI 和 SDO 两根线不再遵循 SPI 协议，而是同时
    同向进行数据传输。

\noindent 其中，双 I/O 模式与快速读模式互斥，二者只能选其一。连续地址读则与其它
两种模式可共存。综上所述，龙芯 SPI 控制器具有以下特性：

 - 全双工同步串口数据传输
 - 支持到 4 个的变长字节传输
 - 主模式支持
 - 极性和相位可编程的串行时钟
 - 支持系统启动
 - 支持标准读、连续地址读、快速读、双路 I/O 等 SPI Flash 读模式

### SPI 控制器模块寄存器

\begin{iolongtable}{SPI 控制器模块寄存器}{tab:spiReg}
  \lmcolvb{5}{控制寄存器（SPCR）  偏移：0x00 复位值：0x10} \\ \hline
  7 & Spie & 1 & RW & 中断输出使能信号 高有效 \\
  6 & spe & 1 & RW & 系统工作使能信号高有效 \\
  5 & -- & 1 & RW & 保留 \\
  4 & mstr & 1 & RW & master模式选择位，此位一直保持1 \\
  3 & cpol & 1 & RW & 时钟极性位 \\
  2 & cpha & 1 & RW & 时钟相位位1则相位相反，为0则相同 \\
  1:0 & spr & 2 & RW & 与SPER:spre一起设定sclk\_o分频 \\ \hhline

  \lmcolvb{5}{状态寄存器（SPSR）  偏移：0x01 复位值：0x05} \\ \hline
  7 & spif & 1 & RW & 中断标志位1表示有中断申请，写1则清零 \\
  6 & wcol & 1 & RW & 写寄存器溢出标志位 为1表示已经溢出,写1则清零 \\
  5:4 & -- & 2 & RW & 保留 \\
  3 & wffull & 1 & RW & 写寄存器满标志1表示已经满 \\
  2 & wfempty & 1 & RW & 写寄存器空标志1表示空 \\
  1 & rffull & 1 & RW & 读寄存器满标志1表示已经满 \\
  0 & rfempty & 1 & RW & 读寄存器空标志1表示空 \\ \hhline

  \lmcolvb{5}{数据寄存器（TxFIFO）偏移：0x02 复位值：0x00} \\ \hline
  7:0 & Tx FIFO & 8 & W & 数据传输寄存器 \\ \hhline

  \lmcolvb{5}{外部寄存器（SPER）  偏移：0x03 复位值：0x00} \\ \hline
  7:6 & icnt & 2 & RW &
  传输完多少个字节后送出中断申请信号。 00: 1字节; 01: 2字节; 10: 3字节; 11:
  3字节(??)。 \\ 5:2 & -- & 4 & RW & 保留 \\
  1:0 & spre & 2 & RW & 与SPCR:spr一起设定分频比率 \\ \hline

  \lmcolvb{5}{参数控制寄存器（SFC\_PARAM） 偏移： 0x04 复位值： 0x21} \\ \hline
  7:4 & clk\_div   & 4 & RW & 时钟分频数选择（分频系数与{spre,spr}组合相同） \\
  3   & dual\_io   & 1 & RW & 使用双 I/O 模式，优先级高于快速读模式 \\
  2   & fast\_read & 1 & RW & 使用快速读模式 \\
  1   & burst\_en  & 1 & RW & spi flash 支持连续地址读模式 \\
  0   & memory\_en & 1 & RW & spi flash 读使能，无效时 csn[0]可由软件控制。 \\ \hhline
  
  \lmcolvb{5}{片选控制寄存器（SFC\_SOFTCS）偏移： 0x05 复位值： 0x00} \\ \hline
  7:4 & csn  & 4 & RW & csn 引脚输出值 \\
  3:0 & csen & 4 & RW & 为 1 时对应位的 cs 线由 7:4 位控制 \\ \hhline
  
  \lmcolvb{5}{时序控制寄存器（SFC\_TIMING）偏移：0x06 复位值：0x03} \\ \hline
  7:2 & Reserved & 6 & RW & 保留 \\
  1:0 & tCSH     & 2 & RW & SPI Flash 的片选信号最短无效时间，以分频后时钟周期 T 计算
                            00: 1T； 01: 2T； 10: 4T； 11: 8T \\ \hline

\end{iolongtable}

\begin{table}[htpb]
  \centering
  \caption{SPI 设备分频系数}
  \begin{tabular}{*{13}{|c}|} \hline
    SPER:spre & 00 & 01 & 10 & 11 & 00 & 01 & 10  & 11  & 00  & 01   & 10   & 11 \\ \hline
    SPCR:spr  & 00 & 00 & 00 & 00 & 01 & 01 & 01  & 01  & 10  & 10   & 10   & 10 \\ \hline
    分频系数  & 2  & 4  & 16 & 32 & 8  & 64 & 128 & 256 & 512 & 1024 & 2048 & 4096 \\ \hline
  \end{tabular}
  \label{tab:SPIFreqTable}
\end{table}

### SPI 控制器使用指南

#### SPI 主控制器的读写操作 {-}

 - 模块初始化
    1. 设置片选控制寄存器（SFC_SOFTCS），并使能控制寄存器
    1. 停止 SPI 控制器工作，对控制寄存器 spcr 的 spe 位写 0
    1. 重置状态寄存器 spsr，对寄存器写入 8'b1100_0000
    1. 设置外部寄存器 sper，包括中断申请条件 sper[7:6]和分频系数 sper[1:0]，具
       体参考寄存器说明
    1. 配置 SPI 时序，包括 spcr 的 cpol、cpha 和 sper 的 mode 位。mode 为 1 时
       是标准 SPI 实现，为 0 时为兼容模式。
    1. 配置中断使能，spcr 的 spie 位
    1. 启动 SPI 控制器，对控制寄存器 spcr 的 spe 位写 1

 - 模块的发送/传输操作
    1. 往数据传输寄存器写入数据
    1. 传输完成后从数据传输寄存器读出数据。由于发送和接收同时进行，即使 SPI 从
       设备没有发送有效数据也必须进行读出操作。

 - 中断处理
    1.  接收到中断申请
    1.  读状态寄存器 spsr 的值，若 spsr[2]为 1 则表示数据发送完成，若 spsr[0]为
        1 则表示已经接收数据
    1.  读或写数据传输寄存器
    1.  往状态寄存器 spsr 的 spif 位写 1，清除控制器的中断申请

#### 硬件 SPI Flash 读 {-}

 - 初始化

     将 SFC_PARAM 的 memory_en 位写 1。当 SPI 被选为启动设备时此位复位为 1。
     设置读参数(时钟分频、连续地址读、快速读、双 I/O、tCSH 等)。这些参数复位值
     均为最保守的值。

 - 更改参数

     如果所使用的 SPI Flash 支持更高的频率或者提供增强功能，修改相应参数可以大
     大加快 Flash 的访问速度。参数的修改不需要关闭 SPI Flash 读使能 (memory_en)
     。具体参考寄存器说明。


#### 混合访问 SPI Flash 和 SPI 主控制器 {-}

 - 使用多个 SPI 外设

     SPI Flash 控制器提供 4 个软件可控制的片选 cs[3:0]，其中 cs[0]专用于 SPI
     Flash。在龙芯 3B1500 中，SPI Flash 控制器的片选与 GPIO[3:0]对应。

     软件可通过 SFC_SOFTCS 控制寄存器设置 cs[3:1]，来访问所选择的 SPI 设备，当
     SFC_SOFTCS 的 csen 有效时，对应的 GPIO 位由 SPI Flash 控制器控制。如果软件
     选中了其它 SPI 设备，此时又出现 SPI Flash 读访问(比如取指)，cs[3:1]会自动
     无效，Flash 访问结束后恢复原值。

 - 对 SPI Flash 进行读以外的访问

     将 SPI Flash 读使能关闭后，软件就可直接控制 cs[0]，并通过 SPI 主控制器访问
     SPI 总线。这意味着在进行此操作时，不能从 SPI Flash 中取指。除了读以外，SPI
     Flash 还实现了很多命令(如擦除、写入)，具体参见相关文档。

