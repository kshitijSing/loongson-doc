电气特性
========

\newcommand{\n}{\newline}

通用电器特性
------------

### 绝对最大额定值

Table: 绝对最大额定值

| Parameter    | Description           | Min.  | Max. |
|--------------|-----------------------|-------|------|
| VDD          | 处理器核电源          | -0.3V | 1.2V |
| VDD_N0/1     | 处理器节点 0/1 电源   | -0.3V | 1.5V |
| VDDE1V8      | 处理器 IO 电源        | -0.3V | 2.0V |
| MEM_VDDE_0/1 | DDR2 通道 0/1 IO 电源 | -0.3V | 2.3V |
|              | DDR3 通道 0/1 IO 电源 | -0.3V | 1.8V |
| HT_VDDE      | HT IO 电源            | -0.3V | 1.3V |
| Tstg         | 存储温度              | -55C  | 150C |

### 推荐直流工作条件

Table: 推荐直流工作条件

| Parameter      | Description         | Min.  | Typ.  | Max.  |
|----------------|---------------------|-------|-------|-------|
| VDD            | 处理器核电源        | 1.05V | 1.05V | 1.15V |
| VDD_N0/1       | 处理器节点 0/1 电源 | 1.00V | 1.10V | 1.3V  |
| VDDE1V8        | 处理器 IO 电源      | 1.71V | 1.80V | 1.89V |
| CORE_PLL_AVDD  | 核心 PLL 模拟电源   | 1.1V  | 1.15V | 1.2V  |
| CORE_PLL_DVDD  | 核心 PLL 数字电源   | 1.1V  | 1.15V | 1.2V  |
| CORE_PLL_GND   | 核心 PLL 地         | 0V    | 0V    | 0V    |
| DDR_PLL_AVDD   | DDR PLL 模拟电源    | 1.1V  | 1.15V | 1.2V  |
| DDR_PLL_DVDD   | DDR PLL 数字电源    | 1.1V  | 1.15V | 1.2V  |
| DDR_PLL_GND    | DDR PLL 地          | 0V    | 0V    | 0V    |
| HT0/1_PLL_AVDD | HT0/1 PLL 模拟电源  | 1.1V  | 1.15V | 1.2V  |
| HT0/1_PLL_DVDD | HT0/1 PLL 数字电源  | 1.1V  | 1.15V | 1.2V  |
| HT0/1_PLL_GND  | HT0/1 PLL 地        | 0V    | 0V    | 0V    |

HyperTransport 总线接口特性
---------------------------

### HyperTransport 推荐直流工作条件

Table: HyperTransport 直流工作条件

| Symbol           | Parameter                                                | Min. | Typ. | Max. | Unit |
|------------------|----------------------------------------------------------|------|------|------|------|
| VOD              | Output Differential Voltage                              | 495  | 600  | 715  | mV   |
| DVOD             | Change in VOD from 0 to 1 State                          | -15  | 0    | 15   | mV   |
| VOCM             | Output Common Mode Voltage                               | 495  | 600  | 715  | mV   |
| ∆VOCM            | Change in VOCM from 0 to 1 State                         | -15  | 0    | 15   | mV   |
| VID              | Input Differential Voltage                               | 200  | 600  | 1000 | mV   |
| DVID             | Change in VID from 0 to 1 State                          | -15  | 0    | 15   | mV   |
| VICM             | Input Common Mode Voltage                                | 440  | 600  | 780  | mV   |
| ∆VICM            | Change in VICM from 0 to 1 State                         | -15  | 0    | 15   | mV   |
| RTT              | Input Differential Impedance                             | 90   | 100  | 110  | Ohm  |
| R_ON_ (pull up)  | Output Driver Impedance driving high                     | 45   | 50   | 55   | Ohm  |
| R_ON_ (pulldown) | Output Driver Impedance driving low                      | 45   | 50   | 55   | Ohm  |
| Cout             | Output pad capacitance for devices rated above 800 MT/s. |      |      | 2    | pF   |
|                  | Output pad capacitance for devices rated up to 800 MT/s. |      |      | 5    | pF   |
| Cin              | Input pad capacitance for devices rated above 800 MT/s.  |      |      | 2    | pF   |
|                  | Input pad capacitance for devices rated up to 800 MT/s   |      |      | 5    | pF   |

### HyperTransport 推荐交流工作条件

Table: HyperTransport 交流工作条件

| Symbol | Parameter                        | Min. | Typ. | Max. | Unit |
|--------|----------------------------------|------|------|------|------|
| VOD    | Output Differential Voltage      | 400  | 600  | 820  | mV   |
| DVOD   | Change in VOD from 0 to 1 State  | -75  |      | 75   | mV   |
| VOCM   | Output Common Mode Voltage       | 440  | 600  | 780  | mV   |
| ∆VOCM  | Change in VOCM from 0 to 1 State | -50  |      | 50   | mV   |
| VID    | Input Differential Voltage       | 300  | 600  | 900  | mV   |
| DVID   | Change in VID from 0 to 1 State  | -125 |      | 125  | mV   |
| VICM   | Input Common Mode Voltage        | 385  | 600  | 845  | mV   |
| ∆VICM  | Change in VICM from 0 to 1 State | -100 |      | 100  | mV   |
| TR     | Input Rising Edge Rate           | 1.0  |      | 4.0  | V/ns |
| TF     | Input Falling Edge Rate          | 1.0  |      | 4.0  | V/ns |


### 传输时序特性

    图 7-1 HyperTransport 总线 TODIFF 时序
    图 7-2 HyperTransport 总线 TDIFF 时序
    图 7-3 HyperTransport 总线 TCADV 时序
    图 7-4 HyperTransport 总线 TSU 和 THD 时序
    图 7-5 HyperTransport 总线 TCADVRS / TCADVRH 时序

Table: HyperTransport 连接传输时序规范


------------------------------------------------------------------------------------
  Parameter  Description                          Speed(MT/s)     Min(ps)   Max(ps) 
------------ ----------------------------------- --------------- --------- ---------
  TODIFF     Output differential skew                400,600,800                  70

                                                  1000,1200,1600                  60

  TIDIFF     Input differential skew                 400,600,800                  90

                                                  1000,1200,1600                  65

  TCADV      Transmitter output CAD/CTLOUT valid           400\n     695\n      1805  
             relative to CLKOUT                            600\n     467\n      1200  
                                                           800\n     345\n       905   
                                                          1000\n     280\n       720   
                                                          1200\n     234\n       600   
                                                          1600         166       459   

  TCADVRS    Receiver input CADIN valid time               400\n     460\n           
             to CLKIN                                      600\n     312\n           
                                                           800\n     225\n           
                                                          1000\n     194\n           
                                                          1200\n     166\n           
                                                          1600       116             

  TCADVRH    Receiver input CADIN valid time               400\n     460\n           
             from CLKIN                                    600\n     312\n           
                                                           800\n     225\n           
                                                          1000\n     194\n           
                                                          1200\n     166\n           
                                                          1600       116             

  TSU        Receiver input setup time                     400\n     0\n       250\n 
                                                           600\n     0\n       215\n 
                                                           800\n     0\n       175\n 
                                                          1000\n     0\n       153\n 
                                                          1200\n     0\n       138\n 
                                                          1600       0         110   

  THD        Receiver input hold time                      400\n     0\n       250\n 
                                                           600\n     0\n       215\n 
                                                           800\n     0\n       175\n 
                                                          1000\n     0\n       153\n 
                                                          1200\n     0\n       138\n 
                                                          1600       0         110   
-----------------------------------------------------------------------------------

\clearpage

DDR2 总线内存接口特性
---------------------

### 推荐直流特性

\setlength{\tabcolsep}{2pt}
\begin{table}[htbp]
  \centering
  \caption{推荐的直流工作条件(SSTL\_1.8)}
  \label{tab:ddr-dc-condition}
  \begin{tabular}{>{\tt}c>{\small}lcccc}
                       &                           &               Rating                    &       \\
             Symbol    & Parameter                 & Min.        & Typ.        & Max.        & Units \\
  VDDQ(MEM\_VDDE\_0/1) & Supply Voltage for Output & 1.7         & 1.8         & 1.9         & V     \\
  VREF(MEM\_VREF\_0/1) & Input Reference Voltage   & 0.49 x VDDQ & 0.50 x VDDQ & 0.51 x VDDQ & V     \\
              VTT      & Termination Voltage       & VREF - 0.04 & VREF        & VREF + 0.04 & V     \\
  \end{tabular}
\end{table}
\setlength{\tabcolsep}{6pt}

\begin{table}[htbp]
  \centering
  \caption{输入的直流逻辑电平}
  \label{tab:ddr-dc-input}
  \begin{tabular}{>{\tt}clccc}
    Symbol  & Parameter           & Min.       & Max.       & Units \\
    VIH(dc) & DC input logic HIGH & VREF+0.125 & VDDQ+0.3   & V     \\
    VIL(dc) & DC input logic LOW  & -0.3       & VREF-0.125 & V     \\
  \end{tabular}
\end{table}


\begin{table}[htbp]
\caption{输出直流电流驱动}
\label{tab:ddr-dc-output}
\begin{tabular}{>{\tt}clccc}
  Symbol  & Parameter                        & SSTl\_18 & Units \\
  IOH(dc) & Output Minimum Source DC Current & -13.4    & mA    \\
  IOL(dc) & Output Minimum Sink DC Current   & 13.4     & mA    \\
\end{tabular}
\end{table}

### 推荐的交流特性

\begin{table}[htbp]
\caption{输入交流逻辑电平}
\label{tab:ddr-dc-output}
\begin{tabular}{>{\tt}clccccc}
              &                     & DDR2-400, DDR2-533 & DDR2-667, DDR2-800 & \\
  Symbol      & Parameter           & Min.               & Max.               & Min.       & Max.       & Units \\
  VIH (ac)    & Ac input Logic HIGH & VREF+0.250         & -                  & VREF+0.200 & -          & V     \\
  VIL (ac)    & Ac input Logic LOW  & -                  & VREF-0.250         & -          & VREF-0.200 & V     \\
\end{tabular}
\end{table}

\begin{table}[htbp]
\caption{差分的输入交流逻辑电平}
\label{tab:ddr-dc-output}
\begin{tabular}{>{\tt}clccc}
  Symbol   & Parameter                          & Min.             & Max.             & Units \\
  VID(ac)  & AC differential input voltage      & 0.5              & VDDQ+0.6         & V \\
  VIX (ac) & AC differential crosspoint voltage & 0.5 x VDDQ-0.175 & 0.5 x VDDQ+0.175 & V \\
\end{tabular}
\end{table}

图 7-6 差分的信号电平

\begin{table}[htbp]
\caption{差分的交流输出参数}
\label{tab:ddr-dc-output}
\begin{tabular}{>{\tt}p{5cm}lccc}
  Symbol   & Parameter                          & Min.             & Max.             & Units \\
  VOX (ac) & AC differential crosspoint voltage & 0.5 x VDDQ-0.125 & 0.5 x VDDQ+0.125 & V \\
\end{tabular}
\end{table}


### 电气交流时序特性

\begin{table}[htbp]
\caption{不同密度的器件刷新参数}
\label{tab:refresh-rate}
\begin{tabular}{>{\tt}clcccccc}
Parameter             &  Symbol                     &   256 Mb & 512 Mb   & 1Gb     &  2Gb  & 4Gb    & Units \\
Refresh to active     &  tRFC                       &   75     &  105     & 127.5   &  195  & 327.5  &  ns \\
Refresh command time  &                             &          &          &         &       &        & \\
Average periodic      &  tREFI  0°C≤ TCASE≤85 °C    &    7.8   & 7.8      &  7.8    &  7.8  & 7.8    &   μs \\
refresh interval      &         85°C< TCASE≤95 °C   &    3.9   & 3.9      &  3.9    &  3.9  & 3.9    &   μs \\
\end{tabular}
\end{table}

