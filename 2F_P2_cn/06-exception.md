处理器例外
==========

本章介绍龙芯 GS464V 处理器核例外，内容包括：例外的产生及返回，例外向量位置和所支
持的 例外类型。其中对每一类支持的例外类型，介绍内容包括例外的原因，处理和服务。

例外概述
--------

### 例外的产生及返回

当处理器开始处理某个例外，状态寄存器的 EXL 位是被置为 1 的，这意味着系统运行在内
核模 式。在保存了适当的现场状态之后，例外处理程序通常将状态寄存器的 KSU 字段设定
为内核模式， 同时将 EXL 位置回为 0。当恢复现场状态并且重新执行时，处理程序则会把
KSU 字段恢复回上次的 值，同时置 EXL 位为 1。 从例外返回也会将 EXL 位置为 0。

### 例外向量位置 \label{sec:excVectorLocation}

冷 重 置 、 软 重 置 和 非 屏 蔽 中 断 (NMI) 例 外 的 向 量 地 址 是 专 用 的 重
置 例 外 向 量 地 址 0xFFFFFFFFBFC00000，这个地址既不通过 Cache 进行存取，也无需
地址映射。此外，EJTAG 调试中 断的入口根据其控制寄存器中的 ProbeTrap 位是 0 还是
1 分别选用 0xFFFFFFFFBFC00480 和 0xFFFFFFFFFF200200。所有其它例外向量地址的形式
都是基地址加上向量偏移。当状态寄存器中的 BEV 位为 0 时用户可定义例外向量的基址，
详见表\ \ref{tab:excvec-base} 例外向量基址。

Table: 例外向量基址 \label{tab:excvec-base}

|                   例外   | BEV=0                             | BEV=1               |
|------------------------  | --------------------------------  | --------------------|
| Reset, Soft Reset, NMI   | 0xFFFFFFFF                        | BFC00000            |
| EJTAG Debug(ProbEn=0)    | 0xFFFFFFFF                        | BFC00480            |
| EJTAG Debug(ProbEn=1)    | 0xFFFFFFFF                        | FF200200            |
| Cache Error              | 0xFFFFFFFF \|\| EBase31..30 \|\|  | 0xFFFFFFFF BFC00300 |
|                          |  1 \|\| EBase28..12 \|\| 0x000    |                     |
| Others              | 0xFFFFFFFF \|\| EBase31..12 \|\| 0x000 | 0xFFFFFFFF BFC00200 |

表 \ref{tab:excvec-offset} 列出了龙芯 GS464V 处理器核中例外向量的偏移。

Table: 例外向量偏移 \label{tab:excvec-offset}

| 例外                   | 例外向量偏移     |
|------------------------|------------------|
| TLB Refill, EXL=0      | 0x000            |
| XTLB Refill, EXL=0     | 0x080            |
| Cache error            | 0x100            |
| 其它共用例外           | 0x180            |
| 中断且 CauseIV=1       | 0x200            |
| Reset, Soft Reset, NMI | 无（使用基地址） |

对于外部中断(包括时钟和性能计数器中断)，传统做法是使用共用例外入口，由软件负责分
发到相应的服务。龙芯 GS464V 处理器核支持向量中断模式(Vectored Interrupt)，该模式
由 Cause 寄存器的 IV 位选择。在向量中断模式下，中断优先级从 IP7 到 IP0 依次降低
并且有专门的例外入口。IntCtl 寄存器的 VS 域控制这些例外处理代码所占用的空间大小
，每个中断对应的入口偏移可用下式计算(其中向量号从零开始)：

         向量中断偏移 = 0x200 + 向量号 * IntCtlVS

### 例外优先级

这一章的剩余部分将按照表 \ref{tab:except-order} 中给出的优先顺序依次介绍各个例外
(对某些特定例外，如 TLB 例外和指令/数据例外，为了方便而放在一起介绍)。当一条指令
同时产生一个以上例外
时，只向处理器报告其中优先级最高的例外。有些例外并不是由当时正在执行的指令产生的
，而有些例外可能被推迟处理。更多细节请查看本章对各个例外的单独介绍。

