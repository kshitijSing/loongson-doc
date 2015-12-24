浮点协处理器
============

浮点协处理器（Floting Point Unit，简称 FPU）是一个重要的 CPU 协处理器，一般也被
称为 CP1 （Coprocessor 1）： 它通过扩展 CPU 的指令集来完成浮点算术运算功能。 本
章主要讲述龙芯 GS464V 处理器的 FPU 的特性， 主要内容包括编程模型、指令集、指令格
式、指令流水线以及异常等。 在构架层面， 龙芯 GS464V 的浮点协处理器及其相关的系统
软件实现符合 ANSI/IEEE 754--1985 的二进制浮点运算标准。 同时， 龙芯 GS464V 浮点
协处理器还拥有自定义的 64 位 SIMD 多媒体定点 (fixed-point) 指令集。

概述
----

![龙芯 GS464V 功能单元的组织构成\label{fig:functional-units}](../images/architect-functional-units.pdf)

龙芯 GS464V 的 FPU 由 FALU1 和 FALU2 两个功能单元组成。图\ \ref{fig:functional-units}
对 GS464V 的浮点功能单元的组织构成进行了图解说明。

- FALU1 单元： FALU1 模块可以执行除浮点访存以及浮点和定点数据传送之外的所有浮点
  操作, 包括 浮点加（减）法、浮点乘法、浮点乘加（减），浮点除法，浮点开平方根，
  浮点求倒，浮点 开根后求倒，浮点与定点转换,浮点精度转换, 浮点比较, 转移判断和其
  它简单逻辑等。此 外，FALU1 模块通过指令编码中 FMT 域的扩展与复用来执行 SIMD 媒
  体操作。
- FALU2 单元： FALU2 执行浮点乘加运算部件（可计算浮点乘、加和浮点乘加指令），浮
  点与定点转换, 浮点精度转换, 浮点比较，和其它简单逻辑等以及媒体 SIMD 指令操作。
  同时，龙芯 GS464V 的 FPU 支持执行 MIPS64 指令集中的并行单精度（Paired-Single，
  简称 PS）浮点指令。

浮点队列每个时钟周期可以分别发射 1 条指令到 FALU1 和 FALU2 单元。浮点寄存器文件
为 FALU1 单元与 FALU2 单元各提供三个专用的读端口和一个专用的写端口。

FPU 寄存器
----------

这部分主要讲述 GS464V 的浮点寄存器组及其组织结构。浮点寄存器组又可分为浮点控制寄
存器（简称 FCR） 和浮点通用寄存器（简称 FGR）。总体而言， 龙芯 GS464V 的 浮点寄
存器与 MIPS64 R2 的浮点寄存器兼容， 但略有差别。

在浮点通用寄存器上， 龙芯 GS464V 的浮点寄存器设置沿袭了 R10000 用法，与 MIPS64
略有不同。 这具体体现在当 CP0 的 Status 寄存器的 FR 位为 1 时，表明系统有 32 个
64 位的逻辑浮点通用寄存器可用；而当 FR 位为 0 时， 表明只有 16 个 32 位或 64 位
的逻辑浮点寄存器。 与之相对的是， 在 MIPS64 的设定上， FR 的值为 1 表示有 32 个
32 位的逻辑浮点通用寄存器， 而 FR 为 0 表示有 16 个 64 位的逻辑浮点通用寄存器。

在物理实现上， GS464V 的每个浮点单元有 64 个物理浮点通用寄存器。 32 个逻辑浮点通
用寄存器通过重命名模块后映射到这些物理寄存器上。

在浮点控制寄存器上， MIPS64 R2 规定每个协处理器最多可以拥有 32 个控制寄存器。而
龙芯 GS464V 核的浮点控制寄存器实现了 5 个控制寄存器， 它们分别是： FIR（0 号）
、 FCSR（31 号） 、FCCR（25 号） 、FEXR（26 号）和 FENR （28 号）。

