4. CACHE 的组织和操作

龙芯 3 号使用了三种独立的 Cache：

     一级指令 Cache：共 64KB，Cache 行大小 32 字节，采用四路组相联的结构。
     一级数据 Cache：共 64KB，Cache 行大小 32 字节，采用四路组相联的结构，采用写回策略。
     二级混合 Cache：片上 Cache，通过 128 位 AXI 总线和处理器核通讯，共有 4 个二级 Cache 模块。
每个二级 Cache 模块全局编址，Cache 行大小 32 字节，1M 容量，采用四路组相联的结构，采用写回
策略。


4.1. Cache 概述
     定点访问一次一级 Cache 需要 3 个时钟周期，浮点访问一次一级 Cache 需要 4 个时钟周期。每个
一级 Cache 都有它们自己的数据通路，从而可以同时访问两个 Cache。一级 Cache 的读、写和重填通
路都是 128 位。
     二级 Cache 使用的是 256 位的数据通路，它只有在一级 Cache 失效时才被访问。二级 Cache 和一
级 Cache 不能同时访问，当一级 Cache 失效时，访问二级 Cache 会增加至少 14 个周期的失效代价（在
龙芯 3 号中处理器核和二级 Cache 需要通过交叉开关通讯，因此还需要额外的 6 拍）。二级 Cache 以
每个时钟周期 128 位数据的速度对一级 Cache 进行回填。
     一级 Cache 采用虚地址索引和物理地址标志，而二级 Cache 的索引和标志采用的都是物理地址。
虚地址索引可能会引起不一致问题，目前龙芯 2F 使用操作系统来解决，将来可以通过硬件方式来解
决。
     龙芯 3 号采用了基于目录的 Cache 一致性协议来保证每个处理器核和 IO 的写能被其它处理器核
及 IO 正确观察到。在二级 Cache 中维护了一个目录。对每个二级 Cache 中的 Cache 行，目录用 32 位
的位向量记录每个一级 Cache（包括指令和数据 Cache）是否拥有该 Cache 行的备份。因此龙芯 3 号
利用硬件维护了一级指令 Cache、一级数据 Cache、二级 Cache 以及 HT 外部设备之间的一致性，软
件不需要通过 Cache 指令刷 Cache 来维护一致性。


4.1.1.    非阻塞 Cache
     龙芯 3 号实现了非阻塞 Cache 技术。非阻塞 Cache 是通过允许 Cache 失效访存操作后面的多个
Cache 失效或命中的访存操作继续进行，来提高系统的整体性能。
     在一个阻塞 Cache 的设计中，当发生某个 Cache 失效时，处理器将暂停后续的访存操作。此时，
处理器开始一个存储周期，取出被请求的数据，将其填入 Cache 中，然后再恢复执行。这个操作过程
会占用较多的时钟周期，具体多少取决于存储器系统的设计。
     然而在非阻塞 Cache 设计中，Cache 并不会在某个失效上暂停。龙芯 3 号支持多重失效下的命中，
它最多可以支持 24 次 Cache 失效。
     当一级 Cache 失效时，处理器会检查二级 Cache，看所需数据是否在其中，若二级 Cache 仍然失

56
                                                        龙芯 3B 处理器用户手册


效，则需要访问主存储器。
     龙芯 3 号中的非阻塞 Cache 结构能更有效的使用循环展开和软件流水。为了尽可能最大限度地发
挥 Cache 的优势，在使用访存数据的指令之前，尽可能早的执行相应的 Load 操作。
     针对那些需要顺序存取的 I/O 系统，龙芯 3 号的默认设置是采用阻塞式的 Uncached 访问方式。
     龙芯 3 号提供了预取指令，可以通过 load 到 0 号定点寄存器的方式来将数据预取到一级数据
Cache。此外龙芯 3 号中的 DSP 引擎可以将内存或 IO 中的数据预取到二级 Cache 中。