Table: 例外优先顺序 \label{tab:except-order}

| 例外优先顺序                                                       |
| ------------------------------------------------------------       |
| 冷重置(最高优先级)                                                 |
| 不可屏蔽中断 (NMI)                                                 |
| 地址错误 –– 取指                                                   |
| TLB 重填 –– 取指                                                   |
| TLB 无效 –– 取指                                                   |
| Cache 错 –– 取指                                                   |
| 总线错误 ––取指                                                    |
| 整型溢出，陷阱，系统调用，断点，保留指令，协处理器不可用，浮点例外 |
| EJTAG 中断                                                         |
| 地址错误 –– 数据存取                                               |
| TLB 重填 –– 数据存取                                               |
| TLB 无效 –– 数据存取                                               |
| TLB 修改 –– 写数据                                                 |
| EJTAG 数据断点                                                     |
| Cache 错 –– 数据存取                                               |
| 总线错误 ––数据存取                                                |
| 中断(最低优先级)                                                   |

一般来说，下面各节中介绍的例外先由由硬件来处理，然后由软件来服务。

详细例外说明
------------

### 冷重置例外

\exceptionblk{当系统第一次上电或者冷重置时，产生冷重置例外。该例外不可屏蔽。}
\beginblock

CPU 为这个例外提供了一个特殊的中断向量（32 位模式下位于 0xBFC0\_0000，
64 位模式下位于 0xFFFF FFFF BFC0 0000）。冷重置向量地址属于无需地址映射和不通过
Cache 存取数据的 CPU 地址空间，因此处理这个例外不必初始化 TLB 或 Cache。这也意味
着即使 Cache 和 TLB 处于不确定状态，处理器也可以取出并执行指令。

当例外发生时，CPU 中所有寄存器内容是不确定的，但下列寄存器域除外：

1. 状态（Status）寄存器的初值为 0x30c000e4，SR 位被清为 0，ERL 位和 BEV 位被置为
   1。
1. 配置（Config）寄存器的初值为 0x80034482。
1. 随机（Random）寄存器初始化为它的最大值。
1. Wired 寄存器初始化为 0。
1. ErroEPC 寄存器初始化为 PC 的值。
1. PerfCnt 寄存器的 Event 位初始化为 0。
1. 所有断点和外部中断都被清除。

\endblock
\beginblock

冷重置例外服务包括：初始化所有的处理器寄存器，协处理器，Cache 和存储系统。执行
诊断测试。引导自举操作系统。

\endblock

### NMI 例外

\exceptionblk{NMIn 为低产生 NMI 例外。该例外不可屏蔽。}
\beginblock

当发生 NMI 例外时，状态寄存器的 SR 位被置为１，用以区分冷重置。
     NMI 例外只能在指令的边界被提取。它并不抛弃任何机器的状态，而是保留处理器的状态用于诊
断。Cause 寄存器内容保持不变，而系统则跳到 NMI 例外处理程序开始处。
     NMI 例外保留除下列寄存器外的所有寄存器值：
包含 PC 值的 ErrorEPC 寄存器。
置为 1 的状态寄存器 ERL 位。
软重置或 NMI 置为 1，冷重置置为 0 的状态寄存器 SR 位。
置为 1 的状态寄存器 BEV 位。
PC 寄存器重置为 0xFFFF FFFF BFC0 0000

\endblock
\beginblock

NMI 例外可以用于除“重置处理器，同时保持 Cache 和内存内容”之外的情形。例如，当检
测到电源故障时，系统可以通过 NMI 例外立即、可控地关闭系统。

由于 NMI 例外在另外一个错误例外中发生，因此从例外返回后，通常不太可能继续执行程
序。

\endblock

### 地址错误例外

\exceptionblk\beginblock

当执行以下情况时，会发生地址错误例外：
* 引用非法地址空间。
* 在用户模式下引用超级用户地址空间。
* 在用户或超级用户模式下引用内核地址空间。
* 取(Load)或存(Store)一个双字，但双字不对齐于双字边界。
* 取(Load，Fetch)或存(Store)一个字，但字不对齐于字的边界。
* 取或存一个半字，但半字不对齐于半字的边界。

