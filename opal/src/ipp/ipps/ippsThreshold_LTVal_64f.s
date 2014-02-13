        .text
        .align  4
        .globl  _ippsThreshold_LTVal_64f


_ippsThreshold_LTVal_64f:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #8
        ldr     r8, [r11, #4]
        ldr     r12, [r11, #8]
        ldr     lr, [r11, #0xC]
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r2
        mov     r6, r3
        beq     LAPB3
        cmp     r1, #0
        beq     LAPB3
        cmp     r9, #0
        ble     LAPB2
        cmp     r9, #0
        ble     LAPB1
        sub     r10, r1, #4
        str     lr, [r11, #-0x30]
        str     r12, [r11, #-0x2C]
LAPB0:
        ldr     r5, [r7]
        ldr     r4, [r7, #4]
        mov     r2, r6
        mov     r0, r5
        mov     r3, r8
        mov     r1, r4
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r5, [r11, #-0x2C]
        ldrlt   r4, [r11, #-0x30]
        str     r5, [r10, #4]
        str     r4, [r10, #8]!
        subs    r9, r9, #1
        add     r7, r7, #8
        bne     LAPB0
LAPB1:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAPB2:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LAPB3:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


