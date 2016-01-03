处理器核间中断与通信
====================

龙芯 3B1500 为每个处理器核都实现了 8 个核间中断寄存器（inter-processor
interrupt，简称 IPI）以支持多核 BIOS 启动和操作系统运行时在处理器核之间进行中断
和通信。表 \ref{tab:ipireg} 列出了这 8 个核间中断寄存器的简单说明以及它们相对
中断寄存器快的地址偏移。其中四个邮箱寄存器 IPI\_Mailbox0-3 用于供启动时传递参数
使用，按 64 或者 32 位的非缓存方式进行访问。

\begin{table}[h]
  \centering
  \caption{处理器核间中断寄存器}\vspace{.15cm}
  \begin{tabular}{|l|c|c|c|p{9cm}|} \hline
    名称          & 偏移 & 权限 & 位宽 & \cellalign{c|}{描述} \\ \hhline
    IPI\_Status   & 0x00 & R    & 32 & 状态寄存器: 任何一位被置 1，且对应位使能情况下，处理器核 INT4 (??) 中断线被置位 \\
    IPI\_Enable   & 0x04 & RW   & 32 & 使能寄存器: 控制对应中断位是否有效 \\
    IPI\_Set      & 0x08 & W    & 32 & 置位寄存器: 在任何位写 1，对应的状态寄存器位被置 1 \\
    IPI\_Clear    & 0x0C & W    & 32 & 清除寄存器: 在任何位写 1，对应的状态寄存器位被清 0 \\
    IPI\_MailBox0 & 0x20 & RW   & 64 & 邮箱寄存器 0 \\
    IPI\_MailBox1 & 0x28 & RW   & 64 & 邮箱寄存器 1 \\
    IPI\_MailBox2 & 0x30 & RW   & 64 & 邮箱寄存器 2 \\
    IPI\_MailBox3 & 0x38 & RW   & 64 & 邮箱寄存器 3 \\ \hline
  \end{tabular}
  \label{tab:ipireg}
\end{table}

表 \ref{tab:ipireg} 列出了龙芯 3B1500 芯片节点 0 对应的的核间中断相关寄存器基地
址。

\begin{table}[h]
  \centering
  \caption{节点 0 核间中断寄存器块的基地址}\vspace{.15cm}
  \begin{tabular}{|c|c|c|c|c|} \hline
               & Core0 & Core1 & Core2 & Core3 \\ \cline{2-5}
    IPI 基地址 & 0x3FF0\_1000 & 0x3FF0\_1100 & 0x3FF0\_1200 & 0x3FF0\_1300 \\ \hline
  \end{tabular}
  \label{tab:ipibases}
\end{table}

\noindent 龙芯 3B1500 的核间中断寄存器块的地址遵守[节点控制寄存器地址规则][]，
即每个芯片节点的控制寄存器块地址分别在前一个节点基础上加 0x1000\_0000\_4000。例
如，2 号节点的 2 号处理器 IPI\_Enable 地址为

        Core2_IPI_Enable: 0x2000_0000_8000 + 0x3FF0_1200 + 0x04 = 0x2000_3FF0_9204。

\noindent 其他节点，其他处理器核，其他 IPI 寄存器依次类推。