4.1.2.         替换策略
     一级 Cache 和二级 Cache 均采用随机替换算法。但二级 Cache 提供了锁机制。通过配置锁窗口寄
存器，可以确保最多 4 个被锁住的区域不被替换出二级 Cache（具体配置方法见第 12 章）。


4.1.3.         Cache 的参数
     表 4-1 给出了三个 Cache 的一些参数

                                   表 4-1 Cache 参数
     参数               指令 Cache           数据 Cache       二级 Cache

     Cache 大小         64KB               32KB           1MB（共 4MB）

     相联度              4 路组相联             2 路组相联         4 路组相联

     替换策略             随机法                随机法            随机法（可锁定）

     块大小(line size)   32 字节              32 字节          32 字节

     索引(Index)        虚地址 13:5 位         虚地址 13:5 位     物理地址 16:5 位1

     标志(Tag)          物理地址 47:12 位       物理地址 47:12 位   物理地址 47:12 位

     写策略              不可写                写回法            写回法

     读策略              非阻塞（2 个同时）         非阻塞(24 个同时)    非阻塞（8 个同时）

     读顺序              关键字优先              关键字优先          关键字优先

     写顺序              不可写                顺序式

     校验手段             奇偶校验               ECC 校验         ECC 校验


4.2. 一级指令 Cache
     一级指令 Cache 大小是 64KB，采用的是四路组相联结构。Cache 块大小（通常也被称作 Cache
行）为 32 字节，可以存放 8 条指令。由于龙芯 3 号采用 128 位的读通路，所以每个时钟周期可以取
四条指令送到超标量调度单元。
     一级指令 Cache 实现了奇偶校验。当读一级指令 Cache 发生了奇偶校验错时，硬件会自动将相应

的 Cache 行会被置成无效，并从二级 Cache 中获取正确的值。整个过程无需软件干预。




1
    一个物理地址具体落在 4 个二级 Cache 模块中哪一个根据交叉开关的路由配置寄存器决定。

57
                                                    龙芯 3B 处理器用户手册


4.2.1.    指令 Cache 的组织
     图 4-1 给出了一级指令 Cache 的组织结构。该 Cache 采用四路组相联的映射方式，其中每组包括
512 个索引项。根据索引(Index)选择相应的标志(Tag)和数据(Data)。从 Cache 读出 Tag 后，它被用来
和虚地址中的被转换的部分进行比较，从而确定包含正确数据的组。
     当一级指令 Cache 被索引时，四个组都会返回它们相应的 Cache 行，Cache 行大小为 32 字节，
Cache 行采用了 34 位作为标志和 1 位作为有效位。




                            图 4-1 指令 Cache 的组织


4.2.2.    指令 Cache 的访问
     龙芯 3 号指令 Cache 采用虚地址索引和物理地址标志的四路组相联结构。如图 4-2 所示，地址的
低 14 位被用作指令 Cache 的索引。其中 13:5 位用于索引 512 个项。其中每个项中又包含四个 64 位
的双字，使用 4:3 位在这四个双字中进行选择。
     当对 Cache 索引时，从 Cache 中取出四个块中的 Data 和相应的物理地址 Tag，同时，高位地址通
过指令 TLB(Instruction Translation Look-aside Buffer，简称 ITLB)进行转换，将转换后的地址与取出的
四个组中的 Tags 进行比较，若存在一个 Tag 与其匹配，则使用该组中的数据。这就被称为一次“一
级 Cache 命中(Hit)”。若四组的 Tag 都不与其匹配，那么中止操作，并开始访问二级 Cache。这就被
称为“一级 Cache 失效(miss)”。




                              图 4-2 指令 Cache 访问



58
                                              龙芯 3B 处理器用户手册


4.3. 一级数据 Cache
     数据 Cache 的容量为 32KB，采用四路组相联的结构。Cache 块大小为 32 字节，即可以存放 8 个
