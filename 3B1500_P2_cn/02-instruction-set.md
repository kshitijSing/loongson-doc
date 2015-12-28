龙芯 GS464V 处理器核指令集概述
==============================

在指令集架构（Instruction Set Architecture，简称 ISA）上，
龙芯 GS464V 处理器核兼容 MIPS64 R2 体系结构，提供了其所定义的全套必需指令。关于
MIPS64 R2 指令的详细定义，请查阅MIPS 体系结构规范 2.50 版本的卷 I 和卷 II。在
MIPS64 R2 的基础上，GS464V 核提供了扩展访存、定点、浮点、多媒体、 x86 翻译加速、
及 向量指令。龙芯 GS464V 处理器核所实现的这些扩展指令列举在
\ref{sec:extended-instructions} 节中。囿于篇幅，本文档中仅给出了部分扩展指令的详
细定义。授权客户如需了解相关指令的详细定义，请查阅《龙芯指令系统手册》。

龙芯 GS464 处理器核对所有 MIPS64 R2 指令都作了支持，但对一些实现相关的指令作了重
新的定义。\ref{sec:ins-implementation} 节列举了这些重要的实现细节。

指令编码
--------

龙芯处理器指令编码为 32 位。主要有三种指令格式：立即数指令（I-型）、跳转指令（J-
型）和寄存器指令（R-型），如图 \ref{fig:instruction-format} 所示。

![龙芯指令格式\label{fig:instruction-format}](../images/ins-format-cn.pdf)

\noindent\vspace{-.3cm} 其中各位域解释为：
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

\noindent 根据指令功能，MIPS64 指令可分为如下几组：

  - 访存指令
  - 运算指令
  - 跳转和分支指令
  - 协处理器指令
  - 浮点指令
  - 其它指令

下面小节分别列出了龙芯 GS464V 处理器兼容的所有 MIPS64 指令。

### 访存指令

MIPS 体系结构采用 load/store 架构。所有运算都在寄存器上进行，只有访存指令可对主
存中的数据进行访问。访存指令包含各种宽度数据的读写、无符号读、非对齐访存和原子访
存等。

\begin{inslongtable}{访存指令}{tab:mips64-memory-ins}\hhline
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

运算指令完成寄存器值的算术、逻辑、移位、乘法和除法等操作。运算型指令包含了寄存
器指令格式（R-型，操作数和运算结果均保存在寄存器中）和立即数指令格式（I-型，其中
一个操作数为一个 16 位的立即数）。

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

\begin{inslongtable}{跳转和分支指令}{tab:mips64-jump-ins}\hline
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

协处理器指令完成协处理器内部的操作。龙芯 GS464V 处理器核有三个协处理器：0 号协处
理器（系统处理器）、1 号协处理器（浮点协处理器）和 2 号协处理器（向量协处理器）
。

* 0 号协处理器（CP0）指令通过 CP0 的寄存器来管理内存和处理异常。
* 1 号协处理器（CP1）指令包括浮点指令，龙芯扩展浮点指令和扩展定点计算指令。这些
  指令都是在浮点寄存器上操作的。
* 2 号协处理器（CP2）指令包括 GS464V 扩展多媒体指令和向量指令，这些指令都是在向
  量协处理器上操作的。使用这些指令需要 2 号协处理器被使能。

\noindent 表 \ref{tab:mips64-cp0-ins} 列出了通过 CP0 的寄存器来管理内存和处理异
常的相关指令。操作 CP1 寄存器的指令被列在[浮点指令][]节。

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
  DERET  & Debug 返回          & EJTAG \tabularnewline
  RDHWR  & 读取硬件寄存器      & MIPS32 R2 \tabularnewline
  RDPGPR & 从影子寄存器中读取  & MIPS32 R2 \tabularnewline
  WRPGPR & 写到影子寄存器      & MIPS32 R2 \tabularnewline
  SDBBP  & 软件断点            & EJTAG \tabularnewline
\end{inslongtable}

### 浮点指令 {#float-instruction}

GS464V 实现了 MIPS64 中浮点部分的所有数据类型，包括 S (single)，D (double)，W
(word)，L (long)，以及可选的 PS (paired single) 类型。这些类型对应表
\ref{fpu-ins} 中的 *fmt*。关于这些类型的具体描述，见[浮点格式][]节。

