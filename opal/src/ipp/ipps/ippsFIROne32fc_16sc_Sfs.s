        .text
        .align  4
        .globl  _ippsFIROne32fc_16sc_Sfs


_ippsFIROne32fc_16sc_Sfs:
        stmdb   sp!, {r1, lr}
        cmp     r2, #0
        str     r0, [sp]
        beq     LBXF1
        cmp     r1, #0
        beq     LBXF1
        ldr     r12, [r2, #0x58]
        ldr     r0, [pc, #0x30]
        cmp     r0, r12
        beq     LBXF0
        mvn     r0, #0x10
        ldmia   sp!, {r1, pc}
LBXF0:
        ldrh    r0, [sp]
        ldrh    r12, [sp, #2]
        orr     r0, r0, r12, lsl #16
        ldr     r12, [r2, #0x64]
        blx     r12
        mov     r0, #0
        ldmia   sp!, {r1, pc}
LBXF1:
        mvn     r0, #7
        ldmia   sp!, {r1, pc}
        .long   0x46493036


