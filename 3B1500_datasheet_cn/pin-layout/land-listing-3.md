\begin{tabu}{>{\tt\small}r*{8}{>{\tt\small}P{2.35cm}}}
  \e & 17              & 18             & 19               & 20             & 21               & 22             & 23              & 24              \\ \thickcline{2-9}
  A  & HT1\_RX\_CADp01 & HT1\_LO\_RSTn  & HT1\_LO\_POWEROK & SYSCLK         & HT0\_LO\_POWEROK & HT0\_LO\_RSTn  & HT0\_RX\_CADp01 & HT0\_RX\_CADn01 \\
  B  & HT1\_RX\_CADn00 & \HToLOLDTSTOPn & \HTzLOLDTREQn    & SYSRESETn      & \HTzLOLDTREQn    & \HTzLOLDTSTOPn & HT0\_RX\_CADn00 & VDDE\_1V2       \\
  C  & HT1\_RX\_CADp00 & HT1\_8x2       & CORE\_PLL\_AVDD  & CORE\_PLL\_GND & CORE\_PLL\_DVDD  & HT0\_8x2       & HT0\_RX\_CADp00 & VDDE\_1V2       \\
  D  & GNDE            & HT1\_HI\_RSTn  & HT1\_HI\_POWEROK & CORE\_PLL\_GND & HT0\_HI\_POWEROK & HT0\_HI\_RSTn  & GNDE            & HT0\_RX\_CADp09 \\
  E  & GNDE            & \HToHILDTREQn  & \HToHILDTSTOPn   & VDDE\_1V8      & \HTzHILDTSTOPn   & \HTzHILDTREQn  & GNDE            & HT0\_RX\_CADn09 \\
  F  & HT1\_RX\_CADp08 & \HToHIHOSTMODE & \HToLOHOSTMODE   & GNDE           & \HTzLOHOSTMODE   & \HTzHIHOSTMODE & HT0\_RX\_CADp08 & HT0\_RX\_CADn08 \\
  G  & GNDE            & VDDE\_1V8      & GNDE             & VDDE\_1V8      & GNDE             & VDDE\_1V8      & GNDE            & VDD             \\ \thickcline{2-9}
  H  &                 &                &                  &                &                  &                &                 &                 \\
  J  &                 &                &                  &                &                  &                &                 &                 \\
  K  &                 &                &                  &                &                  &                &                 &                 \\
  L  &                 &                &                  &                &                  &                &                 &                 \\
  M  &                 &                &                  &                &                  &                &                 &                 \\ \thickcline{2-9}
  N  & GND             & VDD            & GND              & VDD            & GND              & VDD            & GND             & VDD             \\
  P  & VDD             & GND            & VDD              & GND            & VDD              & GND            & VDD             & GND             \\
  R  & GND             & VDD\_N1        & GND              & VDD            & GND              & VDD\_N0        & GND             & VDD\_N0         \\
  T  & VDD\_N1         & GND            & VDD\_N1          & GND            & VDD\_N0          & GND            & VDD\_N0         & GND             \\
  U  & GND             & VDD\_N1        & GND              & VDD            & GND              & VDD\_N0        & GND             & VDD\_N0         \\
  V  & VDD\_N1         & GND            & VDD\_N1          & GND            & VDD\_N0          & GND            & VDD\_N0         & GND             \\
  W  & GND             & VDD\_N1        & GND              & VDD            & GND              & VDD\_N0        & GND             & VDD\_N0         \\
  Y  & VDD\_N1         & GND            & VDD\_N1          & GND            & VDD\_N0          & GND            & VDD\_N0         & GND             \\
  AA & GND             & VDD\_N1        & GND              & VDD            & GND              & VDD\_N0        & GND             & VDD\_N0         \\
  AB & VDD             & GND            & VDD              & GND            & VDD              & GND            & VDD             & GND             \\
  AC & GND             & VDD            & GND              & VDD            & GND              & VDD            & GND             & VDD             \\
  AD & VDD             & GND            & VDD              & GND            & VDD              & GND            & VDD             & GND             \\
  AE & GND             & VDD            & GND              & VDD            & GND              & VDD            & GND             & VDD             \\
  AF & VDD             & GND            & VDD              & GND            & VDD              & GND            & VDD             & GND             \\
  AG & GND             & VDD            & GND              & VDD            & GND              & VDD            & GND             & VDD             \\ \thickcline{2-9}
  AH &                 &                &                  &                &                  &                &                 &                 \\
  AJ &                 &                &                  &                &                  &                &                 &                 \\
  AK &                 &                &                  &                &                  &                &                 &                 \\
  AL &                 &                &                  &                &                  &                &                 &                 \\
  AM &                 &                &                  &                &                  &                &                 &                 \\ \thickcline{2-9}
  AN & GNDE            & GNDE           & GNDE             & GNDE           & GNDE             & GNDE           & GNDE            & PCI\_GNTn6      \\
  AP & PCI\_GNTn5      & PCI\_CBEn3     & VDDE\_1V8        & PCI\_FRAMEn    & VDDE\_1V8        & PCI\_AD14      & VDDE\_1V8       & PCI\_CBEn0      \\
  AR & PCI\_AD28       & PCI\_AD23      & PCI\_AD19        & PCI\_IRDYn     & PCI\_PERR        & PCI\_AD13      & PCI\_AD09       & PCI\_AD07       \\
  AT & PCI\_AD27       & VDDE\_1V8      & PCI\_AD18        & VDDE\_1V8      & PCI\_SERR        & VDDE\_1V8      & PCI\_AD08       & VDDE\_1V8       \\
  AU & PCI\_AD30       & PCI\_AD26      & PCI\_AD22        & PCI\_AD17      & PCI\_TRDYn       & PCI\_PAR       & PCI\_AD11       & DDR\_PLL\_GND   \\
  AV & PCI\_AD31       & PCI\_AD25      & PCI\_AD21        & PCI\_AD16      & PCI\_DEVSELn     & PCI\_AD15      & PCI\_AD12       & DDR\_PLL\_DVDD  \\
  AW & PCI\_AD29       & PCI\_AD24      & PCI\_AD20        & PCI\_CBEn2     & PCI\_STOPn       & PCI\_CBEn1     & PCI\_AD10       & MEMCLK          \\ \thickcline{2-9}
  \e & 17              & 18             & 19               & 20             & 21               & 22             & 23              & 24              \\
\end{tabu}