\begin{inslongtable}{MIPS64 的浮点指令集}{tab:fpu-ins}
  \mtabsep{浮点算术指令}
  ABS.{\sl fmt}     & 绝对值                                   & MIPS32 \tabularnewline
  ADD.{\sl fmt}     & 加法                                     & MIPS32 \tabularnewline
  DIV.{\sl fmt}     & 除法                                     & MIPS32 \tabularnewline
  MADD.{\sl fmt}    & 乘加                                     & MIPS64 \tabularnewline
  MSUB.{\sl fmt}    & 乘减                                     & MIPS64 \tabularnewline
  MUL.{\sl fmt}     & 乘法                                     & MIPS32 \tabularnewline
  NEG.{\sl fmt}     & 求反                                     & MIPS32 \tabularnewline
  NMADD.{\sl fmt}   & 乘加后求反                               & MIPS64 \tabularnewline
  NMSUB.{\sl fmt}   & 乘减后求反                               & MIPS64 \tabularnewline
  RECIP.{\sl fmt}   & 求倒数                                   & MIPS64 \tabularnewline
  RSQRT.{\sl fmt}   & 平方根后求倒数                           & MIPS64 \tabularnewline
  SQRT.{\sl fmt}    & 平方根                                   & MIPS32 \tabularnewline
  SUB.{\sl fmt}     & 减法                                     & MIPS32 \tabularnewline
  \mtabsep{浮点分支跳转指令}
  BC1F              & 浮点假时跳转                             & MIPS32 \tabularnewline
  BC1FL             & 浮点假时 Likely 跳转                     & MIPS32 \tabularnewline
  BC1T              & 浮点真时跳转                             & MIPS32 \tabularnewline
  BC1TL             & 浮点真时 Likely 跳转                     & MIPS32 \tabularnewline
  \mtabsep{浮点比较指令}
  C.{\sl cond.fmt}  & 比较浮点值并置标志位                     & MIPS32 \tabularnewline
  \mtabsep{浮点转换指令}
  ALNV.PS           & 可变浮点对齐                             & MIPS64 \tabularnewline
  CEIL.L.{\sl fmt}  & 浮点转换到 64 位定点，向上取整           & MIPS64 \tabularnewline
  CEIL.W.{\sl fmt}  & 浮点转换到 32 位定点，向上取整           & MIPS64 \tabularnewline
  CVT.D.{\sl fmt}   & 浮点或定点转换到双精度浮点               & MIPS32 \tabularnewline
  CVT.L.{\sl fmt}   & 转换浮点值到 64 位定点                   & MIPS64 \tabularnewline
  CVT.PS.S          & 转换两个浮点值到浮点对                   & MIPS64 \tabularnewline
  CVT.S.PL          & 转换浮点对的低位到单精度浮点             & MIPS64 \tabularnewline
  CVT.S.PL          & 转换浮点对的高位到单精度浮点             & MIPS64 \tabularnewline
  CVT.S.{\sl fmt}   & 浮点或定点转换到单精度浮点               & MIPS32 \tabularnewline
  CVT.W.{\sl fmt}   & 转换浮点值到 32 位定点                   & MIPS32 \tabularnewline
  FLOOR.L.{\sl fmt} & 浮点转换到 64 位定点，向下取整           & MIPS64 \tabularnewline
  FLOOR.W.{\sl fmt} & 浮点转换到 32 位定点，向下取整           & MIPS64 \tabularnewline
  PLL.PS            & 合并两个浮点对的低位为新的浮点对         & MIPS64 \tabularnewline
  PLU.PS            & 合并两个浮点对的低位和高位为新的浮点对   & MIPS64 \tabularnewline
  PUL.PS            & 合并两个浮点对的高位和低位为新的浮点对   & MIPS64 \tabularnewline
  PUU.PS            & 合并两个浮点对的高位为新的浮点对         & MIPS64 \tabularnewline
  ROUND.L.{\sl fmt} & 把浮点数四舍五入到 64 位定点             & MIPS64 \tabularnewline
  ROUND.W.{\sl fmt} & 把浮点数四舍五入到 32 位定点             & MIPS32 \tabularnewline
  TRUNC.L.{\sl fmt} & 把浮点数向绝对值小的方向舍入到 64 位定点 & MIPS64 \tabularnewline
  TRUNC.W.{\sl fmt} & 把浮点数向绝对值小的方向舍入到 32 位定点 & MIPS32 \tabularnewline
  \mtabsep{浮点访存指令}
  LDC1              & 从内存取双字                             & MIPS32 \tabularnewline
  LDXC1             & 按索引从内存取双字                       & MIPS64 \tabularnewline
  LUXC1             & 按非对齐索引从内存取双字                 & MIPS64 \tabularnewline
  LWC1              & 从内存取字                               & MIPS32 \tabularnewline
  LWXC1             & 按索引从内存取字                         & MIPS64 \tabularnewline
  SDC1              & 存双字到内存                             & MIPS32 \tabularnewline
  SDXC1             & 按索引存双字到内存                       & MIPS64 \tabularnewline
  SUXC1             & 按非对齐索引存双字到内存                 & MIPS64 \tabularnewline
  SWC1              & 存字到内存                               & MIPS32 \tabularnewline
  SWXC1             & 按索引存字到内存                         & MIPS64 \tabularnewline
  \mtabsep{浮点移动指令}
  CFC1              & 读浮点控制寄存器到 GPR                   & MIPS32 \tabularnewline
  CTC1              & 写浮点控制寄存器到 GPR                   & MIPS32 \tabularnewline
  DMFC1             & 从 FPR 复制双字到 GPR                    & MIPS64 \tabularnewline
  DMTC1             & 从 GPR 复制双字到 FPR                    & MIPS64 \tabularnewline
  MFC1              & 从 FPR 复制低字到 GPR                    & MIPS32 \tabularnewline
  MFHC1             & 从 FPR 复制高字到 GPR                    & MIPS32 R2 \tabularnewline
  MOV.{\sl fmt}     & 复制 FPR                                 & MIPS32 \tabularnewline
  MOVF.{\sl fmt}    & 浮点假时复制 FPR                         & MIPS32 \tabularnewline
  MOVN.{\sl fmt}    & GPR 不为 0 时复制 FPR                    & MIPS32 \tabularnewline
  MOVT.{\sl fmt}    & 浮点真时复制 FPR                         & MIPS32 \tabularnewline
  MOVZ.{\sl fmt}    & GPR 为 0 时复制 FPR                      & MIPS32 \tabularnewline
  MTC1              & 从 GPR 复制低字到 FPR                    & MIPS32 \tabularnewline
  MTHC1             & 从 GPR 复制高字到 FPR                    & MIPS32 R2 \tabularnewline
