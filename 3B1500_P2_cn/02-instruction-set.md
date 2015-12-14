龙芯 GS464V 处理器核指令集概述
==============================

龙芯 GS464V 处理器核兼容 MIPS64 R2 体系结构，提供了其所定义的全套必需指令。在此
基础上还提供部分媒体与 X86 虚拟机扩展指令。处理器指令编码为 32 位，主要包括三种
指令格式，如图 2-1 所示，立即数指令（I-型），跳转指令（J-型）和寄存器指令（R-型
）。

![龙芯处理器指令格式](../images/ins-format-cn.pdf)

\noindent 其中各位域解释为：
\begin{center}
  \begin{tabular}{ll@{\hspace{1cm}}ll@{\hspace{1cm}}}
    op：        & 6 位操作码;         & target：& 26 位跳转目标地址；    \\ 
    rs：        & 5 位源操作寄存器域; & rd：    & 5 位目的操作寄存器域； \\ 
    rt：        & 5 位目标操作寄存器; & sa：    & 5 位移位位数；         \\ 
    immediate： & 16 位立即数;        & funct： & 6 位功能域。
  \end{tabular}
\end{center}

MIPS64 兼容指令列表
-------------------

根据指令功能，MIPS64 指令可分为如下几组：

* 访存指令
* 运算指令
* 转移指令
* 其它指令
* 协处理器指令

下面分组列出龙芯 GS464V 处理器兼容的所有 MIPS64 指令

### 访存指令

MIPS 体系结构采用 load/store 架构。所有运算都在寄存器上进行，只有访存指令可对主
存中的数据进行访问。访存指令包含各种宽度数据的读写、无符号读、非对齐访存和原子访
存等。

\begin{inslongtable}{MIPS64 访存指令}{tab:mips64-memory-ins}\hhline
  LB  & 取字节           & MIPS32 \tabularnewline
  LBU & 取无符号字节     & MIPS32 \tabularnewline
  LH  & 取半字           & MIPS32 \tabularnewline
  LHU & 取无符号半字     & MIPS32 \tabularnewline
  LW  & 取字             & MIPS32 \tabularnewline
  LWU & 取无符号字       & MIPS32 \tabularnewline
  LWL & 取字左部         & MIPS32 \tabularnewline
  LWR & 取字右部         & MIPS32 \tabularnewline
  LD  & 取双字           & MIPS64 \tabularnewline
  LDL & 取双字左部       & MIPS64 \tabularnewline
  LDR & 取双字右部       & MIPS64 \tabularnewline
  LL  & 取标志处地址     & MIPS32 \tabularnewline
  LLD & 取标志处双字地址 & MIPS64 \tabularnewline
  SB  & 存字节           & MIPS32 \tabularnewline
  SH  & 存半字           & MIPS32 \tabularnewline
  SW  & 存字             & MIPS32 \tabularnewline
  SWL & 存字左部         & MIPS32 \tabularnewline
  SWR & 存字右部         & MIPS32 \tabularnewline
  SD  & 存双字           & MIPS64 \tabularnewline
  SDL & 存双字左部       & MIPS64 \tabularnewline
  SDR & 存双字右部       & MIPS64 \tabularnewline
  SC  & 满足条件下存     & MIPS32 \tabularnewline
  SCD & 满足条件下存双字 & MIPS64 \tabularnewline
\end{inslongtable}

### 运算指令

运算型指令完成寄存器值的算术、逻辑、移位、乘法和除法等操作。运算型指令包含了寄存
器指令格式（R-型，操作数和运算结果均保存在寄存器中）和立即数指令格式（I-型，其中
一个操作数为一个 16 位的立即数）

