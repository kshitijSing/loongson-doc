\begin{tabu}{>{\tt\small}r|[1pt]*{8}{>{\tt\small}P{2.35cm}}}
  \e  & 1               & 2               & 3               & 4               & 5               & 6                & 7              & 8               \\ \thickcline{2-9}
  A   & HT1\_TX\_CADn07 & HT1\_TX\_CTLp0  & HT1\_TX\_CTLn0  & VDDE\_1V2       & HT1\_REXT       & HT1\_TX\_CTLp1   & HT1CLKp        & HT1\_RX\_CTLn0  \\
  B   & HT1\_TX\_CADp07 & VDDE\_1V2       & VDDE\_1V2       & HT1\_TX\_CADn15 & HT1\_TX\_CADp15 & HT1\_TX\_CTLn1   & HT1CLKn        & VDDE\_1V2       \\
  C   & HT1\_TX\_CADn05 & HT1\_TX\_CADp06 & HT1\_TX\_CADn06 & GNDE            & GNDE            & HT1\_TX\_CADn14  & HT1\_PLL\_AVDD & VDDE\_1V2       \\
  D   & HT1\_TX\_CADp05 & GNDE            & GNDE            & HT1\_TX\_CADn13 & HT1\_TX\_CADp13 & HT1\_TX\_CADp14  & HT1\_PLL\_GND  & HT1\_RX\_CTLp0  \\
  E   & HT1\_TX\_CLKn0  & HT1\_TX\_CADp04 & HT1\_TX\_CADn04 & VDDE\_1V2       & VDDE\_1V2       & HT1\_TX\_CADn12  & HT1\_PLL\_DVDD & HT1\_RX\_CTLn1  \\
  F   & HT1\_TX\_CLKp0  & VDDE\_1V2       & VDDE\_1V2       & HT1\_TX\_CLKn1  & HT1\_TX\_CLKp1  & HT1\_TX\_CADp12  & HT1\_PLL\_GND  & HT1\_RX\_CADn15 \\
  G   & HT1\_TX\_CADn02 & HT1\_TX\_CADp03 & HT1\_TX\_CADn03 & GNDE            & GNDE            & HT1\_TX\_CADn11  & GND            & VDD             \\ \thickcline{9-9}
  H   & HT1\_TX\_CADp02 & GNDE            & GNDE            & HT1\_TX\_CADn10 & HT1\_TX\_CADp10 & HT1\_TX\_CADp11  & GND            & \el{}           \\
  J   & HT1\_TX\_CADn00 & HT1\_TX\_CADp01 & HT1\_TX\_CADn01 & VDDE\_1V2       & VDDE\_1V2       & HT1\_TX\_CADn09  & VDD            & \el{}           \\
  K   & HT1\_TX\_CADp00 & VDDE\_1V2       & VDDE\_1V2       & HT1\_TX\_CADn08 & HT1\_TX\_CADp08 & HT1\_TX\_CADp09  & VDD            & \el{}           \\
  L   & UART0\_RI       & UART1\_DCD      & PCI\_CONFIG7    & PCI\_CONFIG6    & PCI\_CONFIG5    & VDDE\_1V8        & GNDE           & \el{}           \\
  M   & UART1\_RTS      & UART0\_DTR      & UART0\_RXD      & PCI\_CONFIG0    & PCI\_CONFIG3    & GNDE             & VDDE\_1V8      & \el{}           \\
  N   & UART1\_DTR      & UART0\_CTS      & PCI\_CONFIG2    & PCI\_CONFIG1    & PCI\_CONFIG4    & VDDE\_1V8        & GNDE           & \el{}           \\
  P   & UART1\_RXD      & UART1\_DSR      & UART0\_RTS      & UART0\_DSR      & UART0\_DCD      & UART0\_TXD       & VDDE\_1V8      & \el{}           \\
  R   & NODE\_ID0       & UART1\_RI       & CLKSEL15        & ICCC\_EN        & UART1\_TXD      & UART1\_CTS       & GNDE           & \el{}           \\
  T   & CLKSEL11        & CLKSEL08        & CLKSEL14        & CLKSEL10        & CLKSEL13        & NODE\_ID1        & GNDE           & \el{}           \\
  U   & CLKSEL07        & CLKSEL06        & CLKSEL09        & CLKSEL05        & CLKSEL12        & VDD              & VDD            & \el{}           \\
  V   & CLKSEL02        & CLKSEL01        & CLKSEL04        & CLKSEL00        & CLKSEL03        & GND              & GND            & \el{}           \\
  W   & GND             & VDD             & GND             & VDD             & GND             & VDD              & VDD            & \el{}           \\
  Y   & MC1\_DDR\_DQ01  & MC1\_DDR\_DQ00  & MC1\_DDR\_DQM0  & GNDE            & MC1\_DDR\_DQ05  & MC1\_DDR\_DQ04   & GND            & \el{}           \\
  AA  & MC1\_DDR\_DQSp0 & MC1\_DDR\_DQSn0 & MC1\_DDR\_DQ06  & MC1\_DDR\_DQ03  & VDDE\_DDR       & MC1\_DDR\_DQ07   & MC1\_DDR\_DQ02 & \el{}           \\
  AB  & MC1\_DDR\_DQM1  & MC1\_DDR\_DQ13  & MC1\_DDR\_DQ09  & GNDE            & MC1\_DDR\_DQ08  & MC1\_DDR\_DQ12   & VDD            & \el{}           \\
  AC  & MC1\_DDR\_DQSn1 & MC1\_DDR\_DQSp1 & VDDE\_DDR       & MC1\_DDR\_CLKp1 & MC1\_DDR\_CLKn1 & MC1\_DDR\_DQ14   & MC1\_DDR\_DQ10 & \el{}           \\
  AD  & MC1\_DDR\_CLKp0 & MC1\_DDR\_CLKn0 & GNDE            & MC1\_DDR\_DQ15  & MC1\_DDR\_DQ11  & MC1\_DDR\_DQ20   & GND            & \el{}           \\
  AE  & MC1\_DDR\_DQSn2 & MC1\_DDR\_DQSp2 & MC1\_DDR\_DQM2  & VDDE\_DDR       & MC1\_DDR\_DQ17  & MC1\_DDR\_DQ21   & MC1\_DDR\_DQ16 & \el{}           \\
  AF  & MC1\_DDR\_DQ23  & MC1\_DDR\_DQ19  & MC1\_DDR\_DQ28  & MC1\_DDR\_DQ18  & GNDE            & MC1\_DDR\_DQ22   & VDD            & \el{}           \\
  AG  & MC1\_DDR\_DQSn3 & MC1\_DDR\_DQSp3 & MC1\_DDR\_DQ25  & VDDE\_DDR       & MC1\_DDR\_DQ29  & MC1\_DDR\_DQ24   & GND            & \el{}           \\
  AH  & MC1\_DDR\_DQ27  & MC1\_DDR\_DQ31  & GNDE            & MC1\_DDR\_DQM3  & MC1\_DDR\_DQ26  & MC1\_DDR\_DQ30   & VDD            & \el{}           \\
  AJ  & MC1\_DDR\_DQM8  & MC1\_DDR\_CB1   & MC1\_DDR\_CB0   & MC1\_DDR\_CB5   & VDDE\_DDR       & MC1\_DDR\_CB4    & GND            & \el{}           \\
  AK  & MC1\_DDR\_DQSn8 & MC1\_DDR\_DQSp8 & MC1\_DDR\_CB3   & MC1\_DDR\_CB2   & MC1\_DDR\_CB7   & GNDE             & MC1\_DDR\_CB6  & \el{}           \\
  AL  & MC1\_DDR\_CKE2  & MC1\_DDR\_BA2   & MC1\_DDR\_CKE0  & VDDE\_DDR       & MC1\_DDR\_CKE1  & MC1\_DDR\_CKE3   & VDD            & \el{}           \\
  AM  & MC1\_DDR\_A09   & MC1\_DDR\_A11   & GNDE            & MC1\_DDR\_A12   & MC1\_DDR\_A14   & MC1\_DDR\_RESETn & MC1\_DDR\_A15  & \el{}           \\ \thickcline{9-9}
  AN  & MC1\_DDR\_A04   & MC1\_DDR\_A06   & MC1\_DDR\_A05   & VDDE\_DDR       & MC1\_DDR\_A07   & MC1\_DDR\_A08    & MC1\_DDR\_REXT & MC1\_DDR\_DQ46  \\
  AP  & MC1\_DDR\_A00   & MC1\_DDR\_CLKn3 & MC1\_DDR\_CLKp3 & MC1\_DDR\_A01   & MC1\_DDR\_A02   & MC1\_DDR\_A03    & GND            & MC1\_DDR\_DQ42  \\
  AR  & MC1\_DDR\_CLKn2 & MC1\_DDR\_CLKp2 & MC1\_DDR\_RASn  & MC1\_DDR\_BA0   & MC1\_DDR\_BA1   & MC1\_DDR\_A10    & MC1\_DDR\_DQ44 & MC1\_DDR\_DQ47  \\
  AT  & MC1\_DDR\_SCSn0 & MC1\_DDR\_WEn   & MC1\_DDR\_SCSn2 & MC1\_DDR\_CASn  & MC1\_DDR\_ODT0  & MC1\_DDR\_ODT2   & MC1\_DDR\_DQ40 & VDDE\_DDR       \\
  AU  & MC1\_DDR\_SCSn3 & MC1\_DDR\_SCSn1 & GNDE            & MC1\_DDR\_A13   & MC1\_DDR\_ODT1  & MC1\_DDR\_ODT3   & MC1\_DDR\_DQ45 & MC1\_DDR\_DQSn5 \\
  AV  & MC1\_DDR\_DQ33  & MC1\_DDR\_DQM4  & MC1\_DDR\_DQ37  & VDDE\_DDR       & MC1\_DDR\_DQ32  & MC1\_DDR\_DQ36   & MC1\_DDR\_DQ41 & MC1\_DDR\_DQSp5 \\
  AW  & MC1\_DDR\_DQSn4 & MC1\_DDR\_DQSp4 & MC1\_DDR\_DQ38  & MC1\_DDR\_DQ39  & MC1\_DDR\_DQ34  & MC1\_DDR\_DQ35   & MC1\_DDR\_DQM5 & MC1\_DDR\_DQ43  \\ \thickcline{2-9}
  \e  & 1               & 2               & 3               & 4               & 5               & 6                & 7              & 8               \\
\end{tabu}
