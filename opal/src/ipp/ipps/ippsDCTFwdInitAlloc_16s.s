        .text
        .align  4
        .globl  _ippsDCTFwdInitAlloc_16s


_ippsDCTFwdInitAlloc_16s:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0x14
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LCTB4
        add     r12, sp, #8
        add     r3, sp, #0x10
        add     r2, sp, #0xC
        str     r12, [sp]
        mov     r0, r5
        mov     r1, r4
        bl      _ippsDCTFwdGetSize_16s
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r8, pc}
        ldr     r0, [sp, #0xC]
        bl      _ippsMalloc_8u
        mov     r7, r0
        cmp     r7, #0
        beq     LCTB5
        ldr     r0, [sp, #0x10]
        cmp     r0, #0
        movle   r8, #0
        ble     LCTB0
        bl      _ippsMalloc_8u
        mov     r8, r0
        cmp     r8, #0
        mvneq   r4, #8
        beq     LCTB2
LCTB0:
        str     r8, [sp]
        mov     r2, r4
        mov     r1, r5
        mov     r0, r6
        mov     r3, r7
        bl      _ippsDCTFwdInit_16s
        mov     r4, r0
        cmp     r8, #0
        beq     LCTB1
        mov     r0, r8
        bl      _ippsFree
LCTB1:
        cmp     r4, #0
        beq     LCTB3
LCTB2:
        mov     r0, r7
        bl      _ippsFree
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r8, pc}
LCTB3:
        ldr     r6, [r6]
        mov     r1, #1
        mov     r0, #0
        str     r1, [r6, #0x10]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r8, pc}
LCTB4:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r8, pc}
LCTB5:
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r8, pc}

