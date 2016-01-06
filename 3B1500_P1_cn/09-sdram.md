DDR2/3 SDRAM 控制器配置
=======================

龙芯 3B1500 处理器内部集成的内存控制器的设计遵守 DDR2/3 SDRAM 的行业标准
（JESD79）。


DDR2/3 SDRAM 参数配置格式
-------------------------

参数列表及说明如下表：

\newcommand{\twocol}[1]{\multicolumn{2}{c|}{#1}}
\newcommand{\thrcol}[1]{\multicolumn{3}{c|}{#1}}
\newcommand{\forcol}[1]{\multicolumn{4}{c|}{#1}}

\setlength{\tabcolsep}{2pt}
\setlength\LTleft{-.5in}
\setlength\LTright{-.5in}
\begin{longtable}{@{\extracolsep}|>{\tt\scriptsize}c|*{8}{>{\tt\scriptsize}m{2cm}|}}
  \caption{DDR2/3 参数列表} \tabularnewline \hline
  & 63:56 & 55:48 & 47:40 & 39:32 & 31:24 & 23:16 & 15:8 & 7:0
  \tabularnewline\hhline \endfirsthead
  \caption{DDR2/3 参数列表（续）} \tabularnewline \hline
  & 63:56 & 55:48 & 47:40 & 39:32 & 31:24 & 23:16 & 15:8 & 7:0
  \tabularnewline\hhline \endhead
  \hline \multicolumn{9}{r}{\tiny 未完待续} \endfoot \endlastfoot
  0x000 & \twocol{Dll\_value\_0(R)} & \twocol{Dll\_value\_ck(R)} & \twocol{Dll\_init\_done(R)} & \twocol{Version(R)}       \\
  0x008 & \twocol{Dll\_value\_4(R)} & \twocol{Dll\_value\_3(R)}  & \twocol{Dll\_value\_2(R)}   & \twocol{Dll\_value\_1(R)} \\
  0x010 & \twocol{Dll\_value\_8(R)} & \twocol{Dll\_value\_7(R)}  & \twocol{Dll\_value\_6(R)}   & \twocol{Dll\_value\_5(R)} \\

  0x018 & Dll\_ck\_3          & Dll\_ck\_2       & Dll\_ck\_1          & Dll\_ck\_0         & Dll\_increment      & Dll\_start\_point   & Dll\_bypass          & Init\_start         \\
  0x020 & Dq\_oe\_end\_0      & Dq\_oe\_begin\_0 & Dq\_stop\_edge\_0   & Dq\_start\_edge\_0 & Rddata\_delay\_0    & Rddqs\_lt\_half\_0  & Wrdqs\_lt\_half\_0   & Wrdq\_lt\_half\_0   \\
  0x028 & Rd\_oe\_end\_0      & Rd\_oe\_begin\_0 & Rd\_stop\_edge\_0   & Rd\_start\_edge\_0 & Dqs\_oe\_end\_0     & Dqs\_oe\_begin\_0   & Dqs\_stop\_edge\_0   & Dqs\_start\_edge\_0 \\
  0x030 &                     &                  &                     & Wrdq\_clkdelay\_0  & Odt\_oe\_end\_0     & Odt\_oe\_begin\_0   & Odt\_stop\_edge\_0   & Odt\_start\_edge\_0 \\
  0x038 &                     &                  &                     & Dll\_rddqs\_n\_0   & Dll\_rddqs\_p\_0    & Dll\_wrdqs\_0       & Dll\_wrdata\_0       & Dll\_gate\_0        \\
  0x040 & Dq\_oe\_end\_1      & Dq\_oe\_begin\_1 & Dq\_stop\_edge\_1   & Dq\_start\_edge\_1 & Rddata\_delay\_1    & Rddqs\_lt\_half\_1  & Wrdqs\_lt\_half\_1   & Wrdq\_lt\_half\_1   \\
  0x048 & Rd\_oe\_end\_1      & Rd\_oe\_begin\_1 & Rd\_stop\_edge\_1   & Rd\_start\_edge\_1 & Dqs\_oe\_end\_1     & Dqs\_oe\_begin\_1   & Dqs\_stop\_edge\_1   & Dqs\_start\_edge\_1 \\
  0x050 &                     &                  &                     & Wrdq\_clkdelay\_1  & Odt\_oe\_end\_1     & Odt\_oe\_begin\_1   & Odt\_stop\_edge\_1   & Odt\_start\_edge\_1 \\
  0x058 &                     &                  &                     & Dll\_rddqs\_n\_1   & Dll\_rddqs\_p\_1    & Dll\_wrdqs\_1       & Dll\_wrdata\_1       & Dll\_gate\_1        \\
  0x060 & Dq\_oe\_end\_2      & Dq\_oe\_begin\_2 & Dq\_stop\_edge\_2   & Dq\_start\_edge\_2 & Rddata\_delay\_2    & Rddqs\_lt\_half\_2  & Wrdqs\_lt\_half\_2   & Wrdq\_lt\_half\_2   \\
  0x068 & Rd\_oe\_end\_2      & Rd\_oe\_begin\_2 & Rd\_stop\_edge\_2   & Rd\_start\_edge\_2 & Dqs\_oe\_end\_2     & Dqs\_oe\_begin\_2   & Dqs\_stop\_edge\_2   & Dqs\_start\_edge\_2 \\
  0x070 &                     &                  &                     & Wrdq\_clkdelay\_2  & Odt\_oe\_end\_2     & Odt\_oe\_begin\_2   & Odt\_stop\_edge\_2   & Odt\_start\_edge\_2 \\
  0x078 &                     &                  &                     & Dll\_rddqs\_n\_2   & Dll\_rddqs\_p\_2    & Dll\_wrdqs\_2       & Dll\_wrdata\_2       & Dll\_gate\_2        \\
  0x080 & Dq\_oe\_end\_3      & Dq\_oe\_begin\_3 & Dq\_stop\_edge\_3   & Dq\_start\_edge\_3 & Rddata\_delay\_3    & Rddqs\_lt\_half\_3  & Wrdqs\_lt\_half\_3   & Wrdq\_lt\_half\_3   \\
  0x088 & Rd\_oe\_end\_3      & Rd\_oe\_begin\_3 & Rd\_stop\_edge\_3   & Rd\_start\_edge\_3 & Dqs\_oe\_end\_3     & Dqs\_oe\_begin\_3   & Dqs\_stop\_edge\_3   & Dqs\_start\_edge\_3 \\
  0x090 &                     &                  &                     & Wrdq\_clkdelay\_3  & Odt\_oe\_end\_3     & Odt\_oe\_begin\_3   & Odt\_stop\_edge\_3   & Odt\_start\_edge\_3 \\
  0x098 &                     &                  &                     & Dll\_rddqs\_n\_3   & Dll\_rddqs\_p\_3    & Dll\_wrdqs\_3       & Dll\_wrdata\_3       & Dll\_gate\_3        \\
  0x0A0 & Dq\_oe\_end\_4      & Dq\_oe\_begin\_4 & Dq\_stop\_edge\_4   & Dq\_start\_edge\_4 & Rddata\_delay\_4    & Rddqs\_lt\_half\_4  & Wrdqs\_lt\_half\_4   & Wrdq\_lt\_half\_4   \\
  0x0A8 & Rd\_oe\_end\_4      & Rd\_oe\_begin\_4 & Rd\_stop\_edge\_4   & Rd\_start\_edge\_4 & Dqs\_oe\_end\_4     & Dqs\_oe\_begin\_4   & Dqs\_stop\_edge\_4   & Dqs\_start\_edge\_4 \\
  0x0B0 &                     &                  &                     & Wrdq\_clkdelay\_4  & Odt\_oe\_end\_4     & Odt\_oe\_begin\_4   & Odt\_stop\_edge\_4   & Odt\_start\_edge\_4 \\
  0x0B8 &                     &                  &                     & Dll\_rddqs\_n\_4   & Dll\_rddqs\_p\_4    & Dll\_wrdqs\_4       & Dll\_wrdata\_4       & Dll\_gate\_4 \\
  0x0C0 & Dq\_oe\_end\_5      & Dq\_oe\_begin\_5 & Dq\_stop\_edge\_5   & Dq\_start\_edge\_5 & Rddata\_delay\_5    & Rddqs\_lt\_half\_5  & Wrdqs\_lt\_half\_5   & Wrdq\_lt\_half\_5 \\
  0x0C8 & Rd\_oe\_end\_5      & Rd\_oe\_begin\_5 & Rd\_stop\_edge\_5   & Rd\_start\_edge\_5 & Dqs\_oe\_end\_5     & Dqs\_oe\_begin\_5   & Dqs\_stop\_edge\_5   & Dqs\_start\_edge\_5 \\
  0x0D0 &                     &                  &                     & Wrdq\_clkdelay\_5  & Odt\_oe\_end\_5     & Odt\_oe\_begin\_5   & Odt\_stop\_edge\_5   & Odt\_start\_edge\_5 \\
  0x0D8 &                     &                  &                     & Dll\_rddqs\_n\_5   & Dll\_rddqs\_p\_5    & Dll\_wrdqs\_5       & Dll\_wrdata\_5       & Dll\_gate\_5 \\
  0x0E0 & Dq\_oe\_end\_6      & Dq\_oe\_begin\_6 & Dq\_stop\_edge\_6   & Dq\_start\_edge\_6 & Rddata\_delay\_6    & Rddqs\_lt\_half\_6  & Wrdqs\_lt\_half\_6   & Wrdq\_lt\_half\_6 \\
  0x0E8 & Rd\_oe\_end\_6      & Rd\_oe\_begin\_6 & Rd\_stop\_edge\_6   & Rd\_start\_edge\_6 & Dqs\_oe\_end\_6     & Dqs\_oe\_begin\_6   & Dqs\_stop\_edge\_6   & Dqs\_start\_edge\_6 \\
  0x0F0 &                     &                  &                     & Wrdq\_clkdelay\_6  & Odt\_oe\_end\_6     & Odt\_oe\_begin\_6   & Odt\_stop\_edge\_6   & Odt\_start\_edge\_6 \\
  0x0F8 &                     &                  &                     & Dll\_rddqs\_n\_6   & Dll\_rddqs\_p\_6    & Dll\_wrdqs\_6       & Dll\_wrdata\_6       & Dll\_gate\_6 \\
  0x100 & Dq\_oe\_end\_7      & Dq\_oe\_begin\_7 & Dq\_stop\_edge\_7   & Dq\_start\_edge\_7 & Rddata\_delay\_7    & Rddqs\_lt\_half\_7  & Wrdqs\_lt\_half\_7   & Wrdq\_lt\_half\_7 \\
  0x108 & Rd\_oe\_end\_7      & Rd\_oe\_begin\_7 & Rd\_stop\_edge\_7   & Rd\_start\_edge\_7 & Dqs\_oe\_end\_7     & Dqs\_oe\_begin\_7   & Dqs\_stop\_edge\_7   & Dqs\_start\_edge\_7 \\
  0x110 &                     &                  &                     & Wrdq\_clkdelay\_7  & Odt\_oe\_end\_7     & Odt\_oe\_begin\_7   & Odt\_stop\_edge\_7   & Odt\_start\_edge\_7 \\
  0x118 &                     &                  &                     & Dll\_rddqs\_n\_7   & Dll\_rddqs\_p\_7    & Dll\_wrdqs\_7       & Dll\_wrdata\_7       & Dll\_gate\_7 \\
  0x120 & Dq\_oe\_end\_8      & Dq\_oe\_begin\_8 & Dq\_stop\_edge\_8   & Dq\_start\_edge\_8 & Rddata\_delay\_8    & Rddqs\_lt\_half\_8  & Wrdqs\_lt\_half\_8   & Wrdq\_lt\_half\_8 \\
  0x128 & Rd\_oe\_end\_8      & Rd\_oe\_begin\_8 & Rd\_stop\_edge\_8   & Rd\_start\_edge\_8 & Dqs\_oe\_end\_8     & Dqs\_oe\_begin\_8   & Dqs\_stop\_edge\_8   & Dqs\_start\_edge\_8 \\
  0x130 &                     &                  &                     & Wrdq\_clkdelay\_8  & Odt\_oe\_end\_8     & Odt\_oe\_begin\_8   & Odt\_stop\_edge\_8   & Odt\_start\_edge\_8 \\
  0x138 &                     &                  &                     & Dll\_rddqs\_n\_8   & Dll\_rddqs\_p\_8    & Dll\_wrdqs\_8       & Dll\_wrdata\_8       & Dll\_gate\_8 \\
  0x140 & Pad\_ocd\_clk       & Pad\_ocd\_ctl    & Pad\_ocd\_dqs       & Pad\_ocd\_dq       & Pad\_enzi           &                     & Pad\_en\_ctl         & Pad\_en\_clk \\
  0x148 & Pad\_adj\_code\_dqs & Pad\_code\_dqs   & Pad\_adj\_code\_dq  & Pad\_code\_dq      &                     & Pad\_vref\_internal & Pad\_odt\_se         & Pad\_modezi1v8 \\
  0x150 &                     &                  & Pad\_adj\_code\_clk & Pad\_code\_lk      & Pad\_adj\_code\_cmd & Pad\_code\_cmd      & Pad\_adj\_code\_addr & Pad\_code\_addr \\
  0x158 &                     &                  & Pad\_comp\_okn      & Pad\_comp\_code\_o & Pad\_comp\_code\_i  & Pad\_comp\_mode     & Pad\_comp\_tm        & Pad\_comp\_pd \\
  0x160 & Rdfifo\_empty(R)    &                  & Overflow(R)         &                    & Dram\_init(R)       & Rdfifo\_valid       & Cmd\_timming         & Ddr3\_mode \\
  0x168 &                     & Addr\_mirror     & Cmd\_delay          & Burst\_length      & Bank                & Cs\_zq              & Cs\_mrs              & Cs\_enable \\
  0x170 & Odt\_wr\_cs\_map    &                  & Odt\_wr\_length     & Odt\_wr\_delay     & Odt\_rd\_cs\_map    &                     & Odt\_rd\_length      & Odt\_rd\_delay \\
  0x178 &                     &                  &                     &                    &                     &                     &                      & \\
  0x180 & Lvl\_resp\_0(R)     & Lvl\_done(R)     & Lvl\_ready(R)       &                    & Lvl\_cs             & tLVL\_DELAY         & Lvl\_req(WR)         & Lvl\_mode \\
  0x188 & Lvl\_resp\_8(R)     & Lvl\_resp\_7(R)  & Lvl\_resp\_6(R)     & Lvl\_resp\_5(R)    & Lvl\_resp\_4(R)     & Lvl\_resp\_3(R)     & Lvl\_resp\_2(R)      & Lvl\_resp\_1(R) \\
  0x190 & Cmd\_a              &                  & Cmd\_ba             & Cmd\_cmd           & Cmd\_cs             & Status\_cmd(R)      & Cmd\_req(WR)         & Command\_mode \\
  0x198 &                     &                  & Status\_sref(R)     & Srefresh\_req      & Pre\_all\_done(R)   & Pre\_all\_req(R)    & Mrs\_done(R)         & Mrs\_req(WR) \\
  0x1A0 & Mr\_3\_cs\_0        &                  & Mr\_2\_cs\_0        &                    & Mr\_1\_cs\_0        &                     & Mr\_0\_cs\_0         & \\
  0x1A8 & Mr\_3\_cs\_1        &                  & Mr\_2\_cs\_1        &                    & Mr\_1\_cs\_1        &                     & Mr\_0\_cs\_1         & \\
  0x1B0 & Mr\_3\_cs\_2        &                  & Mr\_2\_cs\_2        &                    & Mr\_1\_cs\_2        &                     & Mr\_0\_cs\_2         & \\
  0x1B8 & Mr\_3\_cs\_3        &                  & Mr\_2\_cs\_3        &                    & Mr\_1\_cs\_3        &                     & Mr\_0\_cs\_3         & \\
  0x1C0 & tRESET              & tCKE             & tXPR                & tMOD               & tZQCL               & tZQ\_CMD            & tWLDQSEN             & tRDDATA \\
  0x1C8 & tFAW                & tRRD             & tRCD                & tRP                & tREF                & tRFC                & tZQCS                & tZQperiod \\
  0x1D0 & tODTL               & tXSRD            & tPHY\_RDLAT         & tPHY\_WRLAT        & tRAS\_max           &                     &                      & tRAS\_min \\
  0x1D8 & tXPDLL              & tXP              & tWR                 & tRTP               & tRL                 & tWL                 & tCCD                 & tWTR \\
  0x1E0 & tW2R\_diffCS        & tW2W\_diffCS     & tR2P\_sameBA        & tW2P\_sameBA       & tR2R\_sameBA        & tR2W\_sameBA        & tW2R\_sameBA         & tW2W\_sameBA \\
  0x1E8 & tR2R\_diffCS        & tR2W\_diffCS     & tR2P\_sameCS        & tW2P\_sameCS       & tR2R\_sameCS        & tR2W\_sameCS        & tW2R\_sameCS         & tW2W\_sameCS \\
  0x1F0 & Power\_up           & Age\_step        & tCPDED              & Cs\_map            & Bs\_config          & Nc                  & Pr\_r2w              & Placement\_en \\
  0x1F8 & Hw\_pd\_3           & Hw\_pd\_2        & Hw\_pd\_1           & Hw\_pd\_0          & Credit\_16          & Credit\_32          & Credit\_64           & Selection\_en \\
  0x200 & Cmdq\_age\_16       &                  & Cmdq\_age\_32       &                    & Cmdq\_age\_64       &                     & tCKESR               & tRDPDEN \\
  0x208 & Wfifo\_age          &                  & Ffifo\_age          &                    & Power\_stat3        & Power\_stat2        & Power\_stat1         & Power\_stat0 \\
  0x210 & Active\_age         &                  & Cs\_place\_0        & Addr\_win\_0       & Cs\_diff\_0         & Row\_diff\_0        & Ba\_diff\_0          & Col\_diff\_0 \\
  0x218 & Fastpd\_age         &                  & Cs\_place\_1        & Addr\_win\_1       & Cs\_diff\_1         & Row\_diff\_1        & Ba\_diff\_1          & Col\_diff\_1 \\
  0x220 & Slowpd\_age         &                  & Cs\_place\_2        & Addr\_win\_2       & Cs\_diff\_2         & Row\_diff\_2        & Ba\_diff\_2          & Col\_diff\_2 \\
  0x228 & Selfref\_age        &                  & Cs\_place\_3        & Addr\_win\_3       & Cs\_diff\_3         & Row\_diff\_3        & Ba\_diff\_3          & Col\_diff\_3 \\
  0x230 & Win\_mask\_0        &                  &                     &                    & Win\_base\_0        &                     &                      & \\
  0x238 & Win\_mask\_1        &                  &                     &                    & Win\_base\_1        &                     &                      & \\
  0x240 & Win\_mask\_2        &                  &                     &                    & Win\_base\_2        &                     &                      & \\
  0x248 & Win\_mask\_3        &                  &                     &                    & Win\_base\_3        &                     &                      & \\
  0x250 &                     & Cmd\_monitor     & Axi\_monitor        &                    & Ecc\_code(R)        & Ecc\_enable         & Int\_vector          & Int\_enable \\
  0x258 &                     &                  &                     &                    &                     &                     &                      & \\
  0x260 & Ecc\_addr(R)        &                  &                     &                    &                     &                     &                      & \\
  0x268 & Ecc\_data(R)        &                  &                     &                    &                     &                     &                      & \\
  0x270 & Lpbk\_ecc\_mask(R)  & Prbs\_init       &                     &                    & Lpbk\_error(R)      & Prbs\_23            & Lpbk\_start          & Lpbk\_en \\
  0x278 & Lpbk\_ecc(R)        &                  & Lpbk\_data\_mask(R) &                    & Lpbk\_correct(R)    &                     & Lpbk\_counter(R)     & \\
  0x280 & Lpbk\_data\_r(R)    &                  &                     &                    &                     &                     &                      & \\
  0x288 & Lpbk\_data\_f(R)    &                  &                     &                    &                     &                     &                      & \\
  0x290 & Axi0\_bandwidth\_w  &                  &                     &                    & Axi0\_bandwidth\_r  &                     &                      & \\
  0x298 & Axi0\_latency\_w    &                  &                     &                    & Axi0\_latency\_r    &                     &                      & \\
  0x2A0 & Axi1\_bandwidth\_w  &                  &                     &                    & Axi1\_bandwidth\_r  &                     &                      & \\
  0x2A8 & Axi1\_latency\_w    &                  &                     &                    & Axi1\_latency\_r    &                     &                      & \\
  0x2B0 & Axi2\_bandwidth\_w  &                  &                     &                    & Axi2\_bandwidth\_r  &                     &                      & \\
  0x2B8 & Axi2\_latency\_w    &                  &                     &                    & Axi2\_latency\_r    &                     &                      & \\
  0x2C0 & Axi3\_bandwidth\_w  &                  &                     &                    & Axi3\_bandwidth\_r  &                     &                      & \\
  0x2C8 & Axi3\_latency\_w    &                  &                     &                    & Axi3\_latency\_r    &                     &                      & \\
  0x2D0 & Axi4\_bandwidth\_w  &                  &                     &                    & Axi4\_bandwidth\_r  &                     &                      & \\
  0x2D8 & \forcol{Axi4\_latency\_w}         &                        \forcol{Axi4\_latency\_r} \\
  0x2E0 & \forcol{Cmdq0\_bandwidth\_w}      &                        \forcol{Cmdq0\_bandwidth\_r} \\
  0x2E8 & \forcol{Cmdq0\_latency\_w}        &                        \forcol{Cmdq0\_latency\_r} \\
  0x2F0 & \forcol{Cmdq1\_bandwidth\_w}      &                        \forcol{Cmdq1\_bandwidth\_r} \\
  0x2F8 & \forcol{Cmdq1\_latency\_w}        &                        \forcol{Cmdq1\_latency\_r} \\
  0x300 & \forcol{Cmdq2\_bandwidth\_w}      &                        \forcol{Cmdq2\_bandwidth\_r} \\
  0x308 & \forcol{Cmdq2\_latency\_w}        &                        \forcol{Cmdq2\_latency\_r} \\
  0x310 & \forcol{Cmdq3\_bandwidth\_w}      &                        \forcol{Cmdq3\_bandwidth\_r} \\
  0x318 & \forcol{Cmdq3\_latency\_w}        &                        \forcol{Cmdq3\_latency\_r} \\ \hline
\end{longtable}
\setlength\LTleft{0in}
\setlength\LTright{0in}

详细说明列表：
表 9-2 DDR2 SDRAM 配置参数寄存器格式

\begin{longtable}{|>{\tt}p{3.3cm}|>{\tt}p{1cm}|>{\centering}p{1cm}|>{\tt}p{1.5cm}|p{9cm}|}
  \caption{DDR2/3 SDRAM 配置寄存器格式} \tabularnewline \hline
  参数 & 位域 & 读写 & 缺省值 & 说明
  \tabularnewline\hhline \endfirsthead
  \caption{DDR2/3 SDRAM 配置寄存器格式（续）} \tabularnewline \hline
  参数 & 位域 & 读写 & 缺省值 & 说明
  \tabularnewline\hhline \endhead
  \hline \multicolumn{5}{r}{\tiny 未完待续} \endfoot \endlastfoot
  \multicolumn{5}{l}{0x000} \\ \hhline
  Dll\_value\_0   &      56:48  & 只读  & 0x0 &   第 0 组数据 DLL 锁定值 \\
  Dll\_value\_ck  &      40:32  & 只读  & 0x0 &   时钟组 DLL 锁定值 \\
  Dll\_init\_done &      25:16  & 只读  & 0x0 &   控制器内部 DLL 锁定信号
                                              [25:17]：对应 9 组数据的 DLL 锁定信号
                                              [16:16]：对应时钟组 DLL 锁定信号 \\
  Version       &      15:0   & 只读  & 0x1 &   控制器版本号 \\
  \multicolumn{5}{l}{0x008} \\ \hhline
     Dll\_value\_4 &        56:48  & 只读  & 0x0  &  第 4 组数据 DLL 锁定值 \\
     Dll\_value\_3 &        40:32  & 只读  & 0x0  &  第 3 组数据 DLL 锁定值 \\
     Dll\_value\_2 &        24:16  & 只读  & 0x0  &  第 2 组数据 DLL 锁定值 \\
     Dll\_value\_1 &        8:0    & 只读  & 0x0  &  第 1 组数据 DLL 锁定值 \\
     0x010                                        \\
     Dll\_value\_8 &        56:48  & 只读  & 0x0  &  第 8 组数据 DLL 锁定值 \\
     Dll\_value\_7 &        40:32  & 只读  & 0x0  &  第 7 组数据 DLL 锁定值 \\
     Dll\_value\_6 &        24:16  & 只读  & 0x0  &  第 6 组数据 DLL 锁定值 \\
     Dll\_value\_5 &        8:0    & 只读  & 0x0  &  第 5 组数据 DLL 锁定值 \\
  \multicolumn{5}{l}{0x018} \\ \hhline
     Dll\_ck\_3    &        63:56  & 读写  & 0x0  &  时钟 3 延迟值
                                              [63:63]：bypass 控制
                                              [62:56]：当 bypass = 0 时，表示 n/128 个时钟周期
                                                    当 bypass = 1 时，表示 n 个延迟单元 \\
Dll\_ck\_2        & 55:48  & 读写  & 0x0 &   时钟 2 延迟值
                                         [55:55]：bypass 控制
                                         [54:48]：当 bypass = 0 时，表示 n/128 个时钟周期
                                               当 bypass = 1 时，表示 n 个延迟单元 \\
Dll\_ck\_1        & 47:40  & 读写  & 0x0 &   时钟 1 延迟值
                                         [47:47]：bypass 控制
                                         [46:40]：当 bypass = 0 时，表示 n/128 个时钟周期
                                               当 bypass = 1 时，表示 n 个延迟单元 \\
Dll\_ck\_0        & 39:32  & 读写  & 0x0 &   时钟 0 延迟值
                                         [39:39]：bypass 控制
                                         [38:32]：当 bypass = 0 时，表示 n/128 个时钟周期
                                               当 bypass = 1 时，表示 n 个延迟单元 \\
Dll\_increment    & 31:24 & 读写 & 0x4  & 每次 DLL 下溢时，起始延迟单元增加个数 \\
Dll\_start\_point & 23:16 & 读写 & 0x10 & DLL 初始化的起始延迟单元个数 \\
Dll\_bypass       & 8:8   & 读写 & 0x0  & DLL 初始化 bypass 控制。
                                         该位只有当 Dll\_init\_done 一直无法锁定时需要设置，
                                         以使内存控制器初始化可以继续进行。
                                         正确设置该位的方法是在 Init\_start 有效一段时间后
                                         再设为 1。而且设置之前相应的 DLL 延迟的最高位
                                         （bypass 控制）也应该设置 \\
Init\_start      & 0:0    & 读写  & 0x0 &   控制器初始化开始。
                                      只有当其它的所有相关参数设置好了之后才可以将
                                      该位置位，使控制器进行初始化，并向内存发起初始
                                      化。只有这个操作完成后内存空间才可以被访问，否
                                      则内存空间不可被外部访问。 \\
  \multicolumn{5}{l}{0x020} \\ \hhline
Dq\_oe\_end\_0    &  59:56  & 读写 &  0x2&    第 0 组数据输出有效时期的结束时间，不可小于 \\
                                         Dq\_oe\_begin\_0
Dq\_oe\_begin\_0  &  51:48  & 读写 &  0x2&    第 0 组数据输出有效时期的开始时间，不可大于 \\
                                         Dq\_oe\_end\_0
Dq\_stop\_edge\_0 &  41:40  & 读写 &  0x0&    第 0 组数据输出有效时期的结束相位，其与
                                         Dq\_oe\_end\_0 组 合 得 到 的 时 钟 边 沿 不 可 早 于
                                         Dq\_start\_edge\_0 与 Dq\_oe\_begin\_0 组合得到的时钟边
                                         沿
                                        0 – 比为 1 时提前 1/4 周期
                                        1 – 对应于 wrdqs\_0（第 0 组写 DQS）的上升沿
                                        2 – 比为 1 时推后 1/4 周期
                                        3 – 比为 1 时推后 1/2 周期 \\
Dq\_start\_edge\_0&  33:32  & 读写 &  0x0&   第 0 组数据输出有效时期的开始相位，其与
                                        Dq\_oe\_begin\_0 组 合 得 到 的 时 钟 边 沿 不 可 晚 于
                                        Dq\_stop\_edge\_0 与 Dq\_oe\_end\_0 组合得到的时钟边
                                        沿
                                        0 – 比为 1 时提前 1/4 周期
                                        1 – 对应于 wrdqs\_0（第 0 组写 DQS）的上升沿
                                        2 – 比为 1 时推后 1/4 周期
                                        3 – 比为 1 时推后 1/2 周期 \\
Rddata\_delay\_0 &  24:24  & 读写 &  0x1&   读返回数据在 FIFO 中延迟一周期输出 \\
Rddqs\_lt\_half\_0&  16:16  & 读写 &  0x0&   当读返回 DQS 信号(延时后)相比内部时钟的延迟小
                                        于半周期时需要设为 1 \\
Wrdqs\_lt\_half\_0&  8:8    & 读写 &  0x0&   当 Dll\_wrdqs\_0 的设置小于 0x40 时需要设为 1 \\
Wrdq\_lt\_half\_0 &  0:0    & 读写 &  0x0&   当 Dll\_wrdata\_0 的设置小于 0x40 时需要设为 1 \\
  \multicolumn{5}{l}{0x028} \\ \hhline
Rd\_oe\_end\_0    &  59:56  & 读写 &  0x1&   第 0 组数据读采样有效时期的结束时间，不可小于
                                        Rd\_oe\_begin\_0 \\
Rd\_oe\_begin\_0  &  51:48  & 读写 &  0x1&   第 0 组数据读采样有效时期的开始时间，不可大于 \\
                                        Rd\_oe\_end\_0
Rd\_stop\_edge\_0 &  41:40  & 读写 &  0x0&   第 0 组 数 据 读 采 样 有效 时 期 的 结 束 相 位， 其 与
                                        Rd\_oe\_end\_0 组 合 得 到 的 时 钟 边 沿 不 可 早 于
                                        Rd\_start\_edge\_0 与 Rd\_oe\_begin\_0 组合得到的时钟边
                                        沿
                                        0 – 比为 1 时提前 1/4 周期
                                        1 – 对应于 wrdqs\_0（第 0 组写 DQS）的上升沿
                                        2 – 比为 1 时推后 1/4 周期
                                        3 – 比为 1 时推后 1/2 周期 \\
Rd\_start\_edge\_0&  33:32  & 读写 &  0x0&   第 0 组 数 据 读 采 样 有效 时 期 的 开 始 相 位， 其 与
                                     Rd\_oe\_begin\_0 组 合 得 到 的 时 钟 边 沿 不 可 晚 于
                                     Rd\_stop\_edge\_0 与 Rd\_oe\_end\_0 组合得到的时钟边沿
                                     0 – 比为 1 时提前 1/4 周期
                                      1 – 对应于 wrdqs\_0（第 0 组写 DQS）的上升沿
                                      2 – 比为 1 时推后 1/4 周期
                                      3 – 比为 1 时推后 1/2 周期 \\

Dqs\_oe\_end\_0     & 27:24  & 读写  & 0x2&   第 0 组数据写 DQS 有效时期的结束时间，不可小于
                                         Dqs\_oe\_begin\_0 \\
Dqs\_oe\_begin\_0   & 19:16  & 读写  & 0x1&   第 0 组数据写 DQS 有效时期的开始时间，不可大于
                                         Dqs\_oe\_end\_0 \\
Dqs\_stop\_edge\_0  & 9:8    & 读写  & 0x1&   第 0 组数据写 DQS 有效时期的结束相位，其与
                                         Dqs\_oe\_end\_0 组 合 得 到 的 时 钟 边 沿 不 可 早 于
                                         Dqs\_start\_edge\_0 与 Dqs\_oe\_begin\_0 组合得到的时钟
                                         边沿
                                         0 – 比为 1 时提前 1/4 周期
                                         1 – 对应于 wrdqs\_0（第 0 组写 DQS）的上升沿
                                         2 – 比为 1 时推后 1/4 周期
                                         3 – 比为 1 时推后 1/2 周期 \\
Dqs\_start\_edge\_0 & 1:0    & 读写  & 0x1&   第 0 组数据写 DQS 有效时期的开始相位，其与
                                         Dqs\_oe\_begin\_0 组 合 得 到 的 时 钟 边 沿 不 可 晚 于
                                         Dqs\_stop\_edge\_0 与 Dqs\_oe\_end\_0 组合得到的时钟边
                                         沿
                                         0 – 比为 1 时提前 1/4 周期
                                         1 – 对应于 wrdqs\_0（第 0 组写 DQS）的上升沿
                                         2 – 比为 1 时推后 1/4 周期
                                         3 – 比为 1 时推后 1/2 周期 \\
  \multicolumn{5}{l}{0x030} \\ \hhline
Wrdq\_clkdelay\_0  & 32:32  & 读写  & 0x0& 第 0 组数据写 DQ 延迟控制信号在
                                         Wrdq\_lt\_half\_0 = 0 的时候将本组数据延迟增加一 拍 \\
Odt\_oe\_end\_0     & 27:24  & 读写  & 0x2&   第 0 组数据读 ODT（控制器内部）有效时期的结束
                                         时间，不可小于 Odt\_oe\_begin\_0 \\
Odt\_oe\_begin\_0   & 19:16  & 读写  & 0x1&   第 0 组数据读 ODT（控制器内部）有效时期的开始
                                         时间，不可大于 Odt\_oe\_end\_0 \\
Odt\_stop\_edge\_0  & 9:8    & 读写  & 0x0&   第 0 组数据读 ODT（控制器内部）有效时期的结束
                                         相位，其与 Odt\_oe\_end\_0 组合得到的时钟边沿不可
                                         早于 Odt\_start\_edge\_0 与 Odt\_oe\_begin\_0 组合得到的
                                          时钟边沿
                                          0 – 比为 1 时提前 1/4 周期
                                          1 – 对应于 wrdqs\_0（第 0 组写 DQS）的上升沿
                                          2 – 比为 1 时推后 1/4 周期
                                          3 – 比为 1 时推后 1/2 周期 \\
Odt\_start\_edge\_0 & 1:0    & 读写  & 0x0&    第 0 组数据读 ODT（控制器内部）有效时期的开始
                                       相位，其与 Odt\_oe\_begin\_0 组合得到的时钟边沿不可
                                       晚于 Odt\_stop\_edge\_0 与 Odt\_oe\_end\_0 组合得到的时
                                       钟边沿
                                       0 – 比为 1 时提前 1/4 周期
                                       1 – 对应于 wrdqs\_0（第 0 组写 DQS）的上升沿
                                       2 – 比为 1 时推后 1/4 周期
                                       3 – 比为 1 时推后 1/2 周期 \\
  \multicolumn{5}{l}{0x038} \\ \hhline
Dll\_rddqs\_n\_0    & 39:32  & 读写 &  0x20&   读 DQSn 采样延迟值
                                          [39:39]：bypass 控制
                                          [38:32]：当 bypass = 0 时，表示 n/128 个时钟周期
                                                当 bypass = 1 时，表示 n 个延迟单元 \\
Dll\_rddqs\_p\_0    & 31:24  & 读写 &  0x20&   读 DQSp 采样延迟值
                                          [31:31]：bypass 控制
                                          [30:24]：当 bypass = 0 时，表示 n/128 个时钟周期
                                                当 bypass = 1 时，表示 n 个延迟单元 \\
Dll\_wrdqs\_0      & 23:16  & 读写 &  0x7F&   写 DQS 延迟值
                                          [23:23]：bypass 控制
                                          [22:16]：当 bypass = 0 时，表示 n/128 个时钟周期
                                                当 bypass = 1 时，表示 n 个延迟单元 \\
Dll\_wrdata\_0     & 15:8   & 读写 &  0x60&   写数据延迟值（应该比 DQS 提前 1/4 周期）
                                          [15:15]：bypass 控制
                                          [14:8]：当 bypass = 0 时，表示 n/128 个时钟周期
                                                当 bypass = 1 时，表示 n 个延迟单元 \\
Dll\_gate\_0       & 7:0    & 读写 &  0x0 &   读 DQS 采样有效时期控制延迟值
                                          [7:7]：bypass 控制
                                          [6:0]：当 bypass = 0 时，表示 n/128 个时钟周期
                                               当 bypass = 1 时，表示 n 个延迟单元 \\
  \multicolumn{5}{l}{0x040： 从40 到 138 还没有内容} \\ \hhline
  \multicolumn{5}{l}{0x138} \\ \hhline
  \multicolumn{5}{l}{0x140} \\ \hhline
Pad\_ocd\_clk      & 58:56  & 读写 &  0x0 &  时钟引脚输出阻抗控制
                                         000 – 40 欧姆
                                         001 – 30 欧姆
                                         010 – 24 欧姆
                                         011 – 20 欧姆
                                         100 – 15 欧姆 \\
Pad\_ocd\_ctl      & 50:48  & 读写 &  0x0 &  控制引脚输出阻抗控制
                                         000 – 40 欧姆
                                         001 – 30 欧姆
                                         010 – 24 欧姆
                                         011 – 20 欧姆
                                         100 – 15 欧姆 \\
Pad\_ocd\_dqs      & 40:40  & 读写 &  0x0 &  DQS 引脚输出阻抗控制
                                         0 – 34 欧姆
                                         1 – 40 欧姆 \\
Pad\_ocd\_dq       & 32:32  & 读写 &  0x0 &  DQ 引脚输出阻抗控制
                                         0 – 34 欧姆
                                         1 – 40 欧姆 \\
Pad\_enzi         & 24:16  & 读写 &  0x0 &  分别对应 9 个数据组的引脚输入使能
                                         1 – 使能
                                         0 – 高阻 \\
Pad\_en\_ctl       & 8:8    & 读写 &  0x0 &  控制引脚输出使能
                                         1 – 使能
                                         0 – 高阻 \\
Pad\_en\_clk       & 7:0    & 读写 &  0x0 &  时钟引脚输出使能
                                         1 – 使能
                                         0 – 高阻 \\
  \multicolumn{5}{l}{0x148} \\ \hhline
Pad\_adj\_code\_dqs & 63:56  & 读写 &  0x0 &  设置当 Pad\_code\_dqs[0]有效时 DQS 信号附加 CODE
                                          [7:4] N\_CODE：1 使能，0 关闭
                                          [3:0] P\_CODE：0 关闭，1 使能 \\
Pad\_code\_dqs     &  50:48 &  读写&   0x0&   DQS 信号附加 CODE 使能设置
                                          Bit 2：0 有效，表示附加码作用于输出及 ODT
                                          Bit 1：0 有效，表示附加码作用于 SLEWRATE
                                          Bit 0：附加 CODE 符号位，0 为正，1 为负 \\
Pad\_adj\_code\_dq  &  47:40 &  读写&   0x0&   设置当 Pad\_code\_dq[0]有效时 DQ 信号附加 CODE
                                          [7:4] N\_CODE：1 使能，0 关闭
                                          [3:0] P\_CODE：0 关闭，1 使能 \\
Pad\_code\_dq      &  34:32 &  读写&   0x0&   DQ 信号附加 CODE 使能设置
                                          Bit 2：0 有效，表示附加码作用于输出及 ODT
                                          Bit 1：0 有效，表示附加码作用于 SLEWRATE
                                          Bit 0：附加 CODE 符号位，0 为正，1 为负 \\
Pad\_vref\_internal&  16:16 &  读写&   0x0&   使能内部 VREF 分压电路
                                          1 - 同时使用内部 VREF 分压与外部引脚输出电压
                                          0 - 只使用外部引脚输出电压 \\
Pad\_odt\_se       &  8:8   &  读写&   0x0&   引脚匹配电阻值控制
                                          0 – 60 欧姆
                                          1 – 120 欧姆 \\
Pad\_modezi1v8    &  0:0   &  读写&   0x0&   PAD MODE ZI 1v8
                                          1 – 使用 PAD 的 ZITEST 输入
                                          0 – 使用 PAD 的 ZI 输入 \\
  \multicolumn{5}{l}{0x150} \\ \hhline
Pad\_adj\_code\_clk &  47:40 &  读写&   0x0&   设置当 Pad\_code\_clk[0]有效时 CLK 信号附加 CODE
                                          [7:4] N\_CODE：1 使能，0 关闭
                                          [3:0] P\_CODE：0 关闭，1 使能 \\
Pad\_code\_clk     &  34:32 &  读写&   0x0&   CLK 信号附加 CODE 使能设置
                                          Bit 2：0 有效，表示附加码作用于输出及 ODT
                                          Bit 1：0 有效，表示附加码作用于 SLEWRATE
                                          Bit 0：附加 CODE 符号位，0 为正，1 为负 \\
Pad\_adj\_code\_cmd &  31:24 &  读写&   0x0&   设 置 当 Pad\_code\_cmd[0] 有 效 时 CMD 信 号 附 加
                                          CODE
                                          [7:4] N\_CODE：1 使能，0 关闭
                                          [3:0] P\_CODE：0 关闭，1 使能 \\
Pad\_code\_cmd     &  18:16 &  读写&   0x0&    CMD 信号附加 CODE 使能设置
                                           Bit 2：0 有效，表示附加码作用于输出及 ODT
                                           Bit 1：0 有效，表示附加码作用于 SLEWRATE
                                           Bit 0：附加 CODE 符号位，0 为正，1 为负 \\
Pad\_adj\_code\_addr&  15:8  &  读写&   0x0&    设置 当 Pad\_code\_addr[0]有效时 ADDR 信 号附 加
                                           CODE
                                           [7:4] N\_CODE：1 使能，0 关闭
                                           [3:0] P\_CODE：0 关闭，1 使能 \\
Pad\_code\_addr    &  2:0   &  读写&   0x0&    ADDR 信号附加 CODE 使能设置
                                           Bit 2：0 有效，表示附加码作用于输出及 ODT
                                           Bit 1：0 有效，表示附加码作用于 SLEWRATE
                                           Bit 0：附加 CODE 符号位，0 为正，1 为负 \\
  \multicolumn{5}{l}{0x158} \\ \hhline
Pad\_comp\_okn     &  40:40 &  只读&   0x0&    引脚补偿单元自动调节完成标志 \\
Pad\_comp\_code\_o  &  39:32 &  只读&   0x0&    引脚补偿单元自动调节调整值 \\
Pad\_comp\_code\_i  &  31:24 &  读写&  0xF0&   引脚补偿单元手动设置值
                                           [7:4] N\_CODE：1 使能，0 关闭
                                           [3:0] P\_CODE：0 关闭，1 使能 \\
Pad\_comp\_mode    &  16:16 &  读写&   0x0&    引脚补偿单元设置
                                           1 – 手动设置 CODE
                                           0 – 自动调节 CODE \\
Pad\_comp\_tm      &  8:8   &  读写&   0x0&    外部引脚测试模块使能
                                           1 – 使用引脚 COMP\_NOUT/COMP\_POUT 连接电阻
                                           0 – 使用引脚 COMP\_REXT 连接电阻 \\
Pad\_comp\_pd      &  0:0   &  读写&   0x1&    引脚补偿单元 Power Down
                                           1 – Power Down
                                           0 – 正常工作 \\
  \multicolumn{5}{l}{0x160} \\ \hhline
Rdfifo\_empty     &  56:48 &  只读&   0x0&    PHY 中收集每个 SLICE 的读 FIFO 错误读出标志，当
                                        对应的 FIFO 为空时发生出队列操作时有效。可以用
                                        于判断 Rdfifo\_valid 无效时，tPHY\_RDLAT 的值是否
                                        设置过小每一位分别对应于 SLICE8 … SLICE0 \\
Overflow     & 40:32 &  只读 &  0x0 &   PHY 中每个 SLICE 中的读 FIFO 溢出标志，每一位分
                                     别对应于 SLICE8 … SLICE0 \\
Dram\_init    & 27:24 &  只读 &  0x0 &  DRAM 初始化完成标志，在 Init\_start 设置之后才会
                                     生效，每一位分别对应于一个片选 \\
Rdfifo\_valid & 16:16 &  读写 &  0x1 &  表示使用 PHY 内部逻辑控制读数据同步时间
                                     该位无效时，这个同步时间由 tPHY\_RDLAT 决定 \\
Cmd\_timming  & 9:8   &  读写 &  0x0 &  控制线 2T/3T 功能使能
                                     0 – 1T
                                     1 – 2T
                                     2 – 3T
                                     与其他几个参数需要满足关系式：
                                     tRDDATA - Cmd\_delay - Cmd\_timing = CASLAT – 3
                                     tPHY\_WRLAT – Cmd\_delay – Cmd\_timing = WRLAT
                                     -4 \\
Ddr3\_mode    & 0:0   &  读写 &  0x1 &  使用 DDR3 模式时将该位设为 1 \\
  \multicolumn{5}{l}{0x168} \\ \hhline
Addr\_mirror  & 51:48 &  读写 &  0x0 &  表示该 CS 对应的地址需要进行地址镜像 \\
Cmd\_delay    & 41:40 &  读写 &  0x0 &  表示命令总线需要的附加延迟
                                     有效值为 0/1/2
                                     与其他几个参数需要满足关系式：
                                     tRDDATA - Cmd\_delay - Cmd\_timing = CASLAT – 3
                                     tPHY\_WRLAT – Cmd\_delay – Cmd\_timing = WRLAT
                                     -4 \\
Burst\_length & 35:32 &  读写 &  0x7 &  表示 DRAM 总线上的突发请求长度，该参数设置应
                                     与 MRS 参数一致。突发长度为 8 时设为 4’h7，突发
                                     长度为 4 时设为 4’h3 \\
Bank         & 27:24 &  读写 &  0x7 &  表示每个片选上的 Bank 数量
                                     Bank 数为 2 时：
                                          需设置 Ba\_diff = 2 , Addr\_win[3:2] = 2’b01
                                     Bank 数为 4 时：
                                          需设置 Ba\_diff = 1 , Addr\_win[3:2] = 2’b10
                                     Bank 数为 8 时：
                                          需设置 Ba\_diff = 0 , Addr\_win[3:2] = 2’b11 \\
Cs\_zq        & 19:16 &  读写 &  0x1 &  使能对应片选信号的 ZQ 请求 \\
Cs\_mrs       & 11:8  &  读写 &  0x1 &  使能对应片选信号的 MRS 请求 \\
Cs\_enable    &  3:0  &   读写&  0x1 &     使能对应片选信号 \\
  \multicolumn{5}{l}{0x170} \\ \hhline
Odt\_wr\_cs\_map&  63:48&   读写&0x8421&   对应 CS 发送写命令时，使能的 ODT 信号
                                         Bit [15:12]：CS3 发读时对应 ODTx 是否有效，x=3..0
                                         Bit [11: 8]：CS2 发读时对应 ODTx 是否有效，x=3..0
                                         Bit [ 7: 4]：CS1 发读时对应 ODTx 是否有效，x=3..0
                                         Bit [ 3: 0]：CS0 发读时对应 ODTx 是否有效，x=3..0 \\
Odt\_wr\_length&  43:40&   读写&  0x5 &     发送写命令时，ODT 信号有效周期数 \\
Odt\_wr\_delay &  35:32&   读写&  0x0 &     发送写命令时，ODT 信号与写命令的起始间隔 \\
Odt\_rd\_cs\_map&  31:16&   读写&0x4812&   对应 CS 发送读命令时，使能的 ODT 信号
                                         Bit [15:12]：CS3 发读时对应 ODTx 是否有效，x=3..0
                                         Bit [11: 8]：CS2 发读时对应 ODTx 是否有效，x=3..0
                                         Bit [ 7: 4]：CS1 发读时对应 ODTx 是否有效，x=3..0
                                         Bit [ 3: 0]：CS0 发读时对应 ODTx 是否有效，x=3..0 \\
Odt\_rd\_length&  11:8 &   读写&  0x5 &     发送读命令时，ODT 信号有效周期数 \\
Odt\_rd\_delay &  3:0  &   读写&  0x1 &     发送读命令时，ODT 信号与读命令的起始间隔 \\
  \multicolumn{5}{l}{0x178} \\ \hhline
  \multicolumn{5}{l}{0x180} \\ \hhline
Lvl\_resp\_0   &  63:56&   只读&   0x0&      Leveling 操作时，第 0 数据组的反馈信号 \\
Lvl\_done     &  48:48&   只读&   0x0&      Leveling 操作时，表示 Lvl\_resp\_\*有效信号 \\
Lvl\_ready    &  40:40&   只读&   0x0&      Leveling 操作时，表示当前控制器已经进入 Leveling
                                         操作模式。（用户程序正确设置 Lvl\_mode 的值后，
                                         应该对这个寄存器进行采样，如果值为 1 表示可以对
                                         控制器发起 Leveling 请求，也就是说，此时才可以将
                                         设 Lvl\_req 为 1） \\
Lvl\_cs       &  27:24&   读写&   0x1&      Leveling 操作时，当前控制的片选信号 \\
tLVL\_DELAY   &  23:16&   读写&  0x10&     Leveling 操作时，有效采样延迟周期
                                         单位为时钟周期 \\
Lvl\_req      &  8:8  &   只写&   0x0&      Leveling 操作时，向外发起 Leveling 操作请求 \\
Lvl\_mode     &  1:0  &   读写&   0x0&      Leveling 模式使能
                                         00 – 正常功能模式
                                         01 – Write Leveling 模式
                                         10 – Gate Leveling 模式 \\
  \multicolumn{5}{l}{0x188} \\ \hhline
Lvl\_resp\_8   & 63:56 &  只读 &  0x0 &  Leveling 操作时，第 8 数据组的反馈信号
                                     当 Lvl\_mode == 1 时，为数据线上的反馈
                                     当 Lvl\_mode == 2 时
                                      Bit[7:5]：内部有效读 DQS 时钟上升沿计数器
                                      Bit[4:2]：内部有效读 DQS 时钟下升沿计数器
                                      Bit[1:0]：内部 DQS 采样信号采样 DQS 的反馈
                                     对于一个正确配置的 Gate Leveling 操作来说
                                     Bit[7:5]与 Bit[4:2]应该在每一次 Leveling\_req 增加
                                     Burst\_length/2 个计数，否则需要调整 Dll\_gate\_x 的值 \\
Lvl\_resp\_7   & 55:48 &  只读 &  0x0 &  Leveling 操作时，第 7 数据组的反馈信号 \\
Lvl\_resp\_6   & 47:40 &  只读 &  0x0 &  Leveling 操作时，第 6 数据组的反馈信号 \\
Lvl\_resp\_5   & 39:32 &  只读 &  0x0 &  Leveling 操作时，第 5 数据组的反馈信号 \\
Lvl\_resp\_4   & 31:24 &  只读 &  0x0 &  Leveling 操作时，第 4 数据组的反馈信号 \\
Lvl\_resp\_3   & 23:16 &  只读 &  0x0 &  Leveling 操作时，第 3 数据组的反馈信号 \\
Lvl\_resp\_2   & 15:8  &  只读 &  0x0 &  Leveling 操作时，第 2 数据组的反馈信号 \\
Lvl\_resp\_1   & 7:0   &  只读 &  0x0 &  Leveling 操作时，第 1 数据组的反馈信号 \\
  \multicolumn{5}{l}{0x190} \\ \hhline
Cmd\_a        & 63:48 &  读写 &  0x0 &  命令发送模式下，对 DRAM 发出的地址线信号 （最高位 bit[15]保留，cmd\_a[15]==0）\\
Cmd\_ba       & 42:40 &  读写 &  0x0 &  命令发送模式下，对 DRAM 发出的 ba 线信号 \\
Cmd\_cmd      & 34:32 &  读写 &  0x0 &  命令发送模式下，对 DRAM 发出的控制信号
                                     bit2 – RASn
                                     bit1 – CASn
                                     bit0 – WEn \\
Cmd\_cs       & 27:24 &  读写 &  0x0 &  命令发送模式下，对 DRAM 发出的片选信号 \\
Status\_cmd   & 16:16 &  只读 &  0x0 &  表示控制器进入命令发送模式，在 command\_mode
                                     设置之后才会生效 \\
Cmd\_req      & 8:8   &  只写 &  0x0 &  命令发送模式下，对 DRAM 发出一次控制命令 \\
Command\_mode & 0:0   &  读写 &  0x0 &  使控制器进入命令发送模式 \\
  \multicolumn{5}{l}{0x198} \\ \hhline
Status\_sref  & 43:40 &  只读 &  0x0 &  已经进入自刷新模式，每位分别对应一个片选 \\
Srefresh\_req & 35:32 &  读写 &  0x0 &  自刷新控制信号，设 1 进入自刷新，设 0 退出自刷新 \\
Pre\_all\_done & 27:24 &  只读 &  0x0 &  Precharge All 操作完成 \\
Pre\_all\_req  &19:16  & 只写  & 0x0  &    请求发出 Precharge All 命令，每位分别对应一个片选 \\
Mrs\_done     &8:8    & 只读  & 0x0  &    命令模式下，表示 MRS 命令发送完毕 \\
Mrs\_req      &0:0    & 只写  & 0x0  &    命令模式下，向 DRAM 发出一次 MRS 命令，发送的
                                       命令序列为 MRS2、MRS3、MRS1、MRS0 \\
  \multicolumn{5}{l}{0x1A0} \\ \hhline
Mr\_3\_cs\_0    &63:48  & 读写  &0x0000&   向 DRAM CS 0 发送 MRS 3 命令时对应的值 \\
Mr\_2\_cs\_0    &47:32  & 读写  &0x0018&   向 DRAM CS 0 发送 MRS 2 命令时对应的值 \\
Mr\_1\_cs\_0    &31:16  & 读写  &0x0004&   向 DRAM CS 0 发送 MRS 1 命令时对应的值 \\
Mr\_0\_cs\_0    &15:0   & 读写  &0x0d60&   向 DRAM CS 0 发送 MRS 0 命令时对应的值 \\
  \multicolumn{5}{l}{0x1A8} \\ \hhline
Mr\_3\_cs\_1    &63:48  & 读写  &0x0000&   向 DRAM CS 1 发送 MRS 3 命令时对应的值 \\
Mr\_2\_cs\_1    &47:32  & 读写  &0x0018&   向 DRAM CS 1 发送 MRS 2 命令时对应的值 \\
Mr\_1\_cs\_1    &31:16  & 读写  &0x0004&   向 DRAM CS 1 发送 MRS 1 命令时对应的值 \\
Mr\_0\_cs\_1    &15:0   & 读写  &0x0d60&   向 DRAM CS 1 发送 MRS 0 命令时对应的值 \\
  \multicolumn{5}{l}{0x1B0} \\ \hhline
Mr\_3\_cs\_2    &63:48  & 读写  &0x0000&   向 DRAM CS 2 发送 MRS 3 命令时对应的值 \\
Mr\_2\_cs\_2    &47:32  & 读写  &0x0018&   向 DRAM CS 2 发送 MRS 2 命令时对应的值 \\
Mr\_1\_cs\_2    &31:16  & 读写  &0x0004&   向 DRAM CS 2 发送 MRS 1 命令时对应的值 \\
Mr\_0\_cs\_2    &15:0   & 读写  &0x0d60&   向 DRAM CS 2 发送 MRS 0 命令时对应的值 \\
  \multicolumn{5}{l}{0x1B8} \\ \hhline
Mr\_3\_cs\_3    &63:48  & 读写  &0x0000&   向 DRAM CS 3 发送 MRS 3 命令时对应的值 \\
Mr\_2\_cs\_3    &47:32  & 读写  &0x0018&   向 DRAM CS 3 发送 MRS 2 命令时对应的值 \\
Mr\_1\_cs\_3    &31:16  & 读写  &0x0004&   向 DRAM CS 3 发送 MRS 1 命令时对应的值 \\
Mr\_0\_cs\_3    &15:0   & 读写  &0x0D60&   向 DRAM CS 3 发送 MRS 0 命令时对应的值 \\
  \multicolumn{5}{l}{0x1C0} \\ \hhline
tRESET       &63:56  & 读写  & 0x28 &    DRAM 初始化前的复位时间单位为 4096 个时钟周期 \\
tCKE         &55:48  & 读写  & 0x70 &    DRAM 初始化从复位释放到 CKE 有效时间
                                       单位为 4096 个时钟周期 \\
tXPR         &47:40  & 读写  & 0x80 &    DRAM 初始化从 CKE 有效到 MRS 命令的时间
                                       单位为时钟周期 \\
tMOD         &39:32  & 读写  & 0x0C &    发送 MRS 命令后至下一条命令的时间间隔
                                       单位为时钟周期 \\
tZQCL        &31:24  & 读写  & 0x03 &  发送 ZQCL 命令后至下一条命令的时间间隔
                                     单位为 256 个时钟周期 \\
tZQ\_CMD      &23:16  & 读写  & 0x03 &  不同片选之间发送 ZQ 命令的时间间隔
                                     单位为时钟周期 \\
tWLDQSEN     &15:8   & 读写  & 0x20 &  Write Leveling 中，从 MRS 到 DQS 为低的时间间隔
                                     单位为时钟周期 \\
tRDDATA      &7:0    & 读写  & 0x07 &  从发送读命令到发送读数据有效命令的时间间隔。 
                                     单位为时钟周期
                                     与其他几个参数需要满足关系式：
                                     tRDDATA - Cmd\_delay - Cmd\_timing = CASLAT – 3
                                     该参数最小设置值为 2\\
  \multicolumn{5}{l}{0x1C8} \\ \hhline
tFAW         &61:56  & 读写  & 0x30 &  连续打开 4 个 Bank 的最小允许时间
                                     单位为时钟周期 \\
tRRD         &50:48  & 读写  & 0x06 &  打开两个行之间的最小间隔时间
                                     单位为时钟周期 \\
tRCD         &43:40  & 读写  & 0x09 &  打开行到对应行的读写操作之间的最小间隔时间
                                     单位为时钟周期 \\
tRP          &39:32  & 读写  & 0x09 &  Precharge 操作需要时间
                                     单位为时钟周期 \\
tREF         &31:24  & 读写  & 0x03 &  同一片选刷新操作之间的时间间隔
                                     单位为 256 个时钟周期 \\
tRFC         &23:16  & 读写  & 0x85 &  刷新操作需要时间
                                     单位为时钟周期 \\
tZQCS        &15:8   & 读写  & 0x40 &  ZQCS 操作需要时间
                                     单位为时钟周期 \\
tZQperiod    &7:0    & 读写  & 0x04 &  同一片选 ZQCS 操作之间的时间间隔
                                     单位为 tREF（刷新操作之间的时间间隔） \\
  \multicolumn{5}{l}{0x1D0} \\ \hhline
tODTL        &59:56  & 读写  & 0x0A &  Write Leveling 中从 ODT 无效到 MRS 命令时间间隔
                                     单位为时钟周期 \\
tXSRD        &55:48  & 读写  & 0x02 &  从自刷新模式恢复到第一条访问的最小时间间隔
                                     单位为 256 个时钟周期 \\
tPHY\_RDLAT   &43:40  & 读写  & 0x9  &  读内存操作的 PHY 内部读数据同步时间
                                       0x5 时一般可以正常工作，极端情况下可以将这个值
                                       增加或减小。减小可能会影响到读数据的正确性，增
                                       加会增加读操作的延迟
                                       当 Rdfifo\_valid 有效时，这个配置不起作用
                                       单位为时钟周期 \\
tPHY\_WRLAT   &36:32  & 读写  & 0x04 &     从发送写命令到发送写数据的时间间隔。
                                       单位为时钟周期
                                       与其他几个参数需要满足关系式：
                                       tPHY\_WRLAT – Cmd\_delay – Cmd\_timing = WRLAT
                                       –4
                                       该参数最小设置值为 2 \\
tRAS\_max     &25:8   & 读写 &0x20000&   行打开的最长有效时间 
                                       单位为时钟周期\\
tRAS\_min     &5:0    & 读写  & 0x1C &     行打开的最短有效时间单位为时钟周期 \\
  \multicolumn{5}{l}{0x1D8} \\ \hhline
tXPDLL       &63:56  & 读写  & 0x14 &     从离开 Power down （DLL 关闭）状态到下一个命令
                                       的间隔时间
                                       单位为始终周期 \\
tXP          &55:48  & 读写  & 0x05 &     从离开 Power down （DLL 打开）状态到下一个命令
                                       的间隔时间 \\
tWR          &44:40  & 读写  & 0x0C &     写恢复时间
                                       单位为时钟周期
                                       该参数设置值应大于等于 MRS 中设置值 \\
tRTP         &34:32  & 读写  & 0x06 &     读到 Precharge 操作的间隔时间
                                       单位为时钟周期 \\
tRL          &27:24  & 读写  & 0x0a &     读操作延迟，相当于 CASLAT
                                       单位为时钟周期
                                       该参数设置值应大于等于 MRS 中设置值 \\
tWL          &19:16  & 读写  & 0x08 &     写操作延迟，相当于 WRLAT
                                       单位为时钟周期
                                       该参数设置值应大于等于 MRS 中设置值 \\
tCCD         &11:8   & 读写  & 0x04 &     两个读写操作之间的最小间隔时间
                                       单位为时钟周期 \\
tWTR         &3:0    & 读写  & 0x06 &  写操作到读操作之间的最小间隔时间
                                        单位为时钟周期 \\
  \multicolumn{5}{l}{0x1E0} \\ \hhline
tW2R\_diffCS      &  61:56&   读写&   0x03&   不同 CS 上的写操作到读操作之间间隔时间减 1 单位为时钟周期，最小值等于 tCCD+tWL-tRL. \\
tW2W\_diffCS      &  53:48&   读写&   0x0 &   不同 CS 上的写操作到写操作之间的附加间隔时间单位为时钟周期，最小值等于 tCCD-1 \\
tR2P\_sameBA      &  45:40&   读写&   0x0 &   相同 Bank 上的读操作到 Precharge 之间附加间隔时间单位为时钟周期 \\
tW2P\_sameBA      &  37:32&   读写&   0x0 &   相同 Bank 上的写操作到 Precharge 之间附加间隔时间单位为时钟周期 \\
tR2R\_sameBA      &  29:24&   读写&   0x0 &   相同 Bank 上的读操作到读操作之间的附加间隔时间单位为时钟周期 \\
tR2W\_sameBA      &  21:16&   读写&   0x0 &   相同 Bank 上的读操作到写操作之间的附加间隔时间单位为时钟周期 \\
tW2R\_sameBA      &  13:8 &   读写&   0x0 &   相同 Bank 上的写操作到读操作之间的附加间隔时间单位为时钟周期 \\
tW2W\_sameBA      &  5:0  &   读写&   0x0 &   相同 Bank 上的写操作到写操作之间的附加间隔时间单位为时钟周期 \\
  \multicolumn{5}{l}{0x1E8} \\ \hhline
tR2R\_diffCS      &  61:56&   读写&   0x0 &   不同 CS 上的读操作到读操作之间的附加间隔时间单位为时钟周期，最小值等于 tCCD-1 \\
tR2W\_diffCS      &  53:48&   读写&   0x05&   不同 CS 上的读操作到写操作之间间隔时间减 1 单位为时钟周期，最小值等于 tCCD+tRL(+1)-tWL. \\
tR2P\_sameCS      &  45:40&   读写&   0x0 &   相同 CS 上的读操作到 Precharge 之间的间隔时间减去 1 的值单位为时钟周期 \\
tW2P\_sameCS      &  37:32&   读写&   0x0 &   相同 CS 上的写操作到 Precharge 之间的间隔时间减去 1 的值单位为时钟周期 \\
tR2R\_sameCS      &  29:24&   读写&   0x0 &   相同 CS 上的读操作到读操作之间的附加间隔时间单位为时钟周期 \\
tR2W\_sameCS      &  21:16&   读写&   0x0 &   相同 CS 上的读操作到写操作之间的附加间隔时间单位为时钟周期 \\
tW2R\_sameCS      &13:8   & 读写  & 0x0   & 相同 CS 上的写操作到读操作之间的附加间隔时间单位为时钟周期 \\
tW2W\_sameCS      &5:0    & 读写  & 0x0   & 相同 CS 上的写操作到写操作之间的附加间隔时间单位为时钟周期 \\
  \multicolumn{5}{l}{0x1F0} \\ \hhline
Power\_up         &59:56  & 读写  & 0x0   & 分别对应四个 CS。设为 1 时，可以使对应的 CS 离开或者不进入 Power down 状态。 \\
Age\_step         &55:48  & 读写  & 0x08  & Power down 计数器步长。 \\
tCPDED           &47:40  & 读写  & 0x01  & CKE 为 0 后，命令和地址总线失效时间单位为时钟周期 \\
Cs\_map           &39:32  & 读写  & 0x0   & CS 地址映射控制，每两位分别对应地址译码后的 CS 与真实 CS 之间的映射关系 \\
Bs\_config        &31:24  & 读写  & 0xFF  & 命令调度 CS 状态使能
                                             Bit7：CS3 对应状态机状态使能
                                                  1-使能；0-禁用（下同）
                                             Bit6：CS3 对应状态机状态重置
                                                  1-解复位；0-重置（下同）
                                             Bit5：CS2 对应状态机状态使能
                                             Bit4：CS2 对应状态机状态重置
                                             Bit3：CS1 对应状态机状态使能
                                             Bit2：CS1 对应状态机状态重置
                                             Bit1：CS0 对应状态机状态使能
                                             Bit0：CS0 对应状态机状态重置 \\
Nc               &18:16  & 读写  & 0x0   &     多通道模式使能
                                             000 – 普通 64 位模式
                                             001 – 多通道模式
                                             011 – 普通 16 位模式
                                             101 – 普通 32 位模式
                                             其它 – 保留 \\
Pr\_r2w           &11:8   & 读写  & 0x1   &     读操作优先级是否高于写操作 \\
Placement\_en     &0:0    & 读写  & 0x1   &     使能读写命令重排逻辑 \\
  \multicolumn{5}{l}{0x1F8} \\ \hhline
Hw\_pd\_3          &59:56  & 读写  & 0x0   &     从低到高分别对应 Active Standby，Fast Power Down，
                                            Slow Power Down 和 Self Refresh。设为 1 表示允许CS3 进入对应的低功耗状态。 \\
Hw\_pd\_2          & 51:48 &  读写 &  0x0  &    设为 1 表示允许 CS2 进入对应的低功耗状态。 \\
Hw\_pd\_1          & 43:40 &  读写 &  0x0  &    设为 1 表示允许 CS1 进入对应的低功耗状态。 \\
Hw\_pd\_0          & 35:32 &  读写 &  0x0  &    设为 1 表示允许 CS0 进入对应的低功耗状态。 \\
Credit\_16        & 29:24 &  读写 &  0x4  &    16 位通道优先级设置 \\
Credit\_32        & 21:16 &  读写 &  0x8  &    32 位通道优先级设置 \\
Credit\_64        & 13:8  &  读写 &  0x10 &    64 位通道优先级设置 \\
Selection\_en     & 0:0   &  读写 &  0x1  &    不同通道优先级调度使能 \\
  \multicolumn{5}{l}{0x200} \\ \hhline
Cmdq\_age\_16      & 59:48 &  读写 &  0xC00&    16 位通道调度初始年龄。0xFFF 为超时。 \\
Cmdq\_age\_32      & 43:32 &  读写 &  0xC00&    32 位通道调度初始年龄。0xFFF 为超时。 \\
Cmdq\_age\_64      & 27:16 &  读写 &  0xC00&    64 位通道调度初始年龄。0xFFF 为超时。 \\
tCKESR           & 15:8  &  读写 &  0x07 &    进入自刷新时，CKE 为低的最短时间单位为时钟周期 \\
tRDPDEN          & 7:0   &  读写 &  0x0C &    从发出 RD/RDA 命令到进入低功耗状态的时间间隔单位为时钟周期 \\
  \multicolumn{5}{l}{0x208} \\ \hhline
Wfifo\_age        & 59:48 &  读写 &  0xC00&    写队列中命令初始年龄。0xFFF 为超时。 \\
Rfifo\_age        & 43:32 &  读写 &  0xC00&    读队列中命令初始年龄。0xFFF 为超时。 \\
Power\_stat3      & 27:24 &  只读 &  0x0  &    从低到高分别对应 Active Standby，Fast Power Down，
                                            Slow Power Down 和 Self Refresh。设为 1 表示 CS3 处于对应的低功耗状态。 \\
Power\_stat2      & 19:16 &  只读 &  0x0  &    设为 1 表示 CS2 处于对应的低功耗状态。 \\
Power\_stat1      & 11:8  &  只读 &  0x0  &    设为 1 表示 CS1 处于对应的低功耗状态。 \\
Power\_stat0      & 3:0   &  只读 &  0x0  &    设为 1 表示 CS0 处于对应的低功耗状态。 \\
  \multicolumn{5}{l}{0x210} \\ \hhline
Active\_age       & 63:48 &  读写 &0x0008 &  Active Standby 低功耗状态计数器 \\
Cs\_place\_0       & 40:40 &  读写 &  0x0  &    普通模式或窗口 0 译码时 CS 在地址中的位置
                                            0 – 译码方式为{CS、ROW、BA、COL}
                                            1 – 译码方式为{ROW、CS、BA、COL} \\
Addr\_win\_0       & 35:32 &  读写 &  0xF  &    普通模式或窗口 0 地址命中及配置
                                            Bit [3:2]：窗口使用 DRAM 的 Bank 数
                                            11 – 8 bank；10 – 4 bank；01 – 2 bank；00 – 保留
                                           Bit [1:0]：窗口使用 DRAM 位数
                                           11 – 64 位；10 – 32 位；01 – 16 位；00 – 保留 \\
Cs\_diff\_0        &27:24  & 读写  & 0x0   &   普通模式或窗口 0 实际使用的 CS 译码前地址与 2 之差
                                           当 Pm\_nc 有效时，
                                           对于 64 位窗口，应该为 2；
                                           对于 32 位窗口，应该为 1；
                                           对于 16 位窗口，应该为 0 \\
Row\_diff\_0       &19:16  & 读写  & 0x2   &   普通模式或窗口 0 实际使用的行地址线个数与 16 之差这个值等于 16 – 实际使用的行地址线个数 \\
Ba\_diff\_0        &9:8    & 读写  & 0x0   &   普通模式或窗口 0 实际使用的 BA 线个数与 3 之差这个值等于 3 – 实际使用的 BA 线个数 \\
Col\_diff\_0       &3:0    & 读写  & 0x6   &   普通模式或窗口 0 实际使用的列地址线个数与 16 之差这个值等于 16 – 实际使用的列地址线个数 \\
  \multicolumn{5}{l}{0x218} \\ \hhline
Fastpd\_age       &63:48  & 读写  & 0x0008&   Fast Powerdown 低功耗状态计数器 \\
Cs\_place\_1       &40:40  & 读写  & 0x0   &   普通模式或窗口 1 译码时 CS 在地址中的位置
                                           0 – 译码方式为{CS、ROW、BA、COL}
                                           1 – 译码方式为{ROW、CS、BA、COL} \\
Addr\_win\_1       &35:32  & 读写  & 0xF   &   普通模式或窗口 1 地址命中及配置
                                           Bit [3:2]：窗口使用 DRAM 的 Bank 数
                                           11 – 8 bank；10 – 4 bank；01 – 2 bank；00 – 保留
                                           Bit [1:0]：窗口使用 DRAM 位数
                                           11 – 64 位；10 – 32 位；01 – 16 位；00 – 保留 \\
Cs\_diff\_1        &27:24  & 读写  & 0x0   &   普通模式或窗口 1 实际使用 CS 译码前地址与 2 之差
                                           当 Pm\_nc 有效时，
                                           对于 64 位窗口，应该为 2；
                                           对于 32 位窗口，应该为 1；
                                           对于 16 位窗口，应该为 0 \\
Row\_diff\_1       &19:16  & 读写  & 0x2   &   普通模式或窗口 1 实际使用行地址线个数与 16 之差这个值等于 16 – 实际使用的行地址线个数 \\
Ba\_diff\_1        &9:8    & 读写  & 0x0   &   普通模式或窗口 1 实际使用的 BA 线个数与 3 之差这个值等于 3 – 实际使用的 BA 线个数 \\
Col\_diff\_1       & 3:0   &  读写 &  0x6  &    普通模式或窗口 1 实际使用列地址线个数与 16 之差这个值等于 16 – 实际使用的列地址线个数 \\
  \multicolumn{5}{l}{0x220} \\ \hhline
Slowpd\_age       & 63:48 &  读写 & 0x0008&   Slow Powerdown 低功耗状态计数器 \\
Cs\_place\_2       & 40:40 &  读写 &  0x0  &    普通模式或窗口 2 译码时 CS 在地址中的位置
                                            0 – 译码方式为{CS、ROW、BA、COL}
                                            1 – 译码方式为{ROW、CS、BA、COL} \\
Addr\_win\_2       & 35:32 &  读写 &  0xF  &    普通模式或窗口 2 地址命中及配置
                                            Bit [3:2]：窗口使用 DRAM 的 Bank 数
                                            11 – 8 bank；10 – 4 bank；01 – 2 bank；00 – 保留
                                            Bit [1:0]：窗口使用 DRAM 位数
                                            11 – 64 位；10 – 32 位；01 – 16 位；00 – 保留 \\
Cs\_diff\_2        & 27:24 &  读写 &  0x0  &    普通模式或窗口 2 实际使用 CS 译码前地址与 2 之差
                                            当 Pm\_nc 有效时，
                                            对于 64 位窗口，应该为 2；
                                            对于 32 位窗口，应该为 1；
                                            对于 16 位窗口，应该为 0 \\
Row\_diff\_2       & 19:16 &  读写 &  0x2  &    普通模式或窗口 2 实际使用行地址线个数与 16 之差这个值等于 16 – 实际使用的行地址线个数 \\
Ba\_diff\_2        & 9:8   &  读写 &  0x0  &    普通模式或窗口 2 实际使用的 BA 线个数与 3 之差这个值等于 3 – 实际使用的 BA 线个数 \\
Col\_diff\_2       & 3:0   &  读写 &  0x6  &    普通模式或窗口 2 实际使用列地址线个数与 16 之差这个值等于 16 – 实际使用的列地址线个数 \\
  \multicolumn{5}{l}{0x228}                                      \\
Selfref\_age      & 63:48 &  读写 &0x0008 &  Selfrefresh 低功耗状态计数器 \\
Cs\_place\_3       & 40:40 &  读写 &  0x0  &    普通模式或窗口 3 译码时 CS 在地址中的位置
                                            0 – 译码方式为{CS、ROW、BA、COL}
                                            1 – 译码方式为{ROW、CS、BA、COL} \\
Addr\_win\_3       & 35:32 &  读写 &  0xF  &    普通模式或窗口 3 地址命中及配置
                                            Bit [3:2]：窗口使用 DRAM 的 Bank 数
                                            11 – 8 bank；10 – 4 bank；01 – 2 bank；00 – 保留
                                            Bit [1:0]：窗口使用 DRAM 位数
                                            11 – 64 位；10 – 32 位；01 – 16 位；00 – 保留 \\
Cs\_diff\_3        & 27:24 &  读写 &  0x0  &     普通模式或窗口 3 实际使用 CS 译码前地址与 2 之差
                                             当 Pm\_nc 有效时，
                                             对于 64 位窗口，应该为 2；
                                             对于 32 位窗口，应该为 1；
                                             对于 16 位窗口，应该为 0 \\
Row\_diff\_3       & 19:16 &  读写 &  0x2  &     普通模式或窗口 3 实际使用行地址线个数与 16 之差这个值等于 16 – 实际使用的行地址线个数 \\
Ba\_diff\_3        & 9:8   &  读写 &  0x0  &     普通模式或窗口 3 实际使用的 BA 线个数与 3 之差这个值等于 3 – 实际使用的 BA 线个数 \\
Col\_diff\_3       & 3:0   &  读写 &  0x6  &     普通模式或窗口 3 实际使用列地址线个数与 16 之差这个值等于 16 – 实际使用的列地址线个数 \\
  \multicolumn{5}{l}{0x230}                                      \\
Win\_mask\_0    & 59:32 &  读写 &\small 0xFFFFF00 &   0 号窗口 MASK，对应地址[47:20] \\
Win\_base\_0    & 27:0  &  读写 &\small0x0000000 &  0 号窗口 BASE，对应地址[47:20] \\
  \multicolumn{5}{l}{0x238}                                      \\
Win\_mask\_1    & 59:32 &  读写 &\small 0xFFFFF00 &   1 号窗口 MASK，对应地址[47:20] \\
Win\_base\_1    & 27:0  &  读写 &\small 0x0000100 &  1 号窗口 BASE，对应地址[47:20] \\
  \multicolumn{5}{l}{0x240}                                       \\
Win\_mask\_2    & 59:32 &  读写 &\small 0xFFFFF00 &   2 号窗口 MASK，对应地址[47:20] \\
Win\_base\_2    & 27:0  &  读写 &\small 0x0000200 &  2 号窗口 BASE，对应地址[47:20] \\
  \multicolumn{5}{l}{0x248}                                       \\
Win\_mask\_3    & 59:32 &  读写 &\small 0xFFFFF00 &   3 号窗口 MASK，对应地址[47:20] \\
Win\_base\_3    & 27:0  &  读写 &\small 0x0000300 &  3 号窗口 BASE，对应地址[47:20] \\
  \multicolumn{5}{l}{0x250}                                      \\
Cmd\_monitor      & 55:48 &  读写 &  0x0  &     Bit 7：使能命令队列 3 监控功能
                                                Bit 6：复位命令队列 3 性能计数值
                                            Bit 5：使能命令队列 2 监控功能
                                            Bit 4：复位命令队列 2 性能计数值
                                            Bit 3：使能命令队列 1 监控功能
                                            Bit 2：复位命令队列 1 性能计数值
                                            Bit 1：使能命令队列 0 监控功能
                                            Bit 0：复位命令队列 0 性能计数值 \\
Axi\_monitor      & 41:32 &  读写 &  0x0  &    使能 AXI 命令队列性能监控，每两位控制一个 AXI 监控模块，控制方法与 Cmd\_monitor 相同 \\
Ecc\_code         & 31:24 &  只读 &  0x0  &    第一次发生 ECC 错误时从内存读出的校验码
                                            记 录 的 出 错 信 息 的 时 机 由 Int\_vector[0] 或
                                            Int\_vector[1]由 0 变 1 时触发，使用 Ecc\_enable[3]进行配置 \\
Ecc\_enable       & 18:16 &  读写 &  0x0  &    ECC 功能使能
                                            Bit-3：设置保存 ECC 出错信号时机
                                                 0 - 出现 ECC 错时触发；1 – 出现两位错时触发
                                            Bit-2：使能写时 ECC 校验错的内部总线报错（异常）
                                            Bit-1：使能读时 ECC 校验错的内部总线报错（异常）
                                            Bit-0：使能 ECC 功能（只在 64 位模式下有效） \\
Int\_vector       & 9:8   &  读写 &  0x0  &    中断向量寄存器
                                            Bit-1：ECC 两位校验错
                                            Bit-0：ECC 校验错（包括一位错与两位错）
                                            对这个寄存器的读操作将得到当前的 ECC 出错情况，
                                            对这个寄存器的“写 1”操作将清除对应的位 \\
Int\_enable       & 1:0   &  读写 &  0x0  &    中断使能寄存器
                                            Bit-1：ECC 两位较验错中断使能
                                            Bit-0：ECC 较验错中断使能（包括一位错与两位错） \\
  \multicolumn{5}{l}{0x258}                                      \\
  \multicolumn{5}{l}{0x260}                                      \\
Ecc\_addr         & 63:0  &  只读 &  0x0  &    第一次发生 ECC 错误时向内存读的出错地址
                                            记 录 的 出 错 信 息 的 时 机 由 Int\_vector[0] 或
                                            Int\_vector[1]由 0 变 1 时触发，使用 Ecc\_enable[3]进
                                            行配置 \\
  \multicolumn{5}{l}{0x268}                                      \\
Ecc\_data         & 63:0  &  只读 &  0x0  &     第一次发生 ECC 错误时从内存读出的数据
                                                记 录 的 出 错 信 息 的 时 机 由 Int\_vector[0] 或
                                                Int\_vector[1]由 0 变 1 时触发，使用 Ecc\_enable[3]进
                                                行配置 \\
  \multicolumn{5}{l}{0x270}                                      \\
Lpbk\_ecc\_mask    &58:57  & 只读  & 0x0   &    自循环测试第一次出错时的 ECC MASK 值
                                            Bit 1：对应于 ECC MASK 的上升沿数据
                                            Bit 0：对应于 ECC MASK 的下降沿数据 \\
Prbs\_init        &54:32  & 只写  & 0x10  &    自循环测试时使用的 PRBS 初始值 \\
Lpbk\_error       &25:25  & 只读  & 0x0   &    自循环测试出错 \\
Prbs\_23          &16:16  & 读写  & 0x0   &    自循环测试时使用的编码方式 1 – PRBS 23 0 – PRBS 7 \\
Lpbk\_start       &8:8    & 读写  & 0x0   &    自循环测试开始 \\
Lpbk\_en          &0:0    & 读写  & 0x0   &    自循环测试模式使能 \\
  \multicolumn{5}{l}{0x278}                                      \\
Lpbk\_ecc         &63:49  & 只读  & 0x0   &    自循环测试第一次出错时的 ECC 值
                                            Bit [63:57]：对应于 ECC 的上升沿数据的低 15 位
                                            Bit [56:49]：对应于 ECC 的下降沿数据 \\
Lpbk\_data\_mask   &48:33  & 只读  & 0x0   &    自循环测试第一次出错时的 DQM 值
                                            Bit [48:41]：对应于 DQM 的上升沿数据
                                            Bit [40:33]：对应于 DQM 的下降沿数据 \\
Lpbk\_correct     &32:17  & 只读  & 0x0   &    自循环测试第一次出错时的 PRBS 编码
                                            Bit [32:25]：对应于上升沿数据
                                            Bit [24:17]：对应于下降沿数据 \\
Lpbk\_counter     &16:1   & 只读  & 0x0   & 自循环测试第一次出错时的计数周期 \\
  \multicolumn{5}{l}{0x280}                                      \\
Lpbk\_data\_r      &63:0   & 只读  & 0x0   & 自循环测试第一次出错时的 DQ 上升沿数据 \\
  \multicolumn{5}{l}{0x288}                                      \\
Lpbk\_data\_f      &63:0   & 只读  & 0x0   & 自循环测试第一次出错时的 DQ 下降沿数据 \\
  \multicolumn{5}{l}{0x290}                                      \\
Axi0\_bw\_w        &63:32  & 只读  & 0x0   & AXI0 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Axi0\_bw\_r        &31:0   & 只读  & 0x0   & AXI0 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x298}                                      \\
Axi0\_latency\_w   &63:32  & 只读  & 0x0   & AXI0 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Axi0\_latency\_r   &31:0   & 只读  & 0x0   & AXI0 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
  \multicolumn{5}{l}{0x2A0}                                      \\
Axi1\_bw\_w        &63:32  & 只读  & 0x0   & AXI1 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Axi1\_bw\_r        &31:0   & 只读  & 0x0   & AXI1 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x2A8}                                      \\
Axi1\_latency\_w   &63:32  & 只读  & 0x0   & AXI1 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Axi1\_latency\_r   &31:0   & 只读  & 0x0   & AXI1 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
  \multicolumn{5}{l}{0x2B0}                                      \\
Axi2\_bw\_w        &63:32  & 只读  & 0x0   & AXI2 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Axi2\_bw\_r        &31:0   & 只读  & 0x0   & AXI2 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x2B8}                                      \\
Axi2\_latency\_w   &63:32  & 只读  & 0x0   & AXI2 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Axi2\_latency\_r   &31:0   & 只读  & 0x0   & AXI2 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
  \multicolumn{5}{l}{0x2C0}                                      \\
Axi3\_bw\_w        &63:32  & 只读  & 0x0   & AXI3 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Axi3\_bw\_r        &31:0   & 只读  & 0x0   & AXI3 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x2C8}                                      \\
Axi3\_latency\_w   &63:32  & 只读  & 0x0   & AXI3 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Axi3\_latency\_r   & 31:0  &  只读 &  0x0  & AXI3 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
  \multicolumn{5}{l}{0x2D0}                                      \\
Axi4\_bw\_w        & 63:32 &  只读 &  0x0  & AXI4 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Axi4\_bw\_r        & 31:0  &  只读 &  0x0  & AXI4 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x2D8}                                      \\
Axi4\_latency\_w   & 63:32 &  只读 &  0x0  & AXI4 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Axi4\_latency\_r   & 31:0  &  只读 &  0x0  & AXI4 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
  \multicolumn{5}{l}{0x2E0}                                      \\
Cmdq0\_bw\_w       & 63:32 &  只读 &  0x0  & 命令队列 0 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Cmdq0\_bw\_r       & 31:0  &  只读 &  0x0  & 命令队列 0 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x2E8}                                      \\
Cmdq0\_latency\_w  & 63:32 &  只读 &  0x0  & 命令队列 0 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Cmdq0\_latency\_r  & 31:0  &  只读 &  0x0  & 命令队列 0 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
  \multicolumn{5}{l}{0x2f0}                                      \\