\begin{inslongtable}{运算指令}{tab:mips64-calculate}
  \mtabsep{算术指令（ALU 立即数）}
  ADDI    & 加立即数                     & MIPS32 \tabularnewline
  DADDI   & 加双字立即数                 & MIPS64 \tabularnewline
  ADDIU   & 加无符号立即数               & MIPS32 \tabularnewline
  DADDIU  & 加无符号双字立即数           & MIPS64 \tabularnewline
  SLTI    & 小于立即数设置               & MIPS32 \tabularnewline
  SLTIU   & 无符号小于立即数设置         & MIPS32 \tabularnewline
  ANDI    & 与立即数                     & MIPS32 \tabularnewline
  ORI     & 或立即数                     & MIPS32 \tabularnewline
  XORI    & 异或立即数                   & MIPS32 \tabularnewline
  LUI     & 取立即数到高位               & MIPS32 \tabularnewline
  \mtabsep{算术指令（3 操作数）}
  ADD     & 加                           & MIPS32 \tabularnewline
  DADD    & 双字加                       & MIPS64 \tabularnewline
  ADDU    & 无符号加                     & MIPS32 \tabularnewline
  DADDU   & 无符号双字加                 & MIPS64 \tabularnewline
  SUB     & 减                           & MIPS32 \tabularnewline
  DSUB    & 双字减                       & MIPS64 \tabularnewline
  SUBU    & 无符号减                     & MIPS32 \tabularnewline
  DSUBU   & 无符号双字减                 & MIPS64 \tabularnewline
  SLT     & 小于设置                     & MIPS32 \tabularnewline
  SLTU    & 无符号小于设置               & MIPS32 \tabularnewline
  AND     & 与                           & MIPS32 \tabularnewline
  OR      & 或                           & MIPS32 \tabularnewline
  XOR     & 异或                         & MIPS32 \tabularnewline
  NOR     & 或非                         & MIPS32 \tabularnewline
  \mtabsep{算术指令（2 操作数）}
  CLO     & 字前导 1 个数                & MIPS32 \tabularnewline
  DCLO    & 双字前导 1 个数              & MIPS64 \tabularnewline
  CLZ     & 字前导 0 个数                & MIPS32 \tabularnewline
  DCLZ    & 双字前导 0 个数              & MIPS64 \tabularnewline
  WSBH    & 半字字节交换                 & MIPS32 R2 \tabularnewline
  DSHD    & 字半字交换                   & MIPS64 R2 \tabularnewline
  SEB     & 字节符号扩展                 & MIPS32 R2 \tabularnewline
  SEH     & 半字符号扩展                 & MIPS32 R2 \tabularnewline
  INS     & 位插入                       & MIPS32 R2 \tabularnewline
  EXT     & 位提取                       & MIPS32 R2 \tabularnewline
  DINS    & 双字位插入                   & MIPS64 R2 \tabularnewline
  DINSM   & 双字位插入                   & MIPS64 R2 \tabularnewline
  DINSU   & 双字位插入                   & MIPS64 R2 \tabularnewline
  DEXT    & 双字位提取                   & MIPS64 R2 \tabularnewline
  DEXTM   & 双字位提取                   & MIPS64 R2 \tabularnewline
  DEXTU   & 双字位提取                   & MIPS64 R2 \tabularnewline
  \mtabsep{整数乘除指令}
  MUL     & 乘到通用寄存器               & MIPS32 \tabularnewline
  MULT    & 乘                           & MIPS32 \tabularnewline
  DMULT   & 双字乘                       & MIPS64 \tabularnewline
  MULTU   & 无符号乘                     & MIPS32 \tabularnewline
  DMULTU  & 无符号双字乘                 & MIPS64 \tabularnewline
  MADD    & 乘加                         & MIPS32 \tabularnewline
  MADDU   & 无符号乘加                   & MIPS32 \tabularnewline
  MSUB    & 乘减                         & MIPS32 \tabularnewline
  MSUBU   & 无符号乘减                   & MIPS32 \tabularnewline
  DIV     & 除                           & MIPS32 \tabularnewline
  DDIV    & 双字除                       & MIPS64 \tabularnewline
  DIVU    & 无符号除                     & MIPS32 \tabularnewline
  DDIVU   & 无符号双字除                 & MIPS64 \tabularnewline
  MFHI    & 从 hi 寄存器取数到通用寄存器 & MIPS32 \tabularnewline
  MTHI    & 从通用寄存器存数到 hi 寄存器 & MIPS32 \tabularnewline
  MFLO    & 从 lo 寄存器取数到通用寄存器 & MIPS32 \tabularnewline
  MTLO    & 从通用寄存器存数到 lo 寄存器 & MIPS32 \tabularnewline
  \mtabsep{移位指令}
  SLL     & 逻辑左移                     & MIPS32 \tabularnewline
  SRL     & 逻辑右移                     & MIPS32 \tabularnewline
  SRA     & 算术右移                     & MIPS32 \tabularnewline
  SLLV    & 可变的逻辑左移               & MIPS32 \tabularnewline
  SRLV    & 可变的逻辑右移               & MIPS32 \tabularnewline
  SRAV    & 可变的算术右移               & MIPS32 \tabularnewline
  ROTR    & 循环右移                     & MIPS32 R2 \tabularnewline
  ROTRV   & 可变的循环右移               & MIPS32 R2 \tabularnewline
  DSLL    & 双字逻辑左移                 & MIPS64 \tabularnewline
  DSRL    & 双字逻辑右移                 & MIPS64 \tabularnewline
  DSRA    & 双字算术右移                 & MIPS64 \tabularnewline
  DSLLV   & 可变的双字逻辑左移           & MIPS64 \tabularnewline
  DSRLV   & 可变的双字逻辑右移           & MIPS64 \tabularnewline
  DSRAV   & 可变的双字算术右移           & MIPS64 \tabularnewline
  DSLL32  & 双字逻辑左移+32              & MIPS64 \tabularnewline
  DSRL32  & 双字逻辑右移+32              & MIPS64 \tabularnewline
  DSRA32  & 双字算术右移+32              & MIPS64 \tabularnewline
  DROTR   & 双字循环右移                 & MIPS64 R2 \tabularnewline
  DROTR32 & 双字循环右移+32              & MIPS64 R2 \tabularnewline
  DROTRV  & 双字可变的循环右移           & MIPS64 R2 \tabularnewline
