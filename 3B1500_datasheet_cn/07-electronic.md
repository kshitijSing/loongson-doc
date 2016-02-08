电气特性
========

通用电器特性
------------

### 绝对最大额定值

表 7-1 绝对最大额定值

            Parameter           Description            Min.            Max.

               VDD             处理器核电源                  -0.3V           1.2V
           VDD_N0/1         处理器节点 0/1 电源               -0.3V           1.5V
            VDDE1V8           处理器 IO 电源                -0.3V           2.0V
                          DDR2 通道 0/1 IO 电源            -0.3V           2.3V
         MEM_VDDE_0/1
                          DDR3 通道 0/1 IO 电源            -0.3V           1.8V
            HT_VDDE             HT IO 电源               -0.3V           1.3V
               Tstg              存储温度                  -55℃            150℃


### 推荐的直流工作条件

表 7-2 推荐的直流工作条件

       Parameter           Description         Min.            Typ.           Max.
         VDD              处理器核电源               1.05V           1.05V          1.15V
       VDD_N0/1         处理器节点 0/1 电源           1.00V           1.10V          1.3V
       VDDE1V8           处理器 IO 电源             1.71V           1.80V          1.89V
 CORE_PLL_AVDD          核心 PLL 模拟电源            1.1V            1.15V          1.2V
 CORE_PLL_DVDD          核心 PLL 数字电源            1.1V            1.15V          1.2V
 CORE_PLL_GND             核心 PLL 地              0V              0V             0V
     DDR_PLL_AVDD       DDR PLL 模拟电源           1.1V            1.15V          1.2V
     DDR_PLL_DVDD       DDR PLL 数字电源           1.1V            1.15V          1.2V
     DDR_PLL_GND          DDR PLL 地             0V              0V             0V
 HT0/1_PLL_AVDD         HT0/1 PLL 模拟电源         1.1V            1.15V          1.2V
 HT0/1_PLL_DVDD         HT0/1 PLL 数字电源         1.1V            1.15V          1.2V
     HT0/1_PLL_GND        HT0/1 PLL 地           0V              0V             0V

HyperTransport 总线接口特性
---------------------------

### HyperTransport 推荐直流工作条件

表 7-2 HyperTransport 直流工作条件

        Symbol                             Parameter                      Min.   Typ.   Max.   Unit
         VOD             Output Differential Voltage                       495    600    715    mV
         DVOD            Change in VOD from 0 to 1 State                   -15     0     15     mV
         VOCM            Output Common Mode Voltage                        495    600    715    mV
        ∆VOCM            Change in VOCM from 0 to 1 State                  -15     0     15     mV
          VID            Input Differential Voltage                        200    600   1000    mV
         DVID            Change in VID from 0 to 1 State                   -15     0     15     mV
         VICM            Input Common Mode Voltage                         440    600    780    mV
        ∆VICM            Change in VICM from 0 to 1 State                  -15     0     15     mV
          RTT            Input Differential Impedance                      90     100    110   Ohm
     RON (pull up)       Output Driver Impedance driving high              45     50     55    Ohm
       RON (pulldown) Output Driver Impedance driving low                  45     50     55    Ohm
                         Output pad capacitance for devices rated above
                         800 MT/s.
         Cout            Output pad capacitance for devices rated up to                   5     pF
                         800 MT/s.
                         Input pad capacitance for devices rated above                    2     pF
                         800 MT/s.
         Cin             Input pad capacitance for devices rated up to                    5     pF
                         800 MT/s

### HyperTransport 推荐交流工作条件

表 7-3 HyperTransport 交流工作条件

       Symbol              Parameter              Min.     Typ.   Max.   Unit
        VOD    Output Differential Voltage        400     600    820     mV
        DVOD   Change in VOD from 0 to 1 State    -75             75     mV
        VOCM   Output Common Mode Voltage         440     600    780     mV
       ∆VOCM   Change in VOCM from 0 to 1 State   -50             50     mV
        VID    Input Differential Voltage         300     600    900     mV
        DVID   Change in VID from 0 to 1 State    -125            125     mV
        VICM   Input Common Mode Voltage          385     600    845     mV
       ∆VICM   Change in VICM from 0 to 1 State   -100   100    mV
        TR     Input Rising Edge Rate             1.0    4.0   V/ns
        TF     Input Falling Edge Rate            1.0    4.0   V/ns


### 传输时序特性

 图 7-1 HyperTransport 总线 TODIFF 时序
 图 7-2 HyperTransport 总线 TDIFF 时序
 图 7-3 HyperTransport 总线 TCADV 时序
 图 7-4 HyperTransport 总线 TSU 和 THD 时序
 图 7-5 HyperTransport 总线 TCADVRS / TCADVRH 时序

表 7-4 HyperTransport 连接传输时序规范
                                                               Link
Parameter                    Description                                  Min.   Max.   Units
                                                               Speed
                                                              400 MT/s            70     ps
                                                              600 MT/s            70     ps
                                                              800 MT/s            70     ps
 TODIFF                Output differential skew
                                                              1000 MT/s           60     ps
                                                              1200 MT/s           60     ps
                                                              1600 MT/s           60     ps

                                                              400 MT/s            90     ps
                                                              600 MT/s            90     ps
                                                              800 MT/s            90     ps
 TIDIFF                Input differential skew
                                                              1000 MT/s           65     ps
                                                              1200 MT/s           65     ps
                                                              1600 MT/s           65     ps
                                                              400 MT/s    695    1805    ps
                                                              600 MT/s    467    1200    ps
            Transmitter output CAD/CTLOUT valid relative to   800 MT/s    345    905     ps
 TCADV                          CLKOUT                        1000 MT/s   280    720     ps
                                                              1200 MT/s   234    600     ps
                                                              1600 MT/s   166    459     Ps
                                                                     400 MT/s     460               ps
                                                                     600 MT/s     312               ps
                                                                     800 MT/s     225               ps
TCADVRS             Receiver input CADIN valid time to CLKIN
                                                                     1000 MT/s    194               ps
                                                                     1200 MT/s    166               ps
                                                                     1600 MT/s    116               Ps
                                                                     400 MT/s     460               ps
                                                                     600 MT/s     312               ps
                                                                     800 MT/s     225               ps
TCADVRH             Receiver input CADIN valid time from CLKIN
                                                                     1000 MT/s    194               ps
                                                                     1200 MT/s    166               ps
                                                                     1600 MT/s    116               Ps
                                                                     400 MT/s      0         250    ps
                                                                     600 MT/s      0         215    ps
                                                                     800 MT/s      0         175    ps
     TSU                    Receiver input setup time
                                                                     1000 MT/s     0         153    ps
                                                                     1200 MT/s     0         138    ps
                                                                     1600 MT/s     0         110    Ps
                                                                     400 MT/s      0         250    ps
                                                                     600 MT/s      0         215    ps
                                                                     800 MT/s      0         175    ps
     THD                     Receiver input hold time
                                                                     1000 MT/s     0         153    ps
                                                                     1200 MT/s     0         138    ps
                                                                     1600 MT/s     0         110    Ps

DDR2 总线内存接口特性
---------------------

### 推荐直流特性

表 7-5 推荐的直流工作条件(SSTL_1.8)
                                                                    Rating
           Symbol               Parameter                                                          Units
                                                        Min.         Typ.           Max.
                            Supply Voltage for
VDDQ(MEM_VDDE_0/1)                                      1.7           1.8              1.9           V
                                 Output
VREF(MEM_VREF_0/1)        Input Reference Voltage   0.49 x VDDQ   0.50 x VDDQ    0.51 x VDDQ         V
             VTT           Termination Voltage      VREF - 0.04      VREF        VREF + 0.04         V

表 7-6 输入的直流逻辑电平
              Symbol             Parameter              Min.         Max.           Units
             VIH(dc)        DC input logic HIGH      VREF+0.125     VDDQ+0.3            V
             VIL(dc)        DC input logic LOW          -0.3       VREF-0.125           V


表 7-7 输出直流电流驱动
      Symbol                    Parameter                               SSTl_18                Units
     IOH(dc)     Output Minimum Source DC Current                          -13.4                mA
     IOL(dc)     Output Minimum Sink DC Current                            13.4                 mA

### 推荐的交流特性

表 7-8 输入交流逻辑电平

                                 DDR2-400, DDR2-533                 DDR2-667, DDR2-800
       Symbol     Parameter                                                                     Units
                                  Min.           Max.               Min.             Max.
        VIH       ac input
                               VREF+0.250         -            VREF+0.200             -             V
        (ac)     logic HIGH
        VIL       ac input
                                     -        VREF-0.250                          VREF-0.200        V
        (ac)     logic LOW


                                 表 7-9 差分的输入交流逻辑电平

     Symbol                Parameter                       Min.                     Max.             Units

     VID(ac)     AC differential input voltage                0.5                  VDDQ+0.6             V
                 AC differential crosspoint
     VIX (ac)                                      0.5 x VDDQ-0.175          0.5 x VDDQ+0.175           V
                 voltage