\end{inslongtable}

GS464V 与 MIPS64 Release 2 版本兼容，从功能上实现了 MIPS64 体系结构规定的所有浮
点指令，但是有些指令在实现上有并不影响兼容性但是比较重要的差别，以下三点值得编程
人员注意：

1. 乘加、乘减指令。在执行 MADD.*fmt*，MSUB.*fmt*，NMADD.*fmt*，NMSUB.*fmt* 这四
   组指令时，GS464V 的运算结果与 MIPS64 处理器略有不同，这是因为 GS464V 在做乘
   加运算时只在最后结果处做精度舍入，而 MIPS64 处理器在进行乘运算后就进行了一次
   舍入，加运算后又做了一次舍入，导致了最终结果最低位相差 1。
1. 单精度运算指令。龙芯沿用了 MIPSR10000 的做法，Status 寄存器的 FR 位表示 16 个
   还是 32 个 64 位浮点寄存器（而 MIPS64 中 FR 位表示浮点寄存器是 32 个 32 位还
   是 64 个 16 位浮点寄存器）。因此，当 Status 寄存器的 FR 位为 0 时，26 条单精
   度指令（ABS.S, ADD.S, CEIL.W.D, CEIL.W.S, DIV.S, FLOOR.W.D, FLOOR.W.S, MUL.S,
   NEG.S, ROUND.W.D, ROUND.W.S, SQRT.S, SUB.S, TRUNC.W.D, TRUNC.W.S, MOV.S,
   CVT.D.S, CVT.D.W, CVT.S.D, CVT.S.W, CVT.W.D, CVT.W.S, MOVF.S, MOVN.S, MOVT.S,
   MOVZ.S 等）不能使用奇数号寄存器。
1. 浮点转换指令。 龙芯 GS464 浮点运算中进行数据格式转换时， 比如使用如下指令将浮
   点数转换为字整点数或双字整点数，
   \begin{verbatim}
       CVT.W.FMT, ROUND.W.FMT, FLOOR.W.FMT, CEIL.W.FMT, TRUNK.W.FMT
       CVT.L.FMT, ROUND.L.FMT, FLOOR.L.FMT, CEIL.L.FMT, TRUNK.L.FMT
   \end{verbatim}
   如果输入值为负非数，负越界，负无穷时， 而 FCSR 寄存器的无效例外没有使能， 将
   不会发出无效操作例外，返回值为负最大：0x8000_0000 或
   0x8000_0000_0000_0000 取决于操作的转换格式。而在 MIPS64 浮点运算中，遇到相
   同情况时， 也不会发出无效操作例外，不过返回值规定为正最大： 0x7FFF_FFFF 或
   0x7FFF_FFFF_FFFF_FFFF。即，MIPS64 的规定不区分输入值的正负。

### 其它指令

MIPS64 中，除了前面列出上述指令外还有其它一些指令，详见
表\ \ref{tab:mips64-other-ins}。

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

扩展指令 \label{sec:extended-instructions}
--------

龙芯 GS464 处理器在 MIPS64 R2 的基础上实现了若干扩展：

- 扩展访存指令
- 扩展定点指令
- 扩展浮点指令
- 扩展多媒体指令
- 扩展 x86 加速指令
- 扩展向量指令
- 扩展杂项指令

### 扩展访存指令

\begin{inslongtable}{扩展访存指令}{tab:extended-ins-memory}
  \mtabsep{扩展访存指令}
  gsLE    & 如果小于等于置地址错例外 & LoongsonISA   \tabularnewline
  gsGT    & 如果大于置地址错例外     & LoongsonISA   \tabularnewline
  gsLDX   & 带偏移取双字             & LoongsonISA   \tabularnewline
  gsLWX   & 带偏移取字               & LoongsonISA   \tabularnewline
  gsLBX   & 带偏移的取字节           & LoongsonISA   \tabularnewline
  gsLHX   & 带偏移的取半字           & LoongsonISA   \tabularnewline
  gsLBLE  & 带上越界检查的取字节     & LoongsonISA   \tabularnewline
  gsLBGT  & 带下越界检查的取字节     & LoongsonISA   \tabularnewline
  gsLDLE  & 带上越界检查的取双字     & LoongsonISA   \tabularnewline
  gsLDGT  & 带下越界检查的取双字     & LoongsonISA   \tabularnewline
  gsLHLE  & 带上越界检查的取半字     & LoongsonISA   \tabularnewline
  gsLHGT  & 带下越界检查的取半字     & LoongsonISA   \tabularnewline
  gsLWLE  & 带上越界检查的取字       & LoongsonISA   \tabularnewline
  gsLWGT  & 带下越界检查的取字       & LoongsonISA   \tabularnewline
  gsLQ    & 双源寄存器取定点四字     & LoongsonISA   \tabularnewline
  gsSDX   & 带偏移存双字             & LoongsonISA   \tabularnewline
  gsSBX   & 带偏移的存字节           & LoongsonISA   \tabularnewline
  gsSHX   & 带偏移的存半字           & LoongsonISA   \tabularnewline
  gsSWX   & 带偏移存字               & LoongsonISA   \tabularnewline
  gsSBLE  & 带上越界检查的存字节     & LoongsonISA   \tabularnewline
  gsSBGT  & 带下越界检查的存字节     & LoongsonISA   \tabularnewline
  gsSHLE  & 带上越界检查的存半字     & LoongsonISA   \tabularnewline
  gsSHGT  & 带下越界检查的存半字     & LoongsonISA   \tabularnewline
  gsSWLE  & 带上越界检查的存字       & LoongsonISA   \tabularnewline
  gsSWGT  & 带下越界检查的存字       & LoongsonISA   \tabularnewline
  gsSDLE  & 带上越界检查的存双字     & LoongsonISA   \tabularnewline
  gsSDGT  & 带下越界检查的存双字     & LoongsonISA   \tabularnewline
  gsSQ    & 双源寄存器存定点四字     & LoongsonISA   \tabularnewline
