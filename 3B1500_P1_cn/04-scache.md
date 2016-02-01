片上共享高速缓存
================

片上共享高速缓存（即，SCache）是与 GS464V 处理器 IP 配套设计的模块。该模块
既可以和 GS464V 对接，使 GS464V 成为包括SCache 在内的处理器 IP；也可以通过
AXI 网络连接多个 GS464V 以及多个SCache 模块， 形成片内多处理器的 CMP 结构。
龙芯系列 SCache 模块的主要特征包括：

  - 通过目录支持 Cache 一致性协议；
  - 采用四路组相联结构；
  - 运行时可动态关闭；
  - 支持 ECC 校验；
  - 支持 DMA 一致性读写和预取读；
  - 支持 16 种SCache 散列方式；
  - 支持按窗口锁SCache；
  - 保证读数据返回原子性。

\noindent 为降低功耗，SCache 的 TAG、目录和数据可以分开访问，SCache 状态位、w 位
与 TAG 一起存储， TAG 存放在 TAG RAM 中，目录存放在 DIR RAM 中，数 据存放在
DATA RAM 中。失效请求访问SCache，同时读出所有路的 TAG、 目录和数据，并根据
TAG 来选出数据和目录。替换请求、重填请求和写回请求 只操作一路的 TAG、目录和数据
。

### SCache 锁机制

为提高一些特定计算任务的性能，SCache 增加了锁机制。落在被锁区域 中的
SCache 块被锁住， 因而不会被替换出SCache （除非四路 SCache 中都是被锁住
的块）。通过 Confbus 可以对 SCache 模块内部的四组锁窗口寄存器进行动态配置，
但必须保证四路 SCache 中一定有一路被锁住。每组窗口 的大小可以根据 Mask 进行
调整，但不能超过整个SCache 大小的 3/4。此外 当SCache 收到 DMA 写请求时
， 如果被写的区域在 SCache 中命中且被锁住，那么 DMA 写将直接写入到
SCache 而不是内存。

\begin{table}[htpb]
  \centering
  \caption{SCache 锁窗口寄存器配置}
  \begin{tabular}{|l|c|l|l|} \hline
    名称          & 地址         & 位域    & 描述             \\ \hhline
    SLock0\_Valid & 0x3FF0\_0200 & [63:63] & 0 号锁窗口有效位 \\ 
    SLock0\_Addr  & 0x3FF0\_0200 & [47:0]  & 0 号锁窗口锁地址 \\ 
    SLock0\_Mask  & 0x3FF0\_0240 & [47:0]  & 0 号锁窗口掩码   \\ \hline
    SLock1\_Valid & 0x3FF0\_0208 & [63:63] & 1 号锁窗口有效位 \\ 
    SLock1\_Addr  & 0x3FF0\_0208 & [47:0]  & 1 号锁窗口锁地址 \\ 
    SLock1\_Mask  & 0x3FF0\_0248 & [47:0]  & 1 号锁窗口掩码   \\ \hline
    SLock2\_Valid & 0x3FF0\_0210 & [63:63] & 2 号锁窗口有效位 \\ 
    SLock2\_Addr  & 0x3FF0\_0210 & [47:0]  & 2 号锁窗口锁地址 \\ 
    SLock2\_Mask  & 0x3FF0\_0250 & [47:0]  & 2 号锁窗口掩码   \\ \hline
    SLock3\_Valid & 0x3FF0\_0218 & [63:63] & 3 号锁窗口有效位 \\ 
    SLock3\_Addr  & 0x3FF0\_0218 & [47:0]  & 3 号锁窗口锁地址 \\ 
    SLock3\_Mask  & 0x3FF0\_0258 & [47:0]  & 3 号锁窗口掩码   \\ \hline
  \end{tabular}
  \label{tab:l2cachewinconfig}
\end{table}

举例说明。给定一个地址 Addr，在 SLock0\_Valid 使能的情形下，如果如下条件满足：

        (Addr & SLock0_Mask) == (SLock0_Addr & SLock0_Mask)

\noindent 那么这个地址就被锁窗口 0 锁住了。

