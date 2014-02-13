        .text
        .align  4
        .globl  _ippsWTHaarFwd_32s


_ippsWTHaarFwd_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8C
        ldr     r8, [pc, #0x124]
        add     r4, sp, #0x4C
        mov     r7, r0
        mov     r0, r4
        mov     r6, r1
        mov     r5, r2
        mov     r1, r8
        mov     r2, #0x40
        mov     r4, r3
        bl      __intel_memcpy
        ldr     r1, [pc, #0x100]
        add     r0, sp, #0xC
        mov     r2, #0x40
        bl      __intel_memcpy
        cmp     r7, #0
        beq     LAJO3
        cmp     r5, #0
        beq     LAJO3
        cmp     r4, #0
        beq     LAJO3
        cmp     r6, #0
        ble     LAJO4
        sub     r9, r6, #1
        cmp     r9, #0
        movle   r11, #0
        movle   r10, r11
        ble     LAJO2
        mov     r11, #0
        mov     r10, r11
        add     r12, r7, #4
        mov     r8, r5
        mov     lr, r7
        str     r5, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
LAJO0:
        ldr     r0, [lr], #8
        ldr     r1, [r12], #8
        mov     r5, r0, asr #1
        rsb     r2, r5, r1, asr #1
        cmn     r2, #6, 2
        moveq   r1, #0
        mvneq   r3, #2, 2
        beq     LAJO1
        add     r3, sp, #0xC
        and     r7, r1, #3
        and     r0, r0, #3
        add     r3, r3, r7, lsl #2
        ldr     r3, [r3, +r0, lsl #4]
        add     r6, sp, #0x4C
        add     r7, r6, r7, lsl #2
        ldr     r0, [r7, +r0, lsl #4]
        add     r1, r5, r1, asr #1
        add     r3, r2, r3
        add     r1, r0, r1
LAJO1:
        str     r1, [r8], #4
        add     r10, r10, #2
        str     r3, [r4], #4
        cmp     r10, r9
        add     r11, r11, #1
        blt     LAJO0
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LAJO2:
        tst     r6, #1
        ldrne   r10, [r7, +r10, lsl #2]
        strne   r10, [r5, +r11, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LAJO3:
        mvn     r0, #7
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LAJO4:
        mvn     r0, #5
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
        .long   LAJO_sumCorrect_TS.3614.0.0.0
        .long   LAJO_subCorrect_TS.3614.0.0.0


        .data
        .align  4


LAJO_sumCorrect_TS.3614.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
LAJO_subCorrect_TS.3614.0.0.0:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