Cmdq1\_bw\_w       & 63:32 &  只读 &  0x0  & 命令队列 1 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Cmdq1\_bw\_r       & 31:0  &  只读 &  0x0  & 命令队列 1 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x2f8}                                      \\
Cmdq1\_latency\_w  & 63:32 &  只读 &  0x0  & 命令队列 1 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Cmdq1\_latency\_r  & 31:0  &  只读 &  0x0  & 命令队列 1 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
  \multicolumn{5}{l}{0x300}                                      \\
Cmdq2\_bw\_w       & 63:32 &  只读 &  0x0  & 命令队列 2 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Cmdq2\_bw\_r       & 31:0  &  只读 &  0x0  & 命令队列 2 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x308}                                      \\
Cmdq2\_latency\_w  & 63:32 &  只读 &  0x0  & 命令队列 2 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Cmdq2\_latency\_r  & 31:0  &  只读 &  0x0  & 命令队列 2 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
  \multicolumn{5}{l}{0x310}                                      \\
Cmdq3\_bw\_w       & 63:32 &  只读 &  0x0  & 命令队列 3 写带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
Cmdq3\_bw\_r       & 31:0  &  只读 &  0x0  & 命令队列 3 读带宽性能计数值表示 64K 个时钟周期里总线数据有效的周期数 \\
  \multicolumn{5}{l}{0x318}                                      \\
