        .text
        .align  4
        .globl  logb


logb:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x10
        mov     r2, r1
        str     r0, [sp, #8]
        mvn     r12, #2, 2
        str     r1, [sp, #0xC]
        ands    r1, r2, r12
        mov     r12, #0xFF
        mov     r3, #0xFF, 12
        orr     r12, r12, #7, 24
        orr     r3, r3, #0xF, 4
        mov     r4, #0
        mov     lr, r1, lsr #20
        bne     LABP3
        cmp     r0, #0
        bne     LABP3
        sub     r5, r12, #1, 22
        cmp     r5, lr
        beq     LABP2
        cmp     r12, lr
        bne     LABP5
LABP0:
        mvn     r3, r3
        ands    r1, r1, r3
        mov     r12, r4
        mov     r3, #1
        moveq   r12, r3
        cmp     r0, #0
        moveq   r4, r3
        tst     r12, r4
        beq     LABP1
        mov     r0, #0xFF, 12
        orr     r1, r0, #7, 4
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LABP1:
        orr     r1, r2, #2, 14
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LABP2:
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LABP3:
        cmp     r12, lr
        beq     LABP0
        sub     r2, r12, #1, 22
        cmp     r2, lr
        beq     LABP2
        cmp     lr, #0
        beq     LABP6
LABP4:
        mov     r0, #0xFF
        orr     r0, r0, #3, 24
        subs    lr, lr, r0
        rsbmi   lr, lr, #0
        movmi   r4, #2, 2
        sub     r12, r12, #1, 22
        clz     r0, lr
        add     r12, r12, #0x1E
        rsb     r1, r0, r12
        sub     r0, r0, #0xB
        mov     r1, r1, lsl #20
        add     r0, r1, lr, lsl r0
        orr     r1, r4, r0
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LABP5:
        str     r4, [sp]
        add     r1, sp, #8
        add     r0, sp, #8
        mov     r2, sp
        str     r3, [sp, #4]
        mov     r3, #0x97
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LABP6:
        mov     r2, r12, lsl #20
        orr     r2, r2, #2, 2
        mvn     r2, r2
        and     r2, r1, r2
        clz     r1, r2
        cmp     r1, #0x20
        clzeq   r0, r0
        addeq   r1, r0, #0x14
        subne   r1, r1, #0xC
        sub     lr, lr, r1
        b       LABP4


