mtc0 r0, C0_WIRED                      # `所有表项可以被随机替换`
li r2, (VPN2<<13)|(ASID & 0xFF);
mtc0 r2, C0_ENHI                       # `设置虚拟地址`
li r2, (EPFN<<6)|(C<<3)|(D<<2)|V<<1|G)
mtc0 r2, C0_ENLO0                      # `设置偶数页的物理地址`
li r2, (OPFN<<6)|(C<<3)|(D<<2)|V<<1|G)
mtc0 r2, C0_ENLO1                      # `设置奇数页的物理地址`
li r2, 0                               # `设置页面大小为 4KB`
mtc0 r2, C0_PAGEMASK
li r2, index_of_some_entry             # needed for tlbwi only
mtc0 r2, C0_INDEX                      # needed for tlbwi only
tlbwr                                  # `随机写 TLB 表项`