Cmdq3\_latency\_w  & 63:32 &  只读 &  0x0  & 命令队列 3 写延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
Cmdq3\_latency\_r  & 31:0  &  只读 &  0x0  & 命令队列 3 读延迟性能计数值这个值表示 64K 个访问的总延迟周期之和 \\
\end{longtable}

DDR2/3 SDRAM 软件编程指南
-------------------------

### 初始化操作

初始化操作由软件向寄存器 Init_start（0x018）写入 1 时开始，在设置 Init_start
信号之 前，必须将其它所有寄存器设置为正确的值。 软硬件协同的 DRAM
初始化过程如下：

 1. 软件向所有的寄存器写入正确的配置值，但是 Init_start（0x018）在这一过程中必
    须保持为 0；
 1. 软件将 Init_start（0x018）设置为 1，这将导致硬件初始化的开始；
 1. PHY 内部开始初始化操作，DLL 将尝试进行锁定操作。如果锁定成功，则可以从
    Dll_init_done（0x000）读出对应状态，并可以从 Dll_value_ck（0x000）读写当前
    锁定延迟线个数；如果锁定不成功，则初始化不会继续进行（此时可以通过设置
    Dll_bypass（0x018）使得初始化继续执行）；
 1. DLL 锁定（或者 bypass 设置）之后，控制器将根据对应 DRAM 的初始化要求向 DRAM
    发出相应的初始化序列，例如对应的 MRS 命令，ZQCL 命令等等；
 1. 软件可以通过采样 Dram_init（0x160）寄存器来判断内存初始化操作是否完成。

