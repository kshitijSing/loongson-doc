/* 参数含义：
   t4 - 32 bit Virtual address
   t3 - ASID value
   t0 - 32 bit physical address for EntryLo1`（待创建的 JTLB 项）`
   t1 - 32 bit physical address for EntryLo0`（待创建的 JTLB 项）`
   attr0 - TLB attribute for EntryLo0
   attr1 - TLB attribute for EntryLo1
   t5 - Index value of the TLB entry
   t6 - temp register             */

srl      t6, t4, 13;           /*  Clean up lower order bits   */
sll      t6, t6, 13;           /*  Pad zeros                   */
or       t6, t6, t3;           /*  Include the ASID value      */
mtc0     t6, C0_EntryHi;       /*  Write to entry Hi register  */
srl      t6, t1, 6;            /*  align PFN for entry Lo reg  */
sll      t6, t6, 6;
ori      t6, t6, attr0;        /* Include the attribute field  */
mtc0     t6, C0_EntryLo0;      /* Write to entry lo0 reg       */
srl      t6, t0, 6;            /* align PFN for entry Lo reg   */
sll      t6, t6, 6;
ori      t6, t6, attr1;        /*  Include the attribute field */
mtc0     t6, C0_EntryLo1;      /*  Write to entry lo1 reg      */
mtc0     t5, C0_Index;         /*  Write to Index register     */
tlbwi;                         /*  Do a TLB write              */
li       k1, (0x1 << 2);       /*  Set ITLB flushing bit       */
mtc0     k1, C0_Diag           /*  Write to Diagnostic reg     */

