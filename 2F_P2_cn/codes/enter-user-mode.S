mtc0 r10, C0_EPC                      # Load the desired user mode address into r10
mfc0 r1, C0_SR                        # Read the current value of the Status register into r1
and  r1, r1, ~(SR_KSU || SR_ERL)      # Clear KSU (mode) and ERL (error level) bits
or   r1, r1, (KSU_USERMODE || SR_EXL) # Set user mode and EXL (exception level) bit
mtc0 r1, C0_SR                        # Write the modified Status register value back
eret                                  # Perform exception return and jump to user mode