字。数据 Cache 的读写数据通路都是 128 位。
     数据 Cache 使用的是虚地址索引，物理地址标志。操作系统可以解决可能由虚地址引起的页着色
一致性问题。数据 Cache 是非阻塞的，也就意味着，数据 Cache 中的一次失效不会引起流水线的停顿。
     数据 Cache 采用的写策略是写回法，即写数据到一级 Cache 的操作不会引起二级 Cache 和主存的
更新。写回策略减少了一级 Cache 到二级 Cache 的通信量，从而提高了全局性能。只有在数据 Cache
行被替换出去时，数据才会被写到二级 Cache 中。
     一级数据 Cache 实现了 ECC 校验。当读一级数据 Cache 发生了一位 ECC 校验错时，硬件会自动
校正 Cache 读出的结果并将 Cache 中的内容更新为校正后的值。整个过程无需软件干预。当读一级数
据 Cache 发生了二位 ECC 校验错时，将会发生例外留待软件处理。


4.3.1.    数据 Cache 的组织
     图 4-3 给出了数据 Cache 的组织结构。这是一个二路组相联的 Cache，其中含有 512 个索引项。
当对 Cache 索引时，同时访问两个组中的 Tag 和 Data。然后将两个组中的 Tag 与转换后的物理地址
部分进行比较，从而确定命中哪一个数据行。
     当索引数据 Cache 时，两个组中都会返回它们各自相应的 Cache 行。Cache 块大小为 32 字节，
Cache 行使用了 34 位作为物理标志地址，1 位作为脏位和 2 位作为状态位（包括 INV，SHD 和 EXC
三种状态）。INV 状态表示该 Cache 行无效，SHD 状态表示该 Cache 行可读，EXC 状态表示该 Cache
行可读可写。




                       图 4-3 数据 Cache 的组织结构


4.3.2.    数据 Cache 的访问
     龙芯 3 号数据 Cache 采用虚地址索引和物理地址标志的二路组相联结构。图 4-4 给出了访问一次
数据 Cache 时，虚地址如何被分解。




59
                                              龙芯 3B 处理器用户手册




                          图 4-4 数据 Cache 访问

     如图 4-4 所示，地址的低 14 位用作对数据 Cache 的索引。其中 13:5 位用作索引 512 个项，其中
每个项又包括 4 个 64 位的双字。使用 4:3 位对四个双字进行选择，2:0 位用作选择一个双字的八个字
节中的某一个字节。
     数据 Cache 访问失效的指令（访存指令不命中或写指令命中 SHD 状态的 Cache 行），则访问二级
Cache。如果二级 Cache 命中，则将从二级 Cache 取回的 Cache 块送回一级 Cache。如果二级 Cache
失效，则访问内存，用从内存取回的值填充二级 Cache 和数据 Cache。


4.4. 二级 Cache
     龙芯 3B 号中包括了 8 个片上二级 Cache 模块。每个二级 Cache 模块的容量为 512KB，共 4MB。
每个 Cache 行大小为 32 字节。二级 Cache 模块的主要特征包括：采用 128 位 AXI 接口，四路组相连，
8 项 Cache 访问队列，关键字优先，接收读失效请求到返回数据最快 8 拍，通过目录支持 Cache 一致
性协议，可用于片上多核结构（也可直接和单处理器 IP 对接），软 IP 级可配置二级 Cache 模块的大
小（512KB/1MB），采用四路组相联结构，运行时可动态关闭，支持 ECC 校验，支持 DMA 一致性
读写和预取读，支持 16 种二级 Cache 散列方式，支持按窗口锁二级 Cache，保证读数据返回原子性。
     二级 Cache 还维护了每个 Cache 行的目录，以记录每个一级 Cache 中是否包含该 Cache 行的备份。
