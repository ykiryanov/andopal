        .text
        .align  4
        .globl  _ippsMul_Low_32s_Sfs


_ippsMul_Low_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r5, [sp, #0x30]
        cmp     r0, #0
        mov     r6, r2
        mov     r7, r3
        beq     LBCY18
        cmp     r1, #0
        beq     LBCY18
        cmp     r6, #0
        beq     LBCY18
        cmp     r7, #0
        ble     LBCY17
        cmp     r5, #0x3E
        bgt     LBCY15
        cmn     r5, #0x1F
        mov     r8, #0
        bge     LBCY3
        cmp     r7, #0
        ble     LBCY2
        mov     lr, #2, 2
        mvn     r12, #2, 2
LBCY0:
        ldr     r4, [r0], #4
        ldr     r5, [r1], #4
        smull   r4, r9, r4, r5
        orrs    r5, r4, r9, lsl #1
        tstcs   r5, #0
        strne   r12, [r6]
        beq     LBCY16
LBCY1:
        subs    r7, r7, #1
        add     r6, r6, #4
        bne     LBCY0
LBCY2:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCY3:
        cmp     r5, #0
        bne     LBCY7
        cmp     r7, #5
        blt     LBCY5
        sub     r5, r7, #5
        add     r4, r1, #4
        add     lr, r0, #4
        add     r12, r6, #4
LBCY4:
        ldr     r9, [r4, #-4]
        ldr     r10, [lr, #-4]
        add     r8, r8, #4
        cmp     r8, r5
        smull   r9, r10, r10, r9
        str     r9, [r12, #-4]
        ldr     r9, [r4]
        ldr     r10, [lr]
        smull   r9, r10, r10, r9
        str     r9, [r12]
        ldr     r9, [r4, #4]
        ldr     r10, [lr, #4]
        smull   r9, r10, r10, r9
        str     r9, [r12, #4]
        ldr     r9, [r4, #8]
        ldr     r10, [lr, #8]
        add     r4, r4, #0x10
        add     lr, lr, #0x10
        smull   r9, r10, r10, r9
        str     r9, [r12, #8]
        add     r12, r12, #0x10
        ble     LBCY4
LBCY5:
        add     r1, r1, r8, lsl #2
        add     r0, r0, r8, lsl #2
        add     r6, r6, r8, lsl #2
LBCY6:
        ldr     r2, [r1], #4
        ldr     r12, [r0], #4
        add     r8, r8, #1
        smull   r2, r12, r12, r2
        cmp     r8, r7
        str     r2, [r6], #4
        blt     LBCY6
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCY7:
        cmp     r5, #0
        ble     LBCY11
        cmp     r7, #5
        movlt   r4, r5, asr #31
        blt     LBCY9
        sub     r2, r7, #5
        str     r7, [sp]
        mov     r4, r5, asr #31
        add     r11, r1, #4
        add     r10, r0, #4
        add     r9, r6, #4
        str     r1, [sp, #8]
        str     r0, [sp, #4]
        mov     r7, r2
LBCY8:
        ldr     r12, [r11, #-4]
        ldr     r1, [r10, #-4]
        mov     r2, r5
        mov     r3, r4
        add     r8, r8, #4
        smull   r0, r1, r1, r12
        bl      __ashrdi3
        str     r0, [r9, #-4]
        ldr     r1, [r10]
        ldr     r12, [r11]
        mov     r2, r5
        mov     r3, r4
        smull   r0, r1, r1, r12
        bl      __ashrdi3
        str     r0, [r9]
        ldr     r1, [r10, #4]
        ldr     r12, [r11, #4]
        mov     r2, r5
        mov     r3, r4
        smull   r0, r1, r1, r12
        bl      __ashrdi3
        str     r0, [r9, #4]
        ldr     r1, [r10, #8]
        ldr     r12, [r11, #8]
        add     r11, r11, #0x10
        add     r10, r10, #0x10
        mov     r2, r5
        smull   r0, r1, r1, r12
        mov     r3, r4
        bl      __ashrdi3
        str     r0, [r9, #8]
        cmp     r8, r7
        add     r9, r9, #0x10
        ble     LBCY8
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r7, [sp]
LBCY9:
        add     r9, r1, r8, lsl #2
        add     r10, r0, r8, lsl #2
        add     r6, r6, r8, lsl #2
LBCY10:
        ldr     r0, [r10], #4
        ldr     r12, [r9], #4
        add     r8, r8, #1
        smull   r0, r1, r0, r12
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        str     r0, [r6], #4
        cmp     r8, r7
        blt     LBCY10
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCY11:
        cmp     r7, #5
        rsb     r5, r5, #0
        movlt   r4, r5, asr #31
        blt     LBCY13
        sub     r2, r7, #5
        str     r7, [sp]
        mov     r4, r5, asr #31
        add     r11, r1, #4
        add     r10, r0, #4
        add     r9, r6, #4
        str     r1, [sp, #8]
        str     r0, [sp, #4]
        mov     r7, r2
LBCY12:
        ldr     r12, [r11, #-4]
        ldr     r1, [r10, #-4]
        mov     r2, r5
        mov     r3, r4
        add     r8, r8, #4
        smull   r0, r1, r1, r12
        bl      __ashldi3
        str     r0, [r9, #-4]
        ldr     r1, [r10]
        ldr     r12, [r11]
        mov     r2, r5
        mov     r3, r4
        smull   r0, r1, r1, r12
        bl      __ashldi3
        str     r0, [r9]
        ldr     r1, [r10, #4]
        ldr     r12, [r11, #4]
        mov     r2, r5
        mov     r3, r4
        smull   r0, r1, r1, r12
        bl      __ashldi3
        str     r0, [r9, #4]
        ldr     r1, [r10, #8]
        ldr     r12, [r11, #8]
        add     r11, r11, #0x10
        add     r10, r10, #0x10
        mov     r2, r5
        smull   r0, r1, r1, r12
        mov     r3, r4
        bl      __ashldi3
        str     r0, [r9, #8]
        cmp     r8, r7
        add     r9, r9, #0x10
        ble     LBCY12
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r7, [sp]
LBCY13:
        add     r9, r1, r8, lsl #2
        add     r10, r0, r8, lsl #2
        add     r6, r6, r8, lsl #2
LBCY14:
        ldr     r0, [r9], #4
        ldr     r12, [r10], #4
        add     r8, r8, #1
        smull   r0, r1, r12, r0
        mov     r2, r5
        mov     r3, r4
        bl      __ashldi3
        str     r0, [r6], #4
        cmp     r8, r7
        blt     LBCY14
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCY15:
        mov     r0, r6
        mov     r1, r7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LBCY16:
        tst     r9, r9
        strmi   lr, [r6]
        bmi     LBCY1
        orrs    r9, r4, r9
        streq   r8, [r6]
        b       LBCY1
LBCY17:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCY18:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