该例外不可屏蔽。

\endblock
\beginblock

共用例外向量用于地址错误例外。Cause 寄存器的 ExcCode 字段值被设为 ADEL 或 ADES
编码值，连同 EPC 寄存器和 Cause 寄存器的 BD 位一起，指明引起例外的指令以及例外的
起因是指令引用、取操作指令还是存操作指令。

例外发生时，BadVAddr 寄存器保存了没有正确对齐的虚地址，或者受保护的地址空间的虚
地址。

如果引发例外的指令不是位于分支延迟槽内的指令，那么 EPC 寄存器保存了该指令的地址
；否则， EPC 寄存器保存了之前的分支指令的地址，并且 Cause 寄存器的 BD 位被置为 1
。

服务 此时，正在运行的导致例外发生的进程会收到 UNIX SIGSEGV(段违例)信号，这个错误
对该进程 来说通常是致命的。

\endblock

### TLB 例外

可能发生三种 TLB 例外：

1. 当 TLB 中没有项与欲引用的映射地址空间的地址匹配时，会导致 TLB 重填例外。
1. 当虚 地址引用与 TLB 中某一项匹配，但该项被标示为无效时，TLB 无效例外发生。
1. 当写内存操作的虚地址引用与 TLB 中某项匹配，但该项并没有被标示为“脏” 时（表示
   该项不可写），TLB 修改例外发生。

下面三节将介绍这些 TLB 例外。

注：TLB 重填向量选择已经在本章前面作了介绍，具体章节见 6.8“TLB 重填例外”。


#### TLB 重填例外

\exceptionblk{当 TLB 中没有项匹配映射地址空间的引用地址时，TLB 重填例外发生，该
例外是不可屏蔽的。}
\beginblock

对于这个例外来说，MIPS 体系结构存在两个特殊的例外向量：一个用于 32 位地址空间，
另一个用于 64 位地址空间。当引用地址在 32 位地址空间中时例外向量偏移为 0x000，当
引用地址在 64 位地址空间中时例外向量偏移为 0x080。

当状态寄存器中的 EXL 位被设为 0 时，所有的地址引用使用这些例外向量。这个例外设置
Cause 寄存器中 ExcCode 字段的值为 TLBL 或 TLBS 编码。这个编码与 EPC 寄存器以及
Cause 寄存器的 BD 一起，指明引起例外的指令以及例外的起因是指令引用、取操作指令还
是存操作指令。

发生这个例外时，BadVAddr、Context、XContext 和 EntryHi 寄存器保存了那条地址转换
失败的虚地址。EntryHi 寄存器也保存了转换失败时的 ASID。Random 寄存器通常保存了用
于放置被替换 TLB 项的合法位置。EntryLo 寄存器的内容是不确定的。如果引发例外的指
令不是位于分支延迟槽内的指令，那么 EPC 寄存器保存了导致例外的指令的地址；否则，
EPC 寄存器保存了之前的分支指令的地址，并且 Cause 寄存器的 BD 位被置为 1。

\endblock
\beginblock

为了服务这个例外，Contex 或 XContext 寄存器的内容被作为虚地址以取得某些内存位置
，这些位置包含了一对 TLB 项的物理页地址和访问控制位。这一对 TLB 项被放入了
EntryLo0/EntryLo1 寄存器；EntryHi 和 EntryLo 寄存器被写入 TLB。

用于获得物理地址和访问控制信息的虚地址有可能位于一个没有驻留在 TLB 中的页面上。
如果出现这种情况，则在 TLB 重填处理程序允许另外一个 TLB 重填例外来解决。由于
Status 寄存器的 EXL 位被置为 1，第二个 TLB 重填例外被传递的是共用例外向量。

\endblock

#### TLB 无效例外

