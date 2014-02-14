        .text
        .align  4
        .globl  ippiEncodeDCIntra_H263_16s1u


ippiEncodeDCIntra_H263_16s1u:
        stmdb   sp!, {r4, lr}
        cmp     r1, #0
        beq     LFEP2
        cmp     r2, #0
        beq     LFEP2
        ldr     r3, [r1]
        cmp     r3, #0
        beq     LFEP2
        ldr     r12, [r2]
        cmp     r12, #0
        blt     LFEP1
        cmp     r12, #7
        bgt     LFEP1
        cmp     r0, #0x80
        mov     r4, #0xFF
        moveq   r0, #0xFF
        cmp     r12, #0
        streqb  r0, [r3]
        beq     LFEP0
        ldrb    lr, [r3]
        rsb     r2, r12, #8
        mov     r2, r0, lsl r2
        bic     r4, lr, r4, asr r12
        orr     r12, r4, r0, asr r12
        strb    r12, [r3]
        strb    r2, [r3, #1]
LFEP0:
        add     r3, r3, #1
        mov     r0, #0
        str     r3, [r1]
        ldmia   sp!, {r4, pc}
LFEP1:
        mvn     r0, #0xC0
        ldmia   sp!, {r4, pc}
LFEP2:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


