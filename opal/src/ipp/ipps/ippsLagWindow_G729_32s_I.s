        .text
        .align  4
        .globl  _ippsLagWindow_G729_32s_I


_ippsLagWindow_G729_32s_I:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r1, #0xC
        mvngt   r0, #6
        ldmgtia sp!, {r4 - r6, pc}
        cmp     r1, #0
        ble     LDRO1
        ldr     r12, [pc, #0x68]
        mov     r2, #0xFF
        orr     r3, r2, #0x7F, 24
LDRO0:
        ldr     lr, [r0]
        ldr     r2, [r12], #4
        subs    r1, r1, #1
        mov     r5, lr, asr #16
        and     r4, r3, r2, asr #1
        mov     r5, r5, lsl #16
        mov     r6, r2, asr #16
        and     lr, r3, lr, asr #1
        mov     r2, r5, asr #16
        mul     r5, r4, r2
        mov     r6, r6, lsl #16
        mov     r4, r6, asr #16
        mul     lr, r4, lr
        mov     r5, r5, asr #15
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        mla     r5, r2, r4, r5
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        add     lr, r5, lr, asr #16
        mov     r2, lr, lsl #1
        str     r2, [r0], #4
        bne     LDRO0
LDRO1:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
        .long   LDRO_wlag


        .data
        .align  4


LDRO_wlag:
        .byte   0x00,0x5D,0xD8,0x7F,0x00,0x87,0x6B,0x7F,0x00,0xF0,0xB6,0x7E,0x00,0xCA,0xBB,0x7D
        .byte   0x00,0xBD,0x7B,0x7C,0x80,0xE2,0xF8,0x7A,0x80,0xBE,0x35,0x79,0x80,0x39,0x35,0x77
        .byte   0x80,0x98,0xFA,0x74,0x80,0x73,0x89,0x72,0x98,0xAC,0xE5,0x6F,0xF8,0x64,0x13,0x6D


