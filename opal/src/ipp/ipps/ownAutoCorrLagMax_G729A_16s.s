        .text
        .align  4
        .globl  ownAutoCorrLagMax_G729A_16s


ownAutoCorrLagMax_G729A_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r5, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        cmp     r1, r2
        mov     r6, #2, 2
        movge   lr, #0
        bge     LDQR2
        mov     r4, r6
        mov     lr, #0
        str     r6, [sp, #8]
        str     r12, [sp, #4]
        str     r5, [sp]
LDQR0:
        rsb     r12, r1, #0
        mov     r8, #0
        mov     r6, r8
        add     r12, r0, r12, lsl #1
        mov     r5, r0
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LDQR1:
        ldrsh   r10, [r12]
        ldrsh   r9, [r5]
        ldrsh   r1, [r12, #4]
        ldrsh   r7, [r5, #4]
        ldrsh   r0, [r12, #8]
        mla     r11, r9, r10, r8
        ldrsh   r10, [r5, #8]
        ldrsh   r8, [r12, #0xC]
        ldrsh   r9, [r5, #0xC]
        add     r6, r6, #8
        mla     r11, r7, r1, r11
        cmp     r6, #0x50
        add     r12, r12, #0x10
        add     r5, r5, #0x10
        mla     r11, r10, r0, r11
        mla     r8, r9, r8, r11
        blt     LDQR1
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        cmp     r8, r4
        movgt   r4, r8
        movgt   lr, r1
        add     r1, r3, r1
        cmp     r1, r2
        blt     LDQR0
        ldr     r6, [sp, #8]
        ldr     r12, [sp, #4]
        ldr     r5, [sp]
        cmn     r4, #7, 2
        mvngt   r6, #2, 2
        bgt     LDQR2
        cmp     r4, #3, 2
        movge   r6, r4, lsl #1
LDQR2:
        str     lr, [r12]
        str     r6, [r5]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