\end{inslongtable}

### 扩展定点指令

这些指令扩大了 MIPS64 的 定点乘除法指令，以提高定点乘法运算使用广泛的应用性能。
主要 执行 64 位整点乘除法操作，并产生 64 位（而不是 128 位）结果。 附录 A 对龙芯
GS464V 的扩展整数指令进行了详细介绍。

\begin{inslongtable}{扩展定点指令}{tab:extended-ins-multdiv} \hhline
  gsMULT   & 有符号字乘，结果写通用寄存器   & LoongsonISA \tabularnewline
  gsDMULT  & 有符号双字乘，结果写通用寄存器 & LoongsonISA \tabularnewline
  gsMULTU  & 无符号字乘，结果写通用寄存器   & LoongsonISA \tabularnewline
  gsDMULTU & 无符号双字乘，结果写通用寄存器 & LoongsonISA \tabularnewline
  gsDIV    & 有符号字除，商写通用寄存器     & LoongsonISA \tabularnewline
  gsDDIV   & 有符号双字除，商写通用寄存器   & LoongsonISA \tabularnewline
  gsDIVU   & 无符号字除，商写通用寄存器     & LoongsonISA \tabularnewline
  gsDDIVU  & 无符号双字除，商写通用寄存器   & LoongsonISA \tabularnewline
  gsMOD    & 有符号字除，余数写通用寄存器   & LoongsonISA \tabularnewline
  gsDMOD   & 有符号双字除，余数写通用寄存器 & LoongsonISA \tabularnewline
  gsMODU   & 无符号字除，余数写通用寄存器   & LoongsonISA \tabularnewline
  gsDMODU  & 无符号双字除，余数写通用寄存器 & LoongsonISA \tabularnewline
\end{inslongtable}

### 扩展浮点指令

龙芯扩展浮点指令采用了三个操作数模式，而不是MIPS64中的四操作数形式。 附录 B龙芯
GS464 扩展浮点指令进行了详细介绍。表 \ref{tab:fpu-ins} 列出了 GS464V 龙芯扩展浮
点指令。使用这些指令要求协处理器 1 被使能。

\begin{inslongtable}{扩展浮点指令}{tab:extended-ins-float}
  \mtabsep{扩展浮点访存指令}
  gsSQC1   & 双源寄存器存定点四字             & LoongsonISA \tabularnewline 
  gsSWLEC1 & 带上越界检查的从浮点寄存器存字   & LoongsonISA \tabularnewline 
  gsLWXC1  & 带偏移的取浮点字                 & LoongsonISA \tabularnewline 
  gsLQC1   & 双目标寄存器取浮点四字           & LoongsonISA \tabularnewline 
  gsLWLEC1 & 带上越界检查的取字到浮点寄存器   & LoongsonISA \tabularnewline 
  gsLWLC1  & 取字左部到浮点寄存器             & LoongsonISA \tabularnewline 
  gsLWRC1  & 取字右部到浮点寄存器             & LoongsonISA \tabularnewline 
  gsLDLC1  & 取双字左部到浮点寄存器           & LoongsonISA \tabularnewline 
  gsLDRC1  & 取双字右部到浮点寄存器           & LoongsonISA \tabularnewline 
  gsLWGTC1 & 带下越界检查的取字到浮点寄存器   & LoongsonISA \tabularnewline 
  gsLDLEC1 & 带上越界检查的取双字到浮点寄存器 & LoongsonISA \tabularnewline 
  gsLDGTC1 & 带下越界检查的取双字到浮点寄存器 & LoongsonISA \tabularnewline 
  gsLDXC1  & 带偏移的取浮点双字               & LoongsonISA \tabularnewline 
  gsSWLC1  & 从浮点寄存器存字左部             & LoongsonISA \tabularnewline 
  gsSWRC1  & 从浮点寄存器存字右部             & LoongsonISA \tabularnewline 
  gsSDLC1  & 从浮点寄存器存双字左部           & LoongsonISA \tabularnewline 
  gsSDRC1  & 从浮点寄存器存双字右部           & LoongsonISA \tabularnewline 
  gsSWGTC1 & 带下越界检查的从浮点寄存器存字   & LoongsonISA \tabularnewline 
  gsSDLEC1 & 带上越界检查的从浮点寄存器存双字 & LoongsonISA \tabularnewline 
  gsSDGTC1 & 带下越界检查的从浮点寄存器存双字 & LoongsonISA \tabularnewline 
  gsSWXC1  & 带偏移的存浮点字                 & LoongsonISA \tabularnewline 
  gsSDXC1  & 带偏移的存浮点双字               & LoongsonISA \tabularnewline 
  \mtabsep{扩展浮点格式转换指令}
  CVT.D.LD & 扩展双精度转化为双精度           & LoongsonISA \tabularnewline 
  CVT.LD.D & 双精度转化为扩展双精度低位       & LoongsonISA \tabularnewline 
  CVT.UD.D & 双精度转化为扩展双精度高位       & LoongsonISA \tabularnewline 