\exceptionblk{当一个虚地址引用匹配到一项被标记为无效的 TLB 项(TLB 有效位被清掉)
时，TLB 无效例外发生。这个例外是不可屏蔽的。}
\beginblock
 
共用例外向量用于处理这个例外。Cause 寄存器的 ExcCode 字段值被设为 TLBL 或 TLBS，
连同 EPC 寄存器和 Cause 寄存器的 BD 位一起，指明引起例外的指令以及例外的起因是指
令引用、取操作指令还是存操作指令。

发生这个例外时，BadVAddr、Context、XContext 和 EntryHi 寄存器保存了那条地址转换
失败的虚地址。EntryHi 寄存器也保存了转换失败时的 ASID。Random 寄存器通常保存了用
于放置被替换 TLB 项的合法位置。EntryLo 寄存器的内容是不确定的。

如果引发例外的指令不是位于分支延迟槽内的指令，那么 EPC 寄存器保存了该指令的地址
；否则， EPC 寄存器保存了之前的分支指令的地址，并且 Cause 寄存器的 BD 位被置为 1
。

\endblock
\beginblock

当发生下面情况之一时，TLB 项被标记为无效：
     虚地址不存在
     虚地址存在，但是不在主存中(缺页)
     引用这个页而引发一个陷阱(例如,维护引用位)
     在服务完 TLB 无效例外的起因之后，通过 TLBP 指令来定位 TLB 项(探测 TLB 来找
     匹配的项)，然 后用标记位有效的一项来替换该 TLB 项。

\endblock

#### TLB 修改例外

\exceptionblk{当写内存操作的虚地址引用与 TLB 中某项匹配，但该项并没有被标示为“脏
”，因此该项不可写时，TLB 修改例外发生。该例外不可屏蔽。}
\beginblock

共用例外向量用于处理这个例外，并且 Cause 寄存器中的 ExcCode 字段值被设置为
MOD。 发生这个例外时，BadVAddr、Context、XContext 和 EntryHi 寄存器保存了那条地
址转换失败的 虚地址。EntryHi 寄存器也保存了转换失败时的 ASID。EntryLo 寄存器的内
容是不确定的。 如果引发例外的指令不是位于分支延迟槽内的指令，那么 EPC 寄存器保存
了该指令的地址；否则， EPC 寄存器保存了之前的分支指令的地址，并且 Cause 寄存器的
BD 位被置为 1。

\endblock
\beginblock

内核使用失败的虚地址或虚页号来识别相应的访问控制信息。被识别的页可能允许或者不允
许写

访问；如果写访问不允许，那么写保护违例发生。 如果写访问是允许的，那么内核在其自
己的数据结构内将页标记为可写。TLBP 指令把必须改变 的 TLB 项的索引放入到 Index 寄
存器中。包含物理页和访问控制位(D 位被设置)的一个字被取出放入 EntryLo 寄存器中，
然后，EntryHi 和 EntryLo 寄存器被写入 TLB 中。

\endblock

### Cache 错误例外

\exceptionblk{当处理器取指或者访存而出现内部 Cache 校验错时，Cache 错误例外发生
。该例外不可屏蔽。}
\beginblock

偏移量为 0x100 的 Cache 错例外入口用于处理 Cache 错误例外。此时例外入口基址
被设在不经过 Cache 的地址段。Cause 寄存器的 ExcCode 字段值被设为 CacheErr，连同
EPC 寄存器和 Cause 寄存器的 BD 位一起，指明引起例外的指令以及例外的起因是指令引
用还是访存操作指令。CacheErr 寄存器记录出错类型和在组相联 Cache 中的位置。
CacheErr1 寄存器记录出错的指令虚地址或者内存物理地址，详见第 X 章第 X 节
CacheErr 和 CacheErr1 寄存器描述。

如果引发例外的指令不是位于分支延迟槽内的指令，那么 EPC 寄存器保存了该指令的地址
；否则， EPC 寄存器保存了之前的分支指令的地址，并且 Cause 寄存器的 BD 位被置为 1
。

\endblock
\beginblock

龙芯 GS464V 处理器核对 Cache 错实现了硬件自纠错功能，应用程序可以简单地直接
从例外返回。

