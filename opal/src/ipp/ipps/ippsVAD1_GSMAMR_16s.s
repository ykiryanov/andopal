        .text
        .align  4
        .globl  _ippsVAD1_GSMAMR_16s


_ippsVAD1_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        add     lr, sp, #8
        ldr     r9, [sp, #0x54]
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        mov     r5, r0
        add     r12, sp, #8
        and     lr, lr, #0xF
        cmp     r5, #0
        add     r6, r12, lr
        mov     r4, r1
        mov     r8, r2
        mov     r7, r3
        beq     LDOG2
        cmp     r4, #0
        beq     LDOG2
        cmp     r8, #0
        beq     LDOG2
        add     r3, sp, #0x2C
        mvn     r10, #0
        str     r10, [sp]
        mov     r2, #0xA0
        mov     r1, r5
        mov     r0, r5
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x2C]
        mov     lr, #0x4F, 22
        orr     lr, lr, #1, 14
        cmp     lr, r12
        ble     LDOG0
        ldrsh   lr, [r4, #0x72]
        add     r11, r10, #1, 18
        and     r11, lr, r11
        strh    r11, [r4, #0x72]
LDOG0:
        mov     lr, #0xA6, 30
        orr     lr, lr, #0xE, 22
        cmp     lr, r12
        ble     LDOG1
        ldrsh   r12, [r4, #0x68]
        add     r10, r10, #1, 18
        and     r10, r12, r10
        strh    r10, [r4, #0x68]
LDOG1:
        add     r1, r5, #0x50
        mov     r0, r4
        mov     r2, r6
        bl      ownVadFilterBank_GSMAMR_16s
        str     r7, [sp]
        ldr     r2, [sp, #0x2C]
        mov     r0, r4
        mov     r3, r9
        mov     r1, r6
        bl      ownVadDecision_GSMAMR_16s
        strh    r0, [r8]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LDOG2:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}


