        .text
        .align  4
        .globl  _ippsFIRGetDlyLine32fc_16sc


_ippsFIRGetDlyLine32fc_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBXV5
        cmp     r1, #0
        beq     LBXV5
        ldr     r2, [pc, #0xC0]
        ldr     r3, [r0, #0x58]
        subs    r2, r3, r2
        mov     r3, #0
        beq     LBXV2
        adds    r2, r2, #2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        ldr     r2, [r0, #0x48]
        ldr     r12, [r0, #4]
        ldr     r0, [r0, #0x2C]
        cmp     r2, #0
        add     r0, r12, r0, lsl #2
        ble     LBXV1
        sub     r12, r2, #1
        sub     r1, r1, #2
        add     r0, r0, r12, lsl #2
LBXV0:
        rsb     r12, r3, #0
        add     r3, r3, #1
        mov     lr, r12, lsl #2
        ldrsh   r12, [r0, +lr]
        add     lr, r0, lr
        cmp     r3, r2
        strh    r12, [r1, #2]
        ldrsh   lr, [lr, #2]
        strh    lr, [r1, #4]!
        blt     LBXV0
LBXV1:
        mov     r0, #0
        ldr     pc, [sp], #4
LBXV2:
        ldr     r2, [r0, #0x48]
        ldr     r0, [r0, #4]
        cmp     r2, #0
        ble     LBXV4
        sub     r12, r2, #1
        sub     r1, r1, #2
        add     r0, r0, r12, lsl #2
LBXV3:
        rsb     r12, r3, #0
        add     r3, r3, #1
        mov     lr, r12, lsl #2
        ldrsh   r12, [r0, +lr]
        add     lr, r0, lr
        cmp     r3, r2
        strh    r12, [r1, #2]
        ldrsh   lr, [lr, #2]
        strh    lr, [r1, #4]!
        blt     LBXV3
LBXV4:
        mov     r0, #0
        ldr     pc, [sp], #4
LBXV5:
        mvn     r0, #7
        ldr     pc, [sp], #4
        .long   0x46493038


