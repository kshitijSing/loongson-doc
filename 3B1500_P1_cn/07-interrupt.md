I/O 中断
========

龙芯 3B1500 芯片最多支持 32 个中断源，以统一方式管理。图 \ref{fig:interrupt} 给
出了在一个节点上，这些中断对应的中断源，以及中断路由的简单示意。

\begin{figure}[htbp]
  \centering
  \setlength\fboxsep{15pt}
  \setlength\fboxrule{.5pt}
  \fbox{\includegraphics{gs3-int-route}}
  \caption{龙芯 3B1500 处理器中断路由示意图}
  \label{fig:interrupt}
\end{figure}

中断配置寄存器
--------------

表 \ref{tab:intreg} 列出了一个龙芯节点所拥有的中断配置寄存器及其这些寄存器相对
于中断配置寄存器基地址的偏移。

Table: I/O 中断配置寄存器 \label{tab:intreg}

| 名称          | 地址偏移  | 位宽  | 描述                          |
| :------------ | :-------: | :---: | :--------------------------   |
| Entry0-31     | 0x00-0x1F | 8     | 32 个 8 位中断路由寄存器      |
| Intisr        | 0x20      | 32    | 中断状态寄存器                |
| Inten         | 0x24      | 32    | 中断使能状态寄存器            |
| Intenset      | 0x28      | 32    | 设置使能寄存器                |
| Intenclr      | 0x2c      | 32    | 清除使能寄存器                |
| Intedge       | 0x38      | 32    | 触发方式寄存器                |
| Core0_Intisr  | 0x40      | 32    | 路由给 Core0 的中断状态寄存器 |
| Core1_Intisr  | 0x48      | 32    | 路由给 Core1 的中断状态寄存器 |
| Core2_Intisr  | 0x50      | 32    | 路由给 Core2 的中断状态寄存器 |
| Core3_Intisr  | 0x58      | 32    | 路由给 Core3 的中断状态寄存器 |

由于龙芯 3B1500 系统可以拥有最多 4 个节点，这些中断配置寄存器的地址遵守
[节点控制寄存器地址规则][]。表 \ref{tab:intbase} 列出了每个节点的中断配置寄存器
基地址。

Table: 中断配置寄存器基地址 \label{tab:intbase}

| 节点   | 中断配置寄存基地址 | 节点   | 中断配置寄存基地址 |
| :----: | :--------------:   | :----: | :--------------:   |
| 0      | 0x0000_3FF0_1400   | 1      | 0x1000_3FF0_5400   |
| 2      | 0x2000_3FF0_9400   | 3      | 0x3000_3FF0_C400   |

中断配置
--------

龙芯 3B1500 的所有中断相关配置寄存器都是以“位”的形式对相应的中断线进行控制的。
任意一个 IO 中断源可以配置：是否使能、触发方式、以及路由目标。表
\ref{tab:intenconf} 列出了所有具体中断与位域的对应，以及中断使能和触发方式寄存
器的属性。

\begin{table}[htpb]
  \centering
  \caption{中断使能控制寄存器属性}\vspace{.2cm}
  \begin{tabular}{|c|l|c|c|c|c|} \hline
          &                 & \multicolumn{4}{c|}{访问属性/缺省值} \\ \cline{3-6}
    位域  & \cellalign{c|}{中断源} & Intedge & Inten & Intenset & Intenclr \\ \hhline
    31:24 & HT1\_Int7-0     & RW/0    & R/0   & RW/0     & RW/0 \\
    23:16 & HT0\_Int7-0     & RW/0    & R/0   & RW/0     & RW/0 \\
    15    & PCI\_perr和serr & RW/0    & R/0   & RW/0     & RW/0 \\
    14    & 保留            & RW/0    & R/0   & RW/0     & RW/0 \\
    13    & Barrier         & RW/0    & R/0   & RW/0     & RW/0 \\
    12:11 & MC1-0           & RW/0    & 保留  & 保留     & 保留 \\
    10    & LPC             & R/0     & R/0   & RW/0     & RW/0 \\
    9     & MT\_Int1        & R/0     & R/0   & RW/0     & RW/0 \\
    8     & MT\_Int0        & R/0     & R/0   & RW/0     & RW/0 \\
    7:4   & PCI\_Int3-0     & R/0     & R/0   & RW/0     & RW/0 \\
    3:0   & SYS\_Int3-0     & RW/0    & R/0   & W/0      & W/0  \\ \hline
  \end{tabular}
  \label{tab:intenconf}
\end{table}

### 中断使能设置

中断的使能 （Enable） 配置由三个寄存器控制： Inten、Intenset、和 Intenclr。

 - Inten 寄存器用于读取当前各中断使能的情况。为 1 的位对应的中断源产生的中断可
   以被路由，为 0 对应的中断源产生的中断被屏蔽；
 - Intenset 设置中断使能：写 1 的位对应中断被使能；写 0 没有任何作用；
 - Intenclr 清除中断使能：写 1 的位对应中断被清除；写 0 没有任何作用。

### 中断触发方式设置

脉冲形式的中断信号（如 PCI\_serr）可由 Intedge 配置寄存器来选择中断触发方式：写
1 表示脉冲触发，写 0 表示电平触发。中断处理程序可以通过 Intenclr 的相应位来清除
脉冲记录。所有的片内中断（包括 HT、DDR、MT、LPC）都为电平触发。

### 中断路由设置

每个 I/O 硬件中断源都对应一个 8 位的路由配置（Entry）寄存器，如表
\ref{tab:intreg} 中所示的 Entry0-31。软件可以通过设置路由路由配置寄存器，选择中
断的目标处理器核，以及处理器核的中断引脚 IP2-IP5 （IP0 和 IP1 是软中断）。路由
寄存器采用向量的方式进行路由选择，其格式如表 \ref{tab:introute-reg} 所示。举例
说明， Entry3=0x48 表明 3 号中断被路由到 2 号处理器的 IP5 上。

\begin{longtable}{|>{\centering}p{3cm}|p{10.5cm}|}
  \caption{中断路由寄存器 Entry} \tabularnewline[-.3cm]
  \multicolumn{2}{@{}c@{}}{\includegraphics[scale=0.875]{introute-reg}}
  \tabularnewline
  \hline 位域 & \cellalign{c|}{描述} \tabularnewline \hhline \endfirsthead
  \caption{中断路由寄存器 Entry（续）} \tabularnewline
  \hline 位域 & \cellalign{c|}{描述} \tabularnewline \hhline \endhead
  \hline \multicolumn{2}{r}{\tiny 未完待续} \endfoot
  \hline \endlastfoot
  处理器核向量号 & 第 0 位代表 0 号处理器核，第 1 位代表 1 号处理器核，以此类推 \\
  处理器核引脚号 & 第 0 位代表 IP2，第 1 位代表 IP3，以此类推
  \label{tab:introute-reg}
\end{longtable}


\remark{同一中断可以同时dispatch到几个核吗，比如 Entry2=0x49？如果有冲突，硬件
如何处理？}

