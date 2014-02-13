        .text
        .align  4
        .globl  _ippsSubC_64fc


_ippsSubC_64fc:
        mov     r12, sp
        stmdb   sp!, {r1 - r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #0xC
        ldr     r10, [r11, #0x10]
        ldr     r1, [r11, #0x14]
        mov     r8, r0
        cmp     r8, #0
        beq     LAUJ2
        cmp     r10, #0
        beq     LAUJ2
        cmp     r1, #0
        mvnle   r0, #5
        ldmledb r11, {r4 - r11, sp, pc}
        cmp     r1, #0
        sub     r9, r1, #1
        beq     LAUJ1
        ldr     r7, [r11]
        ldr     r6, [r11, #4]
        ldr     r5, [r11, #8]
        ldr     r4, [r11, #0xC]
LAUJ0:
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r0, [r8, #8]
        ldr     r1, [r8, #0xC]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        sub     r9, r9, #1
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        cmn     r9, #1
        add     r8, r8, #0x10
        add     r10, r10, #0x10
        bne     LAUJ0
LAUJ1:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAUJ2:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


