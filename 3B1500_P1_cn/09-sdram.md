\chapter{DDR2/3 SDRAM 控制器配置}

    龙芯 3 号处理器内部集成的内存控制器的设计遵守 DDR2 SDRAM 的行业标
准（JESD79-2B）  。在龙芯 3 号处理器中，所实现的所有内存读/写操作都遵守
JESD79-2B 及 JESD79-3 的规定。

\section{DDR2 SDRAM 控制器功能概述}

龙芯 3A 处理器支持最大 4 个 CS（由 4 个 DDR2 SDRAM 片选信号实现，
即两个双面内存条），一共含有 18 位的地址总线（即：15 位的行列地址总线和 3
位的逻辑 Bank 总线）。 最大支持的地址空间为 128GB（237） 。

龙芯 3 号处理器在具体选择使用不同内存芯片类型时，可以调整 DDR2/3 控
制器参数设置进行支持。          其中，支持的最大片选（CS\_n）数为
4，行地址（RAS\_n） 数为 15，列地址（CAS\_n）数为 14，逻辑体选择（BANK\_n）数为 3。

CPU 发送的内存请求物理地址将按照如下图所示的方法进行行列地址转换：以 4GB
地址空间为例，按照下面的配置：
\begin{verbatim}
  片选     = 4     Bank 数  = 8
  行地址数 = 12    列地址数 = 12
\end{verbatim}

龙芯 3 号处理器所集成的内存控制电路只接受来自处理器或者外部设备的
内存读/写请求， 在所有的内存读/写操作中， 内存控制电路处于从设备状态  （Slave
State）。

龙芯 3 号处理器中内存控制器具有如下特征：
\begin{itemize}
  \item 接口上命令、读写数据全流水操作
  \item 内存命令合并、排序提高整体带宽
  \item 配置寄存器读写端口，可以修改内存设备的基本参数
  \item 内建动态延迟补偿电路（DCC），用于数据的可靠发送和接收
  \item ECC 功能可以对数据通路上的 1 位和 2 位错误进行检测，并能对对 1
    位错误进行自动纠错
  \item 支持 133-400MHZ 工作频率
\end{itemize}