### FIR 寄存器（CP1，0）

FIR 是 32 位只读寄存器，它包含了浮点单元实现的功能，如处理器 ID，修订版本号等 信
息。龙芯 GS464V 里 FIR 的初始值为 0x0077_0501。表\ 7-1 显示了 FIR 寄存器的格式，
描述了该寄存器的域。

\begin{reglongtable}{fpu-FIR}{FIR 寄存器}
  Impl        & 实现相关                                              \\
  F64         & 浮点数据通路是否为 64 位 0－32 位 1－64 位            \\
  L           & 长字（64 位）定点数据类型是否实现 0－未实现 1－已实现 \\
  W           & 字（32 位）定点数据类型是否实现 0－未实现 1－已实现   \\
  3D          & MIPS-3D ASE 是否实现 0－未实现 1－已实现              \\
  PS          & 浮点对数据类型是否实现 0－未实现 1－已实现            \\
  D           & 双精度浮点数据类型是否实现 0－未实现 1－已实现        \\
  S           & 单精度浮点数据类型是否实现 0－未实现 1－已实现        \\
  ProcessorID & 浮点处理器标识                                        \\
  Revision    & 浮点单元的修订版本号                                  \\
  0           & 保留。必须按 0 写入，读时返回 0。
  \label{tab:fpu-FIR}
\end{reglongtable}

### FCSR 寄存器（CP1，31）

FCSR 寄存器用于控制浮点单元的操作和表示一些状态。GS464V 中 FCSR 的初始值为
0x0000_0F80。表\ \ref{tab:fpu-FIR} 描述了 FCSR 寄存器的格式及各域含义。
其中 E、V、Z、O、U、I 分别表示未实现操作、无效操作、除零、上溢、下溢、不精确。

\begin{reglongtable}{fpu-FCSR}{FCSR 寄存器}
  0       & 保留：必须按 0 写入，读时返回 0。                                \\ 
  CC7-0   & 浮点条件域： 记录浮点比较结果，用于条件跳转或转移等。            \\
  FS      & 冲刷位： 该位设置时，非正常数的结果将被刷为 0，而不产生例外。    \\ 
  T       & Top 模式位： 该位为龙芯具体实现位， 用于在译码时指示是否使用
            x86 的 TOP 寄存器对浮点寄存器号进行重命名。                      \\ 
  Cause   & 当产生浮点运算的例外时，相应位被设置。                           \\ 
  Enables & 是否允许相应的条件产生例外。                                     \\ 
  Flags   & 标志域：是否 IEEE 的浮点例外产生。Enables 未打开时，可查看本字段 \\ 
  RM      & 舍入模式（rounding mode）域。
  \label{tab:fpu-FIR}
\end{reglongtable}

#### 浮点条件域（CC7-0）{-}

当一个浮点比较操作发生时，结果被保存在 CC0 位，即条件位。如果比较结果为真，则
CC0 位被置 1；反之则置 0。CC0 位仅能被浮点比较指令和 CTC1 指令所修改。

其他条件位（CC7-1）则对应相应的浮点操作。 CC1-0 位对应单精度对的条件比较结果。更
多的细节参照 PS 和 SIMD 指令相关章节。

#### 浮点例外原因域（Cause）{-}

控制状态寄存器的位 17：12 为导致（Causes）域，如表\ \ref{fig:fpu-FCSR} 所示，这
些位反映了最近执行指令的结果。Causes 域是协处理器 0 的 Cause 寄存器的一个逻辑扩
充，这些位指示了由上次浮点操作所引起的例外，并且如果相应的使能位（ Enable）被设
置的话则产生一个中断或者例外。如果一条指令中产生不只一个例外，每一个相应的例外导
致位都要被设置。