\begin{table}[htbp]
\caption{DDR2 内存标准速率分级}
\label{tab:refresh-rate}
\begin{tabular}{>{\tt}clcccccccccc}
  Speed bin           & DDR2-800C &       & DDR2-800D &       & DDR2-800E &       & DDR2-667C &       & DDR2-667D &       & \\
  CL-tRCD-tRP         & 4-4-4     &       & 5-5-5     &       & 6-6-6     &       & 4-4-4     &       & 5-5-5     &       & Units \\
      Parameter       & Min.      & Max   & Min.      & Max.  & Min.      & Max.  & Min.      & Max.  & Min.      & Max.  & \\
         tRCD         & 10        & -     & 12.5      & -     & 15        & -     & 12        & -     & 15        & -     & ns \\
         tRP1         & 10        & -     & 12.5      & -     & 15        & -     & 12        & -     & 15        & -     & ns \\
         tRC          & 55        & -     & 57.5      & -     & 60        & -     & 57        & -     & 60        & -     & ns \\
         tRAS         & 45        & 70000 & 45        & 70000 & 45        & 70000 & 45        & 70000 & 45        & 70000 & ns \\
       tCK(avg) @CL=2 & Optional  &       & Optional  &       & Optional  &       & Optional  &       & Optional  &       & ns \\
       tCK(avg) @CL=3 & Optional  &       & Optional  &       & Optional  &       & Optional  &       & Optional  &       & ns \\
       tCK(avg) @CL=4 & 2.5       & 8     & 3.75      & 8     & 3.75      & 8     & 3         & 8     & 3.75      & 8     & ns \\
       tCK(avg) @CL=5 & 2.5       & 8     & 2.5       & 8     & 3         & 8     & 3         & 8     & 3         & 8     & ns \\
       tCK(avg) @CL=6 & Optional  &       & Optional  &       & 2.5       &       & Optional  &       & Optional  &       & ns \\
\end{tabular}
\end{table}

\setlength{\tabcolsep}{2pt}
\begin{longtable}{p{5cm}>{\tt}l*{4}{>{\tt}p{1.9cm}}>{\tt}c}
  \caption{DDR2-667 和 DDR2-800 时序参数} \label{tab:ddr-tsequence} \\ \toprule
              &        & \multicolumn{2}{c}{DDR2-667} & \multicolumn{2}{c}{DDR2-800} & Unit \\
  Parameter   & Symbol & Min.       & Max.            & Min.     & Max. & \\
  \midrule \endfirsthead
  \caption{DDR2-667 和 DDR2-800 时序参数（续）} \\ \toprule
              &        & \multicolumn{2}{c}{DDR2-667} & \multicolumn{2}{c}{DDR2-800} & Unit \\
  Parameter   & Symbol & Min.       & Max.            & Min.     & Max. & \\
  \midrule \endhead
  \rmcol{4}{\tiny 未完待续} \endfoot
  \bottomrule \endlastfoot

  Average clock period                                               & tCK(avg)  & 3000                    & 8000                          & 2500                    & 8000                          & ps \\
  Average clock HIGH pulse width                                     & tCH(avg)  & 0.48                    & 0.52                          & 0.48                    & 0.52                          & tCK(avg) \\
  Average clock LOW pulse width                                      & tCL(avg)  & 0.48                    & 0.52                          & 0.48                    & 0.52                          & tCK(avg) \\
  Write command to DQS associated clock edge                         & WL        & RL - 1                  &                               & RL - 1                  &                               & nCK \\
  DQS latching rising transitions to associated clock edges          & tDQSS     & -0.25                   & 0.25                          & -0.25                   & 0.25                          & tCK(avg) \\
  DQS falling edge to CK setup time                                  & tDSS      & 0.2                     & x                             & 0.2                     & x                             & tCK(avg) \\
  DQS falling edge hold time from CK                                 & tDSH      & 0.2                     & x                             & 0.2                     & x                             & tCK(avg) \\
  DQS input HIGH pulse width                                         & tDQSH     & 0.35                    & x                             & 0.35                    & x                             & tCK(avg) \\
  DQS input LOW pulse width                                          & tDQSL     & 0.35                    & x                             & 0.35                    & x                             & tCK(avg) \\
  Write preamble                                                     & tWPRE     & 0.35                    & x                             & 0.35                    & x                             & tCK(avg) \\
  Write postamble                                                    & tWPST     & 0.4                     & 0.6                           & 0.4                     & 0.6                           & tCK(avg) \\
  Address and control input setup time                               & tIS(base) & 200                     & x                             & 175                     & x                             & ps \\
  Address and control input hold time                                & tIH(base) & 275                     & x                             & 250                     & x                             & ps \\
  Control Address input pulse width for each input                   & tIPW      & 0.6                     & x                             & 0.6                     & x                             & tCK(avg) \\
  DQ and DM input setup time                                         & tDS(base) & 100                     & x                             & 50                      & x                             & ps \\
  DQ and DM input hold time                                          & tDH(base) & 175                     & x                             & 125                     & x                             & ps \\
  DQ and DM input pulse width for each input                         & tDIPW     & 0.35                    & x                             & 0.35                    & x                             & tCK(avg) \\
  DQ output access time from CK/CK                                   & tAC       & -450                    & 450                           & -400                    & 400                           & ps \\
  DQS output access time from CK/CK                                  & tDQSCK    & -400                    & 400                           & -350                    & 350                           & ps \\
  Data-out high-impedance time from CK/CK                            & tHZ       & x                       & tAC, max                      & x                       & tAC, max                      & ps \\
  DQS/DQS low-impedance time from CK/CK                              & tLZ(DQS)  & tAC, min                & tAC, max                      & tAC, min                & tAC, max                      & ps \\
  DQ low-impedance time from CK/CK                                   & tLZ(DQ)   & 2 x tAC, min            & tAC, max                      & 2 x tAC, min            & tAC, max                      & ps \\
  DQS-DQ skew for DQS and associated DQ signals                      & tDQSQ     & x                       & 240                           & x                       & 200                           & ps \\
  CK half pulse width                                                & tHP       & Min(tCH(abs), tCL(abs)) & x                             & Min(tCH(abs), tCL(abs)) & x                             & ps \\
  DQ hold skew factor                                                & tQHS      & X                       & 340                           & x                       & 300                           & ps \\
  DQ/DQS output hold time from DQS                                   & tQH       & tHP - tQHS              & x                             & tHP - tQHS              & x                             & ps \\
  Read preamble                                                      & tRPRE     & 0.9                     & 1.1                           & 0.9                     & 1.1                           & tCK(avg) \\
  Read postamble                                                     & tRPST     & 0.4                     & 0.6                           & 0.4                     & 0.6                           & tCK(avg) \\
  Activate to activate command period for 1KB page size products     & tRRD      & 7.5                     & x                             & 7.5                     & x                             & ns \\
  Activate to activate command period for 2KB page size products     & tRRD      & 10                      & x                             & 10                      & x                             & ns \\
  Four Activate Window for 1KB page size products                    & tFAW      & 37.5                    & x                             & 35                      & x                             & ns \\
  Four Activate Window for 2KB page size products                    & tFAW      & 50                      & x                             & 45                      & x                             & ns \\
  CAS to CAS command delay                                           & tCCD      & 2                       & x                             & 2                       & x                             & nCK \\
  Write recovery time                                                & tWR       & 15                      & x                             & 15                      & x                             & ns \\
  Auto precharge write recovery + precharge time                     & tDAL      & WR + tnRP               & x                             & WR + tnRP               & x                             & nCK \\
  Internal write to read command delay                               & tWTR      & 7.5                     & x                             & 7.5                     & x                             & ns \\
  Internal read to precharge command delay                           & tRTP      & 7.5                     & x                             & 7.5                     & x                             & ns \\
  CKE minimum pulse width (HIGH and LOW pulse width)                 & tCKE      & 3                       & x                             & 3                       & x                             & nCK \\
  Exit self refresh to a non-read command                            & tXSNR     & tRFC + 10               & x                             & tRFC + 10               & x                             & ns \\
  Exit self refresh to a read command                                & tXSRD     & 200                     & x                             & 200                     & x                             & nCK \\
  Exit precharge power down to any command                           & tXP       & 2                       & x                             & 2                       & x                             & nCK \\
  Exit active power down to read command                             & tXARD     & 2                       & x                             & 2                       & x                             & nCK \\
  Exit active power down to read command (slow exit, lower power)    & tXARDS    & 7-AL                    & x                             & 8-AL                    & x                             & nCK \\
  ODT turn-on delay                                                  & tAOND     & 2                       & 2                             & 2                       & 2                             & nCK \\
  ODT turn-on                                                        & tAON      & tAC, min                & tAC, max + 0.7                & tAC, min                & tAC, max + 0.7                & ns \\
  ODT turn-on (Power-Down mode)                                      & tAONPD    & tAC, min + 2            & 2 x tCK(avg) + tAC, max +1    & tAC, min + 2            & 2 x tCK(avg) + tAC, max + 1   & ns \\
  ODT turn-off delay                                                 & tAOFD     & 2.5                     & 2.5                           & 2.5                     & 2.5                           & nCK \\
  ODT turn-off                                                       & tAOF      & tAC, min                & tAC, max + 0.6                & tAC, min                & tAC, max + 0.6                & ns \\
  ODT turn-off (Power-Down mode)                                     & tAOFPD    & tAC, min + 2            & 2.5 x tCK(avg) + tAC, max + 1 & tAC, min + 2            & 2.5 x tCK(avg) + tAC, max + 1 & ns \\
  ODT to power down entry latency                                    & tANPD     & 3                       & x                             & 3                       & x                             & nCK \\
  ODT Power Down Exit Latency                                        & tAXPD     & 8                       &                               & 8                       &                               & nCK \\
  Mode register set command cycle time                               & tMRD      & 2                       & x                             & 2                       & x                             & nCK \\
  MRS command to ODT update delay                                    & tMOD      & 0                       & 12                            & 0                       & 12                            & ns \\
  OCD drive mode output delay                                        & tOIT      & 0                       & 12                            & 0                       & 12                            & ns \\
  Minimum time clocks remains ON after CKE asyn-chronously drops LOW & tDelay    & tIS+ tCK(avg)+ tIH      & X                             & tIS + tCK(avg) + tIH    & x                             & ns \\
\end{longtable}
\setlength{\tabcolsep}{6pt}

DDR3 内存接口特性
-----------------

### 推荐的直流工作条件

\begin{table}[htbp]
  \centering
  \caption{推荐的直流工作条件}
  \label{tab:ddr3-dc}
  \begin{tabular}{>{\tt}clcccc}
   Symbol & Parameter                 & Min.  & Typ. & Max.  & Unit \\
    VDD   & Supply Voltage            & 1.425 & 1.5  & 1.575 & V    \\
   VDDQ   & Supply Voltage for Output & 1.425 & 1.5  & 1.575 & V    \\
  \end{tabular}
\end{table}

### 交流和直流逻辑输入电平

#### 单端信号的交流和直流输入电平 {-}

\begin{table}[htbp]
  \centering
  \caption{控制信号和地址单端信号的交流和直流输入电平}
  \label{tab:ddr3-dc}
  \begin{tabular}{>{\tt}clccc}
                 &                                       & \multicolumn{2}{c}{DDR3-800/1066/1333/1600} & Unit \\
  Symbol         & Parameter                             & Min                     & Max          &      \\
  VIH.CA(DC100)  & DC input logic high                   & Vref + 0.100            & VDD          & V    \\
  VIL.CA(DC100)  & DC input logic low                    & VSS                     & Vref - 0.100 & V    \\
  VIH.CA(AC175)  & AC input logic high                   & Vref + 0.175            & Note 2       & V    \\
  VIL.CA(AC175)  & AC input logic low                    & Note 2                  & Vref - 0.175 & V    \\
  VIH.CA(AC150)  & AC input logic high                   & Vref + 0.150            & Note 2       & V    \\
  VIL.CA(AC150)  & AC input logic low                    & Note 2                  & Vref - 0.150 & V    \\
  VRefCA(DC)     & Reference Voltage for ADD, CMD inputs & 0.49 * VDD              & 0.51 * VDD   & V    \\
  \end{tabular}