\begin{longtable}{|@{}>{\centering\small}p{3.7cm}@{}|c
                  |>{\centering}p{1cm}|>{\centering}p{1cm}|p{7.5cm}|}
  \caption{DDR2/3 SDRAM 配置参数寄存器格式} \tabularnewline \hline
  {\normalsize 参数名} & 位域 & 缺省 & 范围 & \cellalign{c|}{描述} \tabularnewline \hhline
  \endfirsthead

  \caption{DDR2/3 SDRAM 配置参数寄存器格式（续）} \tabularnewline \hline
  {\normalsize 参数名} & 位域 & 缺省 & 范围 & \cellalign{c|}{描述} \tabularnewline \hhline
  \endhead

  \hline \multicolumn{5}{r}{\tiny 未完待续} \endfoot
  \hline \endlastfoot

  \multicolumn{5}{|l|}{CONF\_CTL\_00 Offset: 0x00 DDR2 667：0x0000\_0100\_0000\_0101} \tabularnewline \hline
  ACTIVE\_AGING & 0:0   & ---  & ---  & 是否允许对命令队列中的命令进行 aging 记录，防止低优先级命令饥饿 \tabularnewline
  ADDR\_CMP\_EN & 8:8   & ---  & ---  & 是否允许命令队列重排序逻辑对地址冲突进行检测 \tabularnewline
  AP            & 16:16 & ---  & ---  & 是否使能内存控制器自动刷新功能， 置1表示内存访问为 CLOSE PAGE 方式。 \tabularnewline
  AREFRESH      & 24:24 & ---  & ---  & 根据 auto\_refresh\_mode 参数的设置，向内存发起自动刷新命令（只写） \tabularnewline
  {\scriptsize AUTO\_REFRESH\_MODE}
                      & 32:32 & ---  & ---  & 设置 auto-refresh 是在下一个 burst 还是下一个命令边界发出 \tabularnewline
  BANK\_SPLIT\_EN     & 40:40 & ---  & ---  & 是否允许命令队列重排序逻辑对 bank 进行拆分（split） \tabularnewline
  CONCURRENTAP        & 48:48 & ---  & ---  & 是否允许控制器对一个 bank 进行
                                              auto precharge 时，对另外一个 bank
                                              发出命令。注：部分内存条不支持
                                              \tabularnewline \hhline

  \multicolumn{5}{|l|}{CONF\_CTL\_01 Offset: 0x10  DDR2 667：0x0000010100000000} \tabularnewline \hline
  DLLLOCKREG               & 0:0   & ---  & ---  & 指示 DLL 是否已锁定（只读）只有在 DLL 锁定之后，对内存发起的读写操作才能有 效到达内存，所以，可以用本位判断第一 次写内存的时机。 \tabularnewline
  {\scriptsize ECC\_DISBALE\_W\_UC\_ERR}
                           & 24:24 & ---  & ---  & 当检测到不可恢复的错误时，是否将 ECC 关闭 \tabularnewline
  EIGHT\_BANK\_MODE       & 32:32 & ---  & ---  & 指示内存模块是否有 8 个 bank \tabularnewline
  {\scriptsize ENABLE\_QUICK\_SREFRESH}
                          & 40:40 & ---  & ---  & 是否使能快速自刷新。当这个参数使能 后，内存的初始化未进行完就进入自刷新 状态 \tabularnewline
  FAST\_WRITE             & 48:48 & ---  & ---  & 是否允许控制器打开快速写功能。打开快速写功能后，控制器在未收到全部写数据后即向内存模块发出写命令。 \tabularnewline
  FWC                     & 56:56 & ---  & ---  & 是否强制进行写检查，当这个参数设置 后，  内存控制器将用 xor\_check\_bits 参数 指定的数与数据进行异或写入内存（只写） \tabularnewline \hhline

  \multicolumn{5}{|l|}{CONF\_CTL\_02    Offset: 0x20         DDR2 667：0x0100010100000000} \tabularnewline \hline
  INTRPTAPBURST & 0:0   & ---  & ---  & 是否允许对另一 bank 的其它命令打断当前的 auto-precharge 命令 \tabularnewline
  INTRPTREADA   & 8:8   & ---  & ---  & 是否允许用 autoprecharge 命令加上对同一 bank 的其它读命令打断前一个读命令 \tabularnewline
  INTRPTWRITENA & 16:16 & ---  & ---  & 是否允许用 autoprecharge 命令加上对同一 bank 的其它写命令打断前一个写命令 \tabularnewline
  NO\_CMD\_INIT & 24:24 & ---  & ---  & 在内存初始化过程中，是否禁止在内存模块的 tDLL 时间内发出其它命令 \tabularnewline
  {\scriptsize ODT\_ADD\_TURN\_CLK\_EN}
                & 32:32  & ---  & ---  & 在对不同片选的快速背对背读或者写命令中间是否插入一个 turn-around 时钟。 通常情况下，插入一个这样的周期是对内存是需要的。 \tabularnewline
  PLACEMENT\_EN & 40:40  & ---  & ---  & 是否使能命令重排序逻辑 \tabularnewline
  POWER\_DOWN   & 48:48  & ---  & ---  & 当使能这个参数时，内存控制器将用 pre-charge 命令关闭内存模块的所有页面，使时钟使能信号为低，不发送收到的所有命令，直到这个参数重新设置为 0 \tabularnewline
  PRIORITY\_EN  & 56:56  & ---  & ---  & 是否使能命令队列重排序逻辑使用优先级 \tabularnewline \hhline

  \multicolumn{5}{|l|}{CONF\_CTL\_03     Offset: 0x30  DDR2 667：0x0101010001010000} \tabularnewline \hline
  PWRUP\_SREFRESH\_EXIT & 0:0   & ---  & ---  & 是用 self-refresh 命令而不是用正常的内存初始化命令来脱离下电模式 \tabularnewline
  REDUC                 & 8:8   & ---  & ---  & 是否只使用 32 位位宽的内存数据通道， 通常情况下，不应设置该位 \tabularnewline
  REG\_DIMM\_EN         & 16:16 & ---  & ---  & 是否使能 registered DIMM 内存模组 \tabularnewline
  RW\_SAME\_EN          & 24:24 & ---  & ---  & 在命令队列重排序逻辑中是否考虑对同一 bank 读写命令的重组 \tabularnewline
  SREFRESH                 & 32:32 & ---  & ---  & 内存模块是否进入自刷新工作模式 \tabularnewline
  START                    & 40:40 & ---  & ---  & 是否开始内存的初始化工作。需要在所有的参数配置完成之后，再设置该位，让内存进入初始化配置。在没有完成其它位的配置之前就配置该位，很可能导致内存访问错误。 \tabularnewline
  SWAP\_EN                 & 48:48 & ---  & ---  & 在使能命令队列重排序逻辑时，当高优先级命令到达时，是否将正在执行的命令与新命令交换 \tabularnewline
  SWAP\_PORT\_RW\_SAME\_EN & 56:56 & ---  & ---  & 当 swap\_en 使能时，该参数决定是否将同一端口上的类似命令进行交换 \tabularnewline \hhline

  \multicolumn{5}{|l|}{CONF\_CTL\_04     Offset: 0x40         DDR2 667：0x0100010100010101} \tabularnewline \hline 
  TRAS\_LOCKOUT     &  0:0   & ---  & ---  & 是 否 在 tRAS 时间到期之前发出 auto-prechareg 命令 \tabularnewline
  TREF\_ENABLE      &  8:8   & ---  & ---  & 是否使能控制器内部的自动刷新功能，通常的情况下，应该将该位置 1 \tabularnewline
  WRITEINTERP       & 16:16  & ---  & ---  & 定义是否能用一个读命令取打断一个写突发 \tabularnewline
  WRITE\_MODEREG    & 24:24  & ---  & ---  & 是否写内存模块的 EMRS 寄存器（只写）， 每次写 1 时控制器就将配置参数中 emrs\_data 与 mrs\_data 发往内存。 \tabularnewline
  AXI0\_R\_PRIORITY &33:32   & ---  & ---  & 设置 AXI0 端口读命令优先级 \tabularnewline
  AXI0\_W\_PRIORITY &41:40   & ---  & ---  & 设置 AXI0 端口写命令优先级 \tabularnewline
  CTRL\_RAW         & 49:48  & ---  & ---  &设置 ECC 的检错和纠错模式 2'b0 不使用 ECC 2b0 只报错，不纠错 2b10 没有使用 ECC 设备 2b1 使用 ECC 报错纠错 \tabularnewline
  RTT\_0            & 57:56  & ---  & ---  &使能内存模块的片上终端电阻。 00 disable 其它 enable，   电阻大小由 mrs\_data 中的值决定 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_05       Offset: 0x50          DDR2 667：0x0000000404050101} \tabularnewline \hline 
  ADDR\_PINS     &     10:8  & ---  & ---  & 间的差值 内存所用地址线数 = 15 – ADDR\_PINS \tabularnewline
  CASLAT         &   18:16   & ---  & ---  &设置 CAS latency 值。应当根据具体的内 存颗粒在不同的运行频率下进行配置。 设置实际地址引脚数和最大地址数(15)之 \tabularnewline
  COLUMN\_SIZE   &    26:24  & ---  & ---  & 设置实际列地址数和最大列地址数(14)之间的差值，应该根据具体的内存颗粒进行配置。 内 存 所 用 列 地 址 数 =   14 - COLUMN\_SIZE \tabularnewline
  MAX\_CS\_REG            &34:32  & ---  & ---  & 定义控制器所用片选个数（只读） \tabularnewline
  OUT\_OF\_RANGE\_TYPE    &42:40  & ---  & ---  & 定义发生越界访问时的错误类型（只读） \tabularnewline
  PORT\_DATA\_ERROR\_TYPE &50:48  & ---  & ---  & 定义内存控制器端口上数据错误类型（只读） 位 0 – 突发数据个数大于 16 位 1 – 写数据交错 位 2 – ECC 2 位错 \tabularnewline
  Q\_FULLNESS             &58:56  & ---  & ---  & 定义内存控制器命令队列中有多少命令 时认为命令队列满 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_06       Offset: 0x60     DDR2 667：0x0a04040603040003} \tabularnewline \hline 
  TCKE           &    2:0     & ---  & ---  & 定义 CKE 信号最小脉宽 \tabularnewline
  TRRD           &   18:16    & ---  & ---  & 需要根据具体内存颗粒及运行频率进行配置。 \tabularnewline
  TRTP           &   26:24    & ---  & ---  & 定义内存模组的读命令到 precharge 周期数，需要根据具体内存颗粒及运行频率进 行配置。 定义到不同 bank 的 active 命令时间间隔， \tabularnewline
  TWR\_INT      &    34:32  & ---  & ---  & 定义内存模组的写恢复时间，需要根据具体内存颗粒及运行频率进行配置。 \tabularnewline
  TWTR          &    42:40  & ---  & ---  & 定义从写命令切换到读命令所需要的时钟周期数，需要根据具体内存颗粒及运行频率进行配置。 \tabularnewline
  WRLAT         &    50:48  & ---  & ---  & 写操作时写命令发出到接收到第一个数 据的时间（按时钟周期数），同时决定何 时使对应的 ODT 信号有效。 注：当 WRLAT = (CASLAT\_LIN /2)时， 会在不同 CS 读写之间加入一拍额外延 迟。 \tabularnewline
  APREBIT       &    59:56  & ---  & ---  & 定义用哪位地址线向内存发出 autoprecharge 命令，一般为 bit 10。 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_07      Offset: 0x70          DDR2 667：0x0f0e0200000f0a0a} \tabularnewline \hline 
  CASLAT\_LIN    &     3:0   & ---  & ---  & 当板上走线延迟为 DDR2 时钟周期的 0.5~1.5 倍：CASLAT\_LIN = CASLAT×2 小于 0.5 倍：CASLAT\_LIN = CASLAT× 2-1 大于 1.5 倍：CASLAT\_LIN = CASLAT× 2+1 （以半个时钟周期为单位） \tabularnewline
  CS\_MAP        &    19:16  & ---  & ---  & 定义可用片选信号，本参数应当根据实际使用的片选个数进行正确的配置，不正确的配置将会导致错误的内存访问。该参数的四位分别对应于 CS0- CS3 \tabularnewline
  INITAREF       &     43:40  & ---  & ---  & 定义系统初始化时所需要执行的 autorefresh 命令个数。DDR2 时设为 2， DDR3 时设为 0。 \tabularnewline
  MAX\_COL\_REG  &     51:48  & ---  & ---  & 系统最大列地址个数（只读） \tabularnewline
  MAX\_ROW\_REG  &     59:56  & ---  & ---  & 系统最大行地址个数（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_08      Offset: 0x80          DDR2 667：0x0102040801020408} \tabularnewline \hline 
  ODT\_RD\_MAP\_CS0 & 3:0   & ---  & ---  & 定义 CS0 有读命令时，将指定的 CS 的 ODT 终端电阻有效，具体的配置应当参考 相应的内存颗粒手册对于 ODT 配置的要求。该参数的四位分别对应于 CS0- CS3 \tabularnewline
  ODT\_RD\_MAP\_CS1 & 11:8  & ---  & ---  & ODT 终端电阻有效，        具体的配置应当参考相应的内存颗粒手册对于 ODT 配置的要求。该参数的四位分别对应于 CS0- CS3 \tabularnewline
  ODT\_RD\_MAP\_CS2 & 19:16 & ---  & ---  & 定义 CS2 有读命令时，将指定的 CS 的 ODT 终端电阻有效， 具体的配置应当参考 相应的内存颗粒手册对于 ODT 配置的要求。该参数的四位分别对应于 CS0- CS3 定义 CS1 有读命令时，将指定的 CS 的 \tabularnewline
  ODT\_RD\_MAP\_CS3 & 27:24 & ---  & ---  & 定义 CS3 有读命令时，将指定的 CS 的 ODT 终端电阻有效，     具体的配置应当参考 相应的内存颗粒手册对于 ODT 配置的要求。该参数的四位分别对应于 CS0- CS3 \tabularnewline
  ODT\_WR\_MAP\_CS0 & 35:32   & ---  & ---  & 定义 CS0 有写命令时，将指定的 CS 的 ODT 终端电阻有效，        具体的配置应当参考 相应的内存颗粒手册对于 ODT 配置的要 求。该参数的四位分别对应于 CS0- CS3 \tabularnewline
  ODT\_WR\_MAP\_CS1 & 43:40   & ---  & ---  & 定义 CS1 有写命令时，将指定的 CS 的 ODT 终端电阻有效，        具体的配置应当参考 相应的内存颗粒手册对于 ODT 配置的要 求。该参数的四位分别对应于 CS0- CS3 \tabularnewline
  ODT\_WR\_MAP\_CS2 & 51:48   & ---  & ---  & 定义 CS2 有写命令时，将指定的 CS 的 ODT 终端电阻有效，        具体的配置应当参考 相应的内存颗粒手册对于 ODT 配置的要 求。该参数的四位分别对应于 CS0- CS3 \tabularnewline
  ODT\_WR\_MAP\_CS3 & 59:56   & ---  & ---  & 定义 CS3 有写命令时，将指定的 CS 的 ODT 终端电阻有效，        具体的配置应当参考 相应的内存颗粒手册对于 ODT 配置的要 求。该参数的四位分别对应于 CS0- CS3 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_09       Offset: 0x90        DDR2 667：0x0000050b00000000} \tabularnewline \hline 
  PORT\_CMD\_ERROR\_TYPE & 19:16 & ---  & ---  & 端口上发生命令错误的类型（只读） 位 0 – 数据位宽过大 位 1 – 关键字优先操作地址未对齐 位 2 – 关键字优先操作字数不是 2 幂 位 3 – narrow transform 出错 \tabularnewline
  TDAL                  & 35:32 & ---  & ---  & 当 auto-precharge 参数设置后，该参数定义了 auto-precharge 和 write recovery 时 钟周期数。 TDAL = auto-precharge + write recovery 该参数仅在设置了 AP 之后才生效。 \tabularnewline
  TRP                   & 43:40 & ---  & ---  & 定义内存模组执行 pre-charge 所需要的时钟周期数，需要根据具体内存颗粒及运 行频率进行配置。 \tabularnewline
  OCD\_ADJUST\_PDN\_CS0 & 52:48 & ---  & ---  & 设置内存模组片选 0 OCD 下拉调整值。内存控制器将在初始化时根据这个参数 的值向内存模组发出 OCD 调整命令 \tabularnewline
  OCD\_ADJUST\_PUPP\_CS0& 60:56 & ---  & ---  & 设置内存模组片选 0 OCD 上拉调整值。 内存控制器将在初始化时根据这个参数的值向内存模组发出 OCD 调整命令 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_10       Offset: 0xa0 DDR2 667：0x0000003f3f140612} \tabularnewline \hline 
  TFAW         &      4:0  & ---  & ---  & 定义内存模组 tFAW 参数，8 个逻辑 bank 时使用 \tabularnewline
  TMRD         &      12:8 & ---  & ---  & 定义配置内存模组模式寄存器需要的时 钟周期数，通常为 2 个周期 \tabularnewline
  TRC          &     20:16 & ---  & ---  & 定义对内存模组同一 bank 的 active 命令 之间的时钟周期数，需要根据具体内存颗 粒及运行频率进行配置。 \tabularnewline
  AGE\_COUNT   &     29:24 & ---  & ---  & 定义命令队列重排序逻辑使用 aging 算法时每个命令的 aging 初始值 \tabularnewline
  COMMAND\_AGE\_COUNT & 37:32   & ---  & ---  & 定义命令队列重排序逻辑使用 aging 算法时每个命令的 aging 初始值 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_12       Offset: 0xc0          DDR2 667：0x00002c0511000000} \tabularnewline \hline 
  ECC\_C\_SYND          &  7:0   & ---  & ---  & 发生 1bit 可纠错错误时的原因（只读） \tabularnewline
  ECC\_U\_SYND          &  15:8  & ---  & ---  & 发生 2bit 不可纠错误时的原因（只读） \tabularnewline
  OUT\_OF\_RANGE\_LENGTH& 23:16  & ---  & ---  & 发生越界访问时的命令长度（只读） \tabularnewline
  TRAS\_MIN             & 31:24  & ---  & ---  & 定义内存模组行地址有效命令的最小时钟周期数 \tabularnewline
  TRCD\_INT       &  39:32    & ---  & ---  & 定义内存模组 RAS 到 CAS 之间的时钟周 期数，需要根据具体内存颗粒及运行频率进行配置。 \tabularnewline
  TRFC            &  47:40    & ---  & ---  & 定义内存模组刷新操作需要的时钟周期 数，需要根据具体内存颗粒及运行频率进行配置。 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_17       Offset: 0x110       DDR2 667：0x0000000000000c2d} \tabularnewline \hline 
  TREF            &   13:0     & ---  & ---  & 定义内存模组两次刷新命令的时钟间隔， 需要根据具体内存颗粒及运行频率进行配置。 \tabularnewline
  EMRS2\_DATA\_0    &  46:32  & ---  & ---  & 定义内存模组初始化时，片选 0 对应的 EMRS2 数据 \tabularnewline
  EMRS2\_DATA\_1    &  62:48  & ---  & ---  & 定义内存模组初始化时，片选 1 对应的EMRS2 数据 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_18       Offset: 0x120      DDR2 667：0x001c000000000000} \tabularnewline \hline 
  EMRS2\_DATA\_2     &  14:0  & ---  & ---  & 定义内存模组初始化时，片选 2 对应的 EMRS2 数据 \tabularnewline
  EMRS2\_DATA\_3     & 30:16  & ---  & ---  & 定义内存模组初始化时，片选 3 对应的 EMRS2 数据 \tabularnewline
  AXI0\_EN\_LT\_WIDTH\_INSTR & 63:48 & ---  & ---  &   定义 AXI0 端口是否接收小于 64 位位宽的内存访问 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_19        Offset: 0x130      DDR2 667：0x6d56000302000000} \tabularnewline \hline 
  TCPD          &     15:0 & ---  & ---  & 定义内存模组时钟有效到 precharge 之间 的时钟周期数，需要根据具体内存颗粒及 运行频率进行配置。 \tabularnewline
  TDLL          &    31:16 & ---  & ---  & 定义内存模组 DLL 锁定需要的时钟周期数 \tabularnewline
  TPDEX            & 47:32  & ---  & ---  & 定义内存模组掉电退出命令的时钟周期数 \tabularnewline
  TRAS\_MAX        & 63:48  & ---  & ---  & 定义内存模组行有效命令的最大时钟周 期数，需要根据具体内存颗粒及运行频率进行配置。 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_20      Offset: 0x140        DDR2 667：0x0000204002000030} \tabularnewline \hline 
  TXSNR            &  15:0 & ---  & ---  & 定义内存模组 tXSNR 参数 \tabularnewline
  TXSR             & 31:16 & ---  & ---  & 定义内存模组自刷新退出需要的时钟周 期数 \tabularnewline
  VERSION         & 47:32  & ---  & ---  & 定义内存控制器版本号（只读） \tabularnewline
  XOR\_CHECK\_BITS& 63:48  & ---  & ---  & 当 fwc 参数设定时，下次写操作的 check bit 将会与该参数进行异或后写入内存 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_21 Offset: 0x150  DDR2 667：0x0000000000000004} \tabularnewline \hline 
  TINIT        &  23:0 & ---  & ---  &  定义内存模组初始化需要的时钟周期数，需要根据具体内存颗粒及运行频率进行配置。一般为 200us \tabularnewline
  ECC\_C\_ADDR & 60:24 & ---  & ---  & 记录发生 1bit ECC 错误时的地址信息 （只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_22      Offset: 0x160         DDR2 667：0x0000000000000000} \tabularnewline \hline 
  ECC\_U\_ADDR & 36:0  & ---  & ---  & 记录发生 2bit ECC 错误时的地址信息（只 读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_23      Offset: 0x170         DDR2 667：0x0000000000000000} \tabularnewline \hline 
  OUT\_OF\_RANGE\_ADDR & 36:0 & ---  & ---  & 记录发生越界访问时的地址信息（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_24       Offset: 0x180      DDR2 667：0x0000000000000000} \tabularnewline \hline 
  PORT\_CMD\_ERROR\_ADDR  & 36:0 & ---  & ---  & 记录端口发生命令错误时的地址信息（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_25       Offset: 0x190         DDR2 667：0x0000000000000000} \tabularnewline \hline 
  ECC\_C\_DATA & 63:0 & ---  & ---  & 记录发生 1bit ECC 错误时的数据信息   （只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_26       Offset: 0x1a0          DDR2 667：0x0000000000000000} \tabularnewline \hline 
  ECC\_U\_DATA & 63:0 & ---  & ---  & 记录发生 2bit ECC 错误时的数据信息   （只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_27   [31:0]       Offset: 0x1b0           DDR2 667：0x00000000} \tabularnewline \hline 
  CKE\_DELAY        & 2:0 & ---  & ---  & CKE 有效延迟。注：用于控制内部 srefresh\_enter 命令的响应时间，对于龙芯 3 号无效。 \tabularnewline \hhline

  \multicolumn{5}{|l|}{CONF\_CTL\_29       Offset: 0x1d0         DDR2 667：0x0103070400000101} \tabularnewline \hline 
  DRIVE\_DQ\_DQS         &   0:0   & ---  & ---  & 设置当控制器空闲时是否驱动数据总线 \tabularnewline
  ODT\_ALT\_EN           &   8:8   & ---  & ---  & 是否支持 CAS＝3 时的 ODT 信号。注：对于龙芯 3 号，无效 \tabularnewline
  DRAM\_CLK\_DISABLE     & 19:16   & ---  & ---  &  \tabularnewline
  TDFI\_CTRLUPD\_MIN     & 35:32   & ---  & ---  & （只读） \tabularnewline
  TDFI\_PHY\_RDLAT       & 44:40   & ---  & ---  & 设置读命令发出到读数据返回间隔的周期数 \tabularnewline
  TDFI\_PHY\_WRLAT       & 51:48   & ---  & ---  & 用于显示实际从写命令发出到写数据发出间隔的周期数（只读） \tabularnewline
  TDFI\_PHY\_WRLAT\_BASE & 59:56   & ---  & ---  & 设置 DDR PHY 中写数据需加入的延迟。 对于龙芯 3 号这个值应为 2 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_30      Offset: 0x1e0       DDR2 667：0x0c2d0c2d0c2d0205} \tabularnewline \hline 
  TDFI\_RDDATA\_EN      &  4:0   & ---  & ---  & 用于显示从读命令发出到读数据返回的 实际周期数 \tabularnewline
  TDFI\_RDDATA\_EN\_BASE& 12:8   & ---  & ---  & DDR PHY 内部读命令发出到读返回的基本时间。对于龙芯 3 号这个值为 2 \tabularnewline
  TDFI\_CTRLUPD\_MAX    & 29:16  & ---  & ---  & 这个值等于 TREF（只读） \tabularnewline
  TDFI\_PHYUPD\_RESP    & 45:32  & ---  & ---  & 这个值等于 TREF（只读） \tabularnewline
  TDFI\_PHYUPD\_TYPE0   &  61:48 & ---  & ---  & 这个值等于 TREF（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_31      Offset: 0x1f0     DDR2 667：0x00200e8000000000} \tabularnewline \hline 
  DFT\_CTRL\_REG       &7:0   & ---  & ---  &  测试使能信号，0x0 为正常工作模式 \tabularnewline
  DLL\_CTRL\_REG\_0\_0 &63:32 & ---  & ---  &  第 0 数据组（DQ7-DQ0）DLL 控制信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_32      Offset: 0x200    DDR2 667：0x00200e8000200e80} \tabularnewline \hline 
  DLL\_CTRL\_REG\_0\_1 &  31:0 & ---  & ---  & 第 1 数据组（DQ15-DQ8） DLL 控制信号 \tabularnewline
  DLL\_CTRL\_REG\_0\_2 & 63:32 & ---  & ---  & 第 2 数据组（DQ23-DQ16）DLL 控制信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_33      Offset: 0x210      DDR2 667：0x00200e8000200e80} \tabularnewline \hline 
  DLL\_CTRL\_REG\_0\_3  & 31:0& ---  & ---  & 第 3 数据组（DQ31-DQ24）DLL 控制信号 \tabularnewline
  DLL\_CTRL\_REG\_0\_4  &63:32& ---  & ---  & 第 4 数据组（DQ39-DQ32）DLL 控制信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_34      Offset: 0x220    DDR2 667：0x00200e8000200e80} \tabularnewline \hline 
  DLL\_CTRL\_REG\_0\_5  & 31:0 & ---  & ---  & 第 5 数据组（DQ47-DQ40）DLL 控制信号 \tabularnewline
  DLL\_CTRL\_REG\_0\_6  &63:32 & ---  & ---  & 第 6 数据组（DQ55-DQ48）DLL 控制信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_35      Offset: 0x230    DDR2 667：0x00200e8000200e80} \tabularnewline \hline 
  DLL\_CTRL\_REG\_0\_7 &  31:0 & ---  & ---  & 第 7 数据组（DQ63-DQ56）DLL 控制信 \tabularnewline
  DLL\_CTRL\_REG\_0\_8 & 63:32 & ---  & ---  & 第 8 数据组（DQ71-DQ64）DLL 控制信 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_36      Offset: 0x240    DDR2 667：0x00000e0000000e00} \tabularnewline \hline 
  DLL\_CTRL\_REG\_1\_0 &  31:0  & ---  & ---  & 第 0 数据组 DLL 控制信号 \tabularnewline
  DLL\_CTRL\_REG\_1\_1 & 63:32  & ---  & ---  & 第 1 数据组 DLL 控制信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_37      Offset: 0x250      DDR2 667：0x00000e0000000e00} \tabularnewline \hline 
  DLL\_CTRL\_REG\_1\_2 &  31:0  & ---  & ---  & 第 2 数据组 DLL 控制信号 \tabularnewline
  DLL\_CTRL\_REG\_1\_3 & 63:32  & ---  & ---  & 第 3 数据组 DLL 控制信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_38      Offset: 0x260      DDR2 667：0x00000e0000000e00} \tabularnewline \hline 
  DLL\_CTRL\_REG\_1\_4 &  31:0  & ---  & ---  & 第 4 数据组 DLL 控制信号 \tabularnewline
  DLL\_CTRL\_REG\_1\_5 & 63:32  & ---  & ---  & 第 5 数据组 DLL 控制信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_39      Offset: 0x270    DDR2 667：0x00000e0000000e00} \tabularnewline \hline 
  DLL\_CTRL\_REG\_1\_6 &  31:0  & ---  & ---  & 第 6 数据组 DLL 控制信号 \tabularnewline
  DLL\_CTRL\_REG\_1\_7 & 63:32  & ---  & ---  & 第 7 数据组 DLL 控制信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_40      Offset: 0x280      DDR2 667：0x0000000z00000e00} \tabularnewline \hline 
  DLL\_CTRL\_REG\_1\_8 &  31:0 & ---  & ---  & 第 8 数据组 DLL 控制信号 \tabularnewline
  DLL\_OBS\_REG\_0\_0  & 33:32 & ---  & ---  & 测试模式下的第 0 数据组 DLL 输出     （只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_41      Offset: 0x290    DDR2 667：0x0000000z0000000z} \tabularnewline \hline 
  DLL\_OBS\_REG\_0\_1& 1:0     & ---  & ---  & 测试模式下的第 1 数据组 DLL 输出      （只读） \tabularnewline
  DLL\_OBS\_REG\_0\_2& 33:32   & ---  & ---  & 测试模式下的第 2 数据组 DLL 输出      （只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_42      Offset: 0x2a0   DDR2 667：0x0x0000000z0000000z} \tabularnewline \hline 
  DLL\_OBS\_REG\_0\_3& 1:0    & ---  & ---  & 测试模式下的第 3 数据组 DLL 输出      （只读） \tabularnewline
  DLL\_OBS\_REG\_0\_4& 33:32  & ---  & ---  & 测试模式下的第 4 数据组 DLL 输出      （只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_43      Offset: 0x2b0   DDR2 667：0x0x0000000z0000000z} \tabularnewline \hline 
  DLL\_OBS\_REG\_0\_5& 1:0   & ---  & ---  &测试模式下的第 5 数据组 DLL 输出      （只读） \tabularnewline
  DLL\_OBS\_REG\_0\_6& 33:32 & ---  & ---  &测试模式下的第 6 数据组 DLL 输出      （只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_44      Offset: 0x2c0   DDR2 667：0x0000000z0000000z} \tabularnewline \hline 
  DLL\_OBS\_REG\_0\_7& 1:0    & ---  & ---  & 测试模式下的第 7 数据组 DLL 输出     （只读） \tabularnewline
  DLL\_OBS\_REG\_0\_8& 33:32  & ---  & ---  & 测试模式下的第 8 数据组 DLL 输出      （只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_45      Offset: 0x2d0    DDR2 667：0xf30029470000019d} \tabularnewline \hline 
  PAD\_CTRL\_REG\_0    & 25:0  & ---  & ---  & 引脚控制信号 \tabularnewline
  PHY\_CTRL\_REG\_0\_0 & 63:32 & ---  & ---  & 第 0 数据组时延控制. \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_46      Offset: 0x2e0  DDR2 667：0xf3002947f3002947} \tabularnewline \hline 
  PHY\_CTRL\_REG\_0\_1  & 31:0  & ---  & ---  & 第 1 数据组时延控制. \tabularnewline
  PHY\_CTRL\_REG\_0\_2  & 63:32 & ---  & ---  & 第 2 数据组时延控制. \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_47      Offset: 0x2f0  DDR2 667：0xf3002947f3002947} \tabularnewline \hline 
  PHY\_CTRL\_REG\_0\_3 & 31:0 & ---  & ---  & 第 3 数据组时延控制. \tabularnewline
  PHY\_CTRL\_REG\_0\_4 & 63:32& ---  & ---  & 第 4 数据组时延控制. \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_48      Offset: 0x300  DDR2 667：0xf3002947f3002947} \tabularnewline \hline 
  PHY\_CTRL\_REG\_0\_5 & 31:0  & ---  & ---  &第 5 数据组时延控制. \tabularnewline
  PHY\_CTRL\_REG\_0\_6 & 63:32 & ---  & ---  &第 6 数据组时延控制. \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_49      Offset: 0x310    DDR2 667：0xf3002947f3002947} \tabularnewline \hline 
  PHY\_CTRL\_REG\_0\_7 & 31:0 & ---  & ---  &第 7 数据组时延控制. \tabularnewline
  PHY\_CTRL\_REG\_0\_8 & 63:32& ---  & ---  &第 8 数据组时延控制. \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_50      Offset: 0x320    DDR2 667：0x07c0000007c00000} \tabularnewline \hline 
  PHY\_CTRL\_REG\_1\_0 &31:0 & ---  & ---  &第 0 数据组中 PAD 的终端电阻控制 \tabularnewline
  PHY\_CTRL\_REG\_1\_1 &63:32& ---  & ---  & 第 1 数据组中 PAD 的终端电阻控制 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_51      Offset: 0x330  DDR2 667：0x07c0000007c00000} \tabularnewline \hline 
  PHY\_CTRL\_REG\_1\_2& 31:0 & ---  & ---  &第 2 数据组中 PAD 的终端电阻控制 \tabularnewline
  PHY\_CTRL\_REG\_1\_3& 63:32& ---  & ---  & 第 3 数据组中 PAD 的终端电阻控制 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_52      Offset: 0x340 DDR2 667：0x07c0000007c00000} \tabularnewline \hline 
  PHY\_CTRL\_REG\_1\_4& 31:0  & ---  & ---  &第 4 数据组中 PAD 的终端电阻控制 \tabularnewline
  PHY\_CTRL\_REG\_1\_5& 63:32 & ---  & ---  &第 5 数据组中 PAD 的终端电阻控制 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_53      Offset: 0x350 DDR2 667：0x07c0000007c00000} \tabularnewline \hline 
  PHY\_CTRL\_REG\_1\_6& 31:0  & ---  & ---  &第 6 数据组中 PAD 的终端电阻控制 \tabularnewline
  PHY\_CTRL\_REG\_1\_7& 63:32 & ---  & ---  &第 7 数据组中 PAD 的终端电阻控制 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_54      Offset: 0x360 DDR2 667：0x0800c00507c00000} \tabularnewline \hline 
  PHY\_CTRL\_REG\_1\_8&  31:0& ---  & ---  & 第 8 数据组中 PAD 的终端电阻控制 \tabularnewline
  PHY\_CTRL\_REG\_2   & 63:32& ---  & ---  & 读写数据延迟控制 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_55      Offset: 0x370    DDR2 667：0x0000000000000000} \tabularnewline \hline 
  PHY\_OBS\_REG\_0\_0 &31:0  & ---  & ---  &第 0 数据组测试用观测信号（只读） \tabularnewline
  PHY\_OBS\_REG\_0\_1 &63:32 & ---  & ---  &第 1 数据组测试用观测信号（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_56      Offset: 0x380 DDR2 667：0x0000000000000000} \tabularnewline \hline 
  PHY\_OBS\_REG\_0\_2  &31:0  & ---  & ---  &  第 2 数据组测试用观测信号（只读） \tabularnewline
  PHY\_OBS\_REG\_0\_3  &63:32 & ---  & ---  &  第 3 数据组测试用观测信号（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_57      Offset: 0x390     DDR2 667：0x0000000000000000} \tabularnewline \hline 
  PHY\_OBS\_REG\_0\_4& 31:0 & ---  & ---  &  第 4 数据组测试用观测信号（只读） \tabularnewline
  PHY\_OBS\_REG\_0\_5& 63:32& ---  & ---  &  第 5 数据组测试用观测信号（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_58      Offset: 0x3a0     DDR2 667：0x0000000000000000} \tabularnewline \hline 
  PHY\_OBS\_REG\_0\_6& 31:0 & ---  & ---  &  第 6 数据组测试用观测信号（只读） \tabularnewline
  PHY\_OBS\_REG\_0\_7& 63:32& ---  & ---  &  第 7 数据组测试用观测信号（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_59       Offset: 0x3b0     DDR2 667：0x0000000000000000} \tabularnewline \hline 
  PHY\_OBS\_REG\_0\_8 & 31:0 & ---  & ---  &  第 8 数据组测试用观测信号（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_113       Offset: 0x710    DDR2 667：0x0000000000000000} \tabularnewline \hline 
  EN\_WR\_LEVELING & 48   & ---  & ---  & Write Leveling  功能使能信号。 一种 DDR3 的调试模式， 周期性向内在颗粒发送 DQ/DQS \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_114       Offset: 0x720      DDR2 667：0x0000000000000000} \tabularnewline \hline 
  SWLVL\_OP\_DONE                  &  8   & ---  & ---  & 用于指示软件 Leveling 是否完成（只读） \tabularnewline
  RDLVL\_BEGIN\_DELAY\_EN          &  24  & ---  & ---  & 使能 Read Leveling 寻找数据采样点功能 \tabularnewline
  RDLVL\_EN                        &  32  & ---  & ---  & 使能 Read Leveling 功能 \tabularnewline
  RDLVL\_GATE\_EN                  &  40  & ---  & ---  & 使能 Read Leveling 时读选通采样训练，在初始化完成后会向颗粒发送命令，进行读 DQS 采样窗口的训练 \tabularnewline
  RDLVL\_GATE\_PREAMBLE\_CHECK\_EN &  48  & ---  & ---  & 开启读选通采样训练时的前导采样检查 \tabularnewline
  RDLVL\_GATE\_REQ                 &  56  & ---  & ---  & 用户请求读选通采样训练功能.（只写） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_115       Offset: 0x730 DDR2 667：0x0000000000000000} \tabularnewline \hline 
  RDLVL\_OFFSET\_DIR\_0 & 0    & ---  & ---  & 第 0 数据组 Read Leveling 时中点的调整方向为 0 时中点 计算为减去 rdlvl\_offset\_delay，为 1 则加 \tabularnewline
  RDLVL\_OFFSET\_DIR\_1 & 8    & ---  & ---  & 第 1 数据组 Read Leveling 时中点的调整方向为 0 时中点 计算为减去 rdlvl\_offset\_delay，为 1 则加 \tabularnewline
  RDLVL\_OFFSET\_DIR\_2 & 16   & ---  & ---  & 第 2 数据组 Read Leveling 时中点的调整方向为 0 时中点 计算为减去 rdlvl\_offset\_delay，为 1 则加 \tabularnewline
  RDLVL\_OFFSET\_DIR\_3 & 24   & ---  & ---  & 第 3 数据组 Read Leveling 时中点的调整方向为 0 时中点 计算为减去 rdlvl\_offset\_delay，为 1 则加 \tabularnewline
  RDLVL\_OFFSET\_DIR\_4 & 32   & ---  & ---  & 第 4 数据组 Read Leveling 时中点的调整方向为 0 时中点 计算为减去 rdlvl\_offset\_delay，为 1 则加 \tabularnewline
  RDLVL\_OFFSET\_DIR\_5 & 40   & ---  & ---  & 第 5 数据组 Read Leveling 时中点的调整方向为 0 时中点 计算为减去 rdlvl\_offset\_delay，为 1 则加 \tabularnewline
  RDLVL\_OFFSET\_DIR\_6 & 48   & ---  & ---  & 第 6 数据组 Read Leveling 时中点的调整方向为 0 时中点 计算为减去 rdlvl\_offset\_delay，为 1 则加 \tabularnewline
  RDLVL\_OFFSET\_DIR\_7 & 56   & ---  & ---  & 第 7 数据组 Read Leveling 时中点的调整方向为 0 时中点 计算为减去 rdlvl\_offset\_delay，为 1 则加 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_116     Offset: 0x740    DDR2 667：0x0100000000000000} \tabularnewline \hline 
  RDLVL\_OFFSET\_DIR\_8                   & 0      & ---  & ---  &   第 8 数据组 Read Leveling 时中点的调整 方向？ \tabularnewline
  NCY\_ CONTROLRDLVL\_REQ                 & 8      & ---  & ---  & 用户请求开始 Read Leveling 训练功能.  （只写） \tabularnewline
  WEIGHTED\_ROUND\_ROBIN\_LATE            & 16     & ---  & ---  & Free-running or limited WRR latency counters. \tabularnewline
  WEIGHTED\_ROUND\_ROBIN\_WEIGHT\_SHARING & 24     & ---  & ---  & Per-port pair shared arbitration for WRR \tabularnewline
  WRLVL\_INTERVAL\_CT\_EN                 & 32     & ---  & ---  & 使能 Write Leveling 时间间隔功能 \tabularnewline
  WRLVL\_REQ                              & 40     & ---  & ---  & 用户请求开始 Write Leveling 训练功能. （只写） \tabularnewline
  AXI0\_PORT\_ORDERING                    & 49:48  & ---  & ---  & 内部端口 0 是否可乱序执行 \tabularnewline
  AXI1\_PORT\_ORDERING                    & 57:56  & ---  & ---  & 内部端口 1 是否可乱序执行，对于龙芯 3号无效 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_117     Offset: 0x750     DDR2 667：0x0100000101020101} \tabularnewline \hline 
  AXI1\_R\_PRIORITY    & 1:0    & ---  & ---  & 内部端口 1 的读操作优先级，对于龙芯 3 号无效 \tabularnewline
  AXI1\_W\_PRIORITY    & 9:8    & ---  & ---  &   内部端口 1 的写操作优先级，对于龙芯 3 号无效 \tabularnewline
  AXI2\_PORT\_ORDERING & 17:16  & ---  & ---  &   内部端口 2 是否可乱序执行，对于龙芯 3号无效 \tabularnewline
  AXI2\_R\_PRIORITY    & 25:24  & ---  & ---  & 内部端口 2 的读操作优先级，对于龙芯 3 号无效 \tabularnewline
  AXI2\_W\_PRIORITY    & 33:32  & ---  & ---  &    内部端口 2 的写操作优先级，对于龙芯 3 号无效 \tabularnewline
  RDLVL\_CS            & 41:40  & ---  & ---  & 指示当前 Read Leveling 操作的片选信号 \tabularnewline
  SW\_LEVELING\_MODE   & 49:48  & ---  & ---  & 定义软件 Leveling 操作的模式 \tabularnewline
  WRLVL\_CS            & 57:56  & ---  & ---  & 指示当前 Write Leveling 操作的片选信号 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_118     Offset: 0x760    DDR2 667：0x0303030000020001} \tabularnewline \hline 
  ZQ\_ON\_SREF\_EXIT                  & 1:0   & ---  & ---  & 定义在退出自刷新模式时 ZQ 调整功能的模式 \tabularnewline
  ZQ\_REQ                             & 9:8   & ---  & ---  & 用户请求开始 ZQ 调整功能 \tabularnewline
  BSTLEN                              & 18:16 & ---  & ---  & 设置控制器上向内存模块发送的 Burst 长 度值 \tabularnewline
  TDFI\_DRAM\_CLK\_DISABLE            & 26:24 & ---  & ---  & 从内部时钟关闭到外部时钟关闭的延迟设置 \tabularnewline
  ADDRESS\_MIRRORING                  & 35:32 & ---  & ---  & 指示哪个片选支持 Address mirroring 功 能 \tabularnewline
  AXI0\_PRIORITY0\_RELATIVE\_PRIORITY & 43:40 & ---  & ---  & 内部端口 0 优先级 0 的命令的相对优先级 \tabularnewline
  AXI0\_PRIORITY1\_RELATIVE\_PRIORITY & 51:48 & ---  & ---  & 内部端口 0 优先级 1 的命令的相对优先级 \tabularnewline
  AXI0\_PRIORITY2\_RELATIVE\_PRIORITY & 59:56 & ---  & ---  & 内部端口 0 优先级 2 的命令的相对优先级 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_119     Offset: 0x770    DDR2 667：0x0101010202020203} \tabularnewline \hline 
  AXI0\_PRIORITY3\_RELATIVE\_PRIORITY &  0:3  & ---  & ---  & 内部端口 0 优先级 3 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline
  AXI1\_PRIORITY0\_RELATIVE\_PRIORITY & 11:8  & ---  & ---  & 内部端口 1 优先级 0 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline
  AXI1\_PRIORITY1\_RELATIVE\_PRIORITY & 19:16 & ---  & ---  & 内部端口 1 优先级 1 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline
  AXI1\_PRIORITY2\_RELATIVE\_PRIORITY & 27:24 & ---  & ---  & 内部端口 1 优先级 2 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline
  AXI1\_PRIORITY3\_RELATIVE\_PRIORITY & 35:32 & ---  & ---  & 内部端口 1 优先级 3 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline
  AXI2\_PRIORITY0\_RELATIVE\_PRIORITY & 43:40 & ---  & ---  & 内部端口 2 优先级 0 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline
  AXI2\_PRIORITY1\_RELATIVE\_PRIORITY & 51:48 & ---  & ---  & 内部端口 2 优先级 1 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline
  AXI2\_PRIORITY2\_RELATIVE\_PRIORITY & 59:56 & ---  & ---  & 内部端口 2 优先级 2 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_120     Offset: 0x780 DDR2 667：0x0102020400040c01} \tabularnewline \hline 
  AXI2\_PRIORITY3\_RELATIVE\_PRIORITY  & 3:0   & ---  & ---  & 内部端口 2 优先级 3 的命令的相对优先级，对于龙芯 3 号无效 \tabularnewline
  BURST\_ON\_FLY\_BIT                  & 11:8  & ---  & ---  & 对 DRAM 发 出 的 模 式 配 置 中 的 burst-on-fly 位 \tabularnewline
  DRAM\_CLASS                          & 19:16 & ---  & ---  & 110：DDR3 100：DDR2 \tabularnewline
  LOWPOWER\_REFRESH\_ENABLE            & 27:24 & ---  & ---  & 使能低功耗模式下的刷新功能定义控制器外接内存类型 \tabularnewline
  RDLVL\_DQ\_ZERO\_COUNT               & 35:32 & ---  & ---  & 设置读 Read Leveling 时，表求由 1 到 0的 0 的个数 \tabularnewline
  RDLVL\_GATE\_DQ\_ZERO\_COUNT         & 43:40 & ---  & ---  & 设置读选通采样训练时，表求由 1 到 0 的  0 的个数 \tabularnewline
  TDFI\_CTRL\_DELAY                    & 51:48 & ---  & ---  & 从时钟有效到输出命令之间的延迟 \tabularnewline
  TDFI\_DRAM\_CLK\_ENABLE              & 59:56 & ---  & ---  & 从内部时钟有效到输出时钟有效的延迟 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_121      Offset: 0x790 DDR2 667：0x281900000f000303} \tabularnewline \hline 
  TDFI\_RDLVL\_DLL       &  7:0    & ---  & ---  & 读操作到 Read Leveling 更新延迟线数目的最小周期 \tabularnewline
  TDFI\_WRLVL\_DLL       & 15:8    & ---  & ---  & 读操作到 Write Leveling 更新延迟线数目的最小周期 \tabularnewline
  WRR\_PARAM\_VALUE\_ERR & 19:16   & ---  & ---  & Errors/warnings related to the WRR parameters. （只读） \tabularnewline
  ZQCS\_CHIP             & 27:24   & ---  & ---  & 定义下次 ZQ 时的有效片选 \tabularnewline
  LOWPOWER\_AUTO\_ENABLE & 36:32   & ---  & ---  &  使能当控制器内闲时自动进入低功耗模式 控 制 位 与 LOWERPOWER\_CONTROL 相同 \tabularnewline
  LOWPOWER\_CONTROL      & 44:40   & ---  & ---  & 低功耗模式使能 Bit 4: power down Bit 3: power down external Bit 2: self refresh Bit 1: external Bit 0: internal \tabularnewline
  WLDQSEN                & 53:48   & ---  & ---  & 从 对 DRAM 发 送 模 式 配 置 到 Write Leveling 的的选通数据采样延迟 \tabularnewline
  WLMRD                  & 61:56   & ---  & ---  & 从 对 DRAM 发 送 模 式 配 置 到 Write Leveling 的延迟 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_122      Offset: 0x7a0      DDR2 667：0x00000000000000ff} \tabularnewline \hline 
  DFI\_WRLVL\_MAX\_DELAY & 7:0     & ---  & ---  & Write leveling 延迟线的最大级数 \tabularnewline
  SWLVL\_RESP\_0         & 15:8    & ---  & ---  & 第 0 数据组的 Leveling 响应 \tabularnewline
  SWLVL\_RESP\_1         & 23:16   & ---  & ---  & 第 1 数据组的 Leveling 响应 \tabularnewline
  SWLVL\_RESP\_2         & 31:24   & ---  & ---  & 第 2 数据组的 Leveling 响应 \tabularnewline
  SWLVL\_RESP\_3         & 39:32   & ---  & ---  & 第 3 数据组的 Leveling 响应 \tabularnewline
  SWLVL\_RESP\_4         & 47:40   & ---  & ---  & 第 4 数据组的 Leveling 响应 \tabularnewline
  SWLVL\_RESP\_5         & 55:48   & ---  & ---  & 第 5 数据组的 Leveling 响应 \tabularnewline
  SWLVL\_RESP\_6         & 63:56   & ---  & ---  & 第 6 数据组的 Leveling 响应 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_123      Offset: 0x7b0    DDR2 667：0x0000000000000000} \tabularnewline \hline 
  SWLVL\_RESP\_7         &   7:0 & ---  & ---  & 第 7 数据组的 Leveling 响应 \tabularnewline
  SWLVL\_RESP\_8         &   15: & ---  & ---  & 第 8 数据组的 Leveling 响应 \tabularnewline
  RDLVL\_BEGIN\_DELAY\_0 & 23:16 & ---  & ---  &   第 0 数据组中，Read Leveling 时从第一 \tabularnewline
  RDLVL\_BEGIN\_DELAY\_1 & 31:24 & ---  & ---  &   第 1 数据组中，Read Leveling 时从第一 \tabularnewline
  RDLVL\_BEGIN\_DELAY\_2 & 39:32 & ---  & ---  &   第 2 数据组中，Read Leveling 时从第一 \tabularnewline
  RDLVL\_BEGIN\_DELAY\_3 & 47:40 & ---  & ---  &   第 3 数据组中，Read Leveling 时从第一 \tabularnewline
  RDLVL\_BEGIN\_DELAY\_4 & 55:48 & ---  & ---  &   第 4 数据组中，Read Leveling 时从第一 \tabularnewline
  RDLVL\_BEGIN\_DELAY\_5 & 63:56 & ---  & ---  &   第 5 数据组中，Read Leveling 时从第一 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_124      Offset: 0x7c0     DDR2 667：0x0000000000000000} \tabularnewline \hline 
  RDLVL\_BEGIN\_DELAY\_6 &  7:0   & ---  & ---  &  第 6 数据组中，Read Leveling 时从第一 个 1 到 0 的延迟单元数目 \tabularnewline
  RDLVL\_BEGIN\_DELAY\_7 &  15:8  & ---  & ---  &  第 7 数据组中，Read Leveling 时从第一 个 1 到 0 的延迟单元数目 \tabularnewline
  RDLVL\_BEGIN\_DELAY\_8 &  23:16 & ---  & ---  &  第 8 数据组中，Read Leveling 时从第一 个 1 到 0 的延迟单元数目 \tabularnewline
  RDLVL\_END\_DELAY\_0   &  31:24 & ---  & ---  &  第 0 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline
  RDLVL\_END\_DELAY\_1   &  39:32 & ---  & ---  &  第 1 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline
  RDLVL\_END\_DELAY\_2   &  47:40 & ---  & ---  &  第 2 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline
  RDLVL\_END\_DELAY\_3   &  55:48 & ---  & ---  &  第 3 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline
  RDLVL\_END\_DELAY\_4   &  63:56 & ---  & ---  &  第 4 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_125      Offset: 0x7d0    DDR2 667：0x0000000000000000} \tabularnewline \hline 
  RDLVL\_END\_DELAY\_5        & 7:0   & ---  & ---  & 第 5 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline
  RDLVL\_END\_DELAY\_6        & 15:8  & ---  & ---  & 第 6 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline
  RDLVL\_END\_DELAY\_7        & 23:16 & ---  & ---  & 第 7 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline
  RDLVL\_END\_DELAY\_8        & 31:34 & ---  & ---  & 第 8 数据组中，Read Leveling 时从第一 个 0 到 1 的延迟单元数目 \tabularnewline
  RDLVL\_GATE\_CLK\_ADJUST\_0 & 39:32 & ---  & ---  & 第 0 数据组中，读采样训练的起始值 \tabularnewline
  RDLVL\_GATE\_CLK\_ADJUST\_1 & 47:40 & ---  & ---  & 第 1 数据组中，读采样训练的起始值 \tabularnewline
  RDLVL\_GATE\_CLK\_ADJUST\_2 & 55:48 & ---  & ---  & 第 2 数据组中，读采样训练的起始值 \tabularnewline
  RDLVL\_GATE\_CLK\_ADJUST\_3 & 63:56 & ---  & ---  & 第 3 数据组中，读采样训练的起始值 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_126      Offset: 0x7e0     DDR2 667：0x0000000000000000} \tabularnewline \hline 
  RDLVL\_GATE\_CLK\_ADJUST\_4  &   7:0    & ---  & ---  & 第 4 数据组，读采样训练的起始值  \tabularnewline
  RDLVL\_GATE\_CLK\_ADJUST\_5  &   15:8   & ---  & ---  & 第 5 数据组，读采样训练的起始值                                    \tabularnewline
  RDLVL\_GATE\_CLK\_ADJUST\_6  & 23:16    & ---  & ---  & 第 6 数据组，读采样训练的起始值                                    \tabularnewline
  RDLVL\_GATE\_CLK\_ADJUST\_7  & 31:24    & ---  & ---  & 第 7 数据组，读采样训练的起始值                                    \tabularnewline
  RDLVL\_GATE\_CLK\_ADJUST\_8  & 39:32    & ---  & ---  & 第 8 数据组，读采样训练的起始值 \tabularnewline
  RDLVL\_GATE\_DELAY\_0        & 47:40    & ---  & ---  & 第 0 数据组，采样时机到选通信号上升沿周期数 \tabularnewline
  RDLVL\_GATE\_DELAY\_1        & 55:48    & ---  & ---  & 第 1 数据组，采样时机到选通信号上升沿周期数 \tabularnewline
  RDLVL\_GATE\_DELAY\_2        & 63:56    & ---  & ---  & 第 2 数据组，采样时机到选通信号上升沿周期数 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_127      Offset: 0x7f0     DDR2 667：0x0000000000000000} \tabularnewline \hline 
  RDLVL\_GATE\_DELAY\_3   & 7:0   & ---  & ---  &  第 3 数据组，采样时机到选通信号上升沿周期数 \tabularnewline
  RDLVL\_GATE\_DELAY\_4   & 15:8  & ---  & ---  &  第 4 数据组，采样时机到选通信号上升沿周期数 \tabularnewline
  RDLVL\_GATE\_DELAY\_5   & 23:16 & ---  & ---  &  第 5 数据组，采样时机到选通信号上升沿周期数 \tabularnewline
  RDLVL\_GATE\_DELAY\_6   & 31:24 & ---  & ---  &  第 6 数据组，采样时机到选通信号上升沿周期数 \tabularnewline
  RDLVL\_GATE\_DELAY\_7   & 39:32 & ---  & ---  &  第 7 数据组，采样时机到选通信号上升沿周期数 \tabularnewline
  RDLVL\_GATE\_DELAY\_8   & 47:40 & ---  & ---  &  第 8 数据组，采样时机到选通信号上升沿周期数 \tabularnewline
  {\footnotesize RDLVL\_GATE\_MAX\_DELAY} & 55:48 & ---  & ---  & 采样延迟线的最大数目 \tabularnewline
  RDLVL\_MAX\_DELAY       & 63:56 & ---  & ---  & Read Leveling 延迟线的最大数目 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_128      Offset: 0x800     DDR2 667：0x0e0e0e0e0e0e0e0e} \tabularnewline \hline 
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_0} &   7:0  & ---  & ---  & 第 0 数据组数据延迟中点  \tabularnewline
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_1} &   15:8 & ---  & ---  & 第 1 数据组数据延迟中点                                      \tabularnewline
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_2} & 23:16  & ---  & ---  & 第 2 数据组数据延迟中点                                      \tabularnewline
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_3} & 31:24  & ---  & ---  & 第 3 数据组数据延迟中点                                      \tabularnewline
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_4} & 39:32  & ---  & ---  & 第 4 数据组数据延迟中点                                     \tabularnewline
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_5} & 47:40  & ---  & ---  & 第 5 数据组数据延迟中点                                     \tabularnewline
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_6} & 55:48  & ---  & ---  & 第 6 数据组数据延迟中点                                      \tabularnewline
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_7} & 63:56  & ---  & ---  & 第 7 数据组数据延迟中点 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_129      Offset: 0x810    DDR2 667：0x000000000000000e} \tabularnewline \hline                                             
  {\footnotesize RDLVL\_MIDPOINT\_DELAY\_8} &   7:0  & ---  & ---  & 第 8 数据组，计算得出的数据延迟中点 \tabularnewline
  {\footnotesize RDLVL\_OFFSET\_DELAY\_0}   &   15:8 & ---  & ---  & 第 0 数据组，到 Read Leveling 中点的偏移 \tabularnewline
  {\footnotesize RDLVL\_OFFSET\_DELAY\_1}   & 23:16  & ---  & ---  & 第 1 数据组，到 Read Leveling 中点的偏移 \tabularnewline
  {\footnotesize RDLVL\_OFFSET\_DELAY\_2}   & 31:24  & ---  & ---  & 第 2 数据组，到 Read Leveling 中点的偏移 \tabularnewline
  {\footnotesize RDLVL\_OFFSET\_DELAY\_3}   & 39:32  & ---  & ---  & 第 3 数据组，到 Read Leveling 中点的偏移 \tabularnewline
  {\footnotesize RDLVL\_OFFSET\_DELAY\_4}   & 47:40  & ---  & ---  & 第 4 数据组，到 Read Leveling 中点的偏移 \tabularnewline
  {\footnotesize RDLVL\_OFFSET\_DELAY\_5}   & 55:48  & ---  & ---  & 第 5 数据组，到 Read Leveling 中点的偏移 \tabularnewline
  {\footnotesize RDLVL\_OFFSET\_DELAY\_6}   & 63:56  & ---  & ---  & 第 6 数据组，到 Read Leveling 中点的偏移 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_130      Offset: 0x820    DDR2 667：0x0420000c20400000} \tabularnewline \hline 
  {\footnotesize RDLVL\_OFFSET\_DELAY\_7}   & 7:0  & ---  & ---  & 第 7 数据组中，到 Read Leveling 中点的偏移 \tabularnewline
  {\footnotesize RDLVL\_OFFSET\_DELAY\_8}  &15:8  & ---  & ---  &   第 8 数据组中，到 Read Leveling 中点的偏移 \tabularnewline
  REFRESH\_PER\_ZQ          &23:16 & ---  & ---  & 自动 ZQCS 命令之间的刷新命令数目 \tabularnewline
  TDFI\_RDLVL\_RESP         &31:24 & ---  & ---  & Read Leveling 请求到该模式使能的最大周期数 \tabularnewline
  {\footnotesize TDFI\_RDLVL\_RESPLAT}      &39:32 & ---  & ---  & Read Leveling 选通到响应有效的周期数 \tabularnewline
  TDFI\_RDLVL\_RR           &47:40 & ---  & ---  & Read Leveling 中读请求之间的最小周期间隔 \tabularnewline
  TDFI\_WRLVL\_RES          &55:48 & ---  & ---  & Write Leveling 请求到该模式使能的最大周期数 \tabularnewline
  {\footnotesize TDFI\_WRLVL\_RESPLAT}      &63:56 & ---  & ---  & Write Leveling 选通到响应有效的周期数 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_131      Offset: 0x830   DDR2 667：0x0000000000000c0a} \tabularnewline \hline 
  TDFI\_WRLVL\_WW    &   7:0     & ---  & ---  & Write Leveling 选 通之间的最小周期数 \tabularnewline
  TMOD               &  15:8     & ---  & ---  & DRAM 模式配置后需空闲的周期数 \tabularnewline
  WRLVL\_DELAY\_0    & 23:16     & ---  & ---  & 第 0 数据组的在 EN\_WR\_LEVELING 无 效 且      SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline
  WRLVL\_DELAY\_1    & 31:24     & ---  & ---  & 第 1 数据组的在 EN\_WR\_LEVELING 无 效 且      SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline
  WRLVL\_DELAY\_2    & 39:32     & ---  & ---  & 第 2 数据组的在 EN\_WR\_LEVELING 无 效 且      SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline
  WRLVL\_DELAY\_3    & 47:40     & ---  & ---  & 第 3 数据组的在 EN\_WR\_LEVELING 无 效 且      SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline
  WRLVL\_DELAY\_4    & 55:48     & ---  & ---  & 第 4 数据组的在 EN\_WR\_LEVELING 无 效 且      SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline
  WRLVL\_DELAY\_5    & 63:56     & ---  & ---  & 第 5 数据组的在 EN\_WR\_LEVELING 无 效 且      SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_132      Offset: 0x840   DDR2 667：0x0000640064000000} \tabularnewline \hline 
  WRLVL\_DELAY\_6             &   7:0   & ---  & ---  & 第 6 数据组的在 EN\_WR\_LEVELING 无 效 且    SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline
  WRLVL\_DELAY\_7             &   15:8  & ---  & ---  & 第 7 数据组的在 EN\_WR\_LEVELING 无 效 且    SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline
  WRLVL\_DELAY\_8             & 23:16   & ---  & ---  & 第 8 数据组的在 EN\_WR\_LEVELING 无 效 且    SW\_LEVELING\_MODE=1 ， SWLVL\_MODE=1 时控制写 DQS 经 DLL 延迟数 \tabularnewline
  {\footnotesize AXI0\_PRIORITY\_RELAX}       & 33:24   & ---  & ---  &   内部端口 0 上触发优先控制放松的计数器值 \tabularnewline
  {\footnotesize AXI1\_PRIORITY\_RELAX}       & 49:40   & ---  & ---  &   内部端口 1 上触发优先控制放松的计数器值，对于龙芯 3 号无效 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_133      Offset: 0x850    DDR2 667：0x0000000000000064} \tabularnewline \hline 
  {\footnotesize AXI2\_PRIORITY\_RELAX}       &  9:0   & ---  & ---  &  内部端口 2 上触发优先控制放松的计数器 值，对于龙芯 3 号无效 \tabularnewline
  ECC\_C\_ID                  &25:16   & ---  & ---  & 访问出现 1 位错请求的 ID 号（只读） \tabularnewline
  ECC\_U\_ID                  &41:32   & ---  & ---  & 访问出现 2 位错请求的 ID 号（只读） \tabularnewline
  OUT\_OF\_RANGE\_ SOURCE\_ID  &57:48   & ---  & ---  & 访问地址溢出请求的 ID 号（只读） \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_134      Offset: 0x860    DDR2 667：0x0200004000000000} \tabularnewline \hline 
  PORT\_CMD\_ERROR\_ID  &   9:0   & ---  & ---  & 内部端口命令错请求的 ID 号（只读） \tabularnewline
  {\footnotesize PORT\_DATA\_ERROR\_ID} & 25:16   & ---  & ---  & 内部端口数据错请求的 ID 号（只读） \tabularnewline
  ZQCS                  & 43:32   & ---  & ---  & ZQCS 命令需要的周期数 \tabularnewline
  ZQINI                 & 59:48   & ---  & ---  & ZQCL 命令需要的周期数 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_135      Offset: 0x870    DDR2 667：0x0002000200020002} \tabularnewline \hline 
  EMRS1\_DATA\_0  &      15:0   & ---  & ---  & 对应片选 0 的模式寄存器 1 配置值 \tabularnewline
  EMRS1\_DATA\_1  &    31:16    & ---  & ---  & 对应片选 1 的模式寄存器 1 配置值 \tabularnewline
  EMRS1\_DATA\_2  &    47:32    & ---  & ---  & 对应片选 2 的模式寄存器 1 配置值 \tabularnewline
  EMRS1\_DATA\_3  &    62:48    & ---  & ---  & 对应片选 3 的模式寄存器 1 配置值 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_136      Offset: 0x880   DDR2 667：0x0000000000000000} \tabularnewline \hline 
  EMRS3\_DATA\_0     &   15:0 & ---  & ---  & 对应片选 0 的模式寄存器 3 配置值 \tabularnewline
  EMRS3\_DATA\_1     & 31:16  & ---  & ---  & 对应片选 1 的模式寄存器 3 配置值 \tabularnewline
  EMRS3\_DATA\_2     & 47:32  & ---  & ---  & 对应片选 2 的模式寄存器 3 配置值 \tabularnewline
  EMRS3\_DATA\_3     & 62:48  & ---  & ---  & 对应片选 3 的模式寄存器 3 配置值 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_137      Offset: 0x890     DDR2 667：0x0a520a520a520a52} \tabularnewline \hline 
  MRS\_DATA\_0 &         15:0 & ---  & ---  & 对应片选 0 的模式寄存器 0 配置值 \tabularnewline
  MRS\_DATA\_1 &       31:16  & ---  & ---  & 对应片选 1 的模式寄存器 0 配置值 \tabularnewline
  MRS\_DATA\_2 &       47:32  & ---  & ---  & 对应片选 2 的模式寄存器 0 配置值 \tabularnewline
  MRS\_DATA\_3 &       62:48  & ---  & ---  & 对应片选 3 的模式寄存器 0 配置值 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_138      Offset: 0x8a0    DDR2 667：0x00000000001c001c} \tabularnewline \hline 
  AXI1\_EN\_SIZE\_LT \_WIDTH\_INSTR &  15:0 & ---  & ---  &   使能内部端口 1 上的各种窄访问，对于龙芯 3 号无效 \tabularnewline
  AXI2\_EN\_SIZE\_LT \_WIDTH\_INSTR & 31:16 & ---  & ---  &   使能内部端口 2 上的各种窄访问，对于龙芯 3 号无效 \tabularnewline
  {\footnotesize LOWPOWER\_EXTERNAL\_CNT}         & 47:32 & ---  & ---  & Counts idle cycles to self-refresh with memory clock gating. \tabularnewline
  {\footnotesize LOWPOWER\_INTERNAL\_CNT}         & 63:48 & ---  & ---  & Counts idle cycles to self-refresh with memory and controller clk gating. \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_139      Offset: 0x8b0   DDR2 667：0x0000000000000000} \tabularnewline \hline 
  LOWPOWER\_SELF\_REFRESH\_CNT & 47:32   & ---  & ---  & 进入内存自刷新前所需周期数 \tabularnewline
  REFRESH\_PER\_RDLVL          & 63:48   & ---  & ---  & 自动 Read Leveling 命令之间的刷新命令数 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_140      Offset: 0x8c0   DDR2 667：0x0004000000000000} \tabularnewline \hline 
  {\footnotesize REFRESH\_PER\_RDLVL\_GATE} & 15:0    & ---  & ---  &    自动采样训练命令之间刷新命令数 \tabularnewline
  TDFI\_RDLVL\_MAX          & 31:16   & ---  & ---  & 与响应之间的最大周期数 \tabularnewline
  TDFI\_WRLVL\_MAX          & 47:32   & ---  & ---  & 在 PHY Eval 模式下，Write Leveling 使能与响应之间的最大周期数在 PHY Eval 模式下，     Read Leveling 使能 \tabularnewline
  WRLVL\_INTERVAL           & 63:48   & ---  & ---  & 自动 Write Leveling 命令之间的刷新命令数 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_141      Offset: 0x8d0      DDR2 667：0x00000000c8000000} \tabularnewline \hline 
  WRLVL\_STATUS        & 17:0  & ---  & ---  & 最近一次 Write Leveling 操作状态             （只读） \tabularnewline
  CKE\_INACTIVE        & 55:24 & ---  & ---  & 从输出 DDR\_RESET 有效到 CKE 有效的时间间隔高位 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_142      Offset: 0x8e0      DDR2 667：0x0000000000000050} \tabularnewline \hline 
  TRST\_PWRON   &      31:0& ---  & ---  & 从 start 有效 500 拍后到 DDR\_RESET有效之间的延迟 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_143      Offset: 0x8f0    DDR2 667：0x0000000000000080} \tabularnewline \hline 
  DLL\_CTRL\_REG\_2[31:0] & 31:0   & ---  & ---  & 输出时钟 DLL 控制 ：输出时钟
                                                    DLL 上 CLK4 与 CLK5 的延迟
                                                    23:16：输出时钟 DLL 上 CLK2
                                                    与 CLK3的延迟 15:8：
                                                    输出时钟 DLL 上 CLK0 与
                                                    CLK1 的延迟 7:0：输出时钟
                                                    DLL 上精度值 \tabularnewline
  DLL\_CTRL\_REG\_2[32]   & 32:32  & ---  & ---  & 输出时钟 DLL 使能信号，高有效 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_144      Offset: 0x900      DDR2 667：0x0000000000000000} \tabularnewline \hline 
  {\footnotesize RDLVL\_ERROR\_STATUS}  & 37:0 & ---  & ---  & Identifies the source of any read leveling errors. \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_145      Offset: 0x910    DDR2 667：0x0000000000000000} \tabularnewline \hline 
  RDLVL\_GATE\_ RESP\_MASK[63:0] & 63:0 & ---  & ---  & 采样训练中读返回屏蔽 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_146      Offset: 0x920      DDR2 667：0x0000000000000000} \tabularnewline \hline 
  RDLVL\_GATE\_ RESP\_MASK[71:64] & 7:0 & ---  & ---  & 采样训练中读返回屏蔽 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_147      Offset: 0x930    DDR2 667：0x0000000000000000} \tabularnewline \hline 
  {\footnotesize RDLVL\_RESP\_MASK[63:0]} & 63:0 & ---  & ---  & Read Leveling 中读返回屏蔽 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_148      Offset: 0x940      DDR2 667：0x0300000000050500} \tabularnewline \hline 
  {\footnotesize RDLVL\_RESP\_MASK[71:64]}
                           &   7:0  & ---  & ---  &  Read Leveling 中读返回屏蔽 \tabularnewline
  CKSRE                    &  11:8  & ---  & ---  & 进入自刷新模式的时钟周期延迟 \tabularnewline
  CKSRX                    & 19:16  & ---  & ---  & 退出自刷新模式的时钟周期延迟 \tabularnewline
  RDLVL\_EDGE              &    24  & ---  & ---  & Read Leveling 操作中，   指明 DQS 上升沿 有效或下降沿有效 \tabularnewline
  LVL\_STATUS              & 34:32  & ---  & ---  & Write Leveling，Read Leveling 与采样训练请求的状态，用于 LVL\_REQ 中断（只读） \tabularnewline
  W2R\_DIFFCS\_DLY         & 42:40  & ---  & ---  & 对不同片选信号，写到读之间的附加延迟 \tabularnewline
  W2R\_SAMECS\_DLY         & 50:48  & ---  & ---  &  对同一个片选信号，写到读之间的附加延迟 \tabularnewline
  TDFI\_RDLVL\_EN          & 59:56  & ---  & ---  & Read Leveling 使能到 Read Leveling 读之间的最小周期数 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_149      Offset: 0x950      DDR2 667：0x0000000000000a03} \tabularnewline \hline 
  TDFI\_WRLVL\_EN  &    3:0  & ---  & ---  & Write Leveling 使能到 Write Leveling 读操作最小周期数 \tabularnewline
  TXPDLL           &   23:8  & ---  & ---  & DRAM TXPDLL parameter in cycles. \tabularnewline
  INT\_MASK        &  41:24  & ---  & ---  & 中断屏蔽 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_150      Offset: 0x960    DDR2 667：0x0504000000000000} \tabularnewline \hline 
  SWLVL\_LOAD    &       32   & ---  & ---  & 软件 Leveling 模式下读操作（只写） \tabularnewline
  SWLVL\_START   &       40   & ---  & ---  & 使能软件 Leveling 模式（只写） \tabularnewline
  WRLAT\_ADJ     &    51:48   & ---  & ---  & PHY 写延迟周期 \tabularnewline
  RDLAT\_ADJ     &    60:56   & ---  & ---  & PHY 读延迟周期 \tabularnewline \hhline
  
  \multicolumn{5}{|l|}{CONF\_CTL\_151      Offset: 0x970 DDR2 667：0x000000000003e805} \tabularnewline \hline 
  DLL\_RST\_ADJ\_DLY & 7:0   & ---  & ---  & 配置 DLL 精度到 DLL 复位结束的最小周期数 \tabularnewline
  DLL\_RST\_DELAY    &  23:8 & ---  & ---  & DLL 复位最小周期数 \tabularnewline
  INT\_ACK           & 40:24 & ---  & ---  & 中断清除 （只写） \tabularnewline
