        .text
        .align  4
        .globl  _ippiResample_H263_8u_P3R


_ippiResample_H263_8u_P3R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        str     r2, [sp, #0x68]
        ldr     r2, [sp, #0x98]
        ldr     r7, [sp, #0x94]
        ldr     r6, [sp, #0x9C]
        str     r2, [sp, #0x4C]
        ldr     r2, [sp, #0xA0]
        str     r3, [sp, #0x6C]
        ldr     r5, [sp, #0xA4]
        ldr     r3, [sp, #0xB4]
        str     r2, [sp, #0x48]
        ldr     r2, [sp, #0xA8]
        ldr     lr, [sp, #0xBC]
        ldr     r12, [sp, #0xC0]
        str     r2, [sp, #0x44]
        ldr     r2, [sp, #0xB8]
        str     r1, [sp, #0x50]
        ldr     r9, [sp, #0xC4]
        ldr     r8, [sp, #0xC8]
        ldr     r1, [sp, #0xCC]
        ldr     r11, [sp, #0xD0]
        ldr     r10, [sp, #0xD4]
        mov     r4, r0
        cmp     r4, #0
        beq     LFEZ5
        cmp     r7, #0
        beq     LFEZ5
        cmp     r6, #0
        beq     LFEZ5
        cmp     r5, #0
        beq     LFEZ5
        cmp     r3, #0
        beq     LFEZ5
        cmp     lr, #0
        beq     LFEZ5
        cmp     r9, #0
        beq     LFEZ5
        ldr     r0, [sp, #0x68]
        cmp     r0, #3
        ble     LFEZ2
        tst     r0, #1
        bne     LFEZ2
        ldr     r0, [sp, #0x6C]
        cmp     r0, #3
        ble     LFEZ2
        tst     r0, #1
        bne     LFEZ2
        ldr     r0, [sp, #0xAC]
        cmp     r0, #3
        ble     LFEZ2
        tst     r0, #1
        bne     LFEZ2
        ldr     r0, [sp, #0xB0]
        cmp     r0, #3
        ble     LFEZ2
        tst     r0, #1
        bne     LFEZ2
        add     r0, sp, #0x58
        cmp     r11, #0
        str     r0, [sp, #0x40]
        bne     LFEZ0
        cmp     r10, #0
        strne   r10, [sp, #0x40]
        beq     LFEZ5
        b       LFEZ1
LFEZ0:
        cmp     r11, #1
        beq     LFEZ4
        cmp     r11, #2
        beq     LFEZ3
        add     r11, sp, #0x58
        mvn     r10, #0
        str     r10, [r11, #8]
        add     r11, sp, #0x58
        str     r10, [r11, #4]
        add     r11, sp, #0x58
        str     r10, [r11]
LFEZ1:
        add     r10, sp, #0x18
        add     r0, r10, #0
        ldr     r10, [sp, #0x40]
        str     r1, [sp, #0x38]
        str     r2, [sp, #0x24]
        add     r1, sp, #0xAC
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x28]
        str     r3, [sp, #0x20]
        str     r10, [sp, #0x3C]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x30]
        mov     r2, #8
        bl      __intel_memcpy
        ldr     r1, [sp, #0x44]
        str     r5, [sp, #0x10]
        mov     r0, r4
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x48]
        str     r6, [sp, #8]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x4C]
        str     r7, [sp]
        str     r1, [sp, #4]
        ldr     r3, [sp, #0x6C]
        ldr     r2, [sp, #0x68]
        ldr     r1, [sp, #0x50]
        bl      ownResample_H263_8u_P3R
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LFEZ2:
        mvn     r0, #5
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LFEZ3:
        add     r11, sp, #0x58
        mov     r10, #0x80
        str     r10, [r11, #8]
        add     r11, sp, #0x58
        str     r10, [r11, #4]
        add     r11, sp, #0x58
        str     r10, [r11]
        b       LFEZ1
LFEZ4:
        add     r0, sp, #0x58
        mov     r11, #0x10
        str     r11, [r0]
        mov     r0, #0x80
        add     r10, sp, #0x58
        add     r11, sp, #0x58
        str     r0, [r11, #8]
        str     r0, [r10, #4]
        b       LFEZ1
LFEZ5:
        mvn     r0, #7
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}