\end{inslongtable}

### 跳转和分支指令

跳转和分支指令可改变程序的控制流，包括以下四种类型：

* PC 相对条件分支
* PC 无条件跳转
* 寄存器绝对跳转
* 过程调用

MIPS 定义中，所有转移指令后都紧跟一条延迟槽指令。Likely 转移指令的延迟槽只在转移
成功时执行，非 Likely 转移指令延迟槽指令总会得到执行。过程调用指令的返回地址默认
保存在第 31 号寄存器中，根据第 31 号寄存器跳转将被认为从被调用过程返回。

\begin{inslongtable}{跳转和分支指令}{tab:mips64-jump-ins}\hhline
  J       & 跳转                            & MIPS32 \tabularnewline
  JAL     & 立即数调用过程                  & MIPS32 \tabularnewline
  JR      & 跳转到寄存器指向的指令          & MIPS32 \tabularnewline
  JR.HB   & 跳转到寄存器指向的指令          & MIPS32 R2 \tabularnewline
  JALR    & 寄存器调用过程                  & MIPS32 \tabularnewline
  JALR.HB & 寄存器调用过程                  & MIPS32 R2 \tabularnewline
  BEQ     & 相等则跳转                      & MIPS32 \tabularnewline
  BNE     & 不等则跳转                      & MIPS32 \tabularnewline
  BLEZ    & 小于等于 0 跳转                 & MIPS32 \tabularnewline
  BGTZ    & 大于 0 跳转                     & MIPS32 \tabularnewline
  BLTZ    & 小于 0 跳转                     & MIPS32 \tabularnewline
  BGEZ    & 大于或等于 0 跳转               & MIPS32 \tabularnewline
  BLTZAL  & 小于 0 调用过程                 & MIPS32 \tabularnewline
  BGEZAL  & 大于或等于 0 调用过程           & MIPS32 \tabularnewline
  BEQL    & 相等则 Likely 跳转              & MIPS32 \tabularnewline
  BNEL    & 不等则 Likely 跳转              & MIPS32 \tabularnewline
  BLEZL   & 小于或等于 0 则 Likely 跳转     & MIPS32 \tabularnewline
  BGTZL   & 大于 0 则 Likely 跳转           & MIPS32 \tabularnewline
  BLTZL   & 小于 0 则 Likely 跳转           & MIPS32 \tabularnewline
  BGEZL   & 大于或等于 0 则 Likely 跳转     & MIPS32 \tabularnewline
  BLTZALL & 小于 0 则 Likely 调用过程       & MIPS32 \tabularnewline
  BGEZALL & 大于或等于 0 则 Likely 调用过程 & MIPS32 \tabularnewline