\end{table}


\begin{table}[htbp]
  \centering
  \caption{DQ 和 DM 单端信号的交流和直流输入电平}
  \label{tab:ddr3-dc}
  \begin{tabular}{>{\tt}clccccc}
                &                              & \multicolumn{2}{c}{DDR3-800, DDR3-1066} & \multicolumn{2}{c}{DDR3-1333, DDR3-1600} & \\
  Symbol        & Parameter                    & Min          & Max          & Min          & Max          & Unit \\
  VIH.DQ(DC100) & DC input logic high          & Vref + 0.100 & VDD          & Vref + 0.100 & VDD          & V \\
  VIL.DQ(DC100) & DC input logic low           & VSS          & Vref - 0.100 & VSS          & Vref - 0.100 & V \\
  VIH.DQ(AC175) & AC input logic high          & Vref + 0.175 & -            & -            & -            & V \\
  VIL.DQ(AC175) & AC input logic low           & -            & Vref - 0.175 & -            & -            & V \\
  VIH.DQ(AC150) & AC input logic high          & Vref + 0.150 & -            & Vref + 0.150 & -            & V \\
  VIL.DQ(AC150) & AC input logic low           & -            & Vref - 0.150 & -            & Vref - 0.150 & V \\
  VRefDQ(DC)    & Reference Voltage for DQ, DM & 0.49 * VDD   & 0.51 * VDD   & 0.49 * VDD   & 0.51 * VDD   & V \\
  \end{tabular}
\end{table}

#### 差分信号的交流和直流输入电平 {-}

图 7-7 ac-swing 和 ac-level 时间点（tDVA）的差分定义

\begin{table}[htbp]
  \centering
  \caption{交流和直流的差分输入电平}
  \label{tab:ddr3-dc}
  \begin{tabular}{>{\tt}clccc} \toprule
               &                              & \multicolumn{2}{c}{DDR3-800,1066}           &      \\ \cline{3-4}
  Symbol       & Parameter                    & Min                  & Max                  & Unit \\ \midrule
  VIHdiff      & Differential input high      & + 0.200              & note 3               & V    \\
  VILdiff      & Differential input logic low & Note 3               & - 0.200              & V    \\
  VIHdiff(ac)  & Differential input high ac   & 2 x (VIH(ac) - Vref) & Note 3               & V    \\
  VILdiff(ac)  & Differential input low ac    & note 3               & 2 x (VIL(ac) - Vref) & V    \\ \bottomrule
  \end{tabular}
\end{table}

#### 差分信号输入的交叉点电压 {-}

为了保证严格的建立和保持时钟和选通时间以及输出偏差参数，每个交叉点电压的差
分输入信号（CK，CK＃和DQS，DQS＃）必须满足表 28 的要求。差分输入的交叉点电压
VIX的测量是从实际的交叉点的和补偿信号的VDD和VSS之间的中间点处获得。

图 7-8 Vix 定义

表 7-18 差分输入信号(CK, DQS)交叉点电压

\begin{table}[htbp]
  \centering
  \caption{交流和直流的差分输入电平}
  \label{tab:ddr3-dc}
  \begin{tabular}{>{\tt}cp{8cm}ccc} \toprule
         &                                                                        & \multicolumn{2}{c}{DDR3-800, DDR3-1066,} & \\
         &                                                                        & \multicolumn{2}{c}{DDR3-1333, DDR3-1600} & \\ \cline{3-4}
  Symbol & Parameter                                                              & Min.   & Max. & Unit \\ \midrule
  VIX    & Differential Input Cross Point Voltage relative to VDD/2 for CK,CK\#    & -150  & 150  & mV \\
         &                                                                        & -175   & 175  & mV \\
  VIX    & Differential Input Cross Point Voltage relative to VDD/2 for DQS, DQS\# & -150  & 150  & mV \\ \bottomrule
  \end{tabular}
\end{table}


### 交流和直流逻辑输出电平

#### 单端信号的交流和直流输出电平 {-}

\begin{table}[htbp]
  \centering
  \caption{单端信号的交流直流输出电平}
  \label{tab:ddr3-dc}
  \begin{tabular}{>{\tt}cp{8cm}cc} \toprule
  Symbol  & Parameter                                                 & DDR3-800, 1066, 1333, and 1600 & Unit \\ \midrule
  VOH(DC) & DC output high measurement level (for IV curve linearity) & 0.8 x VDDQ                     & V \\
  VOM(DC) & DC output mid measurement level (for IV curve linearity)  & 0.5 x VDDQ                     & V \\
  VOL(DC) & DC output low measurement level (for IV curve linearity)  & 0.2 x VDDQ                     & V \\
  VOH(AC) & AC output high measurement level (for output SR)          & VTT + 0.1 x VDDQ               & V \\
  VOL(AC) & AC output low measurement level (for output SR)           & VTT - 0.1 x VDDQ               & V \\ \bottomrule
  \end{tabular}
\end{table}


#### 差分信号的交流和直流输出电平



\begin{table}[htbp]
  \centering
  \caption{差分信号的交流和直流输出电平}
  \label{tab:ddr3-dc}
  \begin{tabular}{>{\tt}cp{8cm}cc} \toprule
   Symbol     & Parameter                                                     & DDR3-800, 1066, 1333, and 1600 & Unit \\ \midrule
  VOHdiff(AC) & AC differential output high measurement level (for output SR) & + 0.2 x VDDQ                   & V \\
  VOLdiff(AC) & AC differential output low measurement level (for output SR)  & - 0.2 x VDDQ                   & V \\ \bottomrule
  \end{tabular}
\end{table}

#### 单端信号的输出斜率

作为时序测量的参考负载，单端信号的下降沿和上升沿输出斜率的定义和测量在VOL （AC）
和VOH（AC）之间，如表 7.21 和图 7.9 所示。


表 7-21 单端信号输出斜率的定义

Description                                    	 Measured 	         	 Defined by
                                               	 from     	 to
Single-ended output slew rate for rising edge  	 VOL(AC)  	 VOH(AC) 	 [VOH(AC) -VOL(AC)] / DeltaTRse
Single-ended output slew rate for falling edge 	 VOH(AC)  	 VOL(AC) 	 [VOH(AC) - VOL(AC)] / DeltaTFse


图 7-9 单端输出斜率的定义
表 7-22 单端的输出斜率

Parameter                     	 Symbol 	 DDR3-800 	      	 DDR3-1066 	      	 Unit
                              	        	 Min.     	 Max. 	 Min.      	 Max.
Single-ended Output Slew Rate 	 SRQse  	 2.5      	 5    	 2.5       	 5    	 V/ns

#### 差分输出斜率 {-}

\begin{table}[htbp]
  \centering
  \caption{差分输出斜率的定义}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}>{\tt}c>{\tt}cc}
                                                 & \multicolumn{2}{c}{Measured} & \\
  Description                                    & from        & to          & Defined by \\
  Differential output slew rate for rising edge  & VOLdiff(AC) & VOHdiff(AC) & [VOHdiff(AC) - VOLdiff(AC)]/DeltaTRdiff \\
  Differential output slew rate for falling edge & VOHdiff(AC) & VOLdiff(AC) & [VOHdiff(AC) - VOLdiff(AC)]/DeltaTFdiff \\
  \end{tabular}
\end{table}


图 7-10 差分输出斜率的定义



\begin{table}[htbp]
  \centering
  \caption{差分输出斜率}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}>{\tt}cccccccccc}
    &         & \multicolumn{2}{c}{DDR3-800} & \multicolumn{2}{c}{DDR3-1066} & \multicolumn{2}{c}{DDR3-1333} & \multicolumn{2}{c}{DDR3-1600} & \\
    Parameter                     & Symbol  & Min      & Max & Min       & Max & Min       & Max & Min       & Max & Units \\
    Differential Output Slew Rate & SRQdiff & 5        & 10  & 5         & 10  & 5         & 10  & TBD       & 10  & V/ns \\
  \end{tabular}
\end{table}


#### 上冲和下冲的规范 {-}