Causes 域能被每条浮点操作指令所重写（不包括 Load、Store、Move 操作）。其中如果
需要软件仿真来完成的则把该操作的未实现操作位（E）置 1，否则保持为 0。其它位则依照
IEEE754 标准看是否相应的例外产生而分别置 1 或者置 0。

当一个浮点例外发生，没有结果将被存储，状态唯一受影响的就是 Causes 域。

#### 浮点例外使能域（Enables）{-}

任何时候当 Cause 位和相应的使能位（Enable）同时为 1 时，会产生一个浮点例外。如果
浮点操作设置了一个被允许激活（相应使能位为 1）的 Cause 位，则处理器会立即产生一
个例外，这和用 CTC1 指令同时设置 Cause 位和 Enable 位为 1 的效果一样。未实现操作
（E）没有相应的使能位： 当该位被设置时， 浮点例外一定会发生。

从一个浮点例外服务程序返回之前，软件首先必须用 CTC1 指令来清除被激活了的 Cause
位以防止中断的重复执行。 因此， 如果某 Cause 位被使能时（对应的 Enable 位为 1）
，用户态程序将永远不会观察到该位值为 1： 因为有更高优先权的例外服务程序会在用户
程序之前服务例外， 并清除该位。如果用户态程序需要该信息，则必须将其内容储存到其
它地方而不是在 FCSR 寄存器中。 如果该 Cause 位没有被使能，根据 IEEE754 标准， 运
算的结果将被写回， 而且没有例外发生。 在这种情况下，前一条浮点指令所引起的例外情
形能够通过读 Causes 域的值来确定。

#### 浮点标志域（Flags）{-}

标志域的各标志位指示自从上次被重置后是否发生了对应的浮点例外。 如果一个对应的
浮点例外曾产生，那么相应的 Flag 位被置 1，否则保持不变。 任何浮点运算都不会清除
这些标志位， 我们只能通过 CTC1 控制指令写一个新值到 FCSR 寄存器中来实现对
Flag 位的设置或清除。

注意：Flags 域并不由硬件来设置；浮点例外服务程序有责任在调用用户程序之前设置这些
位。

#### 浮点舍入模式域（RM） {-}

FCSR 寄存器的第 0 位和第 1 位组成了舍入模式（RM）域。所有的浮点运算根据这些位所
指定的舍入方式进行相应的舍入处理。表~\ref{tab:rounding-mode} 列出了所有的舍入模
式编码值。

\begin{table}[htbp]
  \centering
  \caption{浮点舍入模式位（RM）编码}\vspace{.3cm}
  \begin{tabular}{|c|c|p{8cm}|} \hline
     RM[1:0] & 助记符 & 描述   \\ \hhline
     $00_2$  & RN     & 把结果向最接近可表示数的方向舍入，当两个最接近可表示数
                        离结果一样接近时，则向最低位为 0 的那个最接近数方向舍入。 \\
     $01_2$  & RZ     & 向 0 方向舍入：把结果向与之最接近并且在绝对值上不大于它的那个 数舍入。\\
     $10_2$  & RP     & 向正无穷大方向舍入:把结果向与之最接近并且不小于它的那个数舍入  \\
     $11_2$  & RM     & 向负无穷大方向舍入：把结果向与之最接近并且不大于它的那个数舍入 \\ \hline
  \end{tabular}
  \label{tab:rounding-mode}
\end{table}

### FCCR 寄存器（CP1，25）

FCCR 寄存器是访问 FCC 字段的另一种方式，其内容与 FCSR 里的 FCC 位完全相同，不同
的是在本寄存器中的 FCC 位是连续的。表\ \ref{tab:fpu-FCCR} 显示了 FCCR 寄存器的格
式。

\begin{floattable}
  \caption{浮点 FCCR 寄存器}
  \includegraphics[scale=0.87]{../images/fpu-FCCR}
  \label{tab:fpu-FCCR}
\end{floattable}

### FEXR 寄存器（CP1，26）

