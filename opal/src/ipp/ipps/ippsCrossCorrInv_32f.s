        .text
        .align  4
        .globl  _ippsCrossCorrInv_32f


_ippsCrossCorrInv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r11, [sp, #0x3C]
        mov     r9, r0
        mov     r6, r1
        cmp     r11, #0
        mov     r8, r2
        mov     r7, r3
        ble     LDEX5
        sub     r12, r6, #6
        mov     r10, #0
        str     r12, [sp, #0x14]
LDEX0:
        cmp     r6, #0
        movle   r5, #0
        movle   r4, r5
        ble     LDEX4
        cmp     r6, #6
        blt     LDEX6
        rsb     r12, r10, #0
        mov     r5, #0
        add     r1, r8, r12, lsl #2
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        mov     r4, r5
        add     r3, r9, #4
        mov     r0, r4
        add     r2, r1, #4
        str     r7, [sp, #0xC]
        str     r8, [sp, #8]
        str     r6, [sp, #4]
        str     r9, [sp]
        mov     r7, r0
        mov     r6, r1
        mov     r8, r2
        mov     r9, r3
LDEX1:
        ldr     r1, [r8, #-4]
        ldr     r0, [r9, #-4]
        add     r7, r7, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r8]
        ldr     r3, [r9]
        mov     r4, r1
        mov     r5, r0
        mov     r1, r2
        mov     r0, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r9, #4]
        ldr     r3, [r8, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [r9, #8]
        ldr     r2, [r8, #8]
        mov     r4, r1
        mov     r5, r0
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r9, #0xC]
        ldr     r3, [r8, #0xC]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r7, r11
        mov     r5, r0
        mov     r4, r1
        add     r9, r9, #0x14
        add     r8, r8, #0x14
        ble     LDEX1
        mov     r1, r6
        mov     r0, r7
        ldr     r11, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r9, [sp]
LDEX2:
        add     r2, r9, r0, lsl #2
        str     r7, [sp, #0xC]
        str     r8, [sp, #8]
        str     r9, [sp]
        mov     r8, r0
        mov     r7, r1
        mov     r9, r2
LDEX3:
        ldr     r1, [r7, +r8, lsl #2]
        ldr     r0, [r9], #4
        add     r8, r8, #1
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        cmp     r8, r6
        mov     r5, r0
        mov     r4, r1
        blt     LDEX3
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r9, [sp]
LDEX4:
        mov     r0, r5
        mov     r1, r4
        bl      __truncdfsf2
        add     r10, r10, #1
        str     r0, [r7], #4
        cmp     r10, r11
        blt     LDEX0
LDEX5:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDEX6:
        mov     r5, #0
        mov     r4, r5
        rsb     r12, r10, #0
        mov     r0, r4
        add     r1, r8, r12, lsl #2
        b       LDEX2


