mtc0 r10, C0_EPC                     # 假设 r10 存有当前用户模式地址
mfc0 r1, C0_SR                       # 得到当前 Status 寄存器值
and r1,r1, ~(SR_KSU || SR_ERL)       # 清除 KSU、ERL 域
or r1, r1, (KSU_USERMODE || SR_EXL)  # 设置用户模式及 EXL 位
mtc0 r1, C0_SR
eret                                 # 跳转向用户模式
