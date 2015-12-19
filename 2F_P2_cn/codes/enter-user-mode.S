mtc0 r10, C0_EPC                      # r10: holds desired usermode address
mfc0 r1, C0_SR                        # get current value of Status register
and  r1, r1, ~(SR_KSU || SR_ERL)      # clear KSU and ERL field
or   r1, r1, (KSU_USERMODE || SR_EXL) # set usermode and EXL bit
mtc0 r1, C0_SR
eret                                  # jump to user mode