\end{inslongtable}

### 扩展多媒体指令

龙芯 GS464V 处理器核对 MIPS 指令集中协处理器 2 指令进行了自定义。扩展多媒体指令
，即单指令多数据（SIMD）指令，在协处理器 2 上运行。这些指令类似于 x86 平台的 SSE
的指令。对高性能媒体和通信应用提供了强大支持。附录 C 对龙芯 GS464 的多媒体指令进
行了详细介绍。执行这些指令时要求协处理器 2 可用。

\begin{inslongtable}{扩展 64 位多媒体指令}{tab:extended-ins-simd}
  \mtabsep{扩展 X86 方式逻辑、移位、跳转指令}
  PADDSH    & 四个 16 位有符号整数加，有符号饱和         & LoongsonISA \tabularnewline
  PADDUSH   & 四个 16 位无符号整数加，无符号饱和         & LoongsonISA \tabularnewline
  PADDH     & 四个 16 位数加                             & LoongsonISA \tabularnewline
  PADDW     & 两个 32 位数加                             & LoongsonISA \tabularnewline
  PADDSB    & 八个 8 位有符号整数加，有符号饱和          & LoongsonISA \tabularnewline
  PADDUSB   & 八个 8 位无符号整数加，无符号饱和          & LoongsonISA \tabularnewline
  PADDB     & 八个 8 位数加                              & LoongsonISA \tabularnewline
  PADDD     & 64 位数加                                  & LoongsonISA \tabularnewline
  PSUBSH    & 四个 16 位有符号整数减，有符号饱和         & LoongsonISA \tabularnewline
  PSUBUSH   & 四个 16 位无符号整数减，无符号饱和         & LoongsonISA \tabularnewline
  PSUBH     & 四个 16 位数减                             & LoongsonISA \tabularnewline
  PSUBW     & 两个 32 位数减                             & LoongsonISA \tabularnewline
  PSUBSB    & 八个 8 位有符号整数减，有符号饱和          & LoongsonISA \tabularnewline
  PSUBUSB   & 八个 8 位无符号整数减，无符号饱和          & LoongsonISA \tabularnewline
  PSUBB     & 八个 8 位数减                              & LoongsonISA \tabularnewline
  PSUBD     & 64 位数减                                  & LoongsonISA \tabularnewline
  PSHUFH    & 混洗四个 16 位数                           & LoongsonISA \tabularnewline
  PACKSSWH  & 32 位有符号整数转化成 16 位，有符号饱和    & LoongsonISA \tabularnewline
  PACKSSHB  & 16 位有符号整数转化成 8 位，有符号饱和     & LoongsonISA \tabularnewline
  PACKUSHB  & 16 位有符号整数转化成 8 位，无符号饱和     & LoongsonISA \tabularnewline
  PANDN     & fs 取非后与 ft 按位与                      & LoongsonISA \tabularnewline
  PUNPCKLHW & 拆包低 16 位数                             & LoongsonISA \tabularnewline
  PUNPCKHHW & 拆包高 16 位数                             & LoongsonISA \tabularnewline
  PUNPCKLBH & 拆包低 8 位数                              & LoongsonISA \tabularnewline
  PUNPCKHBH & 拆包高 8 位数                              & LoongsonISA \tabularnewline
  PINSRH\_0 & ft 低 16 位数插入到 fs 低 0 个 16 位       & LoongsonISA \tabularnewline
  PINSRH\_1 & ft 低 16 位数插入到 fs 低 1 个 16 位       & LoongsonISA \tabularnewline
  PINSRH\_2 & ft 低 16 位数插入到 fs 低 2 个 16 位       & LoongsonISA \tabularnewline
  PINSRH\_3 & ft 低 16 位数插入到 fs 低 3 个 16 位       & LoongsonISA \tabularnewline
  PAVGH     & 四个 16 位无符号整数取平均值               & LoongsonISA \tabularnewline
  PAVGB     & 八个 8 位无符号整数取平均值                & LoongsonISA \tabularnewline
  PMAXSH    & 四个 16 位有符号整数取较大值               & LoongsonISA \tabularnewline
  PMINSH    & 四个 16 位有符号整数取较小值               & LoongsonISA \tabularnewline
  PMAXUB    & 八个 8 位无符号整数取较大值                & LoongsonISA \tabularnewline
  PMINUB    & 八个 8 位无符号整数取较小值                & LoongsonISA \tabularnewline
  PCMPEQW   & 两个 32 位数相等比较                       & LoongsonISA \tabularnewline
  PCMPGTW   & 两个 32 位有符号整数大于比较               & LoongsonISA \tabularnewline
  PCMPEQH   & 四个 16 位数相等比较                       & LoongsonISA \tabularnewline
  PCMPGTH   & 四个 16 位有符号整数大于比较               & LoongsonISA \tabularnewline
  PCMPEQB   & 八个 8 位数相等比较                        & LoongsonISA \tabularnewline
  PCMPGTB   & 八个 8 位有符号整数大于比较                & LoongsonISA \tabularnewline
  PSLLW     & 两个 32 位数逻辑左移                       & LoongsonISA \tabularnewline
  PSLLH     & 四个 16 位数逻辑左移                       & LoongsonISA \tabularnewline
  PMULLH    & 四个 16 位有符号整数相乘，取结果低 16 位   & LoongsonISA \tabularnewline
  PMULHH    & 四个 16 位有符号整数相乘，取结果高 16 位   & LoongsonISA \tabularnewline
  PMULUW    & 低 32 位无符号整数相乘，存 64 位结果       & LoongsonISA \tabularnewline
  PMULHUH   & 四个 16 位无符号整数相乘，取结果高 16 位   & LoongsonISA \tabularnewline
  PSRLW     & 两个 32 位数逻辑右移                       & LoongsonISA \tabularnewline
  PSRLH     & 四个 16 位数逻辑右移                       & LoongsonISA \tabularnewline
  PSRAW     & 两个 32 位数算术右移                       & LoongsonISA \tabularnewline
  PSRAH     & 四个 16 位数算术右移                       & LoongsonISA \tabularnewline
  PUNPCKLWD & 低 32 位数组合成 64 位数                   & LoongsonISA \tabularnewline
  PUNPCKHWD & 高 32 位数组合成 64 位数                   & LoongsonISA \tabularnewline
  PASUBUB   & 八个 8 位无符号整数相减并取绝对值          & LoongsonISA \tabularnewline
  PEXTRH    & fs 某 16 位拷贝到 fd 低 16 位，fd 高位补 0 & LoongsonISA \tabularnewline
  PMADDHW   & 四个 16 位有符号数相乘，低高位分别累加     & LoongsonISA \tabularnewline
  BIADD     & 多字节累加                                 & LoongsonISA \tabularnewline
  PMOVMSKB  & 条件字节移动                               & LoongsonISA \tabularnewline
  gsXOR     & fs 与 ft 逻辑位异或                        & LoongsonISA \tabularnewline
  gsNOR     & fs 与 ft 逻辑位或非                        & LoongsonISA \tabularnewline
  gsAND     & fs 与 ft 逻辑位与                          & LoongsonISA \tabularnewline
  gsADDU    & fs 与 ft 定点无符号字加                    & LoongsonISA \tabularnewline
  gsOR      & fs 与 ft 定点逻辑位或                      & LoongsonISA \tabularnewline
  gsADD     & fs 与 ft 定点字加                          & LoongsonISA \tabularnewline
  gsDADD    & fs 与 ft 定点双字加                        & LoongsonISA \tabularnewline
  gsSEQU    & fs 与 ft 定点数相等比较                    & LoongsonISA \tabularnewline
  gsSEQ     & fs 与 ft 定点数相等比较                    & LoongsonISA \tabularnewline
  gsSUBU    & fs 与 ft 定点无符号字减                    & LoongsonISA \tabularnewline
  gsSUB     & fs 与 ft 定点字减                          & LoongsonISA \tabularnewline
  gsDSUB    & fs 与 ft 定点双字减                        & LoongsonISA \tabularnewline
  gsSLTU    & fs 与 ft 定点无符号定点数小于比较          & LoongsonISA \tabularnewline
  gsSLT     & fs 与 ft 定点定点数小于比较                & LoongsonISA \tabularnewline
  gsSLL     & fs 与 ft 定点逻辑左移字                    & LoongsonISA \tabularnewline
  gsDSLL    & fs 与 ft 定点逻辑左移双字                  & LoongsonISA \tabularnewline
  gsSRL     & fs 与 ft 定点逻辑右移字                    & LoongsonISA \tabularnewline
  gsDSRL    & fs 与 ft 定点逻辑右移双字                  & LoongsonISA \tabularnewline
  gsSRA     & fs 与 ft 定点算术右移字                    & LoongsonISA \tabularnewline
  gsDSRA    & fs 与 ft 定点算术右移双字                  & LoongsonISA \tabularnewline
  gsSLEU    & fs 与 ft 定点无符号定点数小于等于比较      & LoongsonISA \tabularnewline
  gsSLE     & fs 与 ft 定点定点数小于等于比较            & LoongsonISA \tabularnewline