二级 Cache 采用的写策略是写回法。写回策略减少了总线的通信量，从而提高了系统的全局性能。只
有在二级 Cache 行被替换出去时，数据才会被写到内存中。
     二级 Cache 实现了 ECC 校验。当读二级 Cache 发生了一位 ECC 校验错时，硬件会自动校正 Cache
读出的结果并将 Cache 中的内容更新为校正后的值。整个过程无需软件干预。当读二级数据 Cache 发
生了二位 ECC 校验错时，将会发生例外留待软件处理。


4.4.1.    二级 Cache 的组织
     二级 Cache 是混合 Cache，其中既包括指令也包括数据。二级 Cache 模块支持 Cache 一致性协议。
龙芯 3 号中所有片上二级 Cache 统一编址，每个二级 Cache 块都有固定的 home 结点。根据 Cache 一
致性的要求，龙芯 3 号的二级 Cache 具有两方面的角色：对一级 Cache 来说是 home，对于内存来说
是 Cache。当访问二级 Cache 时，同时访问四组的 Data 和 Tag，将取出的四个 Tag 分别和访问的物理

60
                                                       龙芯 3B 处理器用户手册


地址高位部分进行比较，来确定数据是否还驻留在 Cache 中。
     每个 Cache 行包含一个 32 字节的数据，31 位的物理地址标志，1 位 Cache 状态位（表示相应的
Cache 行在二级 Cache 中是否有效），1 位目录状态位（表示相应的 Cache 块是否在某个一级 Cache
中处于独占或共享状态）和 1 位 W 位（表示该行是否被写过）。


4.4.2.    二级 Cache 的访问
     只有在一级 Cache 失效的情况下，才访问二级 Cache。二级 Cache 采用的是物理地址索引物理地
址标志。如图 4-5 所示，低位地址用来索引二级 Cache。四个组中都会返回它们各自相应的 Cache 行。
16:5 位被用作二级 Cache 的索引。每个被索引项都含有 4 个 64 位的双字数据。使用 4:3 位在 4 个双
字中进行选择。2:0 位用于选择一个双字中的某 8 个字节。




                              图 4-5 二级 Cache 访问




4.5. Cache 算法和 Cache 一致性属性
     龙芯 3 号实现表 4-2 所示的 Cache 算法和 Cache 一致性属性。

                         表 4-2 龙芯 3 号 Cache 的一致性属性
                            属性分类                     一致性代码

               保留                                      0

               保留                                      1

               非高速缓存（Uncached）                         2

               一致性高速缓存（Cacheable coherent）             3

               保留                                      4

               保留                                      5

               保留                                      6

               非高速缓存加速（Uncached Accelerated）           7




61
                                               龙芯 3B 处理器用户手册


4.5.1.     非高速缓存(Uncached，一致性代码 2)
     如果某个页采用非高速缓存算法时，那么对于在该页中任何位置的 Load 或 Store 操作，处理器都
直接发射一个双字，部分双字，字，部分字的读或写请求给主存，而不通过任何一级 Cache。非高速
缓存算法采用阻塞的方式实现。


4.5.2.     一致性高速缓存(Cacheable coherent，一致性代码 3)
     一个具有该属性的行可以驻留在 Cache 中，相应的存数和取数操作都只访问一级 Cache。当一级
Cache 失效时，处理器会检查二级 Cache，看是否有包含所请求的地址。如果二级 Cache 命中，则从
二级 Cache 中填充数据。如果二级 Cache 不命中，则从主存中取出数据，并将其写入二级 Cache 和一
级 Cache。
     由于龙芯 3 号中存在多个处理器核及 IO 设备可以访问主存，因此龙芯 3 号硬件实现了 Cache 一

致性协议，无需通过软件采用 Cache 指令来主动维护 Cache 的一致性。


4.5.3.     非高速缓存加速 (Uncached Accelerated，一致性代码 7)
     非高速缓存加速属性 用于优化在一 个连续的地址 空间中完成的一系列 顺序的同一类 型的