若为指令 Cache 出错，出错的 Cache 行将被无效；若为数据 Cache 出错且只有一位错时
，有错的数据将被自动纠正；若数据 Cache 出错且有两位错时，操作系统应视出错数据块
的位置决定处理方式。

\endblock

### 总线错误例外

\exceptionblk{当处理器进行数据块的读取、更新或双字/单字/半字的读请求时收到外部的
ERR 完成应答信号，总线错误例外发生。该例外不可屏蔽。}
\beginblock

共用中断向量用于处理总线错误例外。Cause 寄存器的 ExcCode 字段值被设为 IBE
或 DBE，连同 EPC 寄存器和 Cause 寄存器的 BD 位一起，指明引起例外的指令以及例外的
起因是指令引用、取操作指令还是存操作指令。

如果引发例外的指令不是位于分支延迟槽内的指令，那么 EPC 寄存器保存了该指令的地址
；否则， EPC 寄存器保存了之前的分支指令的地址，并且 Cause 寄存器的 BD 位被置为 1
。

\endblock
\beginblock

发生错误的物理地址可以通过 CP0 寄存器中的信息计算出来。

如果 Cause 寄存器中的 ExcCode 字段值被设置为 IBE 编码(表示是取指引用)，那么导致
例外发生的指令虚地址保存在 EPC 寄存器中（如果 Cause 寄存器的 BD 位被置为 1，则该
指令的虚地址为 EPC 寄存器内容加 4）。

如果 Cause 寄存器中的 ExcCode 字段值被设置为 DBE 编码(表示是读取或存储引用)，那
么导致例外发生的指令虚地址保存在 EPC 寄存器中（如果 Cause 寄存器的 BD 位被置为 1
，则该指令的虚地址为 EPC 寄存器内容加 4）。

于是，读取和存储引用的虚地址就可以通过解释这条指令来获得。而物理地址可以通过
TLBP 指令以及读取 EntryLo 寄存器内容计算物理页号来获得。导致例外发生的正在运行的
进程会收到 UNIX SIGBUS(总线错误)信号，对该进程来说这通常是致命的。

\endblock

### 整型溢出例外

\exceptionblk{当一条 ADD、ADDI、SUB、DADD、DADDI 或 DSUB 指令执行，导致结果的补
码溢出时，整型溢出例外发生。这个例外是不可屏蔽的。}
\beginblock

共用例外向量用于处理这个例外，并且 Cause 寄存器的 ExcCode 字段被置为 OV 编码值。

如果引发例外的指令不是位于分支延迟槽内的指令，那么 EPC 寄存器保存了该指令的地址
；否则， EPC 寄存器保存了之前的分支指令的地址，并且 Cause 寄存器的 BD 位被置为 1
。

\endblock
\beginblock

导致例外发生的正在执行的进程会收到一个 UNIX SIGFPE/FPE_INTOVE_TRAP(浮点例外/整型
溢出) 信号。对该进程来说，这个错误通常是致命的。

\endblock

### 陷阱例外

\exceptionblk{当 TGE、TGUE、TLT、TLTU、TEQ、TNE、TGEI、TGEUI、TLTI、TLTUI、TEQI
、TNEI 指令执行，条件结果为真时，陷阱例外发生。这个例外是不可屏蔽的。}
\beginblock

共用例外向量用于处理这个例外，并且 Cause 寄存器的 ExcCode 字段被置为 TR 编码值。
如果引发例外的指令不是位于分支延迟槽内的指令，那么 EPC 寄存器保存了该指令的地址
；否则， EPC 寄存器保存了之前的分支指令的地址，并且 Cause 寄存器的 BD 位被置为 1
。

\endblock
\beginblock

导致例外发生的正在执行的进程会收到一个 UNIX SIGFPE/FPE_INTOVE_TRAP（浮点例外/整
型溢出）信号。对该进程来说，这个错误通常是致命的。

\endblock

### 系统调用例外