### Leveling

Leveling 操作是在 DDR3 中，用于智能配置内存控制器读写操作中各种信号间相位关系的
操作。通常它包括了 Write Leveling、Read Leveling 和 Gate Leveling。在本控制器中
，只实现了 Write Leveling 与 Gate Leveling，Read Leveling 没有实现，软件需要通
过判断读写的正确性来实现 Read Leveling 所完成的功能。除了在 Leveling 过程中操作
的 DQS 相位、 GATE 相位之外，还可以根据这些最后确认的相位来计算出写 DQ 相位、读
DQ 相位的配置方法。 Write Leveling

Write Leveling 用于配置写 DQS 与时钟之间的相位关系，软件编程需要参照如下步骤。

    (1) 完成控制器初始化，参见上一小节内容；
    (2) 将 Dll_wrdqs_x（x = 0…8）设置为 0；
    (3) 设置 Lvl_mode（0x180）为 2’b01；
    (4) 采样 Lvl_ready（0x180）寄存器，如果为 1，表示可以开始 Write Leveling 请求；
    (5) 设置 Lvl_req（0x180）为 1；
    (6) 采样 Lvl_done（0x180）寄存器，如果为 1，表示一次 Write Leveling 请求完成；
    (7) 采样 Lvl_resp_x（0x180、0x188）寄存器，如果为 0 则跳至步骤(8)。否则(采
        样 Lvl_resp_x 结果为 1)，将对应的 Dll_wrdqs_x[6:0]增加 1，并重复执行
        5-7 直至采样 Lvl_resp_x 结果为 0；
    (8) 采样 Lvl_resp_x（0x180、0x188）寄存器，如果为 0，则将对应的 Dll_wrdqs_x[6:0]
        增加 1，并重复执行步骤 5，6，8 直至采样 Lvl_resp_x 结果为 1；
    (9) 此时 Dll_wrdqs_x 的值就应该是正确的设置值。至此 Write Leveling 操作结束。
    (10) 接着根据 Dll_wrdqs_x 的值是否小于 0x40 来设置 Wrdqs_lt_half_x；
    (11) 根据 Dll_wrdqs_x 的值是否小于 0x20 来设置 Dll_wrdata_x。如果
         Dll_wrdqs_x > 0x20，Dll_wrdata_x = Dll_wrdqs_x – 0x20，否则
         Dll_wrdata_x = Dll_wrdqs_x + 0x60；
    (12) 根据 Dll_wrdata_x 的值是否小于 0x40 来设置 Wrdata_lt_half_x；
    (13) 接下来需要根据 DIMM 类型进行不同的操作
         对于 UDIMM，Slice0-7 的 Dll_wrdata 的值依次增大(当跨越 0x7F 边界时也视
         为依次增大)。如果所有 Wrdq_lt_half_x 都为 1，即所有 Dll_wrdata_x 都小
         于 0x40，则将 tPHY_WRDATA 与 tRDDATA 的值减 1；如果有的 Wrdq_lt_half_x
         为 1，有的 Wrdq_lt_half_x 为 0，即 Dll_wrdata_x 的值有跨越 0x40 边界的
         情况，则将 0x40 边界右边(不一定是大于 0x40，因为有可能有的
         Dll_wrdata_x 的值跨越 0x7F 边界)的 Slice 对应的 Wrdq_clkdelay_x 设为 1
         ，然后将 tPHY_WRDATA 与 tRDDATA 的值减 1；如果所有 Wrdq_lt_half_x 都为
         0，即所有 Dll_wrdata_x 都大于等于 0x40，不做任何处理。
         对于 RDIMM，tPHY_WRDATA 与 tRDDATA 的默认配置值需要在 UDIMM 的基础上增
         加 1 。然后分别对于 Slice8,3,2,1,0 和 Slice4,5,6,7 作同 UDIMM 的处理。
    (14) 将 Lvl_mode（0x180）设置为 2’b00，退出 Write Leveling 模式；

