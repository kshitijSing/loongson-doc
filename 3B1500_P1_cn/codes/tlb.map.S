    li      t0, 15
    li      t3, 0xf0000000        # entry_hi，需要映射的虚拟地址的起始地址
    li      a0, 0x3f000000
    bleu    msize, a0, 1f         # 判断内存是1G还是2G，如果是1G，跳到1执行
    nop
    li      t4, 0x0000f000        # 2G情况，将0xf0000000转到0xf0000000
    b   2f                        # 跳到2执行
    nop
1:
    li      t4, 0x00007000        # 1G情况，将0xf0000000转到0x70000000
2:
    .set mips64
    dsll    t4, t4, 10
    .set mips3
    ori     t4, t4, 0x1f
    li      t5, (0x1000000>>6)    # 16M stride，一页为16M
    li      t6, 0x2000000         # VPN2 32M stride
    .set mips64
1:
    dmtc0   t3, COP_0_TLB_HI      # 填TLB表项
    daddu   t3, t3, t6
    dmtc0   t4, COP_0_TLB_LO0
    daddu   t4, t4, t5
    dmtc0   t4, COP_0_TLB_LO1
    daddu   t4, t4, t5
    .set mips3
    addiu   t1, t0, 16
    mtc0    t1, COP_0_TLB_INDEX   # 16MB page
    nop
    nop
    nop
    nop
    nop
    tlbwi
    bnez    t0, 1b                # 共映射大小16*16=256M
    addiu   t0, t0, -1

