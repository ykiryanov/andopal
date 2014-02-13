        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729_16s


_ippsFixedCodebookSearch_G729_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x6F, 30
        sub     sp, sp, #2, 22
        add     lr, sp, #8
        ldr     r7, [sp, #0x9DC]
        and     lr, lr, #0xF
        ldr     r6, [sp, #0x9E0]
        rsb     lr, lr, #0
        mov     r4, r0
        add     r12, sp, #8
        and     lr, lr, #0xF
        cmp     r4, #0
        add     r8, r12, lr
        mov     r9, r1
        mov     r10, r2
        mov     r5, r3
        beq     LDPO2
        cmp     r9, #0
        beq     LDPO2
        cmp     r10, #0
        beq     LDPO2
        cmp     r7, #0
        beq     LDPO2
        cmp     r5, #0
        beq     LDPO2
        cmp     r6, #0
        blt     LDPO0
        cmp     r6, #1
        ble     LDPO1
LDPO0:
        add     sp, sp, #0x6F, 30
        mvn     r0, #6
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r10, pc}
LDPO1:
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0x9A, 30
        bl      _ippsCopy_16s32s
        add     r12, sp, #2, 22
        add     r12, r12, #0x6E, 30
        str     r12, [sp, #4]
        str     r7, [sp]
        mov     r0, r4
        mov     r3, r6
        mov     r2, r10
        mov     r1, r8
        bl      ownFixedCodebookSearch_G729_32s16s
        mov     r0, r8
        mov     r1, r9
        mov     r3, #0
        mov     r2, #0x9A, 30
        bl      _ippsConvert_NR_32s16s_Sfs
        add     r0, sp, #2, 22
        add     r2, sp, #2, 22
        add     r0, r0, #0x6E, 30
        add     r2, r2, #0x6E, 30
        ldrsh   r1, [r0]
        ldrsh   r2, [r2, #2]
        add     sp, sp, #0x6F, 30
        mov     r0, #0
        strh    r1, [r5]
        strh    r2, [r5, #2]
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r10, pc}
LDPO2:
        add     sp, sp, #0x6F, 30
        mvn     r0, #7
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r10, pc}


