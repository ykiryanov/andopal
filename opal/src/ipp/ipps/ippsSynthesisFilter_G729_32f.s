        .text
        .align  4
        .globl  _ippsSynthesisFilter_G729_32f


_ippsSynthesisFilter_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x15, 28
        add     r12, sp, #0x28
        ldr     r8, [sp, #0x174]
        and     r9, r12, #0xF
        ldr     r12, [sp, #0x178]
        rsb     r9, r9, #0
        add     lr, sp, #0x28
        mov     r6, r0
        and     r9, r9, #0xF
        cmp     r6, #0
        add     lr, lr, r9
        mov     r5, r1
        mov     r4, r2
        mov     r7, r3
        beq     LDJU10
        cmp     r4, #0
        beq     LDJU10
        cmp     r7, #0
        beq     LDJU10
        cmp     r12, #0
        beq     LDJU10
        cmp     r8, #0
        ble     LDJU9
        cmp     r8, #0x28
        bgt     LDJU9
        cmp     r5, #0
        ble     LDJU9
        cmp     r5, #0x1E
        bgt     LDJU9
        cmp     r5, #6
        mov     r0, #0
        blt     LDJU1
        sub     r11, r5, #6
        add     r10, r12, #4
        add     r9, lr, #4
LDJU0:
        ldr     r2, [r10, #-4]
        ldr     r1, [r10]
        add     r0, r0, #5
        str     r2, [r9, #-4]
        ldr     r2, [r10, #4]
        str     r1, [r9]
        ldr     r1, [r10, #8]
        str     r2, [r9, #4]
        ldr     r2, [r10, #0xC]
        str     r1, [r9, #8]
        cmp     r0, r11
        str     r2, [r9, #0xC]
        add     r10, r10, #0x14
        add     r9, r9, #0x14
        ble     LDJU0
LDJU1:
        add     r12, r12, r0, lsl #2
        add     r10, lr, r0, lsl #2
LDJU2:
        ldr     r9, [r12], #4
        add     r0, r0, #1
        cmp     r0, r5
        str     r9, [r10], #4
        blt     LDJU2
        cmp     r8, #0
        add     r9, lr, r5, lsl #2
        ble     LDJU8
        sub     r12, r5, #1
        sub     lr, r5, #6
        mov     r11, #0
        mov     r10, r9
        str     lr, [sp, #0x24]
        str     r12, [sp, #0xC]
LDJU3:
        ldr     r0, [r4], #4
        bl      __extendsfdf2
        cmp     r5, #1
        blt     LDJU7
        ldr     r12, [sp, #0xC]
        cmp     r12, #6
        movlt   r2, #1
        addlt   r3, r9, r11, lsl #2
        blt     LDJU5
        add     r3, r9, r11, lsl #2
        str     r9, [sp, #0x10]
        ldr     r9, [sp, #0x24]
        add     r12, r6, #8
        mov     r2, #1
        str     r4, [sp, #4]
        str     r10, [sp, #8]
        str     r7, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r11, [sp]
        str     r8, [sp, #0x14]
        mov     r10, r0
        mov     r7, r1
        mov     r5, r2
        mov     r4, r3
        mov     r6, r12
LDJU4:
        ldr     r0, [r6, #-4]
        rsb     lr, r5, #0
        ldr     r1, [r4, +lr, lsl #2]
        mvn     lr, #1
        rsb     r8, r5, lr
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r1
        mov     r2, r0
        mov     r1, r7
        mov     r0, r10
        bl      __subdf3
        ldr     r2, [r6]
        mov     r11, r1
        mvn     lr, #0
        rsb     lr, r5, lr
        ldr     r1, [r4, +lr, lsl #2]
        mov     r10, r0
        mvn     lr, #2
        rsb     r7, r5, lr
        mov     r0, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [r6, #4]
        ldr     r3, [r4, +r8, lsl #2]
        mov     r8, r1
        mov     r10, r0
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [r6, #8]
        ldr     r3, [r4, +r7, lsl #2]
        mov     r8, r1
        mov     r7, r0
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r1
        mov     r2, r0
        mov     r1, r8
        mov     r0, r7
        bl      __subdf3
        ldr     r2, [r6, #0xC]
        mvn     lr, #3
        rsb     lr, r5, lr
        mov     r8, r1
        ldr     r1, [r4, +lr, lsl #2]
        mov     r7, r0
        mov     r0, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        add     r5, r5, #5
        cmp     r5, r9
        add     r6, r6, #0x14
        mov     r10, r0
        mov     r7, r1
        ble     LDJU4
        mov     r3, r4
        mov     r2, r5
        mov     r1, r7
        mov     r0, r10
        ldr     r11, [sp]
        ldr     r4, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LDJU5:
        add     r12, r6, r2, lsl #2
        str     r7, [sp, #0x18]
        str     r6, [sp, #0x20]
        str     r10, [sp, #8]
        str     r9, [sp, #0x10]
        str     r8, [sp, #0x14]
        mov     r7, r5
        mov     r6, r4
        mov     r5, r0
        mov     r4, r1
        mov     r9, r2
        mov     r8, r3
        mov     r10, r12
LDJU6:
        ldr     r0, [r10], #4
        rsb     lr, r9, #0
        ldr     r1, [r8, +lr, lsl #2]
        add     r9, r9, #1
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        cmp     r9, r7
        mov     r5, r0
        mov     r4, r1
        ble     LDJU6
        mov     r1, r4
        mov     r4, r6
        mov     r0, r5
        mov     r5, r7
        ldr     r10, [sp, #8]
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r6, [sp, #0x20]
LDJU7:
        bl      __truncdfsf2
        str     r0, [r10], #4
        add     r11, r11, #1
        str     r0, [r7], #4
        cmp     r11, r8
        blt     LDJU3
LDJU8:
        mov     r0, #0
        add     sp, sp, #0x15, 28
        ldmia   sp!, {r4 - r11, pc}
LDJU9:
        mvn     r0, #5
        add     sp, sp, #0x15, 28
        ldmia   sp!, {r4 - r11, pc}
LDJU10:
        mvn     r0, #7
        add     sp, sp, #0x15, 28
        ldmia   sp!, {r4 - r11, pc}