FEXR 寄存器是访问 Cause 和 Flags 字段的另一种方式，其内容与 FCSR 里的相应字段完
全相同。表\ \ref{tab:fpu-FEXR} 显示了 FEXR 寄存器的格式。

\begin{floattable}
  \caption{浮点 FEXR 寄存器}
  \includegraphics[scale=0.87]{../images/fpu-FEXR}
  \label{tab:fpu-FEXR}
\end{floattable}

### FENR 寄存器（CP1，28）

FENR 寄存器是访问 Enable, FS 和 RM 字段的另一种方式，其内容与 FCSR 里的相应字段
完全相同。表\ \ref{tab:fpu-FENR} 显示了 FENR 寄存器的格式。

\begin{floattable}
  \caption{浮点 FENR 寄存器}
  \includegraphics[scale=0.87]{../images/fpu-FENR}
  \label{tab:fpu-FENR}
\end{floattable}

浮点格式
--------

GS464V 的浮点部件不仅可以处理符合 IEEE 标准的单精度（32 位）及双精度
（64 位）浮点数， 同时也提供了对``单精度对''（Paired single, 简称PS）浮点
格式的支持。 图 \ref{fig:fpt-types} 显示了这三种浮点数的详细格式。

\begin{figure}[htbp]
  \centering
  \caption{浮点格式}
  (FIXME)
  \label{fig:fpt-types}
\end{figure}

如图所示，浮点数的格式由以下三个域组成：
\begin{itemize}
  \item 符号域， $S$；
  \item 带偏移的指数域，$E = E_0 + Bias$，其中 $E_0$ 是不带偏移的指数
  \item 小数域，$f= .b_1b_2....b_{p-1}$
\end{itemize}
其中指数 $E_0$ 的可能取值为在 $[E_{min}, E_{max}]$ 之间的任何整数。 另外
还有两个保留的指数值用于编码特殊数值：
\begin{itemize}
  \item $E_{min} - 1$： 用来编码 $\pm0$ 和非规范化数（denormalized）；
  \item $E_{max} + 1$： 用来编码$\pm\infty$ 和 NaN （非数， Not a Number）。
\end{itemize}

对于单精度或者双精度格式来说，每一个非 0 数都只有唯一一种编码与之对应。 一个编码
所对应的数值 $V$ 可以由表\ \ref{tab:float-num-eqn} 中的公式所决定。
\begin{table}[htbp]
  \centering
  \caption{单双精度浮点数：数值公式}
  \begin{tabular}{|c|>{\centering}p{4cm}|>{\centering}p{4cm}|} \hline
    $E$         & $f\neq0$                & $f=0$          \tabularnewline \hhline
    $E_{max}+1$ & NaN                     & $(-1)^s\infty$ \tabularnewline \hline
    $[E_{min}, E_{max}]$ & \multicolumn{2}{c|}{$(-1)^s2^E 1.f$} \tabularnewline \hline
    $E_{min}-1$ & $(-1)^s2^{E_{min}} 0.f$ & $(-1)^s0$      \tabularnewline \hline
  \end{tabular}
  \label{tab:float-num-eqn}
\end{table}

对于所有的浮点格式， 如果 $V$ 是一个 NaN， 那么小数域 $f$ 的最高位决定了这个数是
Signaling NaN （SNAN）还是 Quiet NaN（QNAN）： 如果 $f$ 的最高位被设置， 那么
$V$ 是 QNAN， 否则为 SNAN。 表~\ref{tab:float-paramters} 给出了定义浮点格式的相
关参数值，表\ \ref{tab:float-limits} 列出了可表达的浮点的最大值和最小值。