\end{inslongtable}

### 协处理器指令

协处理器指令完成协处理器内部的操作。龙芯 GS464V 处理器核有两个协处理器：0 号协处
理器（系统处理器）和 1 号协处理器（浮点协处理器）。

* 0 号协处理器（CP0 ）通过 CP0 的寄存器来管理内存和处理异常。这些指令列在
  \ref{tab:mips64-cp0-ins} 中。
* 1 号协处理器（CP1）指令包括浮点指令，多媒体指令，和龙芯扩展的定点计算指令。
  这些指令都是在浮点寄存器上操作。第 7 章将会对这些协处理器 1 指令进行总结。

\begin{inslongtable}{CP0 指令}{tab:mips64-cp0-ins}\hhline
  DMFC0  & 从 CP0 寄存器取双字 & MIPS32 \tabularnewline
  DMTC0  & 往 CP0 寄存器写双字 & MIPS32 \tabularnewline
  MFC0   & 从 CP0 寄存器取     & MIPS32 \tabularnewline
  MTC0   & 往 CP0 寄存器写     & MIPS32 \tabularnewline
  TLBR   & 读索引的 TLB 项     & MIPS32 \tabularnewline
  TLBWI  & 写索引的 TLB 项     & MIPS32 \tabularnewline
  TLBWR  & 写随机的 TLB 项     & MIPS32 \tabularnewline
  TLBP   & 在 TLB 中搜索匹配项 & MIPS32 \tabularnewline
  CACHE  & Cache 操作          & MIPS32 \tabularnewline
  ERET   & 异常返回            & MIPS32 \tabularnewline
  DI     & 禁止中断            & MIPS32 R2 \tabularnewline
  EI     & 允许中断            & MIPS32 R2 \tabularnewline
  DERET  & Debug 返回          & EJTAG \tabularnewline
  RDHWR  & 读取硬件寄存器      & MIPS32 R2 \tabularnewline
  RDPGPR & 从影子寄存器中读取  & MIPS32 R2 \tabularnewline
  WRPGPR & 写到影子寄存器      & MIPS32 R2 \tabularnewline
  SDBBP  & 软件断点            & EJTAG \tabularnewline
\end{inslongtable}

### 其它指令

MIPS64 中，除了前面列出上述指令外还有其它一些指令，详见表 2-9 至表 2-12：

\begin{inslongtable}{MIPS64 其他指令}{tab:mips64-other-ins}
  \mtabsep{特殊指令}
  SYSCALL & 系统调用                   & MIPS32 \tabularnewline
  BREAK   & 断点                       & MIPS32 \tabularnewline
  SYNC    & 同步                       & MIPS32 \tabularnewline
  SYNCI   & 同步指令缓存               & MIPS32 R2 \tabularnewline
  \mtabsep{异常指令}
  TGE     & 大于或等于陷入             & MIPS32 \tabularnewline
  TGEU    & 无符号数大于或等于陷入     & MIPS32 \tabularnewline
  TLT     & 小于陷入                   & MIPS32 \tabularnewline
  TLTU    & 无符号数小于陷入           & MIPS32 \tabularnewline
  TEQ     & 等于陷入                   & MIPS32 \tabularnewline
  TNE     & 不等陷入                   & MIPS32 \tabularnewline
  TGEI    & 大于或等于立即数陷入       & MIPS32 \tabularnewline
  TGEIU   & 大于或等于无符号立即数陷入 & MIPS32 \tabularnewline
  TLTI    & 小于立即数陷入             & MIPS32 \tabularnewline
  TLTIU   & 小于无符号立即数陷入       & MIPS32 \tabularnewline
  TEQI    & 等于立即数陷入             & MIPS32 \tabularnewline
  TNEI    & 不等于立即数陷入           & MIPS32 \tabularnewline
  \mtabsep{条件移动指令}
  MOVF    & 条件移动当浮点条件假       & MIPS32 \tabularnewline
  MOVN    & 条件移动当通用寄存器非 0   & MIPS32 \tabularnewline
  MOVT    & 条件移动当浮点条件真       & MIPS32 \tabularnewline
  MOVZ    & 条件移动当通用寄存器为 0   & MIPS32 \tabularnewline
  \mtabsep{其他指令（空操作）}
  PREF    & 预取指令                   & MIPS32 \tabularnewline
  PREFX   & 预取指令                   & MIPS32 \tabularnewline
  NOP     & 空操作                     & MIPS32 \tabularnewline
  SSNOP   & 单发射空操作               & MIPS32 \tabularnewline
