        .text
        .align  4
        .globl  _ippsThreshold_LT_64f


_ippsThreshold_LT_64f:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r11, r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #8
        ldr     r12, [r11, #4]
        str     r12, [sp]
        mov     r12, #0
        str     r12, [sp, #4]
        bl      _ippsThreshold_64f
        ldmdb   r11, {r11, sp, pc}