\begin{table}[htbp]
  \centering
  \caption{地址和控制引脚的交流上冲/下冲规范(A0-A15, BA0-BA3, CS\#, RAS\#, CAS\#, WE\#, CKE, ODT)}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}ccccc}
  Parameter                                           & DR3-800 & DDR3-1066 & DDR3-1333 & DDR3-1600 & Units \\
  Maximum peak amplitude allowed for overshoot area.  & 0.4     & 0.4       & 0.4       & 0.4       & V \\
  Maximum peak amplitude allowed for undershoot area. & 0.4     & 0.4       & 0.4       & 0.4       & V \\
  Maximum overshoot area above VDD                    & 0.67    & 0.5       & 0.4       & 0.33      & V-ns \\
  Maximum undershoot area below VSS                   & 0.67    & 0.5       & 0.4       & 0.33      & V-ns \\
  \end{tabular}
\end{table}

图 7-11 地址和控制的上冲和下冲定义

\begin{table}[htbp]
  \centering
  \caption{时钟，数据，选通和屏蔽信号的交流上冲/下冲规范(CK,CK\#,DQ,DQS,DQS\#,DM)}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}ccccc}
                                                      & DDR3-800 & DDR3-1066 & DDR3-1333 & DDR3-1600 & Units \\
  Maximum peak amplitude allowed for overshoot area.  & 0.4      & 0.4       & 0.4       & 0.4       & V \\
  Maximum peak amplitude allowed for undershoot area. & 0.4      & 0.4       & 0.4       & 0.4       & V \\
  Maximum overshoot area above VDDQ                   & 0.25     & 0.19      & 0.15      & 0.13      & V-ns \\
  Maximum undershoot area below VSSQ                  & 0.25     & 0.19      & 0.15      & 0.13      & V-ns \\
  \end{tabular}
\end{table}

图 7-12 时钟，数据，选通和屏蔽信号的交流上冲和下冲定义

#### ODT 时序定义

\begin{table}[htbp]
  \centering
  \caption{ODT 时序定义}
  \label{tab:refresh-rate}
  \begin{tabular}{cp{5cm}p{5cm}c}
  Symbol & Begin Point Definition                                                            & End Point Definition                                                 & Figure     \\
  tAON   & Rising edge of CK -CK\# defined by the end point of ODTLon                        & Extrapolated point at VSSQ                                           & Figure 103 \\
  tAONPD & Rising edge of CK -CK\# with ODT being first registered high                      & Extrapolated point at VSSQ                                           & Figure 104 \\
  tAOF   & Rising edge of CK -CK\# defined by the end point of ODTLoff                       & End point: Extrapolated point at VRTT\_Nom                           & Figure 105 \\
  tAOFPD & Rising edge of CK -CK\# with ODT being first registered low                       & End point: Extrapolated point at VRTT\_Nom                           & Figure 106 \\
  tADC   & Rising edge of CK -CK\# defined by the end point of ODTLcnw, ODTLcwn4 or ODTLcwn8 & End point: Extrapolated point at VRTT\_Wr and VRTT\_Nom respectively & Figure 107 \\
  \end{tabular}
\end{table}

\begin{table}[htbp]
  \centering
  \caption{ODT 时序测量的参考设置}
  \label{tab:refresh-rate}
  \begin{tabular}{ccccc}
  Parameter & RTT\_Nom Setting & RTT\_Wr Setting & VSW1[V] & VSW2[V] \\
  tAON      & RZQ/4            & NA              & 0.05    & 0.10      \\
            & RZQ/12           & NA              & 0.10    & 0.20      \\
  tAONPD    & RZQ/4            & NA              & 0.05    & 0.10      \\
            & RZQ/12           & NA              & 0.10    & 0.20      \\
  tAOF      & RZQ/4            & NA              & 0.05    & 0.10      \\
            & RZQ/12           & NA              & 0.10    & 0.20      \\
  tAOFPD    & RZQ/4            & NA              & 0.05    & 0.10      \\
            & RZQ/12           & NA              & 0.10    & 0.20      \\
  tAD       & RZQ/12           & RZQ/2           & 0.20    & 0.30      \\
  \end{tabular}
\end{table}


图 7-13 tAON 的定义
图 7-14 tAONPD 的定义
图 7-15 tAOF 的定义
图 7-16 tAOFPD 的定义
图 7-17 tADC 的定义

### IDD 和 IDDQ 规范的参数和测试条件

表 7-29 IDD 和 IDDQ 测量循环模式的时序

\begin{table}[htbp]
  \centering
  \caption{ODT 时序测量的参考设置}
  \label{tab:refresh-rate}
  \begin{tabular}{ccccccccccccccc}
Symbol             & \multicolumn{2}{c}{DDR3-800} & \multicolumn{3}{c}{DDR3-1066} & \multicolumn{4}{c}{DDR3-1333} \\
                   &          &     & 5-5-5     & 6-6-6 & 6-6-6 & 7-7-7     & 8-8-8 & 7-7-7 & 8-8-8 & 9-9-9 & 10-10-10 & 8-8-8 & 9-9-9 & 10-10-10 \\
tCK                & 2.5      &     & 1.875     &       &       & 1.5 \\
CL                 & 5        & 6   & 6         & 7     & 8     & 7         & 8     & 9     & 10    & 8     & 9        & 10 \\
nRCD               & 5        & 6   & 6         & 7     & 8     & 7         & 8     & 9     & 10    & 8     & 9        & 10 \\
nRC                & 20       & 21  & 26        & 27    & 28    & 31        & 32    & 33    & 34    & 36    & 37       & 38 \\
nRAS               & 15       &     & 20        &       &       & 24 \\
nRP                & 5        & 6   & 6         & 7     & 8     & 7         & 8     & 9     & 10    & 8     & 9        & 10 \\
nFAW 1KBpagesize   & 16       &     & 20        &       &       & 20 \\
     2KB page size & 20       & 27  & 30 \\
nRRD 1KB page size & 4        & 4   & 4 \\
     2KB page size & 4        & 6   & 5 \\
nRFC 512 Mb        & 36       & 48  & 60 \\
nRFC 1 Gb          & 44       & 59  & 74 \\
nRFC 2 Gb          & 64       & 86  & 107 \\
nRFC 4 Gb          & 120      & 160 & 200 \\
nRFC 8 Gb          & 140      & 187 & 234 \\
  \end{tabular}
\end{table}


### 输入/输出电容

\begin{table}[htbp]
  \centering
  \caption{输入/输出电容}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}cccccccc}
  Parameter                                                       & Symbol         & DDR3-800 &      & DDR3-1066 &      & DDR3-1333 \\
                                                                  &                & Min      & Max  & Min       & Max  & Min          & Max  & Min \\
  Input/output capacitance (DQ, DM, DQS, DQS\#, TDQS,TDQS\#)        & CIO            & 1.5      & 3.0  & 1.5       & 2.7  & 1.5          & 2.5  & 1.5 \\
  Input capacitance, CK and CK\#                                   & CCK            & 0.8      & 1.6  & 0.8       & 1.6  & 0.8          & 1.4  & 0.8 \\
  Input capacitance delta, CK and CK\#                             & CDCK           & 0        & 0.15 & 0         & 0.15 & 0            & 0.15 & 0 \\
  Input/output capacitance delta DQS and DQS\#                     & CDDQS          & 0        & 0.2  & 0         & 0.2  & 0            & 0.15 & 0 \\
  Input capacitance, (CTRL, ADD, CMD input-only pins)             & CI             & 0.75     & 1.4  & 0.75      & 1.35 & 0.75         & 1.3  & 0.75 \\
  Input capacitance delta, (All CTRL input-only pins              & CDI\_CTRL      & -0.5     & 0.3  & -0.5      & 0.3  & -0.4         & 0.2  & -0.4 \\
  Input capacitance delta, (All ADD/ CMD input-only pins)         & CDI\_ADD\_CM D & -0.5     & 0.5  & -0.5      & 0.5  & -0.4         & 0.4  & -0.4 \\
  Input/output capacitance delta, DQ, DM, DQS, DQS\#, TDQS, TDQS\#  & CDIO           & -0.5     & 0.3  & -0.5      & 0.3  & -0.5         & 0.3  & -0.5 \\
  Input/output capacitance of ZQ pin                              & CZQ            & -        & 3    & -         & 3    & -            & 3    & - \\
  \end{tabular}
\end{table}


### 不同器件密度下的刷新参数

\begin{table}[htbp]
  \centering
  \caption{不同器件密度下的刷新参数}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}cccccccc}
  Parameter                              & Symbol &            & 512Mb & 1Gb & 2Gb & 4Gb & 8Gb & Unit \\
  REF command to ACT or REF command time & tRFC   &            & 90    & 110 & 160 & 300 & 350 & ns \\
  Average periodic refresh interval      & tREFI  & 0≤TCASE≤85 & 7.8   & 7.8 & 7.8 & 7.8 & 7.8 & us \\
                                         &        & 85         & 3.9   & 3.9 & 3.9 & 3.9 & 3.9 & us \\
  \end{tabular}
\end{table}

### 标准的速度分级

\begin{table}[htbp]
  \centering
  \caption{DDR3-800 Speed Bins and Operating Conditions}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}ccccccc}
  Speed Bin                                & DDR3-800D & DDR3-800E & Unit \\
  CL - nRCD - nRP                          &           &           & 5-5-5 &           & 6-6-6 \\
  Parameter                                &           & Symbol    & Min.  & Max.      & Min.  & Max. \\
  Internal read command to first data      &           & tAA       & 12.5  & 20        & 15    & 20        & ns \\
  ACT to internal read or write delay time &           & tRCD      & 12.5  & —         & 15    & —         & ns \\
  PRE command period                       &           & tRP       & 12.5  & —         & 15    & —         & ns \\
  ACT to ACT or REF command period         &           & tRC       & 50    & —         & 52.5  & —         & ns \\
  ACT to PRE command period                &           & tRAS      & 37.5  & 9 * tREFI & 37.5  & 9 * tREFI & ns \\
  CL = 5                                   & CWL = 5   & tCK(AVG)  & 2.5   & 3.3       & 3.0   & 3.3       & ns \\
  CL = 6                                   & CWL = 5   & tCK(AVG)  & 2.5   & 3.3       & 2.5   & 3.3       & ns \\
  Supported CL Settings                    &           &           & 5, 6  &           & 5, 6  &           & nCK \\
  Supported CWL Settings                   &           &           & 5     &           & 5     &           & nCK \\
  \end{tabular}
\end{table}

\begin{table}[htbp]
  \centering
  \caption{DDR3-1066 Speed Bins and Operating Conditions}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}ccccccccc}
  Speed Bin                                &          & DDR3-1066E &           & DDR3-1066F &           & DDR3-1066G &           & Unit \\
  CL - nRCD – nRP                          &          & 6-6-6      &           & 7-7-7      &           & 8-8-8                         \\
  Parameter                                & Symbol   & Min.       & Max.      & Min.       & Max.      & Min.       & Max.             \\
  Internal read command to first data      & tAA      & 11.25      & 20        & 13.125     & 20        & 15         & 20        & ns   \\
  ACT to internal read or write delay time & tRCD     & 11.25      & —         & 13.125     & —         & 15         & —         & ns   \\
  PRE command period                       & tRP      & 11.25      & —         & 13.125     & —         & 15         & —         & ns   \\
  ACT to ACT or REF command period         & tRC      & 48.75      & —         & 50.625     & —         & 52.5       & —         & ns   \\
  ACT to PRE command period                & tRAS     & 37.5       & 9 * tREFI & 37.5       & 9 * tREFI & 37.5       & 9 * tREFI & ns   \\
  CL = 5  CWL = 5                          & tCK(AVG) & 2.5        & 3.3       & 3.0        & 3.3       & 3.0        & 3.3       & ns   \\
          CWL = 6                          & tCK(AVG) & Reserved   &           & Reserved   &           & Reserved   &           & ns   \\
  CL = 6  CWL = 5                          & tCK(AVG) & 2.5        & 3.3       & 2.5        & 3.3       & 2.5        & 3.3       & ns   \\
          CWL = 6                          & tCK(AVG) & 1.875      & <2.5      & Reserved   &           & Reserved   &           & ns   \\
  CL = 7  CWL = 5                          & tCK(AVG) & Reserved   &           & Reserved   &           & Reserved   &           & ns   \\
          CWL = 6                          & tCK(AVG) & 1.875      & <2.5      & 1.875      & < 2.5     & Reserved   &           & ns   \\
  CL = 8  CWL = 5                          & tCK(AVG) & Reserved   &           & Reserved   &           & Reserved   &           & ns   \\
          CWL = 6                          & tCK(AVG) & 1.875      & <2.5      & 1.875      & <2.5      & 1.875      & <2.5      & ns   \\
  Supported CL Settings                    &          & 5,6,7,8    &           & 5,6,7,8    &           & 5,6,8      &           & nCK  \\
  Supported CWL Settings                   &          & 5,6        &           & 5,6        &           & 5,6        &           & nCK  \\
  \end{tabular}
\end{table}


\begin{table}[htbp]
  \centering
  \caption{DDR3-1333 Speed Bins and Operating Conditions}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}ccccccccc}
  SpeedBin                                   &          & (optional) &                & DDR3-1333G &                & DDR3-1333H        &                  & DDR3-1333J (optional) \\
  CL-nRCD-nRP                                &          & 7-7-7      &                &            &                & 9-9-9             &                  & 10-10-10 \\
  Parameter                                  & Symbol   & min        & max            & min        & max            & min               & max              & min                      & max \\
  Internal read command to first data        & tAA      & 10.5       & 20             & 12         & 20             & 13.5(13.125)5, 11 & 20               & 15                       & 20 \\
  ACT to internal read or write delay time   & tRCD     & 10.5       & —              & 12         & —              & 13.5(13.125)5, 11 & —                & 15                       & — \\
  PRE command period                         & tRP      & 10.5       & —              & 12         & —              & 13.5(13.125)5,    & —                & 15                       & — \\
  ACT to ACT or REF command period           & tRC      & 46.5       & —              & 48         & —              & 49.5(49.125)5, 11 & —                & 51                       & — \\
  ACT to PRE command period                  & tRAS     & 36         & 9*tREFI        & 36         & 9*tREFI        & 36                & 9*tREFI          & 36                       & 9*tREFI \\
  CL=5  CWL=5                                & tCK(AVG) & 2.5        & 3.3            & 2.5        & 3.3            & 3.0               & 3.3              & 3.0                      & 3.3 \\
        CWL=6,7                              & tCK(AVG) & Reserved   &                & Reserved   &                & Reserved          &                  & Reserved \\
  CL=6  CWL=5                                & tCK(AVG) & 2.5        & 3.3            & 2.5        & 3.3            & 2.5               & 3.3              & 2.5                      & 3.3 \\
        CWL=6                                & tCK(AVG) & 1.875      & <2.5           & Reserved   &                & Reserved          &                  & Reserved \\
        CWL=7                                & tCK(AVG) & Reserved   &                & Reserved   &                & Reserved          &                  & Reserved \\
  CL=7  CWL=5                                & tCK(AVG) & Reserved   &                & Reserved   &                & Reserved          &                  & Reserved \\
        CWL=6                                & tCK(AVG) & 1.875      & <2.5           & 1.875      & <2.5           & 1.875             & <2.5             & Reserved \\
                                             &          &            &                &            &                & (Optional)5,11 \\
        CWL=7                                & tCK(AVG) & 1.5        & <1.875         & Reserved   &                & Reserved          &                  & Reserved \\
  CL=8  CWL=5                                & tCK(AVG) & Reserved   &                & Reserved   &                & Reserved          &                  & Reserved \\
        CWL=6                                & tCK(AVG) & 1.875      & <2.5           & 1.875      & <2.5           & 1.875             & <2.5             & 1.875                    & < 2.5 \\
        CWL=7                                & tCK(AVG) & 1.5        & <1.875         & 1.5        & <1.875         & Reserved          &                  & Reserved \\
  CL=9  CWL=5,6                              & tCK(AVG) & Reserved   &                & Reserved   &                & Reserved          &                  & Reserved \\
        CWL=7                                & tCK(AVG) & 1.5        & <1.875         & 1.5        & <1.875         & 1.5               & <1.875           & Reserved \\
  CL=10 CWL=5,6                              & tCK(AVG) & Reserved   &                & Reserved   &                & Reserved          &                  & Reserved \\
        CWL=7                                & tCK(AVG) & 1.5        & <1.875         & 1.5        & <1.875         & 1.5               & <1.875           & 1.5                      & <1.875 \\
                                             &          &            & (Optional)     &            & (Optional)     &                   & (Optional) \\
  Supported CL Settings                      &          &            & 5,6,7,8,9,(10) &            & 5,6,7,8,9,(10) &                   & 5,6,8,(7),9,(10) &                          & 5,6,8,10 \\
  Supported CWL Settings                     &          &            & 5, 6, 7        &            & 5, 6, 7        &                   & 5, 6, 7          &                          & 5, 6, 7 \\
  \end{tabular}
