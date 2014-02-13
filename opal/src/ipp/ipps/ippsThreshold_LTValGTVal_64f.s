        .text
        .align  4
        .globl  _ippsThreshold_LTValGTVal_64f


_ippsThreshold_LTValGTVal_64f:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x18
        ldr     r12, [r11, #8]
        ldr     r10, [r11, #4]
        ldr     r5, [r11, #0x10]
        str     r12, [r11, #-0x38]
        ldr     r12, [r11, #0xC]
        ldr     r4, [r11, #0x14]
        mov     r6, r0
        cmp     r6, #0
        str     r12, [r11, #-0x34]
        ldr     r12, [r11, #0x18]
        mov     r8, r1
        mov     r7, r2
        str     r12, [r11, #-0x40]
        ldr     r12, [r11, #0x1C]
        mov     r9, r3
        str     r12, [r11, #-0x3C]
        beq     LAPL6
        cmp     r8, #0
        beq     LAPL6
        cmp     r7, #0
        ble     LAPL5
        mov     r0, r5
        mov     r1, r4
        mov     r2, r9
        mov     r3, r10
        bl      __ltdf2
        cmp     r0, #0
        blt     LAPL4
        cmp     r7, #0
        ble     LAPL3
        str     r10, [r11, #-0x2C]
        str     r9, [r11, #-0x30]
LAPL0:
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        ldr     r10, [r6]
        ldr     r9, [r6, #4]
        mov     r0, r10
        mov     r1, r9
        bl      __gedf2
        cmp     r0, #0
        blt     LAPL1
        mov     r0, r10
        mov     r1, r9
        mov     r2, r5
        mov     r3, r4
        bl      __ledf2
        cmp     r0, #0
        strle   r10, [r8]
        strle   r9, [r8, #4]
        ble     LAPL2
LAPL1:
        mov     r0, r10
        mov     r1, r9
        mov     r2, r5
        mov     r3, r4
        bl      __ledf2
        cmp     r0, #0
        ldrgt   r12, [r11, #-0x40]
        ldrgt   lr, [r11, #-0x3C]
        ldrle   r12, [r11, #-0x38]
        ldrle   lr, [r11, #-0x34]
        str     r12, [r8]
        str     lr, [r8, #4]
LAPL2:
        subs    r7, r7, #1
        add     r8, r8, #8
        add     r6, r6, #8
        bne     LAPL0
LAPL3:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAPL4:
        mvn     r0, #0x11
        ldmdb   r11, {r4 - r11, sp, pc}
LAPL5:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LAPL6:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