\begin{table}[htbp]
  \centering
  \caption{浮点格式参数值表}
  \begin{tabular}{|c|>{\centering}p{4cm}|>{\centering}p{4cm}|} \hline
    & \multicolumn{2}{c|}{格式} \tabularnewline \cline{2-3}
    参数                 & 单精度 & 双精度 \tabularnewline \hhline
    $E_{max}$            & +127   & +1203 \tabularnewline
    $E_{min}$            & -126   & -1022 \tabularnewline
    指数偏移量（$Bias$） & +127   & +1023 \tabularnewline
    指数域，$E$，宽度    & 8      & 11 \tabularnewline
    小数域，$f$，宽度    & 24     & 53 \tabularnewline
    总宽度               & 32     & 64 \tabularnewline \hline
  \end{tabular}
  \label{tab:float-paramters}
\end{table}

\begin{table}[htbp]
  \centering
  \caption{浮点范围值表}
  \begin{tabular}{|c|>{\centering}p{4cm}|>{\centering}p{4cm}|>{\centering}p{4cm}|} \hline
    类型   & 最小数                       & 最小正规数                   & 最大数  \tabularnewline \hhline
    单精度 & $1.40129846e^{-45}$          & $1.17549435e^{-38}$          & $3.40282347e^{38}$ \tabularnewline
    双精度 & $4.9406564584124654e^{-324}$ & $2.2250738585072014e^{-308}$ & $1.7976931348623157e^{308}$
    \tabularnewline \hline
  \end{tabular}
  \label{tab:float-limits}
\end{table}

FPU 指令流水线概述
------------------

FPU 提供一个和 CPU 指令流水线并行的指令流水线。它和 CPU 共享基本的 9 级流
水线体系结构，但根据浮点操作的不同，执行流水级又细分为 2\string~6 个流水级。每个 FPU
指令被两个浮点功能单元中的一个执行：FALU1 或者 FALU2。FALU1 可以执行所有的
浮点运算操作及媒体操作。FALU2 仅执行浮点加减、乘法、乘加操作以及所有媒体操作。

每个 FALU 单元每个周期能够分别接收 1 条指令，并能向浮点寄存器文件分别送出一个结
果。在每个 FALU 单元中，浮点加减、浮点乘法、浮点乘加运算需要 6 个执行周期；定点
与浮点间的格式转换运算需要 4 个执行周期；浮点除法根据操作数的不同需要
4\string~16 个执行周期；浮点开平方根根据操作数的不同需要 4\string~31 个执行周期
，其它浮点运算需要 2 个执行周期。在每个 FALU 单元中，如果两条有着不同执行周期的
指令在同一拍输出结果，执行周期较短的指令优先向总线输出结果。 其中除浮点除法和浮
点开根之外的浮点操作和所有媒体操作都是全流水的。如果同时有两个浮点除法指令或者两
个浮点开平方根指令在 FALU1 中，那么 FALU1 单元将向前一流水级发出一个停顿信号，并
且 FALU1 单元在除法或开平方根指令写回前不能接收新的指令。

浮点例外处理
------------

该节描述了浮点计算的例外。浮点例外发生在当 FPU 不能以常规的方式处理操作数
或者浮点计算的结果时，FPU 产生相应的例外来启动相应的软件陷阱或者是设置状态标
志位。

FPU 的控制和状态寄存器对于每一种例外都包含一个使能位，使能位决定一个例外
是否能够导致 FPU 启动一个例外陷阱或者设置一个状态标志。
如果一个陷阱启动，FPU保持操作开始的状态，启动软件例外处理路径；
如果没有陷阱启动，一个适当的值写到FPU目标寄存器中，计算继续进行。

FPU 支持五个 IEEE754 定义的标准例外：

  - 不精确例外（Inexact，I）；
  - 下溢例外（Underflow，U）；
  - 上溢例外（Overflow，O）；
  - 除零例外（Division by Zero，Z）；
  - 非法操作例外（Invalid Operation，V）；

\noindent 以及

  - 未实现操作例外（Unimplemented Operation，E）。