\end{inslongtable}

### 扩展 x86 翻译加速指令

\begin{inslongtable}{扩展 x86 翻译加速指令}{tab:extended-ins-x86}
  \mtabsep{x86 方式逻辑、移位、跳转指令}
  x86AND     & 设置 EFLAG 的逻辑位与                       & LoongsonISA \tabularnewline
  x86OR      & 设置 EFLAG 的逻辑位或                       & LoongsonISA \tabularnewline
  x86XOR     & 设置 EFLAG 的逻辑位异或                     & LoongsonISA \tabularnewline
  x86DADD    & 设置 EFLAG 的双字加                         & LoongsonISA \tabularnewline
  x86ADD     & 设置 EFLAG 的字加                           & LoongsonISA \tabularnewline
  x86DADDU   & 设置 EFLAG 的无例外双字加                   & LoongsonISA \tabularnewline
  x86ADDU    & 设置 EFLAG 的无例外字加                     & LoongsonISA \tabularnewline
  x86DSUB    & 设置 EFLAG 的双字减                         & LoongsonISA \tabularnewline
  x86SUB     & 设置 EFLAG 的字减                           & LoongsonISA \tabularnewline
  x86DSUBU   & 设置 EFLAG 的无例外双字减                   & LoongsonISA \tabularnewline
  x86SUBU    & 设置 EFLAG 的无例外字减                     & LoongsonISA \tabularnewline
  x86INC     & 设置 EFLAG 的双字自增 1                     & LoongsonISA \tabularnewline
  x86DEC     & 设置 EFLAG 的双字自减 1                     & LoongsonISA \tabularnewline
  x86DSLL    & 设置 EFLAG 的双字左移                       & LoongsonISA \tabularnewline
  x86SLL     & 设置 EFLAG 的字左移                         & LoongsonISA \tabularnewline
  x86DSLL32  & 设置 EFLAG 的移位量加 32 的双字逻辑左移     & LoongsonISA \tabularnewline
  x86DSLLV   & 设置 EFLAG 的双字可变移位量左移             & LoongsonISA \tabularnewline
  x86SLLV    & 设置 EFLAG 的字可变移位量左移               & LoongsonISA \tabularnewline
  x86DSRL    & 设置 EFLAG 的双字逻辑右移                   & LoongsonISA \tabularnewline
  x86SRL     & 设置 EFLAG 的字逻辑右移                     & LoongsonISA \tabularnewline
  x86DSRL32  & 设置 EFLAG 的移位量加 32 的双字逻辑逻辑右移 & LoongsonISA \tabularnewline
  x86DSRLV   & 设置 EFLAG 的双字可变移位量逻辑右移         & LoongsonISA \tabularnewline
  x86SRLV    & 设置 EFLAG 的字可变移位量逻辑右移           & LoongsonISA \tabularnewline
  x86DSRA    & 设置 EFLAG 的双字算术右移                   & LoongsonISA \tabularnewline
  x86SRA     & 设置 EFLAG 的字算术右移                     & LoongsonISA \tabularnewline
  x86DSRA32  & 设置 EFLAG 的移位量加 32 的双字逻辑算术右移 & LoongsonISA \tabularnewline
  x86DSRAV   & 设置 EFLAG 的双字可变移位量算术右移         & LoongsonISA \tabularnewline
  x86SRAV    & 设置 EFLAG 的字可变移位量算术右移           & LoongsonISA \tabularnewline
  x86DROTR   & 设置 EFLAG 的双字循环右移                   & LoongsonISA \tabularnewline
  x86ROTR    & 设置 EFLAG 的字循环右移                     & LoongsonISA \tabularnewline
  x86DROTR32 & 设置 EFLAG 的移位量加 32 双字逻辑循环右移   & LoongsonISA \tabularnewline
  x86DROTRV  & 设置 EFLAG 的可变移位量的双字循环右移       & LoongsonISA \tabularnewline
  x86ROTRV   & 设置 EFLAG 的可变移位量的字循环右移         & LoongsonISA \tabularnewline
  x86MFFLAG  & 提取 EFLAG 标志位的值                       & LoongsonISA \tabularnewline
  x86MTFLAG  & 修改 EFLAG 标志位的值                       & LoongsonISA \tabularnewline
  x86J       & 根据 EFLAG 值跳转                           & LoongsonISA \tabularnewline
  x86LOOP    & 根据 EFLAG 值循环                           & LoongsonISA \tabularnewline
  \mtabsep{x86 浮点栈指令}
  SETTM      & x86 浮点栈模式置位                          & LoongsonISA \tabularnewline
  CLRTM      & x86 浮点栈模式清除                          & LoongsonISA \tabularnewline
  INCTOP     & x86 浮点栈顶指针加 1                        & LoongsonISA \tabularnewline
  DECTOP     & x86 浮点栈顶指针减 1                        & LoongsonISA \tabularnewline
  MTTOP      & 写 x86 浮点栈顶指针                         & LoongsonISA \tabularnewline
  MFTOP      & 读 x86 浮点栈顶指针                         & LoongsonISA \tabularnewline
  SETTAG     & 判断并置位寄存器                            & LoongsonISA \tabularnewline