图 7-6 差分的信号电平

表 7-10 差分的交流输出参数

     Symbol              Parameter                      Min.                       Max.              Units
                 AC differential crosspoint
     VOX (ac)                                  0.5 x VDDQ-0.125            0.5 x VDDQ+0.125             V
                 voltage



### 电气交流时序特性

表 7-11 不同密度的器件刷新参数

Parameter                   Symbol                 256 Mb       512 Mb         1Gb       2Gb        4Gb    Units
Refresh to
                                  tRFC                   75            105         127.5      195       327.5    ns
active/Refresh
command time

                                   0°C≤ TCASE
                                                           7.8    7.8        7.8           7.8   7.8       μs
Average periodic                   ≤85 °C
                         tREFI
refresh interval                      85°C< TCASE
                                                           3.9    3.9        3.9           3.9   3.9       μs
                                          ≤95 °C


表 7-12 DDR2 内存标准速率分级

      Speed bin    DDR2-800C      DDR2-800D      DDR2-800E      DDR2-667C      DDR2-667D
                                                                                           Units
     CL-tRCD-tRP     4-4-4          5-5-5           6-6-6          4-4-4          5-5-5
      Parameter    Min. Max. Min. Max. Min. Max. Min. Max. Min. Max.
         tRCD       10      -     12.5     -      15      -      12      -      15      -    ns
         tRP1       10      -     12.5     -      15      -      12      -      15      -    ns
         tRC        55      -     57.5     -      60      -      57      -      60      -    ns
         tRAS       45    70000    45    70000    45    70000    45    70000    45    70000 ns
       tCK(avg)
                 Optional       Optional       Optional       Optional       Optional       ns
        @CL=2
       tCK(avg)
                 Optional       Optional       Optional       Optional       Optional       ns
        @CL=3
       tCK(avg)
                   2.5      8     3.75     8     3.75     8       3      8     3.75     8    ns
        @CL=4
       tCK(avg)
                   2.5      8     2.5      8       3      8       3      8       3      8    ns
        @CL=5
       tCK(avg)
                 Optional       Optional         2.5      8 Optional         Optional       ns
        @CL=6


表 7-13 DDR2-667 和 DDR2-800 时序参数

                                                DDR2-667                   DDR2-800
      Parameter           Symbol                                                                 Units
                                         Min.              Max.    Min.               Max.
Average clock period     tCK(avg)        3000              8000    2500               8000         ps
Average clock HIGH                                                                               tCK(avg
                         tCH(avg)        0.48              0.52    0.48               0.52
pulse width                                                                                         )
Average clock LOW                                                                                tCK(avg
                         tCL(avg)        0.48              0.52    0.48               0.52
pulse width                                                                                         )
Write command to DQS
associated clock            WL                   RL - 1                     RL - 1                nCK
edge
DQS latching rising
transitions to                                                                                   tCK(avg
                           tDQSS        -0.25             0.25     -0.25              0.25
associated clock                                                                                    )
edges
DQS falling edge to                                                                              tCK(avg
                           tDSS          0.2                x       0.2                x
CK setup time                                                                                       )
DQS falling edge                                                                                 tCK(avg
                           tDSH          0.2                x       0.2                x
hold time from CK                                                                                   )
DQS input HIGH pulse                                                                             tCK(avg
                           tDQSH         0.35               x      0.35                x
width                                                                                               )
DQS input LOW pulse                                                                              tCK(avg
                           tDQSL         0.35               x      0.35                x
width                                                                                               )
                                                                                                 tCK(avg
Write preamble             tWPRE         0.35               x      0.35                x
                                                                                                    )
                                                                                                 tCK(avg
Write postamble            tWPST         0.4               0.6      0.4               0.6
                                                                                                    )
Address and control
                        tIS(base)      200          x          175          x         ps
input setup time

Address and control
                        tIH(base)      275          x          250          x         ps
input hold time
Control & Address
                                                                                    tCK(avg
input pulse width         tIPW         0.6          x          0.6          x
                                                                                       )
for each input
DQ and DM input setup
                        tDS(base)      100          x          50           x         ps
time

DQ and DM input hold
                        tDH(base)      175          x          125          x         ps
time
DQ and DM input pulse                                                               tCK(avg
                         tDIPW        0.35          x         0.35          x
width for each input                                                                   )
DQ output access           tAC        -450         450        -400         400        ps
time from CK/CK
DQS output access        tDQSCK       -400         400        -350         350        ps
time from CK/CK
Data-out                   tHZ                   tAC, max                tAC, max     ps
high-impedance time                     x                       x
from CK/CK
DQS/DQS
low-impedance time      tLZ(DQS)    tAC, min     tAC, max   tAC, min     tAC, max     ps
from CK/CK
DQ low-impedance                    2 x tAC,                2 x tAC,
                         tLZ(DQ)                 tAC, max                tAC, max     ps
time from CK/CK                       min                     min
DQS-DQ skew for DQS
and associated DQ        tDQSQ          x          240          x          200        ps
signals
                                    Min( tCH(               Min( tCH(
CK half pulse width        tHP      abs),           x       abs),           x         ps
                                    tCL(abs) )              tCL(abs) )
DQ hold skew factor       tQHS          X          340          x          300        ps
DQ/DQS output hold
                           tQH      tHP - tQHS      x       tHP - tQHS      x         ps
time from DQS
                                                                                    tCK(avg
Read preamble            tRPRE         0.9         1.1         0.9         1.1
                                                                                       )
                                                                                    tCK(avg
Read postamble           tRPST         0.4         0.6         0.4         0.6
                                                                                       )
Activate to activate
command period for
                          tRRD         7.5          x          7.5          x         ns
1KB page size
products
Activate to activate
command period for
                          tRRD         10           x          10           x         ns
2KB page size
products
Four Activate Window
for 1KB page size         tFAW        37.5          x          35           x         ns
products
Four Activate Window
for 2KB page size         tFAW         50           x          45           x         ns
products
CAS to CAS command
                          tCCD          2           x           2           x        nCK
delay
Write recovery time     tWR        15            x            15             x         ns
Auto precharge write
recovery + precharge   tDAL     WR + tnRP        x         WR + tnRP         x         nCK
time
Internal write to
                       tWTR        7.5           x            7.5            x         ns
read command delay
Internal read to
precharge command      tRTP        7.5           x            7.5            x         ns
delay
CKE minimum pulse
width (HIGH and LOW    tCKE         3            x             3             x         nCK
pulse width)
Exit self refresh to
                       tXSNR    tRFC + 10        x         tRFC + 10         x         ns
a non-read command
Exit self refresh to
                       tXSRD       200           x            200            x         nCK
a read command
Exit precharge power
                        tXP         2            x             2             x         nCK
down to any command
Exit active power
                       tXARD        2            x             2             x         nCK
down to read command
Exit active power
down to read command
                       tXARDS     7-AL           x           8-AL            x         nCK
(slow exit, lower
power)
ODT turn-on delay      tAOND        2            2             2             2         nCK
                                             tAC, max +                 tAC, max +
ODT turn-on            tAON     tAC, min                   tAC, min                    ns
                                             0.7                        0.7
                                             2 x                        2 x
ODT turn-on                     tAC, min +                 tAC, min +
                       tAONPD                tCK(avg) +                 tCK(avg) +     ns
(Power-Down mode)                        2                          2
                                             tAC, max +1                tAC, max + 1
ODT turn-off delay     tAOFD       2.5          2.5           2.5           2.5        nCK
                                             tAC, max +                 tAC, max +
ODT turn-off           tAOF     tAC, min                   tAC, min                    ns
                                             0.6                        0.6
                                             2.5 x
                                                                        2.5 x
ODT turn-off                    tAC, min +   tCK(avg) +    tAC, min +
                       tAOFPD                                           tCK(avg) +     ns
(Power-Down mode)                        2   tAC, max +             2
                                                                        tAC, max + 1
                                             1
ODT to power down
                       tANPD        3            x             3             x         nCK
entry latency
ODT Power Down Exit
                       tAXPD        8                          8                       nCK
Latency
Mode register set
                       tMRD         2            x             2             x         nCK
command cycle time
MRS command to ODT
                       tMOD         0            12            0            12         ns
update delay
OCD drive mode
                       tOIT         0            12            0            12         ns
output delay
Minimum time clocks
                                  tIS+                       tIS +
remains ON after CKE
                       tDelay   tCK(avg)+        X         tCK(avg) +        x         ns
asyn-chronously
                                   tIH                        tIH
drops LOW

DDR3 内存接口特性
-----------------

### 推荐的直流工作条件

表 7-14 推荐的直流工作条件

 Symbol              Parameter                    Min.        Typ.           Max.            Unit
  VDD      Supply Voltage                        1.425         1.5           1.575             V
 VDDQ      Supply Voltage for Output             1.425         1.5           1.575             V


### 交流和直流逻辑输入电平