Gate Leveling

Gate Leveling 用于配置控制器内使能采样读 DQS 窗口的时机，软件编程参照如下步骤。

(1) 完成控制器初始化，参见上一小节内容；
    (2) 完成 Write Leveling，参见上一小节内容；
    (3) 将 Dll_gate_x（x = 0…8）设置为 0；
    (4) 设置 Lvl_mode（0x180）为 2’b10；
    (5) 采样 Lvl_ready（0x180）寄存器，如果为 1，表示可以开始 Gate Leveling 请求；
    (6) 设置 Lvl_req（0x180）为 1；
    (7) 采样 Lvl_done（0x180）寄存器，如果为 1，表示一次 Gate Leveling 请求完成；
    (8) 采样 Lvl_resp_x[0]（0x180、0x188）寄存器。如果第一次采样发现 Lvl_resp_x[0]为
1，则将对应的 Dll_gate_x[6:0]增加 1，并重复执行 6-8，直至采样结果为 0，否则进行下一
步。在这个过程中如果 Dll_gate_x[6:0]的值增加到 0x7F 还没采样到 Lvl_resp_x[0]为 0，则将
对应的 Rd_oe_begin_x 和 Rd_oe_end_x 增加 1；
    (9) 采样 Lvl_resp_x[0]（0x180、0x188）寄存器，如果采样结果为 0，则将对应的