\end{table}



\begin{table}[htbp]
  \centering
  \caption{DDR3-1600 Speed Bins and Operating Conditions}
  \label{tab:refresh-rate}
  \begin{tabular}{p{5cm}cccccccccc}
  SpeedBin                                 &          & DDR3-1600G(optional)  &         & DDR3-1600H        &         & DDR3-1600J    &           & DDR3-1600K         &            & Unit \\
  CL-nRCD-nRP                              &          & 8-8-8                 &         & 9-9-9             &         & 10-10-10      &           & 11-11-11 \\
  Parameter                                & Symbol   & min                   & max     & min               & max     & min           & max       & min                & max \\
  Internal read command to first data      & tAA      & 10                    & 20      & 11.25             & 20      & 12.5          & 20        & 13.75(13.125) 5,11 & 20         & ns \\
  ACT to internal read or write delay time & tRCD     & 10                    & —       & 11.25             & —       & 12.5          & —         & 13.75(13.125) 5,11 & —          & ns \\
  PRE command period                       & tRP      & 10                    & —       & 11.25             & —       & 12.5          & —         & 13.75(13.125) 5,11 & —          & ns \\
  ACT to ACT or REF command period         & tRC      & 45                    & —       & 46.25             & —       & 47.5          & —         & 48.75(48.125) 5,11 & —          & ns \\
  ACT to PRE command period                & tRAS     & 35                    & 9*tREFI & 35                & 9*tREFI & 35            & 9*tREFI   & 35                 & 9 * tREFI  & ns \\
  CL = 5    CWL=5                          & tCK(AVG) & 2.5                   & 3.3     & 2.5               & 3.3     & 2.5           & 3.3       & 3.0                & 3.3        & ns \\
            CWL=6,7,8                      & tCK(AVG) & Reserved              &         & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
  CL = 6    CWL=5                          & tCK(AVG) & 2.5                   & 3.3     & 2.5               & 3.3     & 2.5           & 3.3       & 2.5                & 3.3        & ns \\
            CWL=6                          & tCK(AVG) & 1.875                 & <2.5    & 1.875             & <2.5    & Reserved      & Reserve d & ns                 & 1,2,3,4, 8 \\
            CWL=7,8                        & tCK(AVG) & Reserved              &         & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
  CL = 7    CWL=5                          & tCK(AVG) & Reserved              &         & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
            CWL=6                          & tCK(AVG) & 1.875                 & <2.5    & 1.875             & <2.5    & 1.875         & <2.5      & 1.875              & < 2.5      & ns \\
                                           &          &                       &         &                   &         &               &           & (Optional)5,11 \\
            CWL=7                          & tCK(AVG) & 1.5                   & <1.875  & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
            CWL=8                          & tCK(AVG) & Reserved              &         & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
  CL = 8    CWL=5                          & tCK(AVG) & Reserved              &         & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
            CWL=6                          & tCK(AVG) & 1.875                 & <2.5    & 1.875             & <2.5    & 1.875         & <2.5      & 1.875              & < 2.5      & ns \\
            CWL=7                          & tCK(AVG) & 1.5                   & <1.875  & 1.5               & <1.875  & Reserved      & Reserve d & ns                 & 1,2,3,4, 8 \\
            CWL=8                          & tCK(AVG) & 1.25                  & <1.5    & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
  CL = 9    CWL=5,6                        & tCK(AVG) & Reserved              &         & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
            CWL=7                          & tCK(AVG) & 1.5                   & <1.875  & 1.5               & <1.875  & 1.5           & <1.875    & 1.5                & < 1.875    & ns \\
                                           &          &                       &         &                   &         &               &           & (Optional)5,11 \\
            CWL=8                          & tCK(AVG) & 1.25                  & <1.5    & 1.25              & <1.5    & Reserved      &           & Reserved           &            & ns \\
  CL = 10   CWL=5,6                        & tCK(AVG) & Reserved              &         & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
            CWL=7                          & tCK(AVG) & 1.5                   & <1.875  & 1.5               & <1.875  & 1.5           & <1.875    & 1.5                & <1.875     & ns \\
            CWL=8                          & tCK(AVG) & 1.25                  & <1.5    & 1.25              & <1.5    & 1.25          & <1.5      & Reserved           &            & ns \\
  CL = 11   CWL=5,6,7                      & tCK(AVG) & Reserved              &         & Reserved          &         & Reserved      &           & Reserved           &            & ns \\
            CWL=8                          & tCK(AVG) & 1.25                  & <1.5    & 1.25              & <1.5    & 1.25          & <1.5      & 1.25               & < 1.5      & ns \\
                                           &          & (Optional)            &         & (Optional)        &         & (Optional)    &           &                    &            & ns \\
  Supported CL Settings                    &          & 5,6,7,8,9,10,(11)     &         & 5,6,7,8,9,10,(11) &         & 5,6,7,8,9,10, &           & 5,6,7,8,9,10,(11)  &            & nCK \\
  Supported CWL Settings                   &          & 5,6,7,8               &         & 5,6,7,8           &         & 5,6,7,8       &           & 5,6,7,8            &            & nCK \\
  \end{tabular}
\end{table}

\clearpage

### DDR3-800 和 DDR3-1066 的时序参数

\setlength{\tabcolsep}{2pt}
\begin{longtable}{p{5cm}>{\tt}l*{8}{p{1.2cm}}>{\tt}c}
  \caption{DDR3-800 和 DDR3-1066 的时序参数} \label{tab:ddr-tsequence} \\ \toprule
  Parameter  & Symbol & \multicolumn{2}{c}{DDR3-800} & \multicolumn{2}{c}{DDR3-1066} & \multicolumn{2}{c}{DDR3-1333} & \multicolumn{2}{c}{DDR3-1600} &       \\
             &        & Min & Max                    & Min  & Max                    & Min & Max                     & Min & Max                     & Units \\
  \midrule \endfirsthead
  \caption{DDR3-800 和 DDR3-1066 的时序参数（续）} \\ \toprule
  Parameter  & Symbol & \multicolumn{2}{c}{DDR3-800} & \multicolumn{2}{c}{DDR3-1066} & \multicolumn{2}{c}{DDR3-1333} & \multicolumn{2}{c}{DDR3-1600} &       \\
             &        & Min & Max                    & Min  & Max                    & Min & Max                     & Min & Max                     & Units \\
  \midrule \endhead
  \rmcol{4}{\tiny 未完待续} \endfoot
  \bottomrule \endlastfoot