#### 单端信号的交流和直流输入电平 {-}

表 7-15 控制信号和地址单端信号的交流和直流输入电平

                                                                     DDR3-800/1066/1333/1600
      Symbol                         Parameter                                                                    Unit
                                                                         Min                    Max
 VIH.CA(DC100) DC input logic high                                 Vref + 0.100                 VDD                V
 VIL.CA(DC100)       DC input logic low                                  VSS                 Vref - 0.100          V
 VIH.CA(AC175) AC input logic high                                 Vref + 0.175                 Note 2             V
 VIL.CA(AC175)       AC input logic low                                 Note 2               Vref - 0.175          V
 VIH.CA(AC150) AC input logic high                                 Vref + 0.150                Note 2              V
 VIL.CA(AC150)       AC input logic low                                 Note 2               Vref - 0.150          V
      VRefCA(DC)     Reference Voltage for ADD, CMD inputs         0.49 * VDD                0.51 * VDD            V


                            表 7-16 DQ 和 DM 单端信号的交流和直流输入电平
                                                   DDR3-800, DDR3-1066            DDR3-1333, DDR3-1600
      Symbol               Parameter                                                                                   Unit
                                                     Min           Max               Min                 Max
 VIH.DQ(DC100) DC input logic high               Vref + 0.100      VDD           Vref + 0.100            VDD             V
 VIL.DQ(DC100) DC input logic low                   VSS         Vref - 0.100         VSS            Vref - 0.100         V
 VIH.DQ(AC175) AC input logic high               Vref + 0.175       -                    -                -              V
 VIL.DQ(AC175) AC input logic low                    -          Vref - 0.175             -                -              V
 VIH.DQ(AC150) AC input logic high               Vref + 0.150       -            Vref + 0.150                 -          V
 VIL.DQ(AC150) AC input logic low                    -          Vref - 0.150             -          Vref - 0.150         V
                   Reference Voltage for
      VRefDQ(DC)                                 0.49 * VDD     0.51 * VDD        0.49 * VDD        0.51 * VDD           V
                   DQ, DM inputs


#### 差分信号的交流和直流输入电平 {-}

图 7-7 ac-swing 和 ac-level 时间点（tDVA）的差分定义

表 7-17 交流和直流的差分输入电平
                                                          DDR3-800,1066
      Symbol              Parameter                                                     Unit
                                                Min                 Max
     VIHdiff     Differential input high        + 0.200             note 3              V
     VILdiff     Differential input logic low   Note 3              - 0.200             V
     VIHdiff(ac) Differential input high ac     2 x (VIH(ac) - Vref) Note 3             V
     VILdiff(ac) Differential input low ac      note 3              2 x (VIL(ac) - Vref) V


#### 差分信号输入的交叉点电压 {-}

为了保证严格的建立和保持时钟和选通时间以及输出偏差参数，每个交叉点电压的差
分输入信号（CK，CK＃和DQS，DQS＃）必须满足表 28 的要求。差分输入的交叉点电压
VIX的测量是从实际的交叉点的和补偿信号的VDD和VSS之间的中间点处获得。

图 7-8 Vix 定义

表 7-18 差分输入信号(CK, DQS)交叉点电压
                                                                            DDR3-800, DDR3-1066,
     Symbol                           Parameter                             DDR3-1333, DDR3-1600   Unit
                                                                               Min.        Max.
               Differential Input Cross Point Voltage relative to VDD/2        -150          150   mV
      VIX
               for CK,CK#                                                      -175          175   mV
               Differential Input Cross Point Voltage relative to VDD/2
      VIX                                                                      -150          150   mV
               for DQS, DQS#



### 交流和直流逻辑输出电平

#### 单端信号的交流和直流输出电平 {-}

表 7-19 单端信号的交流直流输出电平
                                                                          DDR3-800, 1066, 1333,
     Symbol                          Parameter                                                     Unit
                                                                               and 1600
               DC output high measurement level (for IV curve
 VOH(DC)                                                                        0.8 x VDDQ          V
               linearity)
 VOM(DC)       DC output mid measurement level (for IV curve linearity)         0.5 x VDDQ          V
 VOL(DC)       DC output low measurement level (for IV curve linearity)         0.2 x VDDQ          V
 VOH(AC)       AC output high measurement level (for output SR)              VTT + 0.1 x VDDQ       V
 VOL(AC)       AC output low measurement level (for output SR)               VTT - 0.1 x VDDQ       V


#### 差分信号的交流和直流输出电平

表 7-20 差分信号的交流和直流输出电平
                                                                               DDR3-800, 1066,
     Symbol                              Parameter                                                 Unit
                                                                                1333, and 1600
                AC differential output high measurement level (for output
 VOHdiff(AC)                                                                     + 0.2 x VDDQ       V
                SR)
                AC differential output low measurement level (for output
 VOLdiff(AC)                                                                     - 0.2 x VDDQ       V
                SR)

#### 单端信号的输出斜率

作为时序测量的参考负载，单端信号的下降沿和上升沿输出斜率的定义和测量在VOL （AC）
和VOH（AC）之间，如表 7.21 和图 7.9 所示。


表 7-21 单端信号输出斜率的定义
                                                              Measured
                   Description                                                                      Defined by
                                                         from                to
 Single-ended output slew rate for rising edge          VOL(AC)          VOH(AC)         [VOH(AC) -VOL(AC)] / DeltaTRse
 Single-ended output slew rate for falling
                                                      VOH(AC)            VOL(AC)         [VOH(AC) - VOL(AC)] / DeltaTFse
 edge


                                        图 7-9 单端输出斜率的定义
                                             表 7-22 单端的输出斜率
                                                             DDR3-800             DDR3-1066
              Parameter                      Symbol                                                       Unit
                                                          Min.       Max.         Min.      Max.
 Single-ended Output Slew Rate               SRQse          2.5          5        2.5         5        V/ns


#### 差分输出斜率 {-}

表 7-23 差分输出斜率的定义
                                                        Measured
               Description                                                                   Defined by
                                                 from               to
 Differential output slew rate for rising                                              [VOHdiff(AC) -
                                              VOLdiff(AC)     VOHdiff(AC)
 edge                                                                               VOLdiff(AC)]/DeltaTRdiff
 Differential output slew rate for falling                                             [VOHdiff(AC) -
                                              VOHdiff(AC)       VOLdiff(AC)
 edge                                                                               VOLdiff(AC)]/DeltaTFdiff

                                   图 7-10 差分输出斜率的定义


                                     表 7-24 差分输出斜率
                                         DDR3-800        DDR3-1066       DDR3-1333      DDR3-1600
                                                                                                      Units
         Parameter            Symbol     Min   Max       Min     Max     Min     Max    Min     Max
 Differential Output Slew Rate SRQdiff   5      10        5      10          5   10     TBD      10   V/ns


#### 上冲和下冲的规范{-}