Uncached 存数操作。该优化方法是通过设置缓冲区来收集这种属性的存数操作。只要缓冲区不满，
就可以把这些存数操作的数据存入缓冲区中。缓冲区和一个 Cache 行一样大小。把数据存储到缓冲区
中就和存储到 Cache 中一样。当缓冲区满的时候，开始进行块写。在顺序存数指令的收集过程中，若
有其他类型 Uncached 存数指令插入，则收集工作中止，缓冲区中保存的数据按字节写方式输出。
     非高速缓存加速属性可以加速顺序的 Uncached 访问，它适用于对显示设备存储的快速输出访问。


4.6. Cache 一致性
     龙芯 3 号实现了基于目录的 Cache 一致性，硬件保证了一级指令 Cache、一级数据 Cache、二级
Cache、内存以及来自 HT 的 IO 设备之间数据的一致性，无需软件利用 Cache 指令来强制刷 Cache。
     龙芯 3 号中每个 Cache 行都有一个固定的宿主二级 Cache 模块。Cache 行的目录信息就在宿主二
级 Cache 模块中维护。目录利用 32 位的位向量来记录拥有每个 Cache 行备份的一级 Cache（包括一
级指令 Cache 和一级数据 Cache）。每个一级 Cache 块有三种可能状态：INV（无效状态）、SHD（共
享状态，可读）和 EXC（独占状态，可读可写）。三个状态的转移情况如图 4-6。当读指令或者取指
发生一级 Cache 失效时，处理器核向二级 Cache 模块发出 Reqread 请求，在得到二级 Cache 模块送回
的 Repread 应答后，处理器核的一级 Cache 获得了一个 SHD 状态的 Cache 备份；当写指令发生一级
Cache 失效时，处理器核向二级 Cache 模块发出 Reqwrite 请求，在得到二级 Cache 模块送回的 Repwrite
应答后，处理器核的一级 Cache 获得了一个 EXC 状态的 Cache 备份；当处理器核发生一级 Cache 替
换时，通过 Reqreplace 写回二级 Cache 模块，二级 Cache 模块通过 Repreplace 应答告知处理器核替换
请求已被处理。二级 Cache 模块可以通过发送 Reqinv 请求至处理器核来无效一个 SHD 状态的一级
Cache 备份，处理器核将该一级 Cache 备份变为 INV 状态并通过 Repinv 应答二级 Cache 模块；二级
Cache 模块可以通过发送 Reqwtbk 请求至处理器核来写回一个 EXC 状态的一级 Cache 备份，处理器

62
                                                                     龙芯 3B 处理器用户手册


核将该一级 Cache 备份变为 SHD 状态并通过 Repwtbk 应答二级 Cache 模块；二级 Cache 模块可以通
过发送 Reqinvwtbk 请求至处理器核来写回并无效一个 EXC 状态的一级 Cache 备份，处理器核将该一
级 Cache 备份变为 INV 状态并通过 Repinvwtbk 应答二级 Cache 模块。



                                           INV

                         Reqinv                         Reqinvwtbk
                         Reqreplace                     Reqreplace


                                      Reqread    Reqwrite




                         SHD                                  EXC
                                         Req-wtbk




                                  图 4-6 龙芯 3 号 cache 状态转换


4.7. Cache 指令
     GS464V 支持了 17 种 cache 指令，分别针对一级数据 cache、一级指令 cache 和二级 cache。Cache