\end{longtable}

定义 CS3 有读、写命令时，将指定的 CS 的 ODT 终端电阻有效，
具体的配置应当参考 相应的内存颗粒手册对于 ODT 配置的要
求。该参数的四位分别对应于 CS0- CS3

数据组DLL 控制信号
24： 控制内部 DLL 的使能信号，为 0 时 DLL 有效
23:16： 控制写数据（DQ）与 DQS 之间的相位关系，每个数值表示为 (1/精度) *
360。在龙芯 3 号中，这个值一般为 1/4， 即 8’h20
15:8：在 rdlvl\_en 无效的情况下，控制读
数据返回时 DQS 的相位延迟
7:0： 控制内部 DLL 的精度，在龙芯 3 号
中，这个值一般为 8’h80


第 1 数据组 DLL 控制信号
15:8：读数据返回时，      DQSn 的相位延迟。
在龙芯 3 号中，这个值一般为 8’h0E
5:0： DLL 测试控制信号，正常情况下为
8’h0

第 0 数据组时延控制.
28： 是否对读 DQS 使用去毛刺电路，指
gate 信号是否通过 PAD\_feedback 延迟
27： 使用读 FIFO 有效信号自动控制读数
据返回采样（1）   ，还是使用 26:24 中的固
定时间采样（0）
26:24： 读数据返回采样完成时机，从内
部时钟域采样的延迟。
21： 在 Read Leveling 模式下，采样数
据总线的电平高低
20： 数据有效控制信号的电平，龙芯 3
号中为 0
19： 是否将写数据延迟再增加一周期
18： 读 DQS 采样是否提前 1/4 周期（与
clk\_wr 同步）
17： 写数据/DQS 延迟是否增加半周期延
迟
16： CAS 延迟是否为半周期
15:12：写 DQS 有效的起始时间，对于
DDR3 应该比 DDR2 提前一个周期打开，
提供颗粒要求的 Preamble DQS
11:8： 写 DQS 有效的结束时间
6:4：写数据有效的起始时间
2:0： 写数据有效的结束时间