Clock Timing \\
Minimum Clock Cycle Time (DLL off mode)                                                                                            & tCK(DLL\_OFF)   & 8                                                                                             & -                            & 8                           & -                            & 8                           & -                            & 8                           & -                            & ns \\
Average Clock Period                                                                                                               & tCK(avg)       &                                                                                               &                              &                             &                              &                             &                              &                             &                              & ps \\
Average high pulse width                                                                                                           & tCH(avg)       & 0.47                                                                                          & 0.53                         & 0.47                        & 0.53                         & 0.47                        & 0.53                         & 0.47                        & 0.53                         & tCK(avg) \\
Average low pulse width                                                                                                            & tCL(avg)       & 0.47                                                                                          & 0.53                         & 0.47                        & 0.53                         & 0.47                        & 0.53                         & 0.47                        & 0.53                         & tCK(avg) \\
Absolute Clock Period                                                                                                              & tCK(abs)       & tCK(avg)min + tJIT(per)min                                                                    & tCK(avg) max + tJIT(per) max & tCK(avg)min + tJIT(per)min  & tCK(avg) max + tJIT(per) max & tCK(avg)min + tJIT(per)min  & tCK(avg) max + tJIT(per) max & tCK(avg)min + tJIT(per)min  & tCK(avg) max + tJIT(per) max & ps \\
Absolute clock HIGH pulse width                                                                                                    & tCH(abs)       & 0.43                                                                                          & -                            & 0.43                        & -                            & 0.43                        & -                            & 0.43                        & -                            & tCK(avg) \\
Absolute clock LOW pulse width                                                                                                     & tCL(abs)       & 0.43                                                                                          & -                            & 0.43                        & -                            & 0.43                        & -                            & 0.43                        & -                            & tCK(avg) \\
Clock Period Jitter                                                                                                                & JIT(per)       & -100                                                                                          & 100                          & -90                         & 90                           & -80                         & 80                           & -70                         & 70                           & ps \\
Clock Period Jitter during DLL locking period                                                                                      & tJIT(per,lck)  & -90                                                                                           & 90                           & -80                         & 80                           & -70                         & 70                           & -60                         & 60                           & ps \\
Cycle to Cycle Period Jitter                                                                                                       & tJIT(cc)       & 200                                                                                           &                              & 180                         &                              & 160                         &                              & 140                         &                              & ps \\
Cycle to Cycle Period Jitter during DLL locking period                                                                             & tJIT(cc,lck)   & 180                                                                                           &                              & 160                         &                              & 140                         &                              & 120                         &                              & ps \\
Duty Cycle Jitter                                                                                                                  & tJIT(duty)     & -                                                                                             & -                            & -                           & -                            & -                           & -                            & -                           & -                            & ps \\
Cumulative error across 2 cycles                                                                                                   & tERR(2per)     & -147                                                                                          & 147                          & -132                        & 132                          & -118                        & 118                          & -103                        & 103                          & ps \\
Cumulative error across 3 cycles                                                                                                   & tERR(3per)     & -175                                                                                          & 175                          & -157                        & 157                          & -140                        & 140                          & -122                        & 122                          & ps \\
Cumulative error across 4 cycles                                                                                                   & tERR(4per)     & -194                                                                                          & 194                          & -175                        & 175                          & -155                        & 155                          & -136                        & 136                          & ps \\
Cumulative error across 5 cycles                                                                                                   & tERR(5per)     & -209                                                                                          & 209                          & -188                        & 188                          & -168                        & 168                          & -147                        & 147                          & ps \\
Cumulative error across 6 cycles                                                                                                   & tERR(6per)     & -222                                                                                          & 222                          & -200                        & 200                          & -177                        & 177                          & -155                        & 155                          & ps \\
Cumulative error across 7 cycles                                                                                                   & tERR(7per)     & -232                                                                                          & 232                          & -209                        & 209                          & -186                        & 186                          & -163                        & 163                          & ps \\
Cumulative error across 8 cycles                                                                                                   & tERR(8per)     & -241                                                                                          & 241                          & -217                        & 217                          & -193                        & 193                          & -169                        & 169                          & ps \\
Cumulative error across 9 cycles                                                                                                   & tERR(9per)     & -249                                                                                          & 249                          & -224                        & 224                          & -200                        & 200                          & -175                        & 175                          & ps \\
Cumulative error across 10 cycles                                                                                                  & tERR(10per)    & -257                                                                                          & 257                          & -231                        & 231                          & -205                        & 205                          & -180                        & 180                          & ps \\
Cumulative error across 11 cycles                                                                                                  & tERR(11per)    & -263                                                                                          & 263                          & -237                        & 237                          & -210                        & 210                          & -184                        & 184                          & ps \\
Cumulative error across 12 cycles                                                                                                  & tERR(12per)    & -269                                                                                          & 269                          & -242                        & 242                          & -215                        & 215                          & -188                        & 188                          & ps \\
Cumulative error across n = 13, 14 . . . 49, 50 cycles                                                                             & tERR(nper)     & tERR(nper)min = (1 + 0.68ln(n)) * tJIT(per)min tERR(nper)max = (1 + 0.68ln(n)) * tJIT(per)max & ps                           & 24 \\
Data Timing \\
DQS, DQS\# to DQ skew, per group, per access                                                                                        & tDQSQ          & -                                                                                             & 200                          & -                           & 150                          & -                           & 125                          & -                           & 100                          & ps \\
DQ output hold time from DQS, DQS\#                                                                                                 & tQH            & 0.38                                                                                          & -                            & 0.38                        & -                            & 0.38                        & -                            & 0.38                        & -                            & tCK(avg) \\
DQ low-impedance time from CK, CK\#                                                                                                 & tLZ(DQ)        & -800                                                                                          & 400                          & -600                        & 300                          & -500                        & 250                          & -450                        & 225                          & ps \\
DQ high impedance time from CK, CK\#                                                                                                & tHZ(DQ)        & -                                                                                             & 400                          & -                           & 300                          & -                           & 250                          & -                           & 225                          & ps \\
Data setup time to DQS, DQS\# referenced to Vih(ac) / Vil(ac) levels                                                                & tDS(base)AC175 & 75                                                                                            &                              & 25                          &                              & -                           &                              & -                           &                              & ps \\
Data setup time to DQS, DQS\# referenced to Vih(ac) / Vil(ac) levels                                                                & tDS(base)AC150 & 125                                                                                           &                              & 75                          &                              & 30                          &                              & 10                          &                              & ps \\
Data hold time from DQS, DQS\# referenced to Vih(dc) / Vil(dc) levels                                                               & tDH(base)DC100 & 150                                                                                           &                              & 100                         &                              & 65                          &                              & 45                          &                              & ps \\
DQ and DM Input pulse width for each input                                                                                         & tDIPW          & 600                                                                                           & -                            & 490                         & -                            & 400                         & -                            & 360                         & -                            & ps \\
Data Strobe Timing \\
DQS,DQS\# differential READ Preamble                                                                                                & tRPRE          & 0.9                                                                                           & Note19                       & 0.9                         & Note19                       & 0.9                         & Note19                       & 0.9                         & Note19                       & tCK(avg) \\
DQS, DQS\# differential READ Postamble                                                                                              & tRPST          & 0.3                                                                                           & Note11                       & 0.3                         & Note11                       & 0.3                         & Note11                       & 0.3                         & Note11                       & tCK(avg) \\
DQS, DQS\# differential output high time                                                                                            & tQSH           & 0.38                                                                                          & -                            & 0.38                        & -                            & 0.40                        & -                            & 0.40                        & -                            & tCK(avg) \\
DQS, DQS\# differential output low time                                                                                             & tQSL           & 0.38                                                                                          & -                            & 0.38                        & -                            & 0.40                        & -                            & 0.40                        & -                            & tCK(avg) \\
DQS, DQS\# differential WRITE Preamble                                                                                              & tWPRE          & 0.9                                                                                           & -                            & 0.9                         & -                            & 0.9                         & -                            & 0.9                         & -                            & tCK(avg) \\
DQS, DQS\# differential WRITE Postamble                                                                                             & tWPST          & 0.3                                                                                           & -                            & 0.3                         & -                            & 0.3                         & -                            & 0.3                         & -                            & tCK(avg) \\
DQS, DQS\# rising edge output access time from rising CK, CK\#                                                                       & tDQSCK         & -400                                                                                          & 400                          & -300                        & 300                          & -255                        & 255                          & -225                        & 225                          & ps \\
DQS and DQS\# low-impedance time (Referenced from RL - 1)                                                                           & tLZ(DQS)       & -800                                                                                          & 400                          & -600                        & 300                          & -500                        & 250                          & -450                        & 225                          & ps \\
DQS and DQS\# high-impedance time (Referenced from RL + BL/2)                                                                       & tHZ(DQS)       & -                                                                                             & 400                          & -                           & 300                          & -                           & 250                          & -                           & 225                          & ps \\
DQS, DQS\# differential input low pulse width                                                                                       & tDQSL          & 0.45                                                                                          & 0.55                         & 0.45                        & 0.55                         & 0.45                        & 0.55                         & 0.45                        & 0.55                         & tCK(avg) \\
DQS, DQS\# differential input high pulse width                                                                                      & tDQSH          & 0.45                                                                                          & 0.55                         & 0.45                        & 0.55                         & 0.45                        & 0.55                         & 0.45                        & 0.55                         & tCK(avg) \\
DQS, DQS\# rising edge to CK, CK\# rising edge                                                                                       & tDQSS          & -0.25                                                                                         & 0.25                         & -0.25                       & 0.25                         & -0.25                       & 0.25                         & -0.27                       & 0.27                         & tCK(avg) \\
DQS, DQS\# falling edge setup time to CK, CK\# rising edge                                                                           & tDSS           & 0.2                                                                                           & -                            & 0.2                         & -                            & 0.2                         & -                            & 0.18                        & -                            & tCK(avg) \\
DQS, DQS\# falling edge hold time from CK, CK\# rising edge                                                                          & tDSH           & 0.2                                                                                           & -                            & 0.2                         & -                            & 0.2                         & -                            & 0.18                        & -                            & tCK(avg) \\
Command and Address Timing \\
DLL locking time                                                                                                                   & tDLLK          & 512                                                                                           & -                            & 512                         & -                            & 512                         & -                            & 512                         & -                            & nCK \\
Internal READ Command to PRECHARGE Command delay                                                                                   & tRTP           & max(4nCK, 7.5ns)                                                                              & －                           & max(4nCK,7.5ns)             & -                            & max(4nCK,7.5 ns)            & -                            & max(4nCK,7.5 ns)            & - \\
Delay from start of internal write transaction to internal read command                                                            & tWTR           & max(4nCK, 7.5ns)                                                                              & －                           & max(4nCK,7.5ns)             & -                            & max(4nCK,7.5 ns)            & -                            & max(4nCK,7.5 ns)            & - \\
WRITE recovery time                                                                                                                & tWR            & 15                                                                                            & －                           & 15                          & -                            & 15                          & -                            & 15                          & -                            & ns \\
Mode Register Set command cycle time                                                                                               & tMRD           & 4                                                                                             & －                           & 4                           & -                            & 4                           & -                            & 4                           & -                            & nCK \\
Mode Register Set command update delay                                                                                             & tMOD           & max(12nCK, 15ns)                                                                              & －                           & max(12nCK,15ns)             & -                            & max(12nCK,15 ns)            & -                            & max(12nCK,15 ns)            & - \\
ACT to internal read or write delay time                                                                                           & tRCD           & -                                                                                             & －                           & -                           & - \\
PRE command period                                                                                                                 & tRP            & -                                                                                             & －                           & -                           & - \\
ACT to ACT or REF command period                                                                                                   & tRC            & -                                                                                             & －                           & -                           & - \\
CAS\# to CAS\# command delay                                                                                                         & tCCD           & 4                                                                                             & －                           & 4                           & -                            & 4                           & -                            & 4                           & -                            & nCK \\
Auto precharge write recovery + precharge time                                                                                     & tDAL(min)      & WR + roundup(tRP / tCK(avg))                                                                  & nCK \\
Multi-Purpose Register Recovery Time                                                                                               & tMPRR          & 1                                                                                             & -                            & 1                           & -                            & 1                           & -                            & 1                           & -                            & nCK \\
ACTIVE to PRECHARGE command period                                                                                                 & tRAS           & -                                                                                             & -                            & -                           & - \\
ACTIVE to ACTIVE command period for 1KB page size                                                                                  & tRRD           & max(4nCK,10ns)                                                                                & -                            & max(4nCK,7.5ns)             & -                            & max(4nCK,6ns )              & -                            & max(4nCK,6ns )              & - \\
ACTIVE to ACTIVE command period for 2KB page size                                                                                  & tRRD           & max(4nCK,10ns)                                                                                & -                            & max(4nCK,10ns)              & -                            & max(4nCK,7.5 ns)            & -                            & max(4nCK,7.5 ns)            & - \\
Four activate window for 1KB page size                                                                                             & tFAW           & 40                                                                                            & -                            & 37.5                        & -                            & 30                          & -                            & 30                          & -                            & ns \\
Four activate window for 2KB page size                                                                                             & tFAW           & 50                                                                                            & -                            & 50                          & -                            & 45                          & -                            & 40                          & -                            & ns \\
Command and Address setup time to CK, CK\# referenced to Vih(ac) / Vil(ac) levels                                                   & tIS(base)AC175 & 200                                                                                           &                              & 125                         &                              & 65                          &                              & 45                          &                              & ps \\
Command and Address setup time to CK, CK\# referenced to Vih(ac) / Vil(ac) levels                                                   & tIS(base)AC150 & 350                                                                                           &                              & 275                         &                              & 190                         &                              & 170                         &                              & ps \\
Command and Address hold time from CK, CK\# referenced to Vih(dc) / Vil(dc) levels                                                  & tIH(base)DC100 & 275                                                                                           &                              & 200                         &                              & 140                         &                              & 120                         &                              & ps \\
Control and Address Input pulse width for each input                                                                               & tIPW           & 900                                                                                           & -                            & 780                         & -                            & 620                         & -                            & 560                         & -                            & ps \\
Calibration Timing \\
Power-up and RESET calibration time                                                                                                & tZQinit        & max(512nCK,640ns)                                                                             & -                            & max(512nCK,640ns )          & -                            & max(512nCK,6 40ns)          & -                            & max(512nCK,6 40ns)          & - \\
Normal operation Full calibration time                                                                                             & tZQoper        & max(256nCK,320ns)                                                                             & -                            & max(256nCK,320ns )          & -                            & max(256nCK,3 20ns)          & -                            & max(256nCK,3 20ns)          & - \\
Normal operation Short calibration time                                                                                            & tZQCS          & max(64nCK,80ns)                                                                               & -                            & max(64nCK,80ns)             & -                            & max(64nCK,80 ns)            & -                            & max(64nCK,80 ns)            & - \\
Reset Timing \\
Exit Reset from CKE HIGH to a valid command                                                                                        & tXPR           & max(5nCK,tRFC(min) +10ns)                                                                     & -                            & max(5nCK,tRFC(mi n)+10ns)   & -                            & max(5nCK,tRF C(min)+10ns)   & -                            & max(5nCK,tRF C(min)+10ns)   & - \\
Self Refresh Timings \\
Exit Self Refresh to commands not requiring a locked DLL                                                                           & tXS            & max(5nCK, tRFC(min) + 10ns)                                                                   & -                            & max(5nCK, tRFC(min) + 10ns) & -                            & max(5nCK, tRFC(min) + 10ns) & -                            & max(5nCK, tRFC(min) + 10ns) & - \\
Exit Self Refresh to commands requiring a locked DLL                                                                               & tXSDLL         & tDLLK(min)                                                                                    & -                            & tDLLK(min)                  & -                            & tDLLK(min)                  & -                            & tDLLK(min)                  & -                            & nCK \\
Minimum CKE low width for Self Refresh entry to exit timing                                                                        & tCKESR         & tCKE(min) + 1 nCK                                                                             & -                            & tCKE(min) + 1 nCK           & -                            & tCKE(min) + 1 nCK           & -                            & tCKE(min) + 1 nCK           & - \\
Valid Clock Requirement after Self Refresh Entry (SRE) or Power-Down Entry (PDE)                                                   & tCKSRE         & max(5nCK,10ns)                                                                                & -                            & max(5nCK,10ns)              & -                            & max(5nCK,10n s)             & -                            & max(5nCK,10n s)             & - \\
Valid Clock Requirement before Self Refresh Exit (SRX) or Power-Down Exit (PDX) or Reset Exit                                      & tCKSRX         & max(5nCK,10ns)                                                                                & -                            & max(5nCK,10ns)              & -                            & max(5nCK,10n s)             & -                            & max(5nCK,10n s)             & - \\
Power Down Timings \\
Exit Power Down with DLL on to any valid command; Exit Precharge Power Down with DLL frozen to commands not requiring a locked DLL & tXP            & max(3nCK,7.5ns)                                                                               & -                            & max(3nCK,7.5ns)             & -                            & max(3nCK,6ns )              & -                            & max(3nCK,6ns )              & - \\
Exit Precharge Power Down with DLL frozen to commands requiring a locked DLL                                                       & tXPDLL         & max(10nCK,24ns)                                                                               & -                            & max(10nCK,24ns)             & -                            & max(10nCK,24 ns)            & -                            & max(10nCK,24 ns)            & - \\
CKE minimum pulse width                                                                                                            & tCKE           & max(3nCK7.5ns)                                                                                & -                            & max(3nCK,5.625ns)           & -                            & max(3nCK,5.6 25ns)          & -                            & max(3nCK,5ns )              & - \\
Command pass disable delay                                                                                                         & tCPDED         & 1                                                                                             & -                            & 1                           & -                            & 1                           & -                            & 1                           & -                            & nCK \\
Power Down Entry to Exit Timing                                                                                                    & tPD            & tCKE(min)                                                                                     & 9*tREFI                      & tCKE(min)                   & 9*tREFI                      & tCKE(min)                   & 9*tREFI                      & tCKE(min)                   & 9*tREFI \\
Timing of ACT command to Power Down entry                                                                                          & tACTPDEN       & 1                                                                                             & -                            & 1                           & -                            & 1                           & -                            & 1                           & -                            & nCK \\
Timing of PRE or PREA command to Power Down entry                                                                                  & tPRPDEN        & 1                                                                                             & -                            & 1                           & -                            & 1                           & -                            & 1                           & -                            & nCK \\
Timing of RD/RDA command to Power Down entry                                                                                       & tRDPDEN        & RL+4+1                                                                                        & -                            & RL+4+1                      & -                            & RL+4+1                      & -                            & RL+4+1                      & -                            & nCK \\
Timing of WR command to Power Down entry (BL8OTF, BL8MRS, BC4OTF)                                                                  & tWRPDEN        & WL+4+(tWR/tCK(avg) )                                                                          & -                            & WL+4+(tWR/tCK(av g))        & -                            & WL+4+(tWR/t CK(avg))        & -                            & WL+4+(tWR/t CK(avg))        & -                            & nCK \\
Timing of WRA command to Power Down entry (BL8OTF, BL8MRS, BC4OTF)                                                                 & tWRAPDEN       & WL+4+WR+1                                                                                     & -                            & WL+4+WR+1                   & -                            & WL+4+WR+1                   & -                            & WL+4+WR+1                   & -                            & nCK \\
Timing of WR command to Power Down entry (BC4MRS)                                                                                  & tWRPDEN        & WL+2+(tWR/tCK(avg) )                                                                          & -                            & WL+2+(tWR/tCK(av g))        & -                            & WL+2+(tWR/t CK(avg))        & -                            & WL+2+(tWR/t CK(avg))        & -                            & nCK \\
Timing of WRA command to Power Down entry (BC4MRS)                                                                                 & tWRAPDEN       & WL+2+WR+1                                                                                     & -                            & WL+2+WR+1                   & -                            & WL+2+WR+1                   & -                            & WL+2+WR+1                   & -                            & nCK \\
Timing of REF command to Power Down entry                                                                                          & tREFPDEN       & 1                                                                                             & -                            & 1                           & -                            & 1                           & -                            & 1                           & -                            & nCK \\
Timing of MRS command to Power Down entry                                                                                          & tMRSPDEN       & tMOD(min)                                                                                     & -                            & tMOD(min)                   & -                            & tMOD(min)                   & -                            & tMOD(min)                   & - \\
ODT Timings \\
ODT turn on Latency                                                                                                                & ODTLon         & WL-2=CWL+AL-2                                                                                 &                              &                             &                              &                             &                              &                             &                              & nCK \\
ODT turn off Latency                                                                                                               & ODTLoff        & WL-2=CWL+AL-2                                                                                 &                              &                             &                              &                             &                              &                             &                              & nCK \\
ODT high time without write command or with write command and BC4                                                                  & ODTH4          & 4                                                                                             & -                            & 4                           & -                            & 4                           & -                            & 4                           & -                            & nCK \\
ODT high time with Write command and BL8                                                                                           & ODTH8          & 6                                                                                             & -                            & 6                           & -                            & 6                           & -                            & 6                           & -                            & nCK \\
Asynchronous RTT turn-on delay (Power-Down with DLL frozen)                                                                        & tAONPD         & 2                                                                                             & 8.5                          & 2                           & 8.5                          & 2                           & 8.5                          & 2                           & 8.5                          & ns \\
Asynchronous RTT turn-off delay (Power-Down with DLL frozen)                                                                       & tAOFPD         & 2                                                                                             & 8.5                          & 2                           & 8.5                          & 2                           & 8.5                          & 2                           & 8.5                          & ns \\
RTT turn-on                                                                                                                        & tAON           & -400                                                                                          & 400                          & -300                        & 300                          & -250                        & 250                          & -225                        & 225                          & ps \\
RTT\_Nom and RTT\_WR turn-off time from ODTLoff reference                                                                            & tAOF           & 0.3                                                                                           & 0.7                          & 0.3                         & 0.7                          & 0.3                         & 0.7                          & 0.3                         & 0.7                          & tCK(avg) \\
RTT dynamic change skew                                                                                                            & tADC           & 0.3                                                                                           & 0.7                          & 0.3                         & 0.7                          & 0.3                         & 0.7                          & 0.3                         & 0.7                          & tCK(avg) \\
Write Leveling Timings \\
First DQS/DQS\# rising edge after write leveling mode is programmed                                                                 & tWLMRD         & 40                                                                                            & -                            & 40                          & -                            & 40                          & -                            & 40                          & -                            & nCK \\
DQS/DQS\# delay after write leveling mode is programmed                                                                             & tWLDQSEN       & 25                                                                                            & -                            & 25                          & -                            & 25                          & -                            & 25                          & -                            & nCK \\
Write leveling setup time from rising CK, CK\# crossing to rising DQS, DQS\# crossing                                                & tWLS           & 325                                                                                           & -                            & 245                         & -                            & 195                         & -                            & 165                         & -                            & ps \\
Write leveling hold time from rising DQS, DQS\# crossing to rising CK, CK\# crossing                                                 & tWLH           & 325                                                                                           & -                            & 245                         & -                            & 195                         & -                            & 165                         & -                            & ps \\
Write leveling output delay                                                                                                        & tWLO           & 0                                                                                             & 9                            & 0                           & 9                            & 0                           & 9                            & 0                           & 7.5                          & ns \\
Write leveling output error                                                                                                        & tWLOE          & 0                                                                                             & 2                            & 0                           & 2                            & 0                           & 2                            & 0                           & 2                            & ns \\
\end{longtable}
\setlength{\tabcolsep}{2pt}

