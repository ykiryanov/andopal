        .text
        .align  4
        .globl  _ippsSumLn_16s32f


_ippsSumLn_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r10, r2
        beq     LASM11
        cmp     r10, #0
        beq     LASM11
        cmp     r8, #0
        ble     LASM12
        cmp     r8, #0
        ble     LASM10
        mov     r5, #0
        mov     r4, r5
        mov     r7, r4
        mov     r6, r7
        mov     r12, #2, 24
        str     r10, [sp]
LASM0:
        mov     r10, #2, 24
        cmp     r8, #2, 24
        movlt   r10, r8
        mov     r12, #0xFF, 12
        cmp     r10, #0
        orr     r1, r12, #3, 4
        movle   r0, #0
        movle   r11, r0
        ble     LASM2
        mov     r0, #0
        mov     r3, r10
        mov     r11, r0
        mov     r2, r11
        str     r5, [sp, #4]
        str     r6, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r8, [sp, #0x14]
        str     r10, [sp, #8]
        mov     r5, r0
        mov     r6, r1
        mov     r8, r2
        mov     r7, r3
LASM1:
        ldrsh   r10, [r9, +r8]
        mov     r0, r10
        bl      __floatsisf
        cmp     r10, #0
        str     r0, [sp, #0x18]
        blt     LASM9
        cmp     r10, #0
        beq     LASM8
        ldr     r10, [sp, #0x18]
        mvn     lr, #0xFE, 10
        bic     lr, lr, #3, 2
        and     lr, r10, lr
        orr     r0, lr, #0x3F, 8
        str     r0, [sp, #0x18]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        sub     r10, r10, #0x3F, 8
        subs    r7, r7, #1
        add     r11, r11, r10, asr #23
        mov     r5, r0
        mov     r6, r1
        add     r8, r8, #2
        bne     LASM1
        mov     r0, r5
        mov     r1, r6
        ldr     r5, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r8, [sp, #0x14]
LASM2:
        bl      log
        mov     r6, r0
        mov     r0, r11
        mov     r7, r1
        bl      __floatsidf
        ldr     r2, [pc, #0x118]
        ldr     r3, [pc, #0x118]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        mov     r11, #0
LASM3:
        cmp     r11, #0
        bne     LASM7
        mov     r2, r7
        mov     r3, r6
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        sub     r8, r8, r10
        cmp     r8, #0
        add     r9, r9, r10, lsl #1
        mov     r5, r0
        mov     r4, r1
        bgt     LASM0
        ldr     r10, [sp]
LASM4:
        subs    r11, r11, #4
        beq     LASM6
        adds    r11, r11, #2
        beq     LASM5
        mov     r0, r5
        mov     r1, r4
        bl      __truncdfsf2
        str     r0, [r10]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LASM5:
        ldr     r1, [pc, #0x98]
        mov     r0, #7
        ldr     r1, [r1]
        str     r1, [r10]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LASM6:
        ldr     r1, [pc, #0x84]
        mov     r0, #8
        ldr     r1, [r1]
        str     r1, [r10]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LASM7:
        ldr     r10, [sp]
        b       LASM4
LASM8:
        ldr     r5, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        mov     r11, #2
        b       LASM3
LASM9:
        ldr     r5, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        mov     r11, #4
        b       LASM3
LASM10:
        mov     r5, #0
        mov     r4, r5
        mov     r11, r4
        b       LASM4
LASM11:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LASM12:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0xfefa39ef
        .long   0x3fe62e42
        .long   ippConstantOfINF_32f
        .long   ippConstantOfNAN_32f


