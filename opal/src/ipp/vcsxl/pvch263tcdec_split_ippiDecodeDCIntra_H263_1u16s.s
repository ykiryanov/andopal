        .text
        .align  4
        .globl  ippiDecodeDCIntra_H263_1u16s


ippiDecodeDCIntra_H263_1u16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LFEU1
        cmp     r1, #0
        beq     LFEU1
        ldr     r3, [r0]
        cmp     r3, #0
        beq     LFEU1
        cmp     r2, #0
        beq     LFEU1
        ldr     r1, [r1]
        cmp     r1, #0
        blt     LFEU0
        cmp     r1, #7
        bgt     LFEU0
        ldrb    r12, [r3]
        ldrb    lr, [r3, #1]
        rsb     r1, r1, #8
        orr     r12, lr, r12, lsl #8
        mov     r1, r12, lsr r1
        and     r1, r1, #0xFF
        tst     r1, #0x7F
        mvneq   r0, #0xBE
        ldreq   pc, [sp], #4
        cmp     r1, #0xFF
        moveq   r1, #0x80
        strh    r1, [r2]
        add     r3, r3, #1
        str     r3, [r0]
        mov     r0, #0
        ldr     pc, [sp], #4
LFEU0:
        mvn     r0, #0xC0
        ldr     pc, [sp], #4
LFEU1:
        mvn     r0, #7
        ldr     pc, [sp], #4


