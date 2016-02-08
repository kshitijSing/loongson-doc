\begin{tabu}{*{7}{>{\tt\small}P{2.35cm}}|[1pt]>{\tt\small}l}
  33             & 34               & 35              & 36              & 37              & 38              & \ec{39}         &    \\ \thickcline{1-7}
  HT0CLKp        & HT0\_TX\_CTLp1   & HT0\_REXT       & VDDE\_1V2       & HT0\_TX\_CTLn0  & HT0\_TX\_CTLp0  & HT0\_TX\_CADn07 & A  \\
  HT0CLKn        & HT0\_TX\_CTLn1   & HT0\_TX\_CADp15 & HT0\_TX\_CADn15 & VDDE\_1V2       & VDDE\_1V2       & HT0\_TX\_CADp07 & B  \\
  HT0\_PLL\_AVDD & HT0\_TX\_CADn14  & GNDE            & GNDE            & HT0\_TX\_CADn06 & HT0\_TX\_CADp06 & HT0\_TX\_CADn05 & C  \\
  HT0\_PLL\_GND  & HT0\_TX\_CADp14  & HT0\_TX\_CADp13 & HT0\_TX\_CADn13 & GNDE            & GNDE            & HT0\_TX\_CADp05 & D  \\
  HT0\_PLL\_DVDD & HT0\_TX\_CADn12  & VDDE\_1V2       & VDDE\_1V2       & HT0\_TX\_CADn04 & HT0\_TX\_CADp04 & HT0\_TX\_CLKn0  & E  \\
  HT0\_PLL\_GND  & HT0\_TX\_CADp12  & HT0\_TX\_CLKp1  & HT0\_TX\_CLKn1  & VDDE\_1V2       & VDDE\_1V2       & HT0\_TX\_CLKp0  & F  \\
  GND            & HT0\_TX\_CADn11  & GNDE            & GNDE            & HT0\_TX\_CADn03 & HT0\_TX\_CADp03 & HT0\_TX\_CADn02 & G  \\
  GND            & HT0\_TX\_CADp11  & HT0\_TX\_CADp10 & HT0\_TX\_CADn10 & GNDE            & GNDE            & HT0\_TX\_CADp02 & H  \\
  VDD            & HT0\_TX\_CADn09  & VDDE\_1V2       & VDDE\_1V2       & HT0\_TX\_CADn01 & HT0\_TX\_CADp01 & HT0\_TX\_CADn00 & J  \\
  VDD            & HT0\_TX\_CADp09  & HT0\_TX\_CADp08 & HT0\_TX\_CADn08 & VDDE\_1V2       & VDDE\_1V2       & HT0\_TX\_CADp00 & K  \\
  GNDE           & VDDE\_1V8        & INTn1           & NMIn            & INTn0           & SPI\_SDO        & HTCLK           & L  \\
  VDDE\_1V8      & GNDE             & INTn3           & INTn2           & SPI\_SDI        & DOTEST          & TMS             & M  \\
  GNDE           & VDDE\_1V8        & SPI\_SCK        & TDO             & TESTCLK         & TDI             & TRST            & N  \\
  VDDE\_1V8      & EJTAG\_TDO       & TCK             & EJTAG\_TCK      & EJTAG\_TMS      & EJTAG\_TDI      & EJTAG\_TRST     & P  \\
  GNDE           & GPIO15           & GPIO12          & GPIO14          & GPIO13          & GPIO10          & GPIO11          & R  \\
  VDDE\_1V8      & GNDE             & GPIO07          & GPIO09          & GPIO08          & GPIO05          & GPIO06          & T  \\
  GNDE           & VDDE\_1V8        & GPIO02          & GPIO03          & GPIO04          & GPIO00          & GPIO01          & U  \\
  VDDE\_1V8      & GNDE             & LPC\_LAD1       & LPC\_LAD3       & LPC\_LAD2       & LPC\_LAD0       & LPC\_SERIRQ     & V  \\
  GNDE           & VDDE\_1V8        & GNDE            & GNDE            & LPC\_ROM8MBITS  & LPC\_ROMINTEL   & LPC\_LFRAMEn    & W  \\
  GNDE           & MC0\_DDR\_DQ04   & MC0\_DDR\_DQ05  & GNDE            & MC0\_DDR\_DQM0  & MC0\_DDR\_DQ00  & MC0\_DDR\_DQ01  & Y  \\
  MC0\_DDR\_DQ02 & MC0\_DDR\_DQ07   & VDDE\_DDR       & MC0\_DDR\_DQ03  & MC0\_DDR\_DQ06  & MC0\_DDR\_DQSn0 & MC0\_DDR\_DQSp0 & AA \\
  VDD            & MC0\_DDR\_DQ12   & MC0\_DDR\_DQ08  & GNDE            & MC0\_DDR\_DQ09  & MC0\_DDR\_DQ13  & MC0\_DDR\_DQM1  & AB \\
  MC0\_DDR\_DQ10 & MC0\_DDR\_DQ14   & MC0\_DDR\_CLKn1 & MC0\_DDR\_CLKp1 & VDDE\_DDR       & MC0\_DDR\_DQSp1 & MC0\_DDR\_DQSn1 & AC \\
  GND            & MC0\_DDR\_DQ20   & MC0\_DDR\_DQ11  & MC0\_DDR\_DQ15  & GNDE            & MC0\_DDR\_CLKn0 & MC0\_DDR\_CLKp0 & AD \\
  MC0\_DDR\_DQ16 & MC0\_DDR\_DQ21   & MC0\_DDR\_DQ17  & VDDE\_DDR       & MC0\_DDR\_DQM2  & MC0\_DDR\_DQSp2 & MC0\_DDR\_DQSn2 & AE \\
  VDD            & MC0\_DDR\_DQ22   & GNDE            & MC0\_DDR\_DQ18  & MC0\_DDR\_DQ28  & MC0\_DDR\_DQ19  & MC0\_DDR\_DQ23  & AF \\
  GND            & MC0\_DDR\_DQ24   & MC0\_DDR\_DQ29  & VDDE\_DDR       & MC0\_DDR\_DQ25  & MC0\_DDR\_DQSp3 & MC0\_DDR\_DQSn3 & AG \\
  VDD            & MC0\_DDR\_DQ30   & MC0\_DDR\_DQ26  & MC0\_DDR\_DQM3  & GNDE            & MC0\_DDR\_DQ31  & MC0\_DDR\_DQ27  & AH \\
  GND            & MC0\_DDR\_CB4    & VDDE\_DDR       & MC0\_DDR\_CB5   & MC0\_DDR\_CB0   & MC0\_DDR\_CB1   & MC0\_DDR\_DQM8  & AJ \\
  MC0\_DDR\_CB6  & GNDE             & MC0\_DDR\_CB7   & MC0\_DDR\_CB2   & MC0\_DDR\_CB3   & MC0\_DDR\_DQSp8 & MC0\_DDR\_DQSn8 & AK \\
  VDD            & MC0\_DDR\_CKE3   & MC0\_DDR\_CKE1  & VDDE\_DDR       & MC0\_DDR\_CKE0  & MC0\_DDR\_BA2   & MC0\_DDR\_CKE2  & AL \\
  MC0\_DDR\_A15  & MC0\_DDR\_RESETn & MC0\_DDR\_A14   & MC0\_DDR\_A12   & GNDE            & MC0\_DDR\_A11   & MC0\_DDR\_A09   & AM \\
  MC0\_DDR\_REXT & MC0\_DDR\_A08    & MC0\_DDR\_A07   & VDDE\_DDR       & MC0\_DDR\_A05   & MC0\_DDR\_A06   & MC0\_DDR\_A04   & AN \\
  GND            & MC0\_DDR\_A03    & MC0\_DDR\_A02   & MC0\_DDR\_A01   & MC0\_DDR\_CLKp3 & MC0\_DDR\_CLKn3 & MC0\_DDR\_A00   & AP \\
  MC0\_DDR\_DQ44 & MC0\_DDR\_A10    & MC0\_DDR\_BA1   & MC0\_DDR\_BA0   & MC0\_DDR\_RASn  & MC0\_DDR\_CLKp2 & MC0\_DDR\_CLKn2 & AR \\
  MC0\_DDR\_DQ40 & MC0\_DDR\_ODT2   & MC0\_DDR\_ODT0  & MC0\_DDR\_CASn  & MC0\_DDR\_SCSn2 & MC0\_DDR\_WEn   & MC0\_DDR\_SCSn0 & AT \\
  MC0\_DDR\_DQ45 & MC0\_DDR\_ODT3   & MC0\_DDR\_ODT1  & MC0\_DDR\_A13   & GNDE            & MC0\_DDR\_SCSn1 & MC0\_DDR\_SCSn3 & AU \\
  MC0\_DDR\_DQ41 & MC0\_DDR\_DQ36   & MC0\_DDR\_DQ32  & VDDE\_DDR       & MC0\_DDR\_DQ37  & MC0\_DDR\_DQM4  & MC0\_DDR\_DQ33  & AV \\
  MC0\_DDR\_DQM5 & MC0\_DDR\_DQ35   & MC0\_DDR\_DQ34  & MC0\_DDR\_DQ39  & MC0\_DDR\_DQ38  & MC0\_DDR\_DQSp4 & MC0\_DDR\_DQSn4 & AW \\ \thickcline{1-7}
  33             & 34               & 35              & 36              & 37              & 38              & \ec{39}         &    \\
\end{tabu}
