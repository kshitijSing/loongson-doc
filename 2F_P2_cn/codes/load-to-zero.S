/* the parameter is that: t2 - the Virtual address in the first page */
lb        zero, 0x0(t2);        # prefetch the data to cache
mfc0      t1, C0_EntryHi;       # read the EntryHi reg
addiu     t1, t1, 0x1;          # Change the ASID value.
mtc0      t1, C0_EntryHi;
lb        zero, 0x20(t2);       # nop operation without TLB exception
addiu     t2, t2, K_PageSize;   # Use the next page for reference.
lb        zero, 0x0(t2);        # nop operation
lb        t3, 0x20(t2);         # generate the TLB exception