指令的格式为：CACHE fmt, offset(base)。

     具体指令列表如下：

                               表 4-3 GS464V 的 Cache 的一致性属性
              FMT 域                     Cache 指令涵义                    目标 cache

             5’b00000     根据索引对 cache 块进行无效                          一级指令 cache

             5’b 01000    根据索引存 cache 块的 tag                         一级指令 cache

             5’b 11100    根据索引存 cache 块的 data                        一级指令 cache

             5’b 00001    根据索引对 cache 块进行无效并写回                       一级数据 cache

             5’b 00101    根据索引取 cache 块的 tag                         一级数据 cache

             5’b 01001    根据索引存 cache 块的 tag                         一级数据 cache

             5’b 10001    根据命中来对 cache 块进行无效                         一级数据 cache

             5’b 10101    根据命中来对 cache 块进行无效并写回                      一级数据 cache

             5’b 11001    根据索引取 cache 块的 data                        一级数据 cache

             5’b 11101    根据索引存 cache 块的 data                        一级数据 cache

             5’b 00011    根据索引对 cache 块进行无效并写回                        二级 cache

             5’b 00111    根据索引取 cache 块的 tag                          二级 cache

             5’b 01011    根据索引存 cache 块的 tag                          二级 cache

             5’b 10011    根据命中来对 cache 块进行无效                          二级 cache



63
                                                           龙芯 3B 处理器用户手册


            5’b 10111   根据命中来对 cache 块进行无效并写回              二级 cache

            5’b 11011   根据索引取 cache 块的 data                二级 cache

            5’b 11111   根据索引存 cache 块的 data                二级 cache


4.7.1.    Cache0 指令
     Cache0 指令的作用是根据索引来无效一级指令 cache 块。具体来说，就是把 cache index 等于
address[13:5]，cache way 等于 address[2:0]的一级指令 cache 块无效掉。


4.7.2.    Cache8 指令
     Cache8 指令的作用是根据索引来存一级指令 cache 块的 tag。具体来说，就是把 CP0 的 TAGHi
和 TAGLo 寄存器中的值存到 cache index 等于 address[13:5]，cache way 等于 address[2:0]的一级指令
cache 块的 tag 中。具体 TAGHi 和 TAGLo 的内容格式见第 3 章。


4.7.3.    Cache28 指令
     Cache28 指令的作用是根据索引来存一级指令 cache 块的 data。具体来说，就是把 CP0 的 DATAHi
和 DATALo 寄存器中的值存到 cache index 等于 address[13:5]，cache way 等于 address[2:0]的一级指令
cache 块的 data 的第 address[4:3]个 64 位中。具体 DATAHi 和 DATALo 的内容格式见第 3 章。


4.7.4.    Cache1 指令
     Cache1 指令的作用是根据索引来无效一级数据 cache 块。具体来说，就是把 cache index 等于
address[13:5]，cache way 等于 address[2:0]的一级数据 cache 块无效掉，里面的内容丢弃掉。


4.7.5.    Cache5 指令
     Cache5 指令的作用是根据索引来取一级数据 cache 块的 tag。具体来说，就是把 cache index 等于
address[13:5]，cache way 等于 address[2:0]的一级数据 cache 块的 tag 的内容取到 CP0 的 TAGHi 和
TAGLo 寄存器中。具体 TAGHi 和 TAGLo 的内容格式见第 3 章。


4.7.6.    Cache9 指令
     Cache9 指令的作用是根据索引来存一级数据 cache 块的 tag。具体来说，就是把 CP0 的 TAGHi
和 TAGLo 寄存器中的值存到 cache index 等于 address[13:5]，cache way 等于 address[2:0]的一级数据
cache 块的 tag 中。具体 TAGHi 和 TAGLo 的内容格式见第 3 章。


4.7.7.    Cache17 指令
     Cache17 指令的作用是根据地址命中来无效一级数据 cache 块。具体来说，如果 cache 指令针对
的地址在一级数据 cache 中命中，则对应的一级数据 cache 块被无效掉，里面的内容丢弃掉；如果 cache
指令针对的地址在一级数据 cache 中不命中，不做任何操作。




64
                                                            龙芯 3B 处理器用户手册


4.7.8.     Cache21 指令
     Cache21 指令的作用是根据地址命中来无效并写回一级数据 cache 块。具体来说，如果 cache 指
