        .text
        .align  4
        .globl  _ippsConvert_32s16s_Sfs


_ippsConvert_32s16s_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r7, r1
        mov     r6, r2
        beq     LCWA11
        cmp     r7, #0
        beq     LCWA11
        cmp     r6, #0
        ble     LCWA10
        mvn     r12, #0xFF
        cmp     r3, #0
        bic     r12, r12, #0x7F, 24
        mov     lr, #0
        bne     LCWA2
        cmp     r6, #0
        ble     LCWA8
        mov     r4, #0
        mvn     r3, r12
LCWA0:
        ldr     r8, [r5], #4
        cmp     r3, r8
        mvnlt   r8, r12
        blt     LCWA1
        cmn     r8, #2, 18
        sub     r9, lr, #2, 18
        movlt   r8, r9
LCWA1:
        add     r4, r4, #1
        strh    r8, [r7], #2
        cmp     r4, r6
        blt     LCWA0
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCWA2:
        cmp     r3, #0
        ble     LCWA5
        mov     r4, #0x1F
        cmp     r3, #0x1F
        movlt   r4, r3
        sub     r8, r4, #1
        mov     r3, #1
        mov     r8, r3, lsl r8
        cmp     r6, #0
        sub     r9, r8, #1
        ble     LCWA8
        mov     r11, #0
        mov     r8, r4, asr #31
        mvn     r10, r12
        str     r12, [sp]
LCWA3:
        ldr     r0, [r5], #4
        mov     r3, r8
        adds    lr, r9, r0
        mov     r12, r0, asr #31
        mov     r0, r0, asr r4
        and     r1, r0, #1
        adc     r12, r12, r9, asr #31
        adds    r0, lr, r1
        adc     r1, r12, r1, asr #31
        mov     r2, r4
        bl      __ashrdi3
        cmp     r10, r0
        ldrlt   r12, [sp]
        mvnlt   r0, r12
        blt     LCWA4
        mov     r12, #0
        cmn     r0, #2, 18
        sub     r12, r12, #2, 18
        movlt   r0, r12
LCWA4:
        add     r11, r11, #1
        strh    r0, [r7], #2
        cmp     r11, r6
        blt     LCWA3
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCWA5:
        mvn     r4, #0xE
        cmp     r3, r4
        movgt   r4, r3
        cmp     r6, #0
        rsb     r3, r4, #0
        ble     LCWA8
        mov     r9, #0
        mvn     r8, r12
        sub     r4, lr, #2, 18
LCWA6:
        ldr     r10, [r5], #4
        cmp     r10, #0
        blt     LCWA9
        cmp     r10, r8, asr r3
        movle   r10, r10, lsl r3
        mvngt   r10, r12
LCWA7:
        add     r9, r9, #1
        strh    r10, [r7], #2
        cmp     r9, r6
        blt     LCWA6
LCWA8:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCWA9:
        cmp     r10, r4, asr r3
        movge   r10, r10, lsl r3
        sublt   r10, lr, #2, 18
        b       LCWA7
LCWA10:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LCWA11:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


