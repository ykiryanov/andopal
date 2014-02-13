        .text
        .align  4
        .globl  _ippsMulPackConj_64f_I


_ippsMulPackConj_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBFI4
        cmp     r6, #0
        beq     LBFI4
        cmp     r5, #0
        ble     LBFI3
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        bl      __muldf3
        tst     r5, #1
        str     r0, [r6]
        str     r1, [r6, #4]
        subne   r5, r5, #1
        bne     LBFI0
        sub     r12, r4, #8
        ldr     r2, [r12, +r5, lsl #3]
        sub     r7, r6, #8
        ldr     r0, [r7, +r5, lsl #3]
        add     r3, r12, r5, lsl #3
        add     r8, r7, r5, lsl #3
        ldr     r1, [r8, #4]
        ldr     r3, [r3, #4]
        bl      __muldf3
        str     r0, [r7, +r5, lsl #3]
        str     r1, [r8, #4]
        sub     r5, r5, #2
LBFI0:
        mov     r2, r5, asr #1
        cmp     r2, #0
        ble     LBFI2
        sub     r4, r4, #4
        add     r10, r6, #4
        mov     r11, #0
        str     r4, [sp, #4]
        str     r2, [sp]
LBFI1:
        ldr     r12, [sp, #4]
        add     r11, r11, #1
        ldr     r0, [r12, #0xC]
        str     r0, [sp, #8]
        ldr     r0, [r12, #0x10]
        str     r0, [sp, #0xC]
        ldr     r4, [r12, #0x14]
        ldr     r5, [r12, #0x18]
        ldr     r7, [r10, #0xC]
        ldr     r6, [r10, #0x10]
        ldr     lr, [r10, #4]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        str     lr, [sp, #0x10]
        ldr     r2, [sp, #0x10]
        add     r12, r12, #0x10
        str     r12, [sp, #4]
        ldr     r12, [r10, #8]
        str     r12, [sp, #0x14]
        ldr     r3, [sp, #0x14]
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mov     r9, r0
        mov     r8, r1
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r10, #0xC]
        str     r9, [r10, #4]
        str     r8, [r10, #8]
        str     r1, [r10, #0x10]!
        ldr     r0, [sp]
        cmp     r11, r0
        blt     LBFI1
LBFI2:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBFI3:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBFI4:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


