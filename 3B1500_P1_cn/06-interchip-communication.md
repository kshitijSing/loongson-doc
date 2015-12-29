处理器核间中断与通信
====================

龙芯 3A 为每个处理器核都实现了 8 个核间中断寄存器（inter-processor
interrupt，简称 IPI）以支持多核 BIOS
启动和操作系统运行时在处理器核之间进行中断和通信。龙芯 3A
的四个核间中断寄存器块的基地址分别为：
\begin{table}[h]
  \centering
  \begin{tabular}{|c|c|c|c|c|} \hline
               & Core0 & Core1 & Core2 & Core3 \\ \cline{2-5}
    IPI 基地址 & 0x3FF0\_1000 & 0x3FF0\_1100 & 0x3FF0\_1200 & 0x3FF0\_1300 \\ \hline
  \end{tabular}
  \caption{核间中断寄存器块的基地址}
  \label{tab:ipibases}
\end{table}

每个核间中断寄存器块 8 个寄存器的说明见表~\ref{tab:ipireg}。其中四个缓存寄存器
(\remark{这个名字好像不太好，就用邮箱寄存器如何？})
IPI\_Mailbox0-3 用于供启动时传递参数使用，按 64 或者 32
位的非缓存方式进行访问。

\begin{table}[h]
  \centering
  \begin{tabular}{|l|c|c|c|p{9cm}|} \hline
    名称          & 偏移 & 权限 & 位宽 & \cellalign{c|}{描述} \\ \hhline
    IPI\_Status   & 0x00 & R    & 32 & 状态寄存器: 任何一位被置 1，且对应位使能情况下，处理器核 INT4 (??) 中断线被置位 \\
    IPI\_Enable   & 0x04 & RW   & 32 & 使能寄存器: 控制对应中断位是否有效 \\
    IPI\_Set      & 0x08 & W    & 32 & 置位寄存器: 在任何位写 1，对应的状态寄存器位被置 1 \\
    IPI\_Clear    & 0x0C & W    & 32 & 清除寄存器: 在任何位写 1，对应的状态寄存器位被清 0 \\
    IPI\_MailBox0 & 0x20 & RW   & 64 & 缓存寄存器 0 \\
    IPI\_MailBox1 & 0x28 & RW   & 64 & 缓存寄存器 1 \\
    IPI\_MailBox2 & 0x30 & RW   & 64 & 缓存寄存器 2 \\
    IPI\_MailBox3 & 0x38 & RW   & 64 & 缓存寄存器 3 \\ \hline
  \end{tabular}
  \caption{处理器核间中断寄存器}
  \label{tab:ipireg}
\end{table}

表~\ref{tab:ipireg} 列出的是单个龙芯 3A
芯片所组成的单节点多处理器系统的的核间中断相关寄存器列表。在采用多片龙芯 3A
互连构成多节点 CC-NUMA
系统时，每个芯片节点对应一个系统全局节点编号，节点内处理器核的 IPI
寄存器地址与其所在节点的基地址成固定偏移关系。例如，1 号节点
(其节点基地址为0x1000\_0000\_0000) 的 2 号处理器 IPI\_Enable 地址为
\begin{center}
  Core2\_IPI\_Enable: 0x1000\_0000\_0000 + 0x3FF0\_1200 + 0x04 = 0x1000\_3FF0\_1204。
\end{center}
其他节点，其他处理器核，其他 IPI 寄存器依次类推。

