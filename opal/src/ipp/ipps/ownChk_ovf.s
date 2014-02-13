        .text
        .align  4
        .globl  ownChk_ovf


ownChk_ovf:
        stmdb   sp!, {r4, lr}
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        sub     r12, r12, #6, 20
        cmp     r12, r1
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mov     lr, #0
        mvnlt   r4, r12
        blt     LDOB0
        cmn     r1, #2, 20
        sublt   r4, lr, #2, 18
        blt     LDOB0
        mov     r4, r1, lsl #2
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
LDOB0:
        cmp     r4, r0
        bgt     LDOB1
        strh    r1, [r2]
        strh    lr, [r3]
        ldmia   sp!, {r4, pc}
LDOB1:
        cmp     r0, #0
        movge   r0, r0, asr #2
        blt     LDOB4
LDOB2:
        sub     r1, r1, r0
        strh    r0, [r2]
        mvn     r0, r12
        cmp     r0, r1
        sublt   lr, lr, #2, 18
        mvnlt   r12, lr
        blt     LDOB3
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r12, r1, asr #16
LDOB3:
        strh    r12, [r3]
        ldmia   sp!, {r4, pc}
LDOB4:
        add     r0, r0, #2
        mov     r0, r0, asr #2
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDOB2