表 7-25 地址和控制引脚的交流上冲/下冲规范(A0-A15, BA0-BA3, CS#, RAS#, CAS#,
WE#, CKE, ODT)

                     Parameter                         DDR3-800 DDR3-1066 DDR3-1333 DDR3-1600         Units
 Maximum peak amplitude allowed for overshoot area.       0.4          0.4        0.4         0.4       V
 Maximum peak amplitude allowed for undershoot area.      0.4          0.4        0.4         0.4       V
 Maximum overshoot area above VDD                         0.67         0.5        0.4         0.33    V-ns
 Maximum undershoot area below VSS                        0.67         0.5        0.4         0.33    V-ns
                           (A0-A15, BA0-BA3, CS#, RAS#, CAS#, WE#, CKE, ODT)

图 7-11 地址和控制的上冲和下冲定义

表 7-26 时钟，数据，选通和屏蔽信号的交流上冲/下冲规范(CK,CK#,DQ,DQS,DQS#,DM)

                                                       DDR3-800 DDR3-1066 DDR3-1333 DDR3-1600 Units
 Maximum peak amplitude allowed for overshoot area.        0.4          0.4        0.4         0.4      V
 Maximum peak amplitude allowed for undershoot area.       0.4          0.4        0.4         0.4      V
 Maximum overshoot area above VDDQ                         0.25        0.19        0.15        0.13    V-ns
 Maximum undershoot area below VSSQ                        0.25        0.19        0.15        0.13    V-ns
                                         (CK, CK#, DQ, DQS, DQS#, DM)




图 7-12 时钟，数据，选通和屏蔽信号的交流上冲和下冲定义


#### ODT 时序定义

表 7-27 ODT 时序定义

     Symbol         Begin Point Definition                  End Point Definition            Figure
              Rising edge of CK -CK# defined by the
      tAON                                            Extrapolated point at VSSQ          Figure 103
              end point of ODTLon
              Rising edge of CK -CK# with ODT
 tAONPD                                               Extrapolated point at VSSQ          Figure 104
              being first registered high
              Rising edge of CK -CK#defined by the    End point: Extrapolated point at
      tAOF                                                                                Figure 105
              end point of ODTLoff                    VRTT_Nom
              Rising edge of CK -CK# with ODT         End point: Extrapolated point at
     tAOFPD                                                                               Figure 106
              being first registered low              VRTT_Nom
              Rising edge of CK -CK# defined by the   End point: Extrapolated point at
      tADC    end point of ODTLcnw, ODTLcwn4 or       VRTT_Wr      and      VRTT_Nom      Figure 107
              ODTLcwn8                                respectively

                           表 7-28 ODT 时序测量的参考设置
 Measured Parameter   RTT_Nom Setting    RTT_Wr Setting     VSW1[V]   VSW2[V]
                          RZQ/4               NA             0.05      0.10
       tAON
                          RZQ/12              NA             0.10      0.20
                          RZQ/4               NA             0.05      0.10
      tAONPD
                          RZQ/12              NA             0.10      0.20
                          RZQ/4               NA             0.05      0.10
       tAOF
                          RZQ/12              NA             0.10      0.20
                          RZQ/4               NA             0.05      0.10
      tAOFPD
                          RZQ/12              NA             0.10      0.20
        tAD               RZQ/12             RZQ/2           0.20      0.30




图 7-13 tAON 的定义
图 7-14 tAONPD 的定义
图 7-15 tAOF 的定义
图 7-16 tAOFPD 的定义
图 7-17 tADC 的定义

### IDD 和 IDDQ 规范的参数和测试条件

表 7-29 IDD 和 IDDQ 测量循环模式的时序

               DDR3-800               DDR3-1066              DDR3-1333                          DDR3-1600
Symbol
               5-5-5 6-6-6 6-6-6 7-7-7 8-8-8 7-7-7 8-8-8 9-9-9           10-10-10   8-8-8 9-9-9 10-10-10    11-11
 tCK                 2.5                1.875                     1.5                             1.25
 CL             5          6      6       7       8    7     8      9      10        8     9        10        11
nRCD            5          6      6       7       8    7     8      9      10        8     9        10        11
 nRC            20         21    26      27       28   31    32    33      34        36    37       38        39
nRAS                 15                  20                       24                               28
 nRP            5          6      6       7       8    7     8      9      10        8     9        10        11
nFAW    1KBpagesize         16                  20                       20                               24
           2KB page size         20                    27                             30                                 32
           1KB page size         4                     4                              4                                      5
 nRRD
           2KB page size         4                     6                              5                                      6
     nRFC 512 Mb                     36               48                              60                                 72
      nRFC 1 Gb                      44               59                              74                                 88
      nRFC 2 Gb                      64               86                              107                                128
      nRFC 4 Gb                  120                  160                             200                                240
      nRFC 8 Gb                  140                  187                             234                                280



### 输入/输出电容

表 7-30 输入/输出电容
                                                    DDR3-800                 DDR3-1066                 DDR3-1333         DDR3-1600
Parameter                       Symbol
                                               Min          Max            Min         Max            Min     Max       Min      Max
Input/output   capacitance
(DQ, DM, DQS, DQS#,               CIO          1.5          3.0            1.5            2.7         1.5     2.5        1.5     2.3
TDQS,TDQS#)
Input capacitance, CK and
                                  CCK          0.8          1.6            0.8            1.6         0.8     1.4        0.8     1.4
CK#
Input capacitance delta, CK
                                 CDCK           0           0.15            0          0.15            0      0.15       0       0.15
and CK#
Input/output   capacitance
                                CDDQS           0           0.2             0             0.2          0      0.15       0       0.15
delta DQS and DQS#
Input capacitance, (CTRL,
                                   CI          0.75         1.4            0.75        1.35           0.75    1.3       0.75     1.3
ADD, CMD input-only pins)
Input capacitance delta, (All
                               CDI_CTRL        -0.5         0.3            -0.5           0.3         -0.4    0.2       -0.4     0.2
CTRL input-only pins
Input capacitance delta, (All CDI_ADD_CM
                                               -0.5         0.5            -0.5           0.5         -0.4    0.4       -0.4     0.4
ADD/ CMD input-only pins)          D
Input/output   capacitance
delta, DQ, DM, DQS,              CDIO          -0.5         0.3            -0.5           0.3         -0.5    0.3       -0.5     0.3
DQS#, TDQS, TDQS#
Input/output capacitance of
                                  CZQ           -              3            -              3           -          3          -    3
ZQ pin



### 不同器件密度下的刷新参数

表 7-31 不同器件密度下的刷新参数
            Parameter                        Symbol                512Mb     1Gb      2Gb       4Gb    8Gb   Unit
REF command to ACT or REF
                                              tRFC                  90       110      160       300    350    ns
command time
Average      periodic      refresh           0≤TCASE≤85             7.8         7.8   7.8       7.8    7.8    us
                                     tREFI
interval                                     85<TCASE≤95            3.9         3.9   3.9       3.9    3.9    us



### 标准的速度分级

表 7-32 DDR3-800 Speed Bins and Operating Conditions
                            Speed Bin                                      DDR3-800D                  DDR3-800E       Unit

                            CL - nRCD - nRP                                         5-5-5                      6-6-6
               Parameter                             Symbol            Min.              Max.          Min.             Max.
Internal read command to first data                       tAA          12.5                20           15               20          ns
ACT to internal read or write delay time                 tRCD          12.5                —            15               —           ns
PRE command period                                        tRP          12.5                —            15               —           ns
ACT to ACT or REF command period                          tRC           50                 —           52.5              —           ns
ACT to PRE command period                                tRAS          37.5          9 * tREFI         37.5         9 * tREFI        ns
     CL = 5                  CWL = 5                tCK(AVG)            2.5                3.3          3.0              3.3         ns
     CL = 6                  CWL = 5                tCK(AVG)            2.5                3.3          2.5              3.3         ns
Supported CL Settings                                                               5, 6                        5, 6              nCK
Supported CWL Settings                                                               5                              5             nCK


                            表 7-33 DDR3-1066 Speed Bins and Operating Conditions
              Speed Bin                    DDR3-1066E                 DDR3-1066F                       DDR3-1066G
          CL - nRCD – nRP                         6-6-6                   7-7-7                              8-8-8              Unit
     Parameter                Symbol     Min.            Max.    Min.                Max.          Min.             Max.
Internal           read
command       to    first      tAA      11.25             20    13.125                20              15             20         ns
data
ACT to internal read
                              tRCD      11.25             —     13.125                —               15             —          ns
or write delay time
PRE         command
                               tRP      11.25             —     13.125                —               15             —          ns
period
ACT to ACT or REF
                               tRC      48.75             —     50.625                —            52.5              —          ns
command period
ACT    to     PRE
                               tRAS      37.5       9 * tREFI    37.5           9 * tREFI          37.5        9 * tREFI        ns
command period
           CWL = 5          tCK(AVG)     2.5              3.3    3.0                  3.3             3.0           3.3         ns
 CL = 5
           CWL = 6          tCK(AVG)           Reserved                 Reserved                           Reserved             ns
           CWL = 5          tCK(AVG)     2.5              3.3    2.5                  3.3             2.5           3.3         ns
 CL = 6
           CWL = 6          tCK(AVG)    1.875            <2.5           Reserved                           Reserved             ns
           CWL = 5          tCK(AVG)           Reserved                 Reserved                           Reserved             ns
 CL = 7
           CWL = 6          tCK(AVG)    1.875            <2.5   1.875                < 2.5                 Reserved             ns
           CWL = 5          tCK(AVG)           Reserved                 Reserved                           Reserved             ns
 CL = 8
           CWL = 6          tCK(AVG)    1.875            <2.5   1.875                <2.5         1.875             <2.5        ns
Supported CL Settings                            5,6,7,8                 5,6,7,8                             5,6,8              nCK
Supported CWL Settings                             5,6                        5,6                             5,6               nCK


                            表 7-34 DDR3-1333 Speed Bins and Operating Conditions
                                                                                                                                DDR3-1333J
              SpeedBin                                          DDR3-1333G                       DDR3-1333H
                                              (optional)                                                                         (optional)
           CL-nRCD-nRP                          7-7-7                                                  9-9-9                     10-10-10
      Parameter                Symbol      min            max   min           max                min            max             min       max
Internal read command                                                                      13.5(13.125)5,
                                 tAA       10.5            20   12             20                                   20          15        20
      to first data                                                                              11
ACT to internal read or                                                                    13.5(13.125)5,
                                tRCD       10.5            —    12             —                                    —           15        —
    write delay time                                                                             11

 PRE command period              tRP       10.5            —    12             —           13.5(13.125)5,           —           15        —
 ACT to ACT or REF                                                                           49.5(49.125)5,
                               tRC         46.5           —          48               —                                —             51               —
  command period                                                                                     11
ACT to PRE command
                              tRAS         36         9*tREFI        36          9*tREFI             36           9*tREFI            36            9*tREFI
       period
            CWL=5            tCK(AVG)      2.5            3.3        2.5             3.3             3.0              3.3            3.0             3.3
 CL=5
           CWL=6,7           tCK(AVG)       Reserved                     Reserved                      Reserved                       Reserved
                CWL=5        tCK(AVG)      2.5            3.3        2.5             3.3             2.5              3.3            2.5             3.3
     CL=6       CWL=6        tCK(AVG)     1.875           <2.5           Reserved                      Reserved                       Reserved
                CWL=7        tCK(AVG)       Reserved                     Reserved                      Reserved                       Reserved
                CWL=5        tCK(AVG)       Reserved                     Reserved                      Reserved                       Reserved
                                                                                                    1.875             <2.5
     CL=7       CWL=6        tCK(AVG)     1.875           <2.5      1.875          <2.5                                               Reserved
                                                                                                     (Optional)5,11
                CWL=7        tCK(AVG)      1.5        <1.875             Reserved                      Reserved                       Reserved
                CWL=5        tCK(AVG)       Reserved                     Reserved                      Reserved                       Reserved
     CL=8       CWL=6        tCK(AVG)     1.875           <2.5      1.875          <2.5             1.875             <2.5          1.875            < 2.5
                CWL=7        tCK(AVG)      1.5        <1.875         1.5         <1.875                Reserved                       Reserved
                CWL=5,6      tCK(AVG)       Reserved                     Reserved                      Reserved                       Reserved
     CL=9
                CWL=7        tCK(AVG)      1.5        <1.875         1.5          <1.875             1.5             <1.875           Reserved
                CWL=5,6      tCK(AVG)       Reserved                     Reserved                      Reserved                       Reserved
 CL=10                                     1.5        <1.875         1.5          <1.875             1.5             <1.875
                CWL=7        tCK(AVG)                                                                                                1.5           <1.875
                                            (Optional)                   (Optional)                   (Optional)
        Supported CL Settings             5,6,7,8,9,(10)             5,6,7,8,9,(10)                 5,6,8,(7),9,(10)                    5,6,8,10
       Supported CWL Settings                   5, 6, 7                    5, 6, 7                         5, 6, 7                         5, 6, 7


                          表 7-35 DDR3-1600 Speed Bins and Operating Conditions
                                        DDR3-1600G(opti
               SpeedBin                                            DDR3-1600H                DDR3-1600J                    DDR3-1600K
                                            onal)
              CL-nRCD-nRP                   8-8-8                        9-9-9                10-10-10                       11-11-11                  Unit

      Parameter             Symbol        min        max           min           max         min           max              min            max
     Internal read                                                                                                   13.75(13.125)
                              tAA         10          20          11.25          20          12.5           20                              20          ns
command to first data                                                                                                       5,11
 ACT to internal read                                                                                                13.75(13.125)
                             tRCD         10              —       11.25          —           12.5           —                               —           ns
 or write delay time                                                                                                        5,11
    PRE command                                                                                                      13.75(13.125)
                              tRP         10              —       11.25          —           12.5           —                               —           ns
        period                                                                                                              5,11
 ACT to ACT or REF                                                                                                   48.75(48.125)
                              tRC         45              —       46.25          —           47.5           —                               —           ns
  command period                                                                                                            5,11
     ACT to PRE                                                                                                                          9*
                             tRAS         35       9*tREFI         35       9*tREFI          35        9*tREFI               35                         ns
  command period                                                                                                                       tREFI
             CWL=5          tCK(AVG)      2.5         3.3          2.5           3.3         2.5            3.3              3.0         3.3            ns
  CL = 5
           CWL=6,7,8        tCK(AVG)       Reserved                 Reserved                  Reserved                       Reserved                  ns
                CWL=5       tCK(AVG)      2.5         3.3          2.5           3.3         2.5            3.3              2.5           3.3          ns

                                                                                                      Reserve
     CL = 6     CWL=6       tCK(AVG)     1.875       <2.5         1.875          <2.5      Reserved                          ns       1,2,3,4,
                                                                                                         d
                                                                                                                                         8
               CWL=7,8      tCK(AVG)    Reserved                 Reserved                  Reserved                    Reserved                         ns
                CWL=5       tCK(AVG)    Reserved                 Reserved                  Reserved                    Reserved                         ns
     CL = 7                                                                                                                 1.875          < 2.5
                CWL=6       tCK(AVG)     1.875       <2.5         1.875          <2.5       1.875          <2.5                                         ns

                                                                                                  (Optional)5,11
               CWL=7      tCK(AVG)     1.5      <1.875      Reserved            Reserved                Reserved            ns
               CWL=8      tCK(AVG)      Reserved            Reserved            Reserved                Reserved            ns
               CWL=5      tCK(AVG)      Reserved            Reserved            Reserved                Reserved            ns
               CWL=6      tCK(AVG)    1.875      <2.5     1.875      <2.5     1.875      <2.5         1.875         < 2.5    ns

     CL = 8                                                                             Reserve
               CWL=7      tCK(AVG)     1.5      <1.875     1.5      <1.875 Reserved                     ns     1,2,3,4,
                                                                                           d
                                                                                                                  8
               CWL=8      tCK(AVG)     1.25      <1.5       Reserved            Reserved                Reserved            ns
              CWL=5,6     tCK(AVG)      Reserved            Reserved            Reserved                Reserved            ns
                                                                                                                      <
                                                                                                        1.5
                                                                                                                   1.875
     CL = 9    CWL=7      tCK(AVG)     1.5      <1.875     1.5      <1.875     1.5      <1.875                               ns

                                                                                                  (Optional)5,11
               CWL=8      tCK(AVG)     1.25      <1.5      1.25      <1.5       Reserved                Reserved             ns
              CWL=5,6     tCK(AVG)      Reserved            Reserved            Reserved                Reserved            ns

 CL = 10       CWL=7      tCK(AVG)     1.5      <1.875     1.5      <1.875     1.5      <1.875          1.5                  ns
                                                                                                                   <1.875
               CWL=8      tCK(AVG)     1.25      <1.5      1.25      <1.5      1.25      <1.5       Reserved                 ns
              CWL=5,6,7   tCK(AVG)   Reserved            Reserved            Reserved               Reserved                 ns
 CL = 11                               1.25      <1.5      1.25      <1.5      1.25      <1.5                                ns
               CWL=8      tCK(AVG)                                                                     1.25         < 1.5
                                        (Optional)          (Optional)          (Optional)                                  ns
        Supported CL Settings        5,6,7,8,9,10,(11)   5,6,7,8,9,10,(11)     5,6,7,8,9,10,        5,6,7,8,9,10,(11)       nCK
       Supported CWL Settings            5,6,7,8             5,6,7,8             5,6,7,8                 5,6,7,8            nCK

### DDR3-800 和 DDR3-1066 的时序参数

表 7-36 Timing Parameters by Speed Bin

                                                      DDR3-800                      DDR3-1066                 DDR3-1333              DDR3-1600
         Parameter                 Symbol                                                                                                                  Units
                                                     Min             Max           Min             Max       Min         Max         Min         Max

Clock Timing
Minimum Clock Cycle Time
                               tCK(DLL_OFF)          8                -            8               -          8           -          8            -         ns
(DLL off mode)

Average Clock Period             tCK(avg)                                                                                                                  ps

Average high pulse width         tCH(avg)           0.47            0.53          0.47           0.53       0.47         0.53       0.47         0.53
                                                                                                                                                         tCK(avg)

Average low pulse width          tCL(avg)           0.47            0.53          0.47           0.53       0.47         0.53       0.47         0.53
                                                                                                                                                         tCK(avg)
                                                                  tCK(avg)                     tCK(avg)               tCK(avg)               tCK(avg)
                                                tCK(avg)min +      max +      tCK(avg)min +     max + tCK(avg)min + max + tCK(avg)min + max +
Absolute Clock Period            tCK(abs)                                                                                                                   ps
                                                 tJIT(per)min     tJIT(per)    tJIT(per)min    tJIT(per) tJIT(per)min tJIT(per) tJIT(per)min tJIT(per)
                                                                     max                          max                    max                    max
Absolute clock HIGH pulse
                                 tCH(abs)           0.43              -           0.43             -        0.43          -         0.43          -      tCK(avg)
width
Absolute clock LOW pulse
                                 tCL(abs)           0.43              -           0.43             -        0.43          -         0.43          -      tCK(avg)
width
Clock Period Jitter               JIT(per)          -100            100            -90             90        -80         80         -70          70        ps
Clock Period Jitter during
                                tJIT(per,lck)        -90             90            -80             80        -70         70         -60          60        ps
DLL locking period
Cycle to Cycle Period Jitter      tJIT(cc)                 200                           180                       160                     140             ps
Cycle to Cycle Period Jitter
                                tJIT(cc,lck)               180                           160                       140                     120             ps
during DLL locking period

Duty Cycle Jitter                tJIT(duty)           -               -             -              -          -           -          -            -        ps

Cumulative error across 2
                              tERR(2per)             -147             147   -132   132   -118   118     -103   103   ps
cycles
Cumulative error across 3
                              tERR(3per)             -175             175   -157   157   -140   140     -122   122   ps
cycles
Cumulative error across 4
                              tERR(4per)             -194             194   -175   175   -155   155     -136   136   ps
cycles
Cumulative error across 5
                              tERR(5per)             -209             209   -188   188   -168   168     -147   147   ps
cycles
Cumulative error across 6
                              tERR(6per)             -222             222   -200   200   -177   177     -155   155   ps
cycles
Cumulative error across 7
                              tERR(7per)             -232             232   -209   209   -186   186     -163   163   ps
cycles
Cumulative error across 8
                              tERR(8per)             -241             241   -217   217   -193   193     -169   169   ps
cycles
Cumulative error across 9
                              tERR(9per)             -249             249   -224   224   -200   200     -175   175   ps
cycles
Cumulative error across 10
                              tERR(10per)            -257             257   -231   231   -205   205     -180   180   ps
cycles
Cumulative error across 11
                              tERR(11per)            -263             263   -237   237   -210   210     -184   184   ps
cycles
Cumulative error across 12
                              tERR(12per)            -269             269   -242   242   -215   215     -188   188   ps
cycles


                                              tERR(nper)min    = (1
                                                + 0.68ln(n)) *
Cumulative error across n =                      tJIT(per)min
                              tERR(nper)                              ps    24
13, 14 . . . 49, 50 cycles                  tERR(nper)max = (1 +
                                                  0.68ln(n)) *
                                                tJIT(per)max



Data Timing
DQS, DQS# to DQ skew, per
                                      tDQSQ         -      200      -      150      -      125         -     100      ps
group, per access
DQ output hold time from
                                       tQH         0.38     -      0.38     -      0.38     -        0.38     -
DQS, DQS#                                                                                                          tCK(avg)
DQ low-impedance time from
                                     tLZ(DQ)       -800    400     -600    300     -500    250       -450    225      ps
CK, CK#
DQ high impedance time
                                     tHZ(DQ)        -      400      -      300      -      250         -     225      ps
from CK, CK#
Data setup time to DQS,
DQS# referenced to Vih(ac) /      tDS(base)AC175   75              25               -                  -              ps
Vil(ac) levels
Data setup time to DQS,
DQS# referenced to Vih(ac) /      tDS(base)AC150   125             75              30                 10              ps
Vil(ac) levels
Data hold time from DQS,
DQS# referenced to Vih(dc) /      tDH(base)DC100   150             100             65                 45              ps
Vil(dc) levels
DQ and DM Input pulse width
                                      tDIPW        600      -      490      -      400      -        360      -       ps
for each input

Data Strobe Timing
DQS,DQS# differential READ
                                      tRPRE        0.9    Note19   0.9    Note19   0.9    Note19      0.9   Note19 tCK(avg)
Preamble
DQS,    DQS#    differential
                                      tRPST        0.3    Note11   0.3    Note11   0.3    Note11      0.3   Note11 tCK(avg)
READ Postamble
DQS,     DQS#      differential
                                      tQSH         0.38     -      0.38     -      0.40     -        0.40     -    tCK(avg)
output high time
DQS,     DQS#   differential
                                      tQSL         0.38     -      0.38     -      0.40     -        0.40     -    tCK(avg)
output low time
DQS,     DQS#   differential
                                      tWPRE        0.9      -      0.9      -      0.9      -         0.9     -    tCK(avg)
WRITE Preamble
DQS,     DQS#   differential
                                      tWPST        0.3      -      0.3      -      0.3      -         0.3     -    tCK(avg)
WRITE Postamble
DQS, DQS# rising edge
output access time from              tDQSCK        -400    400     -300    300     -255    255       -225    225      ps
rising CK, CK#
DQS        and        DQS#
low-impedance            time   tLZ(DQS)        -800          400         -600         300        -500       250        -450       225      ps
(Referenced from RL - 1)
DQS        and        DQS#
high-impedance           time   tHZ(DQS)          -           400           -          300         -         250         -         225      ps
(Referenced from RL + BL/2)
DQS, DQS# differential input
                                 tDQSL          0.45          0.55        0.45         0.55       0.45       0.55       0.45       0.55   tCK(avg)
low pulse width
DQS, DQS# differential input
                                 tDQSH          0.45          0.55        0.45         0.55       0.45       0.55       0.45       0.55   tCK(avg)
high pulse width
DQS, DQS# rising edge to
                                 tDQSS          -0.25         0.25        -0.25        0.25      -0.25       0.25      -0.27       0.27   tCK(avg)
CK, CK# rising edge
DQS, DQS# falling edge
setup time to CK, CK# rising     tDSS           0.2            -           0.2          -         0.2         -         0.18        -     tCK(avg)
edge
DQS, DQS# falling edge hold
time from CK, CK# rising         tDSH           0.2            -           0.2          -         0.2         -         0.18        -     tCK(avg)
edge
Command and Address Timing
DLL locking time                 tDLLK           512           -          512           -         512         -         512         -       nCK
Internal READ Command to                                      －                               max(4nCK,7.5          max(4nCK,7.5
PRECHARGE          Command       tRTP      max(4nCK, 7.5ns)          max(4nCK,7.5ns)    -                     -                     -
                                                                                                  ns)                    ns)
delay
Delay from start of internal                                  －                               max(4nCK,7.5          max(4nCK,7.5
write transaction to internal    tWTR      max(4nCK, 7.5ns)          max(4nCK,7.5ns)    -                     -                     -
                                                                                                  ns)                    ns)
read command
WRITE recovery time               tWR             15          －            15           -          15         -         15          -       ns
Mode Register Set command                                     －
                                 tMRD             4                        4            -          4          -          4          -       nCK
cycle time
Mode Register Set command                                     －                               max(12nCK,15          max(12nCK,15
                                 tMOD      max(12nCK, 15ns)          max(12nCK,15ns)    -                     -                     -
update delay                                                                                       ns)                   ns)
ACT to internal read or write                                 －
                                 tRCD                 -                     -           -
delay time
PRE command period                tRP                 -       －             -           -
ACT to ACT or REF                                                       －
                                       tRC                    -                      -          -
command period
CAS# to CAS# command                                                    －
                                      tCCD                 4                        4           -        4         -        4         -   nCK
delay

Auto     precharge      write                      WR + roundup(tRP /
                                    tDAL(min)                           nCK
recovery + precharge time                             tCK(avg))

Multi-Purpose        Register
                                     tMPRR                1              -          1           -        1         -        1         -   nCK
Recovery Time
ACTIVE to PRECHARGE
                                      tRAS                -              -           -          -
command period
ACTIVE        to     ACTIVE
                                                                                                    max(4nCK,6ns       max(4nCK,6ns
command period for 1KB                tRRD         max(4nCK,10ns)        -    max(4nCK,7.5ns)   -                  -                  -
                                                                                                          )                  )
page size
ACTIVE        to     ACTIVE
                                                                                                    max(4nCK,7.5       max(4nCK,7.5
command period for 2KB                tRRD         max(4nCK,10ns)        -    max(4nCK,10ns)    -                  -                  -
                                                                                                        ns)                 ns)
page size
Four activate window for 1KB
                                      tFAW                40             -         37.5         -        30        -       30         -   ns
page size
Four activate window for 2KB
                                      tFAW                50             -          50          -        45        -       40         -   ns
page size
Command       and    Address
setup time to CK, CK#
                                  tIS(base)AC175         200                       125                   65                45             ps
referenced to Vih(ac) / Vil(ac)
levels
Command       and    Address
setup time to CK, CK#
                                  tIS(base)AC150         350                       275                  190                170            ps
referenced to Vih(ac) / Vil(ac)
levels
Command and Address hold
time    from     CK,      CK#
                                  tIH(base)DC100         275                       200                  140                120            ps
referenced to Vih(dc) / Vil(dc)
levels
Control and Address Input
                                      tIPW               900             -         780          -       620        -       560        -   ps
pulse width for each input

Calibration Timing
Power-up       and        RESET                                       max(512nCK,640ns        max(512nCK,6       max(512nCK,6
                                   tZQinit   max(512nCK,640ns)    -                       -                  -                  -
calibration time                                                              )                   40ns)              40ns)
Normal        operation     Full                                      max(256nCK,320ns        max(256nCK,3       max(256nCK,3
                                   tZQoper   max(256nCK,320ns)    -                       -                  -                  -
calibration time                                                              )                   20ns)              20ns)
Normal      operation      Short                                                              max(64nCK,80       max(64nCK,80
                                   tZQCS      max(64nCK,80ns)     -   max(64nCK,80ns)     -                  -                  -
calibration time                                                                                   ns)                ns)

Reset Timing
Exit Reset from CKE HIGH to                  max(5nCK,tRFC(min)       max(5nCK,tRFC(mi        max(5nCK,tRF       max(5nCK,tRF
                                    tXPR                          -                       -                  -                  -
a valid command                                    +10ns)                 n)+10ns)            C(min)+10ns)       C(min)+10ns)

Self Refresh Timings
Exit   Self Refresh    to                                                                       max(5nCK,          max(5nCK,
                                                  max(5nCK,               max(5nCK,
commands not requiring a             tXS                          -                       -    tRFC(min) +   -    tRFC(min) +   -
                                              tRFC(min) + 10ns)       tRFC(min) + 10ns)
locked DLL                                                                                        10ns)              10ns)
Exit   Self    Refresh    to
commands requiring a locked        tXSDLL         tDLLK(min)      -       tDLLK(min)      -     tDLLK(min)   -     tDLLK(min)   -   nCK
DLL
Minimum CKE low width for
                                                                        tCKE(min) + 1          tCKE(min) +        tCKE(min) +
Self Refresh entry to exit         tCKESR     tCKE(min) + 1 nCK   -                       -                  -                  -
                                                                           nCK                   1 nCK              1 nCK
timing
Valid Clock Requirement
after Self Refresh Entry                                                                      max(5nCK,10n       max(5nCK,10n
                                   tCKSRE     max(5nCK,10ns)      -    max(5nCK,10ns)     -                  -                  -
(SRE) or Power-Down Entry                                                                          s)                 s)
(PDE)
Valid Clock Requirement
before Self Refresh Exit                                                                      max(5nCK,10n       max(5nCK,10n
                                   tCKSRX     max(5nCK,10ns)      -    max(5nCK,10ns)     -                  -                  -
(SRX) or Power-Down Exit                                                                           s)                 s)
(PDX) or Reset Exit
Power Down Timings
Exit Power Down with DLL on
to any valid command; Exit
                                                                                              max(3nCK,6ns       max(3nCK,6ns
Precharge Power Down with           tXP       max(3nCK,7.5ns)     -   max(3nCK,7.5ns)     -                  -                  -
                                                                                                    )                  )
DLL frozen to commands not
requiring a locked DLL
Exit Precharge Power Down
with    DLL    frozen    to                                                                             max(10nCK,24              max(10nCK,24
                               tXPDLL     max(10nCK,24ns)        -       max(10nCK,24ns)        -                         -                         -
commands requiring a locked                                                                                  ns)                       ns)
DLL
                                                                                                        max(3nCK,5.6              max(3nCK,5ns
CKE minimum pulse width         tCKE       max(3nCK7.5ns)        -       max(3nCK,5.625ns)      -                         -                         -
                                                                                                           25ns)                        )
Command pass disable delay     tCPDED             1                  -           1                  -         1               -         1               -   nCK
Power Down Entry to Exit
                                tPD          tCKE(min)        9*tREFI        tCKE(min)       9*tREFI     tCKE(min)     9*tREFI     tCKE(min)     9*tREFI
Timing
Timing of ACT command to
                              tACTPDEN           1               -              1               -            1            -            1            -       nCK
Power Down entry
Timing of PRE or PREA
command to Power Down         tPRPDEN            1               -              1               -            1            -            1            -       nCK
entry
Timing of RD/RDA command
                              tRDPDEN         RL+4+1             -            RL+4+1            -         RL+4+1          -         RL+4+1          -       nCK
to Power Down entry
Timing of WR command to
                                         WL+4+(tWR/tCK(avg)              WL+4+(tWR/tCK(av               WL+4+(tWR/t               WL+4+(tWR/t
Power Down entry (BL8OTF,     tWRPDEN                            -                              -                         -                         -       nCK
                                                 )                              g))                      CK(avg))                  CK(avg))
BL8MRS, BC4OTF)
Timing of WRA command to
Power Down entry (BL8OTF,     tWRAPDEN      WL+4+WR+1            -         WL+4+WR+1            -       WL+4+WR+1         -       WL+4+WR+1         -       nCK
BL8MRS, BC4OTF)
Timing of WR command to
                                         WL+2+(tWR/tCK(avg)              WL+2+(tWR/tCK(av               WL+2+(tWR/t               WL+2+(tWR/t
Power      Down    entry      tWRPDEN                            -                              -                         -                         -       nCK
                                                 )                              g))                      CK(avg))                  CK(avg))
(BC4MRS)
Timing of WRA command to
Power      Down    entry      tWRAPDEN      WL+2+WR+1            -         WL+2+WR+1            -       WL+2+WR+1         -       WL+2+WR+1         -       nCK
(BC4MRS)
Timing of REF command to
                              tREFPDEN           1               -              1               -            1            -            1            -       nCK
Power Down entry
Timing of MRS command to
                              tMRSPDEN       tMOD(min)           -          tMOD(min)           -        tMOD(min)        -        tMOD(min)        -
Power Down entry

ODT Timings
ODT turn on Latency            ODTLon                                                  WL-2=CWL+AL-2                                                        nCK

ODT turn off Latency              ODTLoff                       WL-2=CWL+AL-2                                 nCK
ODT high time without write
command or with write             ODTH4      4      -     4            -         4      -       4      -      nCK
command and BC4
ODT high time with Write
                                  ODTH8      6      -     6            -         6      -       6      -      nCK
command and BL8
Asynchronous RTT turn-on
delay (Power-Down with DLL        tAONPD     2     8.5    2           8.5        2     8.5      2     8.5     ns
frozen)
Asynchronous RTT turn-off
delay (Power-Down with DLL        tAOFPD     2     8.5    2           8.5        2     8.5      2     8.5     ns
frozen)
RTT turn-on                        tAON     -400   400   -300         300       -250   250     -225   225     ps
RTT_Nom and RTT_WR
turn-off time from ODTLoff         tAOF     0.3    0.7   0.3          0.7       0.3    0.7      0.3   0.7   tCK(avg)
reference
RTT dynamic change skew            tADC     0.3    0.7   0.3          0.7       0.3    0.7      0.3   0.7   tCK(avg)

Write Leveling Timings
First DQS/DQS# rising edge
after write leveling mode is     tWLMRD     40      -    40            -        40      -       40     -      nCK
programmed
DQS/DQS# delay after write
                                 tWLDQSEN   25      -    25            -        25      -       25     -      nCK
leveling mode is programmed
Write leveling setup time from
rising CK, CK# crossing to         tWLS     325     -    245           -        195     -      165     -      ps
rising DQS, DQS# crossing
Write leveling hold time from
rising DQS, DQS# crossing          tWLH     325     -    245           -        195     -      165     -      ps
to rising CK, CK# crossing
Write leveling output delay        tWLO      0      9     0            9         0      9       0     7.5     ns
Write leveling output error       tWLOE      0      2     0            2         0      2       0      2      ns

PCI 总线特性
------------

### 电气条件

龙芯 3B1500 PCI总线为 1.8v电压，使用时可能需要芯片外部进行电压转换。

### 时序参数

表 7-37 通用时序参数
                                                  Conventional
                                     PCI-X 33
          Symbol     Parameter                    PCI 33 (ref)    Unit
                                    Min.   Max.   Min.     Max.
                   CLK to Signal
          Tval      Valid Delay      2      6      2        11     ns
                   -bused signals
                   CLK to Signal
          Tval(p     Valid Delay
                                     2      6      2        12     ns
           tp)        -point to
                   point signals
                       Float to
           Ton                       2             2               ns
                    Active Delay
                      Active to
          Toff                              14              28     ns
                     Float Delay
                    Input Set up
           Tsu      Time to CLK-     3             7               ns
                   bused signals
                    Input Set up
          Tsu(pt    Time to CLK-
                                     5            10,12            ns
            p)     point to point
                        signals
                     Input Hold
           Th                        0             0               ns
                   Time from CLK
                    Reset Active
          Trst                       1             1               ms
                         Time
                    Reset Active
          Trst-c
                   Time after CLK   100           100              ms
            lk
                        stable
                    Reset Active
          Trst-o
                      to output             40              40     ns
            ff
                     float delay
                   REQ64# to RST#                                 clock
          Trrsu                      10            10
                     setup time                                     s
                   RST# to REQ64#
          Trrh                       0      50     0        50     ns
                      hold time
                    RST# high to
                         first                                    clock
          Trhfa
                   Configuration    225            225              s
                        access
                    RST# high to
                                                                  clock
          Trhff     first FRAME#     5             5
                                                                    s
                      assertion

                       Power valid to
             Tpvrh                       100           100               ms
                          RST# high
                            PCI-X
                       initializatio
                                                                       clock
             Tprsu      n pattern to
                                                                         s
                         RST# setup
                             time
                       RST# to PCI-X
                       initializatio
             Tprh                                                        ns
                       n pattern hold
                            time
                         Delay from
                       RST# low to CLK
             Trlcx                                                       ns
                         frequency
                           change

       7.5.3 复位时序




                        图 7-18 转换到带上拉的 PCI-X 模式的 RST#时序

       7.5.4 PCI-X 的系统时序裕量

     PCI-X 系统时序裕量与 33MHz 的 PCI 2.2 规范类似，具体的时序裕量见 表 7-38 和表
     7-45。
                                    表 7-38 建立时间预算
                                                  Conventional
                     Parameter     PCI-X 33 MHz    PCI 33 MHz    Units
                                                     (ref)
                     Tval (max)          6             11         ns
                    Tprop (max)          5             10         ns
                    Tskew (max)          1             2          ns
                     Tsu (min)           3             7          ns
                        Tcyc             15            30         ns

表 7-39 保持时间预算
                                                          Conventional
                        Parameter        PCI-X 33MHz                       Units
                                                        PCI 33 MHz (ref)
                        Tval (min)          0.7                2            ns
                       Tprop (min)          0.3                0            ns
                       Tskew (max)          0.5                2            ns
                         Th (min)           0.5                0            ns


7.6 LPC 总线和其它引脚

### LPC 总线

#### 电气条件

龙芯 3B1500 LPC总线为 1.8v电压，使用时可能需要芯片外部进行电压转换。

#### 时序参数
                                          表 7-40 LPC 时序参数
     Symbol                                  Parameter                              Min      Max   Units
       Tcyc      CLK Cycle Time                                                      30      ∞      ns
       Tval      CLK to Signal Valid Delay - bused signals                           2       11     ns
     Tval(ptp)   CLK to Signal Valid Delay - point to point                          2       12     ns
       Ton       Float to Active Delay                                               2              ns
       Toff      Active to Float Delay                                                       28     ns
       Tsu       Input Setup Time to CLK - bused signals                             7              ns
     Tsu(ptp)    Input Setup Time to CLK - point to point                           10,12           ns
        Th       Input Hold Time from CLK                                            0              ns
       Trst      Reset active time after power stable                                1              ms
     Trst-clk    Reset active time after CLK STABLE                                 100             μs
     Trst-off    Reset Active to Output Float delay                                          40     ns
      Trrsu      REQ64# to RST# Setup time                                         10*Tcyc          ns
       Trrh      RST# to REQ64# Hold time                                            0       50     ns
      Trhfa      RST# High to First configuration Access                            225            clocks
       Trhff     RST# High to First FRAME# assertion                                 5             clocks
      Tpvrh      Power valid to RST# high                                           100             ms

#### LPC 信号上拉的需求

LPC[3:0]信号需要上拉电阻在 TAR 周期来保持状态，其信号推荐的上拉电阻如表：

表 7-41 推荐的上拉电阻值

                             Signal Name                     Pull-Up
                               LAD[3:0]                   15k -100k ohm

### EJTAG

表 7-42 EJTAG 的交流时序特性

                              Parameter                           Symbol            Min.    Max.     Unit

           EJTAG external clock frequency of operation                fJTG            0     33.3      MHz
                EJTAG external clock cycle time                       TJTG           30          -    ns
      EJTAG external clock pulse width measured at 1.4
                                                                  tJTKHKL            15          -    ns
                             V
       EJTAG external clock rise and
                                            times               tJTGR& tJTGF          0          2    ns
                    fall
                         TRST assert time                          tTRST             25          -    ns

                                      Boundary-scan data          tJTDVKH             4          -
            Input setup times                                                                         ns
                                           TMS, TDI                tJTIVKH            0          -

                                                                  tJTDXKH            20          -
                                      Boundary-scan data
            Input hold times                                                                          ns
                                           TMS, TDI               tJTIXKH            25          -

                                                                  tJTKLDV             4      20
               Valid times          Boundary-scan data TDO                                            ns
                                                                  tJTKLOV             4      25

                                                                  tJTKLDX             -          -
            Output hold times       Boundary-scan data TDO                                            ns
                                                                  tJTKLOX             -          -

      EJTAG external clock to             impedance:              tJTKLDZ             3      19
                                                                                                      ns
            output high             Boundary-scan data TDO        tJTKLOZ             3          9



参考时钟
--------

### HyperTransport 的时钟

表 7-43 发送端时钟的不确定性

                                                         400    600          800    1000   1200      1600
 Symbol                      Description                                                                    Unit
                                                         Mb/s   Mb/s         Mb/s   Mb/s   Mb/s      Mb/s

               2% duty cycle variation between
 TPLLdc                                                  100     67           50     40     33        25     ps
               opposing edges over 1 bit time

               Uncertainty in subsequent internal
               transmit clocks due to PLL
 TPLLjtr       variation between any 2 edges             150     67           50     20     17        13     ps
               including that contributed by
               reference clock SSC techniques.


               edges due PLL accumulated phase
               error (≤20 ps / ns over 1 bi t t i me)
TPLLerror                                                 50     33           25     20     17        13     ps
               in the internal transmit clock
               Uncertainty in subsequent CADOUT
              Uncertainty in subsequent internal
TPLLsup       transmit clocks due to temporal PLL     125      83         63           50     42      31     ps
              power supply modulation (50 ps/ns)

              Uncertainty in the CLKOUT relative
              to CADOUT caused by load variations
Tclkskew                                              20       20         20           10     10      10     ps
              between the 90 degree phase shifted
              clock relative to the 0 degree clock

### DDR2 内存的时钟

表 7-44 输入时钟抖动参数

                                                                    DDR2-667            DDR2-800
                    Parameter                    Symbol                                              Units
                                                               Min.      Max.          Min.   Max.
        Clock period jitter                     tJIT(per)      -125       125          -100   100     ps
        Clock period jitter during DLL
                                              tJIT(per,lck)    -100       100          -80     80     ps
        locking period
        Cycle to cycle clock period jitter      tJIT(cc)       -250       250          -200   200     ps
        Cycle to cycle clock period jitter
                                               tJIT(cc,lck)    -200       200          -160   160     ps
        during DLL locking period
        Cumulative error across 2 cycles        tERR(2per)     -175       175          -150   150     ps
        Cumulative error across 3 cycles        tERR(3per)     -225       225          -175   175     ps
        Cumulative error across 4 cycles        tERR(4per)     -250       250          -200   200     ps
        Cumulative error across 5 cycles        tERR(5per)     -250       250          -200   200     ps
        Cumulative error across n cycles,
                                              tERR(6-10per)    -350       350          -300   300     ps
        n = 6 ... 10, inclusive
        Cumulative error across n cycles,
                                              tERR(11-50per)   -450       450          -450   450     ps
        n = 11 ... 50, inclusive
        Duty cycle jitter                       tJIT(duty)     - 125      125          -100   100     ps

### PCI-X 时钟

图 7-19 3.3V PCI-X 时钟波形

表 7-45 PCI-X 时钟参数

          Sym           Parameter        Conv. PCI        Unit
                                  33 (ref)
                                 Min. Max.
  Tcyc       CLK Cycle Time       30      ∞        ns

 Thigh       CLK High Time        11               ns
  Tlow        CLK Low Time        11               ns
   -         CLK Slew Rate        1        4   V/ns

电源
----

### 电源工作条件

表 7-46 推荐的工作电源电压

     Net Name                Description             Voltage(V)              Max
                                                    Min.       Typ.      Max.    Current(A)
       VDD         Core power                       1.050      1.150     1.200     22.860
     VDD_N0        Node0 CPU core power             1.000      1.100     1.300     25.450
     VDD_N1        Node1 CPU core power             1.000      1.100     1.300     25.450
       GND         Core ground                        -          -         -         -
 VDDE_DDR(DDR2)    DDR2 power                       1.700      1.800     1.800     3.000
     (DDR3)        DDR3 power                       1.425      1.500     1.575       -
 VDDE_VREF(DDR2)   DDR2 ref power                   0.882      0.900     0.918
     (DDR3)        DDR3 ref power                   0.735      0.750     0.765       -
    VDDE_1V8       IO power                         1.710      1.800     1.890     1.667
    VDDE_1V2       HT power                         1.140      1.200     1.260     1.000
      GNDE         IO ground                          -          -         -         -
  CORE_PLL_AVDD    Core PLL analog power            1.045      1.100     1.155       -
  CORE_PLL_DVDD    Core PLL digital power           1.045      1.100     1.155       -
  CORE_PLL_GND     Core PLL digital ground            -          -         -         -
  DDR_PLL_AVDD     DDR PLL analog power             1.045      1.100     1.155       -
  DDR_PLL_DVDD     DDR PLL digital power            1.045      1.100     1.155       -
   DDR_PLL_GND     DDR PLL digital ground             -          -         -         -
  HT0_PLL_AVDD     HT0 PLL analog power             1.045      1.100     1.155       -
  HT0_PLL_DVDD     HT0 PLL digital power            1.045      1.100     1.155       -
   HT0_PLL_GND     HT0 PLL digital ground             -          -         -         -
  HT1_PLL_AVDD     HT1 PLL analog power             1.045      1.100     1.155       -
  HT1_PLL_DVDD     HT1 PLL digital power            1.045      1.100     1.155       -
   HT1_PLL_GND     HT1 PLL digital ground             -          -         -         -