PCI 总线特性
------------

### 电气条件

龙芯 3B1500 PCI总线为 1.8v电压，使用时可能需要芯片外部进行电压转换。

### 时序参数

\begin{longtable}{p{5cm}>{\tt}lp{5cm}*{4}{p{1.2cm}}>{\tt}c}
  \caption{通用时序参数} \label{tab:ddr-tsequence} \\ \toprule
  Symbol      & Parameter & \multicolumn{2}{c}{PCI-X 33} & \multicolumn{2}{c}{PCI 33 (ref)} & \\
              &           & Min.     & Max. & Min.       & Max.      & Unit                   \\ \midrule
  \midrule \endfirsthead
  \caption{通用时序参数（续）} \\ \toprule
  Symbol      & Parameter & \multicolumn{2}{c}{PCI-X 33} & \multicolumn{2}{c}{PCI 33 (ref)} & \\
              &           & Min.     & Max. & Min.       & Max.      & Unit                   \\ \midrule
  \midrule \endhead
  \rmcol{4}{\tiny 未完待续} \endfoot
  \bottomrule \endlastfoot
  Tval        & CLK to Signal Valid Delay -bused signals          & 2        & 6    & 2     & 11   & ns      \\
  Tval(p tp)  & CLK to Signal Valid Delay -point to point signals & 2        & 6    & 2     & 12   & ns      \\
  Ton         & Float to Active Delay                             & 2        &      & 2     &      & ns      \\
  Toff        & Active to Float Delay                             &          & 14   &       & 28   & ns      \\
  Tsu         & Input Set up Time to CLK- bused signals           & 3        &      & 7     &      & ns      \\
  Tsu(pt p)   & Input Set up Time to CLK- point to point signals  & 5        &      & 10,12 &      & ns      \\
  Th          & Input Hold Time from CLK                          & 0        &      & 0     &      & ns      \\
  Trst        & Reset Active Time                                 & 1        &      & 1     &      & ms      \\
  Trst-c lk   & Reset Active Time after CLK stable                & 100      &      & 100   &      & ms      \\
  Trst-o ff   & Reset Active to output float delay                &          & 40   &       & 40   & ns      \\
  Trrsu       & REQ64\# to RST\# setup time                       & 10       &      & 10    &      & clock s \\
  Trrh        & RST\# to REQ64\# hold time                        & 0        & 50   & 0     & 50   & ns      \\
  Trhfa       & RST\# high to first Configuration access          & 225      &      & 225   &      & clock s \\
  Trhff       & RST\# high to first FRAME\# assertion             & 5        &      & 5     &      & clock s \\
  Tpvrh       & Power valid to RST\# high                         & 100      &      & 100   &      & ms      \\
  Tprsu       & PCI-X initializatio n pattern to RST\# setup time &          &      &       &      & clock s \\
  Tprh        & RST\# to PCI-X initializatio n pattern hold time  &          &      &       &      & ns      \\
  Trlcx       & Delay from RST\# low to CLK frequency change      &          &      &       &      & ns      \\
\end{longtable}

### 复位时序

图 7-18 转换到带上拉的 PCI-X 模式的 RST\#时序

### PCI-X 的系统时序裕量

PCI-X 系统时序裕量与 33MHz 的 PCI 2.2 规范类似，具体的时序裕量见 表 7-38 和表
7-45。