\end{inslongtable}

龙芯 GS464V 处理器核对 MIPS 指令集中协处理器 2 指令进行了自定义。执行这些指令时
要求协处理器 2 可用，其中浮点相关指令还要求协处理器 1 可用。

龙芯扩展指令
------------

龙芯 GS464V 处理器在 MIPS64 基础上对指令集有如下主要扩展：

* 扩展访存指令：带偏移访存，四字访存指令
* 单目标定点乘除指令

\begin{inslongtable}{龙芯扩展指令}{tab:extended-ins}
  \mtabsep{访存指令}
  gsLDX    & 带偏移取双字       & GS464   \tabularnewline
  gsLDXC1  & 带偏移取双字       & GS464   \tabularnewline
  gsLWX    & 带偏移取字         & GS464   \tabularnewline
  gsLWXC1  & 带偏移取字         & GS464   \tabularnewline
  gsSDX    & 带偏移存双字       & GS464   \tabularnewline
  gsSDXC1  & 带偏移存双字       & GS464   \tabularnewline
  gsSWX    & 带偏移存字         & GS464   \tabularnewline
  gsSWXC1  & 带偏移存字         & GS464   \tabularnewline
  gsLQ     & 取四字             & GS464   \tabularnewline
  gsSQ     & 存四字             & GS464   \tabularnewline
  \mtabsep{整数乘除指令}
  gsMULT   & 龙芯乘             & GODSON2 \tabularnewline
  gsDMULT  & 龙芯双字乘         & GODSON2 \tabularnewline
  gsMULTU  & 龙芯无符号乘       & GODSON2 \tabularnewline
  gsDMULTU & 龙芯无符号双字乘   & GODSON2 \tabularnewline
  gsDIV    & 龙芯除             & GODSON2 \tabularnewline
  gsDDIV   & 龙芯双字除         & GODSON2 \tabularnewline
  gsDIVU   & 龙芯无符号除       & GODSON2 \tabularnewline
  gsDDIVU  & 龙芯无符号双字除   & GODSON2 \tabularnewline
  gsMOD    & 龙芯求模           & GODSON2 \tabularnewline
  gsDMOD   & 龙芯双字求模       & GODSON2 \tabularnewline
  gsMODU   & 龙芯无符号求模     & GODSON2 \tabularnewline
  gsDMODU  & 龙芯无符号双字求模 & GODSON2 \tabularnewline
\end{inslongtable}

实现相关指令
------------

\noindent 龙芯 GS464V 处理器核支持所有 MIPS64 R2 指令，但对重定义一些实现相关的
指令，见表\ \ref{tab:impdependent-ins}。

\begin{implongtable}{龙芯实现相关指令}{tab:impdependent-ins}
  PREF   & 预取指令     & 空操作，预取可通过 Load 到 0 号寄存器实现   \tabularnewline
  PREFX  & 预取指令     & 空操作，预取可通过 Load 到 0 号寄存器实现   \tabularnewline
  SSNOP  & 单发射空操作 & GS464V 实现了所有相关指令的硬件互锁。空操作 \tabularnewline
  EHB    & 隔离执行相关 & GS464V 实现了所有相关指令的硬件互锁。空操作 \tabularnewline
  WAIT   & 进入等待状态 & 空操作，同 NOP                              \tabularnewline
  RDPGPR & 读影子寄存器 & GS464V 没有实现影子寄存器，读当前寄存器     \tabularnewline
  WRPGPR & 写影子寄存器 & GS464V 没有实现影子寄存器，写当前寄存器     \tabularnewline
\end{implongtable}