令针对的地址在一级数据 cache 中命中，则对应的一级数据 cache 块被无效掉，同时如果该 cache 块
为脏，里面的内容会送回二级 cache 或者内存（如果没有二级 cache）；如果 cache 指令针对的地址在
一级数据 cache 中不命中，不做任何操作。


4.7.9.     Cache25 指令
     Cache25 指令的作用是根据索引来取一级数据 cache 块的 data。具体来说，就是把 cache index 等
于 address[13:5]，cache way 等于 address[2:0]的一级数据 cache 块的 data 的第 address[4:3]个 64 位取到
CP0 的 DATAHi 和 DATALo 寄存器中。具体 DATAHi 和 DATALo 的内容格式见第 3 章。


4.7.10.    Cache29 指令
     Cache29 指令的作用是根据索引来存一级数据 cache 块的 data。具体来说，就是把 CP0 的 DATAHi
和 DATALo 寄存器中的值存到 cache index 等于 address[13:5]，cache way 等于 address[2:0]的一级数据
cache 块的 data 的第 address[4:3]个 64 位中。具体 DATAHi 和 DATALo 的内容格式见第 3 章。


4.7.11.    Cache3 指令
     Cache3 指令的作用是根据索引来无效二级 cache 块。具体来说，就是把 cache index 等于
address[13:5]，cache way 等于 address[2:0]的二级数据 cache 块无效掉，里面的内容丢弃掉。


4.7.12.    Cache7 指令
     Cache7 指令的作用是根据索引来取二级 cache 块的 tag。具体来说，就是把 cache index 等于
address[13:5]，cache way 等于 address[2:0]的二级数据 cache 块的 tag 的内容取到 CP0 的 TAGHi 和
TAGLo 寄存器中。具体 TAGHi 和 TAGLo 的内容格式见第 3 章。


4.7.13.    Cache11 指令
     Cache11 指令的作用是根据索引来存二级 cache 块的 tag。具体来说，就是把 CP0 的 TAGHi 和
TAGLo 寄存器中的值存到 cache index 等于 address[13:5]，cache way 等于 address[2:0]的二级 cache 块
的 tag 中。具体 TAGHi 和 TAGLo 的内容格式见第 3 章。


4.7.14.    Cache19 指令
     Cache19 指令的作用是根据地址命中来无效二级 cache 块。具体来说，如果 cache 指令针对的地
址在二级数据 cache 中命中，则对应的二级数据 cache 块被无效掉，里面的内容丢弃掉；如果 cache

指令针对的地址在二级 cache 中不命中，不做任何操作。


4.7.15.    Cache23 指令
     Cache23 指令的作用是根据地址命中来无效并写回二级 cache 块。具体来说，如果 cache 指令针
对的地址在二级 cache 中命中，则对应的二级 cache 块被无效掉，同时如果该 cache 块为脏，里面的

65
                                                        龙芯 3B 处理器用户手册


内容会送回二级 cache 或者内存（如果没有二级 cache）；如果 cache 指令针对的地址在二级 cache 中
不命中，不做任何操作。


4.7.16.   Cache27 指令
     Cache27 指令的作用是根据索引来取二级 cache 块的 data。具体来说，就是把 cache index 等于
address[13:5]，cache way 等于 address[2:0]的二级 cache 块的 data 的第 address[4:3]个 64 位的
内容取到 CP0 的 DATAHi 和 DATALo 寄存器中。具体 DATAHi 和 DATALo 的内容格式见第 3 章。


4.7.17.   Cache31 指令
     Cache31 指令的作用是根据索引来存二级 cache 块的 data。具体来说，就是把 CP0 的 DATAHi 和
DATALo 寄存器中的值存到 cache index 等于 address[13:5]，cache way 等于 address[2:0]的二级
cache 块的 data 的第 address[4:3]个 64 位中。具体 DATAHi 和 DATALo 的内容格式见第 3 章。

