mtc0 r0, C0_WIRED                 -- 所有表项可置换
li r2, (vpn2<<13)|(asid & 0xff);
mtc0 r2, C0_ENHI                  -- 设置虚拟地址
li r2, (epfn<<6)|(coherency<<3)|(Dirty<<2)|Valid<<1|Global)
mtc0 r2, C0_ENLO0                 -- 设置偶页面的物理地址
li r2, (opfn<<6)|(coherency<<3)|(Dirty<<2)|Valid<<1|Global)
mtc0 r2, C0_ENLO1                 -- 设置奇页面的物理地址
li r2, 0                          -- 设置页大小为 4KB
mtc0 r2,C0_PAGEMASK

li r2, index_of_some_entry
mtc0 r2, C0_INDEX
tlbwi                             -- 或者 tlbwr