第 1 数据组中 PAD 的终端电阻控制，发
起读操作时，才会启用
31:28：终端电阻关闭时机控制，每个值
表示半周期
27:24：终端电阻开启时机控制，从发送
读命令后 4 拍开始计算
23：终端电阻的有效电平控制，对于龙芯
3 号应为 1
22：终端电阻的使能信号，为 1 时，使用
动态方式控制终端电阻的使能；为 0 时，
可以通过第 23 位 PAD 上的终端电阻永远
有效（置 0）或永远无效（置 1）
21：测试用信号，正常应为 0
20:16：测试用信号，正常应为 0
14:12：测试用信号，正常应为 0
11:8：读采样延时 1，其中只能 1 位有效，
用于控制读 DQS 采样窗口关闭时机
7:0：读采样延时 0，其中只能 1 位有效，
用于控制读 DQS 采样窗口打开时机


REG45
PAD\_CTRL\_REG\_0     25:0  0x0000 0x0- 0x3ffffff  引脚控制信号
                              25:22：对应 COMPZCP\_dig
                              21:18：对应 COMPZCN\_dig
                              17：对应引脚的 TQ1v8
                              16：对应内部反馈引脚的使能信号，低有效
                              15：对应内部反馈引脚的输出使能信号，低有效
                              14：对应数据选通引脚的输出使能信号，低有效
                              13：对应数据屏蔽引脚的输出使能信号，低有效
                              12：对应数据引脚的输出使能信号，低有效
                              11：对应引脚的 USEPAD
                                          0：使用内部参考电压；
                                          1：使用外部参考电压。
                              8： 对应时钟引脚{1,3,5}的使能信号，高有效
                              7： 对应时钟引脚{0,2,4}的使能信号，高有效
                              6：对应地址引脚的使能信号，低有效
                              5：对应引脚的 PROGB1v8
                              4：对应引脚的 PROGA1v8 用于控制引脚驱动能力
                              3：对应引脚的 ODTB
                              2：对应引脚的 ODTA
                                  用于控制引脚 ODT 阻值大小
                                   ODTA    ODTB  DDRII     DDRIII
                                   1       0     150       120
                                   1       1     75        60
                                   0       0     Disable   Disable
                              1：对应引脚的 MODEZI1v8
                                  对于龙芯 3 号应该设为 0。
                              0：对应引脚的 DDR1v8
                                  0：对应 DDRII 的 1.8v 模式
                                  1：对应 DDRIII 的 1.5v 模式

REG54
PHY\_CTRL\_REG\_2   63:32  0x0000 0x0-0xffffff 读写数据延迟控制
                                               27：选择读数据缓冲类型，默认为 0
                                               26：用于清除读返回缓冲区的数据，正常为0
                                               25：高速引脚使能，为 1 时，所有信号通
                                               过引脚向外传输的延迟减小 1 周期
                                               16:13：设置读数据有效时机，从 FIFO 中
                                               收集数据返回控制器的延迟。如果从引脚
                                               到 FIFO 的延迟增加，这个值也必须增加
                                               8：设置 DQS 信号输出是否为 DDR3 模式，
                                               DDR3 模式下， DQS 的 Preamble 将含写有一个脉冲
                                               5：测试模式信号，正常为 0
                                               4：测试模式信号，正常为 0
