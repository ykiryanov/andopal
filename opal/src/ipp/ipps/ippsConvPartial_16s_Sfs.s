        .text
        .align  4
        .globl  _ippsConvPartial_16s_Sfs


_ippsConvPartial_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r8, [sp, #0x38]
        cmp     r0, #0
        beq     LDVB9
        cmp     r1, #0
        beq     LDVB9
        cmp     r2, #0
        beq     LDVB9
        cmp     r8, #0
        blt     LDVB8
        cmp     r3, #0
        ble     LDVB6
        cmp     r3, #0
        ble     LDVB5
        mov     r12, #0
LDVB0:
        cmp     r12, #0
        movlt   r10, #0
        movlt   lr, r12, lsl #1
        blt     LDVB4
        cmp     r12, #6
        blt     LDVB7
        mov     r10, #0
        mov     lr, r12, lsl #1
        mov     r5, r10
        add     r4, r1, lr
        sub     r7, r12, #6
        mov     r6, r0
        str     r8, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDVB1:
        rsb     r0, r5, #0
        ldrsh   r3, [r6]
        mov     r0, r0, lsl #1
        ldrsh   r2, [r4, +r0]
        mvn     r0, #0
        rsb     r1, r5, r0
        ldrsh   r0, [r6, #2]
        mla     r2, r3, r2, r10
        ldrsh   r8, [r6, #4]
        ldrsh   r9, [r6, #6]
        ldrsh   r10, [r6, #8]
        mov     r1, r1, lsl #1
        ldrsh   r11, [r4, +r1]
        mvn     r1, #1
        rsb     r1, r5, r1
        mvn     r3, #2
        mla     r2, r0, r11, r2
        mov     r1, r1, lsl #1
        ldrsh   r1, [r4, +r1]
        mvn     r0, #3
        rsb     r0, r5, r0
        mla     r2, r8, r1, r2
        rsb     r3, r5, r3
        mov     r0, r0, lsl #1
        mov     r3, r3, lsl #1
        ldrsh   r1, [r4, +r3]
        ldrsh   r0, [r4, +r0]
        add     r6, r6, #0xA
        add     r5, r5, #5
        mla     r2, r9, r1, r2
        cmp     r5, r7
        mla     r10, r10, r0, r2
        ble     LDVB1
        ldr     r8, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDVB2:
        add     r6, r0, r5, lsl #1
LDVB3:
        rsb     r7, r5, #0
        ldrsh   r9, [r6], #2
        mov     r7, r7, lsl #1
        ldrsh   r7, [r4, +r7]
        add     r5, r5, #1
        mla     r10, r9, r7, r10
        cmp     r5, r12
        ble     LDVB3
LDVB4:
        add     r12, r12, #1
        mov     r10, r10, asr r8
        cmp     r12, r3
        strh    r10, [r2, +lr]
        blt     LDVB0
LDVB5:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDVB6:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDVB7:
        mov     r10, #0
        mov     lr, r12, lsl #1
        mov     r5, r10
        add     r4, r1, lr
        b       LDVB2
LDVB8:
        mvn     r0, #4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDVB9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


