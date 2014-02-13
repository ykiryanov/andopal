        .text
        .align  4
        .globl  _ippsFIRMR32sc_Direct_16sc_Sfs


_ippsFIRMR32sc_Direct_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r9, [sp, #0x64]
        ldr     r8, [sp, #0x68]
        ldr     r4, [sp, #0x6C]
        ldr     lr, [sp, #0x70]
        ldr     r6, [sp, #0x74]
        ldr     r12, [sp, #0x78]
        mov     r7, r0
        ldr     r5, [sp, #0x7C]
        ldr     r0, [sp, #0x80]
        cmp     r7, #0
        mov     r10, r1
        mov     r11, r3
        beq     LCRC16
        cmp     r10, #0
        beq     LCRC16
        cmp     r2, #0
        ble     LCRC15
        cmp     r11, #0
        beq     LCRC16
        cmp     r9, #0
        ble     LCRC14
        cmp     r4, #0
        ble     LCRC13
        cmp     r6, #0
        ble     LCRC13
        cmp     lr, #0
        blt     LCRC12
        cmp     r4, lr
        ble     LCRC12
        cmp     r12, #0
        blt     LCRC12
        cmp     r6, r12
        ble     LCRC12
        cmp     r5, #0
        beq     LCRC16
        mul     r2, r2, r4
        sub     r8, r8, r0
        str     r8, [sp, #0x3C]
        sub     lr, r4, lr
        mul     r8, r2, r6
        sub     r12, r6, r12
        str     lr, [sp, #0x34]
        str     r12, [sp, #0x30]
        mov     r0, r9
        mov     r1, r4
        bl      __intel_imod
        mov     r1, r0
        ldr     r0, [sp, #0x34]
        mov     r12, #0
        cmp     r1, #0
        mov     r2, #1
        str     r1, [sp, #0x38]
        movne   r12, r2
        str     r12, [sp, #0x10]
        mov     r1, r4
        bl      __intel_imod
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x30]
        mov     r1, r6
        bl      __intel_imod
        str     r0, [sp, #0x14]
        mov     r0, r9
        mov     r1, r4
        bl      __intel_idiv
        ldr     r2, [sp, #0x10]
        str     r0, [sp, #0x34]
        add     r2, r2, r0
        sub     r12, r2, #1
        cmp     r8, #0
        mov     r12, r12, lsl #2
        str     r12, [sp, #0x30]
        ble     LCRC11
        ldr     r9, [sp, #0x3C]
        mov     r12, #0x1F
        mvn     lr, #0xFF
        cmp     r9, #0x1F
        movgt   r9, r12
        cmn     r9, #0x1F
        mvn     r1, #0x1E
        bic     lr, lr, #0x7F, 24
        str     r11, [sp, #0x24]
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        mov     r12, #0
        movlt   r9, r1
        mov     r0, r12
        add     r1, r5, #4
        mvn     lr, lr
        str     r7, [sp, #0x2C]
        str     lr, [sp, #8]
        str     r1, [sp]
        str     r12, [sp, #4]
        str     r2, [sp, #0x10]
        mov     r7, r0
LCRC0:
        ldr     r2, [sp, #0x38]
        cmp     r11, r2
        ldrge   r2, [sp, #0x34]
        strge   r2, [sp, #0xC]
        ldrlt   r2, [sp, #0x10]
        strlt   r2, [sp, #0xC]
        cmp     r11, #0
        bne     LCRC1
        ldr     r2, [sp, #0x30]
        ldr     r0, [sp]
        mov     r1, r5
        bl      memmove
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #0x2C]
        mov     r3, r12, lsl #2
        add     lr, r12, #1
        ldrsh   r3, [r2, +r3]
        str     lr, [sp, #4]
        add     r12, r2, r12, lsl #2
        strh    r3, [r5]
        ldrsh   r2, [r12, #2]
        strh    r2, [r5, #2]
LCRC1:
        cmp     r10, #0
        bne     LCRC10
        ldr     r2, [sp, #0xC]
        cmp     r2, #0
        ldr     r2, [sp, #0x24]
        add     r0, r2, r11, lsl #3
        movle   r2, #0
        movle   r3, r2
        ble     LCRC3
        ldr     r1, [sp, #0xC]
        mov     lr, #0
        mov     r3, lr
        mov     r2, r3
        add     r12, r5, #2
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x20]
LCRC2:
        ldrsh   r10, [r12]
        ldr     r5, [r0]
        ldrsh   r11, [r12, #-2]
        ldr     r6, [r0, #4]
        add     r0, r0, r4, lsl #3
        mla     r2, r5, r10, r2
        mla     r3, r5, r11, r3
        mul     r10, r10, r6
        add     lr, lr, #1
        cmp     lr, r1
        mla     r2, r11, r6, r2
        add     r12, r12, #4
        sub     r3, r3, r10
        blt     LCRC2
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LCRC3:
        ldr     r12, [sp, #0x3C]
        cmp     r12, #0
        beq     LCRC4
        cmp     r9, #0
        movgt   r3, r3, lsl r9
        bgt     LCRC4
        rsb     r12, r9, #0
        str     r12, [sp, #0xC]
        sub     r0, r12, #1
        mov     r12, r3, asr r12
        mov     lr, #1
        and     r12, r12, #1
        add     r0, r3, lr, lsl r0
        add     r12, r0, r12
        sub     r3, r12, #1
        ldr     r12, [sp, #0xC]
        mov     r3, r3, asr r12
LCRC4:
        ldr     r12, [sp, #8]
        cmp     r12, r3
        blt     LCRC5
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LCRC6
LCRC5:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LCRC6:
        ldr     lr, [sp, #0x3C]
        mov     r12, r7, lsl #2
        cmp     lr, #0
        ldr     lr, [sp, #0x28]
        strh    r3, [lr, +r12]
        beq     LCRC7
        cmp     r9, #0
        movgt   r2, r2, lsl r9
        bgt     LCRC7
        rsb     r3, r9, #0
        str     r3, [sp, #0xC]
        sub     lr, r3, #1
        mov     r3, r2, asr r3
        mov     r12, #1
        and     r3, r3, #1
        add     lr, r2, r12, lsl lr
        add     r3, lr, r3
        sub     r2, r3, #1
        ldr     r3, [sp, #0xC]
        mov     r2, r2, asr r3
LCRC7:
        ldr     r3, [sp, #8]
        cmp     r3, r2
        blt     LCRC8
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        mvnlt   r2, #0xFF
        biclt   r2, r2, #0x7F, 24
        b       LCRC9
LCRC8:
        mov     r2, #0
        sub     r2, r2, #2, 18
        mvn     r2, r2
LCRC9:
        mov     r12, r7
        ldr     r3, [sp, #0x28]
        add     r7, r7, #1
        add     r12, r3, r12, lsl #2
        strh    r2, [r12, #2]
LCRC10:
        add     r11, r11, #1
        cmp     r11, r4
        subge   r11, r11, r4
        add     r10, r10, #1
        cmp     r10, r6
        subge   r10, r10, r6
        subs    r8, r8, #1
        bne     LCRC0
LCRC11:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCRC12:
        mvn     r0, #0x1B
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCRC13:
        mvn     r0, #0x1C
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCRC14:
        mvn     r0, #0x19
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCRC15:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCRC16:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


