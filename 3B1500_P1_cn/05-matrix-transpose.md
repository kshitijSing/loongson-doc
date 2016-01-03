矩阵处理加速器
==============

龙芯 3B1500 中每个节点内置了一个独立于处理器核的矩阵转置的加速模块，其基本功能
是通过软件的配置，实现对存放在内存中矩阵进行从源矩阵到目标矩阵的行列转置功能。
两个矩阵转置模块分别集成在龙芯 3B1500 的两个 HyperTransport 控制器内部，通过 1
级交叉开关实现对二级 Cache 及内存的读写，并且能够维护 Cache 一致性。

对每一个转置模块，由于转置前同一 Cache 行的元素顺序在转置后的矩阵中是分散的，为
了提高读写效率，需要读入多行数据，使得这些数据可以在转置后的矩阵中以 Cache 行为
单位进行写入，因此在矩阵转置模块中设置了一个大小为 32 行的缓存区，实现横向方式写
入（从源矩阵读入到缓冲区），纵向读出（由缓冲区写入到目标矩阵）。

矩阵转置的工作过程为先读入 32 行源矩阵数据，再将该 32 行数据写入到目标矩阵，依次
下去，直至完成整个矩阵的转置。矩阵转置模块还可以根据需要，仅进行预取源矩阵而不写
目标矩阵，以此方式来实现对数据进行预取到 2 级 Cache 的操作。转置涉及的源矩阵可能
是位于一个大矩阵中的一个小矩阵，因此，其矩阵地址可能不是完全连续，相邻行之间的地
址会有间隔，需要实现更多的编程控制接口。

与转置不同，进行矩阵搬移工作时可以直接以 Cache 块为单位进行读写操作。因为读写操
作可能不是同时进行，需要对读回来的数据进行缓冲处理，因此矩阵搬移模块实现了一块
64*64bit 的缓存区，提供四个读端口和四个写端口。为了提高 Cache 块的读写效率，本
模块要求源矩阵的起始地址，每行搬运字节数及行宽均是 32 字节的整数倍，对矩阵的列
数则没有要求，并且硬件不考虑矩阵地址不对齐的情况。

转置和搬移操作涉及的源矩阵可能是位于一个大矩阵中的一个小矩阵，因此，其矩阵地址
可能不是完全连续，相邻行之间的地址会有间隔，需要实现更多的编程控制接口。通过设
置矩阵元素的大小，本模块还支持对源矩阵的行和列同时进行放大处理，但要求放大后的
矩阵大小不能超出所在大矩阵。

矩阵加速编程接口
----------------

龙芯 3B1500 的转置模块遵守[节点控制寄存器地址规则][]，所有节点的矩阵加速模块
的基地址见表 \ref{tab:mtbase}。

\begin{table}[htpb]
  \centering
  \caption{矩阵转置模块基地址} \vspace{.2cm}
  \begin{tabular}{|c|c|} \hline
           & 转置模块基地址 \\ 
    节点 0 & 0x0000\_0000\_3FF0\_0600 \\
    节点 1 & 0x0000\_1000\_3FF0\_4600 \\
    节点 2 & 0x0000\_2000\_3FF0\_8600 \\
    节点 3 & 0x0000\_3000\_3FF0\_c600 \\ \hline
  \end{tabular}
  \label{tab:mtbase}
\end{table}

每个转置模块都有 8 个控制寄存器。表 \ref{tab:mtconf} 列出了这些寄存器相对于
基地址的地址偏移及其含义说明。

\begin{table}[htpb]
  \centering
  \caption{矩阵转置编程接口说明}\vspace{.2cm}
  \begin{tabular}{|c|l|c|l|} \hline
    地址偏移 & \cellalign{c}{名称} & 属性 & \cellalign{c}{说明}             \\ \hhline
    0x00     & src\_start\_addr & RW   & 源矩阵起始地址                     \\
    0x08     & dst\_start\_addr & RW   & 目标矩阵起始地址                   \\
    0x10     & row              & RW   & 源矩阵的一行元素个数               \\
    0x18     & col              & RW   & 源矩阵的一列元素个数               \\
    0x20     & length           & RW   & 源矩阵所在大矩阵的行跨度（字节）   \\
    0x28     & width            & RW   & 目标矩阵所在大矩阵的行跨度（字节） \\
    0x30     & trans\_ctrl      & RW   & 转置控制寄存器 (具体位域解释
                                         见表 \ref{tab:mttransctrl})        \\
    0x38     & trans\_status    & RO   & 转置状态寄存器 \\ \hline
  \end{tabular}
  \label{tab:mtconf}
\end{table}

\noindent 下面表 \ref{tab:mttransctrl} 说明了矩阵转置涉及到的编程接口，主要是转置
控制寄存器 trans_ctrl 以及 trans_status 各域的含义。

\begin{table}[htpb]
  \centering
  \caption{矩阵加速模块寄存器位域解释}\vspace{.1cm}
  \begin{tabular}{|c|l|l|} \hline
    字段  & \cellalign{c}{名称} & \cellalign{|c|}{说明} \\ \hhline
    \multicolumn{3}{|l|}{trans\_ctrl 寄存器} \\ \hline
     22   & trans\_yes          & 1： 进行转置； 0：不转置 \\
    21:20 & element\_width      & 矩阵的元素大小为 $2^{[21:20]}$ 字节 \\
    19:16 & awcache             & 写控制位。4'hF: 使用cache通路; 4'h0: uncache通路; 其它值无意义 \\
    15:12 & awcmd               & 写控制位。Awcache为4'hF时，必须设为4'hB。否则无意义 \\
    11:8  & arcache             & 读控制位。0xF：cache通路; 0x0：uncache 通路; 其它值无意义 \\
    7:4   & arcmd               & 读控制位。Arcache为4'hF时，必须设为4'hC; 否则无意义 \\
    3     & wint\_en            & 目标矩阵写入完毕后，是否有效中断 \\
    2     & rint\_en            & 源矩阵读取完毕后，是否有效中断 \\
    1     & store\_en           & 是否允许写目标矩阵。为0时，转置过程只预取源矩阵，但不写目标矩阵 \\
    0     & fetch\_en           & 使能位 \\ \hhline
    \multicolumn{3}{|l|}{trans\_status 寄存器} \\ \hline
    1     & write\_status       & 目标矩阵写入完毕 \\
    0     & read\_status        & 源矩阵读取完毕   \\ \hline
  \end{tabular}
  \label{tab:mttransctrl}
\end{table}

Q: 源矩阵和目标矩阵的地址是否可以（部分）重合？

