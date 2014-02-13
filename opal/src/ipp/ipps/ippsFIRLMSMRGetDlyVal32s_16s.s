        .text
        .align  4
        .globl  _ippsFIRLMSMRGetDlyVal32s_16s


_ippsFIRLMSMRGetDlyVal32s_16s:
        cmp     r0, #0
        beq     LBWR2
        cmp     r1, #0
        beq     LBWR2
        ldr     r12, [r0]
        ldr     r3, [pc, #0x60]
        cmp     r3, r12
        mvnne   r0, #0x10
        bxne    lr
        cmp     r2, #0
        blt     LBWR0
        ldr     r3, [r0, #0x14]
        cmp     r2, r3
        ble     LBWR1
LBWR0:
        mvn     r0, #4
        bx      lr
LBWR1:
        ldr     r3, [r0, #0x1C]
        ldr     r12, [r0, #0x18]
        sub     r2, r2, #1
        add     r3, r3, r12
        ldr     r12, [r0, #0x10]
        ldr     r0, [r0, #8]
        add     r12, r3, r12
        add     r2, r12, r2
        mov     r2, r2, lsl #1
        ldrsh   r2, [r0, +r2]
        mov     r0, #0
        strh    r2, [r1]
        bx      lr
LBWR2:
        mvn     r0, #7
        bx      lr
        .long   0x4c4d5352