\noindent 未实现操作例外用于 FPU 不能执行标准的 MIPS 浮点结构， 包括 FPU 不能决
定正确的例外行为的情况。 该例外指示了软件例外处理的执行。未实现操作例外没有使能
信号和标志位，当这个例外发生时，一个相应的未实现例外陷阱发生。

IEEE754 定义的 5 个例外（I，U，O，Z，V）都对应着一个用户控制的例外陷阱，当 5 个
使能位的某一位被设置时，相应的例外陷阱被允许发生。当例外发生时，相应的导致（
Cause）位被设置。 如果相应的使能（Enable）位没有设置，例外标志（Flag）位被设置；
如果使能位被设置，那么标志位将不被设置，同时 FPU 产生一个例外给 CPU -- 随后的例
外处理允许该例外陷阱发生。

当没有例外陷阱信号时，浮点处理器采取缺省方式进行处理，提供一个浮点计算例
外结果的替代值。不同的例外类型使用不同的缺省值。表~\ref{tab:fpu-except-default}
列出了 FPU 对于每个 IEEE 例外的默认处理。

\begin{table}[htbp]
  \centering
  \caption{例外的默认处理}
  \begin{tabular}{|c|c|c|p{9cm}|} \hline
    域 & 描述         & 舍入模式 & \cellalign{c|}{默认操作} \tabularnewline \hhline
    I  & 非精确例外   & 任何     & 提供舍入后的结果  \tabularnewline \hline
       &              & RN       & 根据中间结果的符号把结果置 0 \tabularnewline
    U  & 下溢例外     & RZ       & 根据中间结果的符号把结果置 0 \tabularnewline
       &              & RP       & 把正下溢修正为最小正数，把负下溢修正为 $-0$ \tabularnewline
       &              & RM       & 把负下溢修正为最小负数,把正下溢修正为 $+0$ \tabularnewline \hline
       &              & RN       & 根据中间结果的符号把结果置为$\infty$ \tabularnewline
    O  & 上溢例外     & RZ       & 根据中间结果的符号把结果置为最大数 \tabularnewline
       &              & RP       & 把负下溢修正为最大负数,把正下溢修正为$+\infty$ \tabularnewline
       &              & RM       & 把正下溢修正为最大整数,把负下溢修正为$-\infty$ \tabularnewline \hline
    Z  & 除零例外     & 任何     & 提供一个相应的带符号的无穷大数 \tabularnewline
    V  & 非法操作例外 & 任何     & 提供一个 Quiet Not a Number(QNaN) \tabularnewline \hline
  \end{tabular}
  \label{tab:fpu-except-default}
\end{table}

下面对导致 FPU 产生每种例外的条件进行了描述， 并且详细说明了 FPU 对每个例外
导致条件的反应。

### 不精确例外 (I)

FPU 在发生如下的情况时产生不精确例外： 舍入结果非精确 舍入结果上溢
舍入结果下溢，并且下溢和不精确的使能位都没有被设置，而且 FS 位被设置。

\fpuexceptout
{如果一个非精确例外陷阱被使能，结果寄存器不被修改，并且
源寄存器被保留。因为这种执行模式会影响性能，所以不精确例外陷阱只有在必要的时
候才被使能。}{舍入或者上溢结果被发送到目标寄存器。}

### 下溢例外 (U)

两个相关的事件导致了下溢例外： 一个很小的在±2Emin
之间的非零结果，由于该结果非常小，因此会导致其后发生 下溢例外。 用非规范化数据
（Denormalized Number） 来近似表示这两个小数据所产生的严重的 数据失真。 IEEE754
允许用多种不同的方法检测这些事件， 但对于所有的操作要求用相同的方法
来检测。小数据可以用下面的方法的一种来检测：
舍入后（如果一个非零的数据，在指数范围没有界限的情况下来计算，应该严格
的位于±2Emin 之间）
舍入前（如果一个非零的数据，在指数和精度范围没有界限的情况下来计算，应
该严格的位于±2Emin 之间） MIPS
的结构要求微小数据在舍入后检测。精度失真可以用如下方法的一种来检测：
非规范化数据的失真（当产生的结果与指数没有界限时计算的结果不同）
非精确数据（当产生的结果与指数和精度范围没有界限的情况下计算的结果不 同） MIPS
结构要求精度失真被检测为产生非精确结果。

