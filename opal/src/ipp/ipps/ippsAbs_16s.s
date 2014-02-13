        .text
        .align  4
        .globl  _ippsAbs_16s


_ippsAbs_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        cmp     r0, #0
        beq     LDDR15
        cmp     r1, #0
        beq     LDDR15
        cmp     r2, #0
        ble     LDDR14
        subs    r10, r2, #4
        mov     r3, #0
        bmi     LDDR5
        add     lr, r0, #2
        add     r4, r0, #4
        add     r5, r0, #6
        add     r9, r1, #2
        add     r8, r1, #4
        add     r7, r1, #6
        mov     r12, r0
        mov     r6, r1
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDDR0:
        ldrsh   r0, [r12], #8
        ldrsh   r1, [lr], #8
        ldrsh   r2, [r4], #8
        ldrsh   r11, [r5], #8
        cmp     r0, #0
        blt     LDDR13
LDDR1:
        cmp     r1, #0
        blt     LDDR12
LDDR2:
        cmp     r2, #0
        blt     LDDR11
LDDR3:
        cmp     r11, #0
        blt     LDDR10
LDDR4:
        strh    r0, [r6], #8
        strh    r1, [r9], #8
        strh    r2, [r8], #8
        add     r3, r3, #4
        strh    r11, [r7], #8
        cmp     r3, r10
        ble     LDDR0
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDDR5:
        cmp     r3, r2
        bge     LDDR8
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        add     r0, r0, r3, lsl #1
        add     r1, r1, r3, lsl #1
LDDR6:
        ldrsh   lr, [r0], #2
        cmp     lr, #0
        blt     LDDR9
LDDR7:
        add     r3, r3, #1
        strh    lr, [r1], #2
        cmp     r3, r2
        blt     LDDR6
LDDR8:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDDR9:
        cmn     lr, #2, 18
        moveq   lr, r12
        rsbne   lr, lr, #0
        b       LDDR7
LDDR10:
        cmn     r11, #2, 18
        moveq   r11, #0xFF
        orreq   r11, r11, #0x7F, 24
        rsbne   r11, r11, #0
        b       LDDR4
LDDR11:
        cmn     r2, #2, 18
        moveq   r2, #0xFF
        orreq   r2, r2, #0x7F, 24
        rsbne   r2, r2, #0
        b       LDDR3
LDDR12:
        cmn     r1, #2, 18
        moveq   r1, #0xFF
        orreq   r1, r1, #0x7F, 24
        rsbne   r1, r1, #0
        b       LDDR2
LDDR13:
        cmn     r0, #2, 18
        moveq   r0, #0xFF
        orreq   r0, r0, #0x7F, 24
        rsbne   r0, r0, #0
        b       LDDR1
LDDR14:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDDR15:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