\exceptionblk{当执行 SYSCALL 指令的时候，系统调用例外发生。这个例外是不可屏蔽的
。}
\beginblock

共用例外向量用于处理这个例外，并且 Cause 寄存器的 ExcCode 字段被置为 SYS 编码值
。如果 SYSCALL 指令没有在分支延迟槽中，则 EPC 寄存器保存这条指令的地址；否则，保
存之前的分支指令的地址。如果 SYSCALL 指令在分延迟槽中，则状态寄存器中的 BD 位被
置为 1，否则该位被清 0。

\endblock
\beginblock

当这个例外发生时，控制权被转到适当的系统例程。进一步的系统调用区分可以分析
SYSCALL 指令的 Code 字段（位 25：6），以及载入 EPC 寄存器中所存地址的指令的内容
。为了恢复进程的执行，必须改变 EPC 寄存器的内容，这样 SYSCALL 指令才不会再次被执
行；这可以通过在返回之前使 EPC 寄存器的值加 4 来完成。如果 SYSCALL 指令处在分支
延迟槽中，则需要更复杂的算法，这已经超出了本节所能描述的范围。

\endblock

### 断点例外

\exceptionblk{当执行一条 BREAK 指令时，发生断点例外。这个例外是不可屏蔽的。}
\beginblock

共用例外向量用于处理这个例外，并且 Cause 寄存器的 ExcCode 字段被置为 BP 编
码值。 如果 BREAK 指令没有在分支延迟槽中，则 EPC 寄存器保存这条指令的地址；否则
，保存之前的分 支指令的地址。 如果 BREAK 指令在分延迟槽中，则状态寄存器中的 BD
位被置为 1，否则该位清 0。

\endblock
\beginblock

当这个例外发生时，控制权被转到适当的系统例程。进一步的区分可以分析 BREAK 指令的
Code 字段（位 25：6），以及载入 EPC 寄存器中所存地址的指令的内容。如果这条指令在
分支延迟槽中，那么 EPC 寄存器中的内容必须加上 4 以定位到该指令。

为了恢复进程的执行，必须改变 EPC 寄存器的内容，这样 BREAK 指令才不会再次被执行；
这可以通过在返回之前使 EPC 寄存器的值加 4 来完成。

如果 BREAK 指令在分支延迟槽中，那么为了恢复进程的继续执行，需要解释这条分支指令
。

\endblock


### 保留指令例外

\exceptionblk{当试图执行一条没有在 MIPS64 Release2 定义并且非龙芯自定义的指令时
，保留指令例外发生。 这个例外是不可屏蔽的。}
\beginblock

共用例外向量用于处理这个例外，并且 Cause 寄存器的 ExcCode 字段被置为 RI 编
码值。 如果保留指令指令没有在分支延迟槽中，则 EPC 寄存器保存这条指令的地址；否则
，保存之前的 分支指令地址。

\endblock
\beginblock

此时 ，没有指令被解释执行。正在执行的导致例外发生的进程会收到 UNIX
SIGILL/ILL_RESOP_FAULT(非法指令/保留的操作错误)信号。对该进程来说，这个错误通常
是致命的。

\endblock


### 协处理器不可用例外

\exceptionblk\beginblock

试图执行以下任意一条协处理器指令，将会导致协处理器不可用例外发生：

* 相应的协处理器单元（CP1 或 CP2）没有被标记为可用。
* CP0 单元没有被标记为可用，并且进程执行在用户或者超级用户的模式下的 CP0 指令。

这个例外是不可屏蔽的。

\endblock
\beginblock

共用例外向量用于处理这个例外，并且 Cause 寄存器的 ExcCode 字段被置为 CPU 编
码值。Cause 寄存器的 CE 域指示四个协处理器的哪个被引用。如果这条指令不是在分支延
迟槽中，EPC 寄存器保 存了不可使用协处理器指令的地址；否则，EPC 寄存器保存了之前
的分支指令的地址。

\endblock
\beginblock