Dll_gate_x[6:0]增加 1，并重复执行 6、7、9，直至采样结果 1，则表示 Gate Leveling 操作已
经成功；
    至此 Gate Leveling 操作结束，此时 Dll_gate_x[6:0]与 Dll_wrdata_x[6:0]的和实际上就是
读 DQS 相对于 PHY 内部时钟的相位关系。下面根据 Leveling 的结果对各个参数进行调整。
    (10) 如果 Dll_gate_x[6:0]与 Dll_wrdata_x[6:0]的和小于 0x20 或者大于 0x60，那么
Dll_rddqs_lt_halt 设置为 1。因为 rddqs 的相位关系实际上等于在输入的读 DQS 基础上再延
迟 1/4。
    (11) 此时如果 Dll_gate_x 的值大于 0x20，则将 Dll_gate_x 的值减去 0x20；否则将其设
为 0 即可。
    (12) 调整完毕后，再分别进行两次 Lvl_req 操作，观察 Lvl_resp_x[7:5]与 Lvl_resp_x[4:2]
的值变化，如果各增加为 Burst_length/2，则继续进行第 13 步操作；如果不为 Burst_length/2，
可能需要对 Rd_oe_begin_x 进行加一或减一操作，如果大于 Burst_length/2，很可能需要对
Dll_gate_x 的值进行一些微调
    (13) 将 Lvl_mode（0x180）设置为 2’b00，退出 Gate Leveling 模式；

