        .text
        .align  4
        .globl  _ippsDivC_64fc_I


_ippsDivC_64fc_I:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x20
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        ldr     r4, [sp, #0x28]
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0x2C]
        cmp     r4, #0
        str     r3, [sp, #0x1C]
        beq     LCHU1
        cmp     r2, #0
        ble     LCHU0
        str     r2, [sp, #8]
        add     r1, sp, #0x1C
        mov     r0, sp
        str     r4, [sp, #4]
        mov     r2, #4
        bl      __intel_memcpy
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        bl      _ippsDivC_64fc
        add     sp, sp, #0x20
        ldmia   sp!, {r4, pc}
LCHU0:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4, pc}
LCHU1:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4, pc}