有以下的几种情形： 如果进程被授权访问协处理器，协处理器被标记为可用，那么相
应的用户状态被恢复以便协处理 器执行。 如果进程被授权访问协处理器，但是协处理器不
存在或者有故障，则需要解释/模拟这条协处理 器指令。 如果在 Cause 寄存器中的 BD 位
被设置了，分支指令必须被解释；然后协处理器指令被模拟。例 外返回时跳过例外的协处
理器指令继续执行。 如果进程没有被授权访问协处理器，这时执行的进程收到 UNIX
SIGILL/ILL_PRIVIN_FAULT(非法 指令/特权指令错误)信号。这个错误通常是致命的。

\endblock

### 浮点例外

\exceptionblk{浮点协处理器使用浮点例外。这个例外是不可屏蔽的。}
\beginblock

共用例外向量用于处理这个例外，并且 Cause 寄存器的 ExcCode 字段被置为 FPE 编码值
。 浮点控制/状态寄存器的内容指示这个例外产生的原因。

\endblock
\beginblock

清除浮点/状态寄存器中的适当位可以清除这个例外。

\endblock


### EJTAG 例外

当与某些 EJTAG 相关的条件满足时，触发 EJTAG 例外。具体描述见第 X 章

### 中断例外

\exceptionblk{当八个中断条件中的一个触发，中断例外发生。这些中断的重要性依赖于特
定的系统实现。 通过清掉在状态寄存器中的 Interrupt-Mask (IM)域中的相应的位，八个
中断中的任何一个都可 以被屏蔽，并且，通过清掉状态寄存器的 IE 位，可以一次屏蔽所
有的八个中断。}
\beginblock

Cause 寄存器的 ExcCode 字段被置为 INT 编码值。根据当前配置，处理器使用传统的共用
例外向量处理或者使用向量例外模式选择最高优先级的中断号对应的入口进行处理。

Cause 寄存器中的 IP 域指明了当前的中断请求。不止一个的中断位可能同时被设置(如果
中断触发并且在寄存器被读到之前被撤消，甚至没有位被设置)。














English Translation-

Processor exception
This chapter introduces Loongson GS464V processor core exceptions, including: exception generation and return, exception vector location and supported exception types. For each type of supported exception type, the introduction includes the reason, treatment and service of the exception.

Exception overview
Generation and return of exceptions
When the processor starts to handle an exception, the EXL bit of the status register is set to 1, which means that the system is running in kernel mode. After saving the appropriate field status, the exception handler usually sets the KSU field of the status register to kernel mode, and resets the EXL position to 0 at the same time. When the scene state is restored and executed again, the processing program will restore the KSU field to the last value and set the EXL bit to 1. Returning from an exception will also set the EXL position to 0.

Exception vector location \label{sec:excVectorLocation}
The vector address outside the cold reset, soft reset and non-masked interrupt (NMI) exception is a special reset example. The outside vector address is 0xFFFFFFFFBFC00000. This address is neither accessed through the Cache nor requires address mapping. In addition, the entry of the EJTAG debug interrupt is based on the entry in its control register

IP[7]中断有三个源，除中断线 5 外，在 Count 寄存器内容与 Compare 寄存器内容相等时
或者 CP0 性能计数器溢出时产生中断。时钟中断和性能计数器溢出中断由 Cause 寄存器中
的 TI 和 PCI 位指示。

如果未用向量中断模式，软件需要对每一个可能的中断源进行查询来判断中断产生的原因（
一个中断同时可能有多个源）。

\endblock
\beginblock

如果中断是由两个软件产生例外之一导致的，则设置 Cause 寄存器中的相应位，IP[1：0]
，为 0 来清除中断条件。

软件中断是非精确的。一旦软件中断触发，在例外被处理之前，程序还可能继续执行几条指
令。定时器中断的清除通过向 Compare 寄存器写入值来完成。性能计数器中断的清除则是
向计数器的溢出位，即位 31，写入 0 来实现。

* 冷重置和软重置会清除所有未完成的外部中断请求，IP[2]至 IP[6]。
* 如果中断是硬件产生的，那么撤消引起触发的中断管脚的条件，就可清除中断条件。

\endblock