### 单独发起 MRS 命令

内存控制器向内存发出的 MRS 命令次序分别为：

            MR2_CS0、MR2_CS1、MR2_CS2、MR2_CS3、
            MR3_CS0、MR3_CS1、MR3_CS2、MR3_CS3、
            MR1_CS0、MR1_CS1、MR1_CS2、MR1_CS3、
            MR0_CS0、MR1_CS1、MR1_CS2、MR1_CS3。

其中，对应 CS 的 MRS 命令是否有效，是由 Cs_mrs 决定，只有 Cs_mrs 上对应每个片
选的位有效，才会真正向 DRAM 发出这个 MRS 命令。对应的每个 MR 的值由寄存器
Mr\*\_cs\* 决定。这些值同时也用于初始化内存时的 MRS 命令。具体操作如下：

  (1) 将寄存器 Cs_mrs（0x168）、Mr\*\_cs\*（0x190 – 0x1B8）设置为正确的值；
  (2) 设置 Command_mode（0x190）为 1，使控制器进入命令发送模式；
  (3) 采样 Status_cmd（0x190），如果为 1，则表示控制器已进入命令发送模式，可以
      进行下一步操作，如果为 0，则需要继续等待；
  (4) 写 Mrs_req（0x198）为 1，向 DRAM 发送 MRS 命令；
  (5) 采样 Mrs_done（0x198），如果为 1，则表示 MRS 命令已经发送完毕，可以退出，
      如果为 0，则需要继续等待；
  (6) 设置 Command_mode（0x190）为 0，使控制器退出命令发送模式。