\end{inslongtable}

### 扩展向量指令

龙芯 GS464V 处理器核实现了自定义扩展的 256 位向量指令。授权客户如需了解相关指令
的详细定义，请查阅《龙芯指令系统手册》向量指令一章。

### 扩展杂项指令

\begin{inslongtable}{扩展 杂项指令}{tab:extended-ins-misc}\hhline
  CAMPV & 查询查找表，返回命中项的内容 & LoongsonISA \tabularnewline
  CAMPI & 查询查找表，返回命中项的索引 & LoongsonISA \tabularnewline
  CAMWI & 写查找表指定项               & LoongsonISA \tabularnewline
  RAMRI & 读查找表指定项的内容         & LoongsonISA \tabularnewline
\end{inslongtable}

指令实现相关 \label{sec:ins-implementation}
------------

### 指令实现重定义

\noindent 龙芯 GS464V 处理器核支持所有 MIPS64 R2 指令，但重定义了一些实现相关的
指令，见表\ \ref{tab:impdependent-ins}。

\begin{implongtable}{龙芯实现相关指令}{tab:impdependent-ins}
  PREF   & 预取指令     & 空操作，预取可通过 Load 到 0 号寄存器实现。       \tabularnewline 
  PREFX  & 预取指令     & 空操作，预取可通过 Load 到 0 号寄存器实现。       \tabularnewline 
  SSNOP  & 单发射空操作 & 空操作，相关指令的互锁由硬件实现，无需软件控制。  \tabularnewline 
  EHB    & 隔离执行相关 & 空操作，相关指令的互锁由硬件实现，无需软件控制。  \tabularnewline 
  WAIT   & 进入等待状态 & 空操作，无停止流水线功能。                        \tabularnewline 
  RDPGPR & 读影子寄存器 & 没有实现影子寄存器，读当前寄存器。                \tabularnewline 
  WRPGPR & 写影子寄存器 & 没有实现影子寄存器，写当前寄存器。                \tabularnewline 
  SYNC   & 同步         & 只实现了 stype=0 的情形，其它值时报保留指令例外。 \tabularnewline 
  SYNCI  & 同步指令缓存 & 执行效果与 SYNC 指令，用户态下可用。              \tabularnewline 
  CACHE  & 缓存操作     & 地址解析方式和特定CACHE指令含义不同。             \tabularnewline 
