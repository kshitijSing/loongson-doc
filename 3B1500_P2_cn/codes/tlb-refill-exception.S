refill_exception:
    mfc0 k0,C0_CONTEXT
    sra k0,k0,1           -- 索引进入页表
    lw k1,0(k0)           -- 读页表
    lw k0,4(k0)
    sll k1,k1,6
    srl k1,k1,6
    mtc0 k1,C0_TLBLO0
    sll k0,k0,6
    srl k0,k0,6
    mtc0 k0,C0_TLBLO1
    tlbwr                 -- 写随机表项
    eret