\fpuexceptout
{如果下溢或者不精确例外被使能，或者FS位没有设置，产生未
实现操作例外，结果寄存器不被修改。}
\beginblock

如果下溢或者不精确例外不被使能，而且FS位被设置，最后的
结果由舍入模式和立即结果的符号位来决定。

\endblock

### 上溢例外 (O)

当舍入后的浮点结果的幅度用没有界限的指数来表示时，大于最大的目标模式所表
示有限数据，上溢例外发出通知信号。 （这个例外同时设置不精确例外和标志位）

\fpuexceptout
{结果寄存器不被修改，源寄存器保留。}
\beginblock

如果没有陷阱发生，最后的结果由舍入模式和中间结果的符号来决定。

\endblock

### 除零例外 (Z)

除法运算中当除数是 0 被除数是一个有限的非零的数据时， 除零例外发出信号通知。
利用软件可以对其他操作产生有符号的无穷值时模拟除零例外， ln(0)， 如：
sin(π/2)， cos(0)， 或者 0-1。

\fpuexceptout{结果寄存器不被修改，源寄存器保留。}{如果没有陷阱发生，结果是有符号
的无穷值。}

### 非法操作例外 (V)

当一个可执行的操作的两个操作数或其中的一个操作数是非法时，非法操作例外发
出信号通知。 如果例外没有陷入， MIPS 定义这个结果是一个 Quiet Not a Number
（QNaN） 。 非法操作包括： 加法或者减法：无穷相减。例如：(+∞)+(-
∞)或者(-∞)-(- ∞) 乘法：0×∞，对于所有的正数和负数
除法：0/0，∞/∞，对于所有的正数和负数 当不处理 Unordered 的比较操作的操作数是
Unordered 对一个指示信号 NaN 进行浮点比较或者转换 任何对 SNaN（Signaling
NaN）的数学操作。当其中一个操作数为 SNaN 或者两 个都为 SNaN
时会导致这个例外（MOV 操作不被认为是数学操作，但 ABS 和 NEG 被认 为是数学操作）
开方： X ，当 X 小于 0 时

软件可以模拟其他给定源操作数的非法操作的例外。例如在 IEEE754 中利用软件来
实现的特定函数：X REM Y，这里当 Y 是 0 或者 X 是无穷的时候；或者当浮点数转化为
十进制时发生上溢，是无穷或者是 NaN；或者先验函数例如：ln(5)或者 cos-1(3)。

\fpuexceptout{源操作数的值不被发送。}{如果没有其他例外发生，QNaN被发送到目标寄存
器中。}

### 未实现操作例外 (E)

当执行任何一条为以后定义所保留的操作码或者操作格式指令时，FPU 控制/状态寄
存器中的未实现操作导致位被设置并产生陷阱。源操作数和目的寄存器保持不变，同时
指令在软件中仿真。IEEE754 中的任何一个例外都能够从仿真操作中产生，这些例外反
过来可以被仿真。另外，当硬件不能正确执行一些罕见的操作或者结果条件时，也会产
生未实现指令例外。这些包括：

1. 非规范化操作数（Denormalized Operand），比较指令除外
1. Quite Not a Number 操作数（QNaN），比较指令除外
1. 非规范化数据或者下溢，而且当下溢或者不精确使能信号被设置同时 FS 位没有被设置

\noindent 注意: 非规范化和NaN操作只在转换或者计算指令中进入陷阱，在MOV指令中不进
入陷阱。

\fpuexceptout{原操作数据不被发送。}{该陷阱不能被屏蔽。}