\end{implongtable}

\noindent 如下小节中详述了更多关于WAIT，SYNC，SYNCI，以及 CACHE 指令的具体差别。

#### WAIT 指令 {-}

GS464V 处理器核没有实现 WAIT 指令的对应功能，导致处理器空闲时，实际上 Linux 内核
处于"忙等待"状态，一直在调用 IDLE 进程，等待并试图重新调度进程。此时指令循环较小
， Cache 命中率高，流水线运行紧凑，使得功耗升高。为解决这个问题，一方面，内核中
增加了处理器 IDLE 补丁，使得处理器空闲时，以 Uncache 方式运行 IDLE 程序，大幅减
小空闲功耗。另一方面，也可以采用动态变频及动态开关核的方法来降低在处理器低负载情
况下的功耗。

同时，也要注意避免在涉及低功耗管理的代码处使用 WAIT 指令，WAIT 不仅无法实现软件
设计预期，甚至可能引起功耗增加。

#### SYNC，SYNCI 指令 {-}

龙芯 3B1500 处理器由硬件维护一级指令缓存和一级数据缓存之间的数据一致性，因此对
SYNC 和 SYNCI 指令的实现功能进行调整。

 - SYNC 指令只有 stype=0 被实现。任何 stype 非零的情形会引起一个"未实现指令例外"
   。该指令起到存储栅障(memory barrier)作用，用于保证 SYNC 之前的访存操作已经确
   定完成（例如，存储指令的数据被写入了 DCache 、 Uncached 的读写已完成、 取指令
   已经将值取回至寄存器），同时保证 SYNC 指令后面的访存操作尚未开始执行。注意，
   SYNC 指令只能在内核态下可以使用。
 - GS464V 的实现中，SYNCI 指令携带的地址信息被忽略，因此不再触发 TIB 相关例外、
   地址错例外和 Cache 错误例外。 SYNCI 指令产生的执行效果与 SYNC 指令等同， 由于
   SYNCI 指令可以在用户态下执行，软件可以利用这一特性，在用户态下获得与 SYNC 指
   令相同的存储栅障的效果。

#### CACHE 指令 {-}

GS464V 的 CACHE 指令支持 17 种 Cache 操作，这些不同操作是由 CACHE 指令的 op 域指
定的。更多关于 CACHE 指令的具体细节，见 \ref{sec:cache-instruction} 节。 GS464V
的 CACHE 指令与 MIPS64 规范存在的区别主要有两点：

 1. **Index 类 CACHE 指令的地址解析方式：** GS464 所实现的 index 类 CACHE 指令采
    用虚地址的最低 2 位作为第几路 Cache 的选择信号，而不是像 MIPS64 规范中定义的
    从虚地址的中间截取。
 2. **CACHE29/CACHE30/CACHE31 指令：** 这三条 op[4:2]=$111_2$ 的 CACHE 指令的含
    义与 MIPS64 规范不同。GS464V 处理器中这些指令均为 Index Store Data 操作，而
    MIPS64 规范中均为 Fetch and Lock 操作。

### 禁用指令

GS464 处理器核禁用下列指令，见表 \ref{tab:forbidden-ins}。

\begin{inslongtable}{禁用指令}{tab:forbidden-ins}\hhline
  DI & 禁止中断 & MIPS32 R2 \tabularnewline
  EI & 允许中断 & MIPS32 R2 \tabularnewline
\end{inslongtable}