### 任意操作控制总线

内存控制器可以通过命令发送模式向 DRAM 发出任意的命令组合，软件可以设置 Cmd_cs、
Cmd_cmd、Cmd_ba、Cmd_a（0x190），在命令发送模式下向 DRAM 发出。具体操作如下：

  (1) 将寄存器 Cmd_cs、Cmd_cmd、Cmd_ba、Cmd_a（0x190）设置为正确的值；
  (2) 设置 Command_mode（0x190）为 1，使控制器进入命令发送模式；
  (3) 采样 Status_cmd（0x190），如果为 1，则表示控制器已进入命令发送模式，可以
      进行下一步操作，如果为 0，则需要继续等待；
  (4) 写 Cmd_req（0x190）为 1，向 DRAM 发送命令；
  (5) 设置 Command_mode（0x190）为 0，使控制器退出命令发送模式。

### 自循环测试模式控制

自循环测试模式可以分别在测试模式下或者正常功能模式下使用，为此，本内存控制器分
别实现了两套独立的控制接口，一套用于在测试模式下由测试端口直接控制，另一套用于
在正常功能模式下由寄存器配置模块进行配置使能测试。

这两套接口的复用使用端口 test_phy 进行控制，当 test_phy 有效时，使用控制器的
test_\* 端口进行控制，此时的自测试完全由硬件控制；当 test_phy 无效时，使用软件
编程的 pm_\* 的参数进行控制。使用测试端口的具体信号含义可以参考寄存器参数中的同
名部分。

这两套接口从控制的参数来说基本一致，仅仅是接入点不同，在此介绍软件编程时的控制
方法。具体操作如下：

  (1) 将内存控制器所有的参数全部正确设置。需要注意的是， Dqs_oe_begin_\*
      、 Dqs_oe_end_\* 应该设为 0，Rd_oe_begin_\*、Rd_oe_end_\* 应该设为 1 或 2
      ，否则可能会导致测试出错；
  (2) 将寄存器 Lpbk_en（0x270）设为 1；
  (3) 将寄存器 Init_start（0x018）设为 1；
  (4) 采样寄存器 Dll_init_done（0x000），如果这个值为 1，表示 DLL 已经锁定，可
      以进行下一步操作；如果这个值为 0，则需要继续等待；（当使用测试端口进行控
      制的时候，因为看不到这个寄存器的输出，所以不需要采样这个寄存器，而只需要
      在此处等待一定的时间，以确保 DLL 锁定完成，再进行下一步操作）；
  (5) 将寄存器 Lpbk_start（0x270）设为 1；此时自循环测试正式开始。到此为止自循
      环测试已经开始，软件需要经常检测是否有错误发生，具体操作如下：
  (6) 采样寄存器 Lpbk_error（0x270），如果这个值为 1，表示有错误发生，此时可以通
      过 Lpbk_\*等观测用寄存器（0x270、0x278、0x280、0x288）来观测第一个出错时
      的错误数据和正确数据；如果这个值为 0，表示还没有出现过数据错误。

### 细粒度多通道模式控制

硬件连接

需要使用细粒度多通道模式，硬件连接时每个 CS/ODT 连接 16 位 DQ，也即 CS0/ODT0 对
应 DQ[15:0]，CS1/ODT1 对应 DQ[31:16]，CS2/ODT2 对应 DQ[47:32]，CS3/ODT3 对应
DQ[63:48]。地址线与其它控制线连接所有内存颗粒。

软件编程

进行软件初始化时，与普通模式时不同的是，需要打开所有的 Cs_enable、Cs_mrs、
Lvl_cs，以便对所有的颗粒进行初始化及 Leveling 操作。需要将 Rdfifo_valid 设为 0
，并正确设置 tPHY_RDLAT 的值。接下来按照需要设置四个
Addr_win/Cs_diff/Row_diff/Ba_diff/Col_diff 的值。四组不同的窗口每组表示总地址空
间的 1/4。需要进行分别配置。

### ECC 功能使用控制

ECC 功能只有在 64 位模式下可以使用。Ecc_enable 包括以下 4 个控制位：

 - Ecc_enable[0]控制是否使能 ECC 功能，只有设置了这个有效位，才会使能 ECC 功能。
 - Ecc_enable[1]控制是否通过处理器内部的读响应通路进行报错，以使得出现 ECC 两位
   错的读访问能立即导致处理器核的异常发生。
 - Ecc_enable[2]控制是否通过处理器内部的写响应通路进行报错，以使得出现 ECC 两位
   错的写访问（读后写）能立即导致处理器核的异常发生。
 - Ecc_enable[3]控制寄存器内记录出错信息的触发时机。这些出错信息在没有软件进行
   处理的情况下不会连续触发，只会记录第一次出错时的信息。这些信息包括 Ecc_code
   ， Ecc_addr，Ecc_data。当 Ecc_enable[3]为 0 的情况下，只要出现了 ECC 错误（
   包括 1 位错与 2 位错），这个记录就会被触发，当 Ecc_enable[3]为 1 的情况下，
   只有出现了 ECC 两位错，这个记录才会被触发。而这个“第一次”指的是中断向量寄存
   器的对应位被置位。也就是说，记录的是导致中断发生的那一次访问。

除此之外，ECC 出错还可以通过中断方式通知处理器核。这个中断通过 Int_enable 进行
控制。中断包括两个向量，Int_vector[0]表示出现 ECC 错误（包括 1 位错与 2 位错）
， Int_vecotr[1] 表示出现 ECC 两位错。Int_vector 的清除通过向对应位写 1 实现。

### 32/16 位窄通道使用控制

除了 64 位模式，通过配置还可以将内存控制器置于 32 位或者 16 位工作模式，具体的
配置如下。

 - 32 位模式：
     1. 将寄存器 Nc（0x1F0）设为 0x5；
     1. 将寄存器 Addr_win_\*（0x210，0x218，0x220，0x228）设为 0xe；
     1. 将寄存器 Cs_diff_\*（0x210，0x218，0x220，0x228）设为 0x1。
 - 16 位模式：
     1. 将寄存器 Nc（0x1F0）设为 0x3；
     1. 将寄存器 Addr_win_\*（0x210，0x218，0x220，0x228）设为 0xd；
     1. 将寄存器 Cs_diff_\*（0x210，0x218，0x220，0x228）设为 0x0。

