        .text
        .align  4
        .globl  _ippsLinToALaw_16s8u


_ippsLinToALaw_16s8u:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBLA8
        cmp     r1, #0
        beq     LBLA8
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #0
        ble     LBLA6
        ldr     r3, [pc, #0xC0]
        mvn     r12, #0
LBLA0:
        ldrsh   lr, [r0], #2
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #19
        mov     lr, lr, lsl #16
        mov     r5, lr, asr #16
        cmp     r5, #0
        movge   lr, #0xD5
        blt     LBLA7
LBLA1:
        ldrsh   r4, [r3]
        mov     r4, r4, lsl #16
        cmp     r5, r4, asr #19
        movle   r4, #0
        ble     LBLA3
        mov     r4, #0
        mov     r6, r3
LBLA2:
        add     r4, r4, #1
        cmp     r4, #8
        add     r6, r6, #2
        bge     LBLA5
        ldrsh   r7, [r6]
        mov     r7, r7, lsl #16
        cmp     r5, r7, asr #19
        bgt     LBLA2
        cmp     r4, #2
        bge     LBLA4
LBLA3:
        mov     r5, r5, asr #1
        and     r5, r5, #0xF
        orr     r4, r5, r4, lsl #4
        eor     lr, r4, lr
        strb    lr, [r1]
        b       LBLA5
LBLA4:
        mov     r5, r5, asr r4
        and     r5, r5, #0xF
        orr     r4, r5, r4, lsl #4
        eor     lr, r4, lr
        strb    lr, [r1]
LBLA5:
        subs    r2, r2, #1
        add     r1, r1, #1
        bne     LBLA0
LBLA6:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBLA7:
        rsb     r5, r5, r12
        mov     lr, #0x55
        mov     r4, r5, lsl #16
        mov     r5, r4, asr #16
        b       LBLA1
LBLA8:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}
        .long   LBLA_seg_end


        .data
        .align  4


LBLA_seg_end:
        .byte   0xFF,0x00,0xFF,0x01,0xFF,0x03,0xFF,0x07,0xFF,0x0F,0xFF,0x1F,0xFF,0x3F,0xFF,0x7F
        .byte   0x00,0x00