\begin{table}[htbp]
  \centering
  \caption{建立时间预算}
  \label{tab:ddr-dc-condition}
  \begin{tabular}{>{\tt}c*{2}{p{2cm}}>{\tt}c}
    Parameter   & PCI-X 33 & PCI 33 (ref) & Units \\
    Tval (max)  & 6        & 11           & ns \\
    Tprop (max) & 5        & 10           & ns \\
    Tskew (max) & 1        & 2            & ns \\
    Tsu (min)   & 3        & 7            & ns \\
    Tcyc        & 15       & 30           & ns \\
  \end{tabular}
\end{table}



\begin{table}[htbp]
  \centering
  \caption{保持时间预算}
  \label{tab:ddr-dc-condition}
  \begin{tabular}{>{\tt}c*{2}{p{2cm}}>{\tt}c}
  Parameter   & PCI-X 33 & PCI 33 (ref) & Units \\
  Tval (min)  & 0.7      & 2            & ns \\
  Tprop (min) & 0.3      & 0            & ns \\
  Tskew (max) & 0.5      & 2            & ns \\
  Th (min)    & 0.5      & 0            & ns \\
  \end{tabular}
\end{table}

LPC 总线和其它引脚
------------------

### LPC 总线

#### 电气条件

龙芯 3B1500 LPC总线为 1.8v电压，使用时可能需要芯片外部进行电压转换。

#### 时序参数

\begin{table}[htbp]
  \centering
  \caption{LPC 时序参数}
  \label{tab:pcix-clkparam}
  \begin{tabular}{cP{5cm}ccc}
  Symbol    & Parameter                                  & Min     & Max & Unit \\
  Tcyc      & CLK Cycle Time                             & 30      & ∞   & ns \\
  Tval      & CLK to Signal Valid Delay - bused signals  & 2       & 11  & ns \\
  Tval(ptp) & CLK to Signal Valid Delay - point to point & 2       & 12  & ns \\
  Ton       & Float to Active Delay                      & 2       &     & ns \\
  Toff      & Active to Float Delay                      &         & 28  & ns \\
  Tsu       & Input Setup Time to CLK - bused signals    & 7       &     & ns \\
  Tsu(ptp)  & Input Setup Time to CLK - point to point   & 10,12   &     & ns \\
  Th        & Input Hold Time from CLK                   & 0       &     & ns \\
  Trst      & Reset active time after power stable       & 1       &     & ms \\
  Trst-clk  & Reset active time after CLK STABLE         & 100     &     & μs \\
  Trst-off  & Reset Active to Output Float delay         &         & 40  & ns \\
  Trrsu     & REQ64\# to RST\# Setup time                & 10*Tcyc &     & ns \\
  Trrh      & RST\# to REQ64\# Hold time                 & 0       & 50  & ns \\
  Trhfa     & RST\# High to First configuration Access   & 225     &     & clocks \\
  Trhff     & RST\# High to First FRAME\# assertion      & 5       &     & clocks \\
  Tpvrh     & Power valid to RST\# high                  & 100     &     & ms \\
  \end{tabular}
\end{table}

#### LPC 信号上拉的需求

LPC[3:0]信号需要上拉电阻在 TAR 周期来保持状态，其信号推荐的上拉电阻如表：

表 7-41 推荐的上拉电阻值

                             Signal Name                     Pull-Up
                               LAD[3:0]                   15k -100k ohm

### EJTAG

\begin{table}[htbp]
  \centering
  \caption{EJTAG 的交流时序特性}
  \label{tab:pcix-clkparam}
  \begin{tabular}{P{5cm}cccccc}
  Parameter                                           &                                   & Symbol       & Min. & Max. & Unit \\
  EJTAG external clock frequency of operation         &                                   & fJTG         & 0    & 33.3 & MHz \\
  EJTAG external clock cycle time                     &                                   & TJTG         & 30   & -    & n \\
  EJTAG external clock pulse width measured at 1.4V   &                                   & tJTKHKL      & 15   & -    & ns \\
  EJTAG external clock rise and fall times            &                                   & tJTGR& tJTGF & 0    & 2    & ns \\
  TRST assert time                                    &                                   & tTRST        & 25   & -    & ns \\
  Input setup times                                   & Boundary-scan data TMS, TDI       & tJTDVKH      & 4    & -    & ns \\
                                                      &                                   & tJTIVKH      & 0    & - \\
  Input hold times                                    & Boundary-scan data TMS, TDI       & tJTDXKH      & 20   & -    & ns \\
                                                      &                                   & tJTIXKH      & 25   & - \\
  Valid times                                         & Boundary-scan data TDO            & tJTKLDV      & 4    & 20   & ns \\
                                                      &                                   & tJTKLOV      & 4    & 25 \\
  Output hold times                                   & Boundary-scan data TDO            & tJTKLDX      & -    & -    & ns \\
                                                      &                                   & tJTKLOX      & -    & - \\
  EJTAG external clock to output high                 & impedance: Boundary-scan data TDO & tJTKLDZ      & 3    & 19   & ns \\
                                                      &                                   & tJTKLOZ      & 3    & 9 \\
  \end{tabular}
\end{table}

参考时钟
--------

### HyperTransport 的时钟



\begin{table}[htbp]
  \centering
  \caption{发送端时钟的不确定性}
  \label{tab:pcix-clkparam}
  \begin{tabular}{>{\tt}cp{5cm}ccccccc}
  Symbol    & Description                                                                                                                                               & 400 Mb/s & 600 Mb/s & 800 Mb/s & 1000 Mb/s & 1200 Mb/s & 1600 Mb/s & Unit \\
  TPLLdc    & 2\% duty cycle variation between opposing edges over 1 bit time                                                                                           & 100      & 67       & 50       & 40        & 33        & 25        & ps \\
  TPLLjtr   & Uncertainty in subsequent internal transmit clocks due to PLL variation between any 2 edges including that contributed by reference clock SSC techniques. & 150      & 67       & 50       & 20        & 17        & 13        & ps \\
  TPLLerror & edges due PLL accumulated phase error (≤20 ps / ns over 1 bi t t i me) in the internal transmit clock Uncertainty in subsequent CADOUT                   & 50       & 33       & 25       & 20        & 17        & 13        & ps \\
  TPLLsup   & Uncertainty in subsequent internal transmit clocks due to temporal PLL power supply modulation (50 ps/ns)                                                 & 125      & 83       & 63       & 50        & 42        & 31        & ps \\
  Tclkskew  & Uncertainty in the CLKOUT relative to CADOUT caused by load variations between the 90 degree phase shifted clock relative to the 0 degree clock           & 20       & 20       & 20       & 10        & 10        & 10        & ps \\
  \end{tabular}
\end{table}


### DDR2 内存的时钟

\begin{table}[htbp]
\caption{输入时钟抖动参数}
\label{tab:pcix-clkparam}
\begin{tabular}{P{5cm}cccccc}
                                                                 &                  &     DDR2-667         &   DDR2-800     & \\
              Parameter                                          &    Symbol        &  Min. &     Max.      &    Min.&   Max. &  Units \\
  Clock period jitter                                            &    tJIT(per)     & -125  &     125       &   -100 &  100   &  ps \\
  Clock period jitter during DLL locking period                  &    tJIT(per,lck) & -100  &     100       &   -80  &   80   &  ps \\
  Cycle to cycle clock period jitter                             &    tJIT(cc)      & -250  &     250       &   -200 &  200   &  ps \\
  Cycle to cycle clock period jitter during DLL locking period   &    tJIT(cc,lck)  &  -200 &      200      &    -160&   160  &   ps \\
  Cumulative error across 2 cycles                               &    tERR(2per)    & -175  &     175       &   -150 &  150   &  ps \\
  Cumulative error across 3 cycles                               &    tERR(3per)    & -225  &     225       &   -175 &  175   &  ps \\
  Cumulative error across 4 cycles                               &    tERR(4per)    & -250  &     250       &   -200 &  200   &  ps \\
  Cumulative error across 5 cycles                               &    tERR(5per)    & -250  &     250       &   -200 &  200   &  ps \\
  Cumulative error across n cycles, n = 6 ... 10, inclusive      &    tERR(6-10per) & -350  &     350       &   -300 &  300   &  ps \\
  Cumulative error across n cycles, n = 11 ... 50, inclusive     &    tERR(11-50per)& -450  &     450       &   -450 &  450   &  ps \\
  Duty cycle jitter                                              &    tJIT(duty)    & - 125 &     125       &   -100 &  100   &  ps \\
\end{tabular}
\end{table}

### PCI-X 时钟

图 7-19 3.3V PCI-X 时钟波形

\begin{table}[htbp]
\caption{PCI-X 时钟参数}
\label{tab:pcix-clkparam}
\begin{tabular}{>{\tt}clccc}
 Symbol &   Parameter    & Conv. PCI 33 (ref)  & Unit   \\
        &                &      Min. &  Max.   &        \\
  Tcyc  & CLK Cycle Time &       30  &    ∞    &   ns  \\
 Thigh  & CLK High Time  &       11  &         &   ns  \\
  Tlow  &  CLK Low Time  &       11  &         &   ns  \\
   -    & CLK Slew Rate  &       1   &     4   &  V/ns \\
\end{tabular}
\end{table}

电源
----

### 电源工作条件

\begin{table}[htbp]
\caption{推荐的工作电源电压}
\label{tab:ddr-dc-output}
\begin{tabular}{>{\tt}clcccc}
                  &                         & Voltage(V) & Max                        \\
 Net Name         & Description             & Min.       & Typ.  & Max.  & Current(A) \\
 VDD              & Core power              & 1.050      & 1.150 & 1.200 & 22.860     \\
 VDD\_N0          & Node0 CPU core power    & 1.000      & 1.100 & 1.300 & 25.450     \\
 VDD\_N1          & Node1 CPU core power    & 1.000      & 1.100 & 1.300 & 25.450     \\
 GND              & Core ground             & -          & -     & -     & -          \\
 VDDE\_DDR(DDR2)  & DDR2 power              & 1.700      & 1.800 & 1.800 & 3.000      \\
 (DDR3)           & DDR3 power              & 1.425      & 1.500 & 1.575 & -          \\
 VDDE\_VREF(DDR2) & DDR2 ref power          & 0.882      & 0.900 & 0.918 &            \\
 (DDR3)           & DDR3 ref power          & 0.735      & 0.750 & 0.765 & -          \\
 VDDE\_1V8        & IO power                & 1.710      & 1.800 & 1.890 & 1.667      \\
 VDDE\_1V2        & HT power                & 1.140      & 1.200 & 1.260 & 1.000      \\
 GNDE             & IO ground               & -          & -     & -     & -          \\
 CORE\_PLL\_AVDD  & Core PLL analog power   & 1.045      & 1.100 & 1.155 & -          \\
 CORE\_PLL\_DVDD  & Core PLL digital power  & 1.045      & 1.100 & 1.155 & -          \\
 CORE\_PLL\_GND   & Core PLL digital ground & -          & -     & -     & -          \\
 DDR\_PLL\_AVDD   & DDR PLL analog power    & 1.045      & 1.100 & 1.155 & -          \\
 DDR\_PLL\_DVDD   & DDR PLL digital power   & 1.045      & 1.100 & 1.155 & -          \\
 DDR\_PLL\_GND    & DDR PLL digital ground  & -          & -     & -     & -          \\
 HT0\_PLL\_AVDD   & HT0 PLL analog power    & 1.045      & 1.100 & 1.155 & -          \\
 HT0\_PLL\_DVDD   & HT0 PLL digital power   & 1.045      & 1.100 & 1.155 & -          \\
 HT0\_PLL\_GND    & HT0 PLL digital ground  & -          & -     & -     & -          \\
 HT1\_PLL\_AVDD   & HT1 PLL analog power    & 1.045      & 1.100 & 1.155 & -          \\
 HT1\_PLL\_DVDD   & HT1 PLL digital power   & 1.045      & 1.100 & 1.155 & -          \\
 HT1\_PLL\_GND    & HT1 PLL digital ground  & -          & -     & -     & -          \\
\end{tabular}
\end{table}
