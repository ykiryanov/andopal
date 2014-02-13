        .text
        .align  4
        .globl  _ippsThreshold_LTValGTVal_64f_I


_ippsThreshold_LTValGTVal_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r12, [sp, #0x38]
        ldr     r9, [sp, #0x40]
        ldr     r6, [sp, #0x44]
        str     r12, [sp]
        ldr     r12, [sp, #0x3C]
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp, #0x4C]
        mov     r7, r0
        cmp     r7, #0
        str     r12, [sp, #4]
        mov     r8, r1
        mov     r5, r2
        mov     r4, r3
        beq     LAPK6
        cmp     r8, #0
        ble     LAPK5
        mov     r0, r9
        mov     r1, r6
        mov     r2, r5
        mov     r3, r4
        bl      __ltdf2
        cmp     r0, #0
        blt     LAPK4
        cmp     r8, #0
        ble     LAPK3
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #4]
        str     r10, [sp, #8]
        str     r9, [sp, #0x10]
LAPK0:
        ldr     r10, [r7]
        ldr     r9, [r7, #4]
        mov     r2, r5
        mov     r0, r10
        mov     r3, r4
        mov     r1, r9
        bl      __ltdf2
        cmp     r0, #0
        bge     LAPK1
        ldr     r12, [sp]
        str     r11, [r7, #4]
        str     r12, [r7]
        b       LAPK2
LAPK1:
        mov     r0, r10
        mov     r1, r9
        ldr     r2, [sp, #0x10]
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        ble     LAPK2
        ldr     r12, [sp, #0xC]
        str     r12, [r7]
        ldr     r12, [sp, #8]
        str     r12, [r7, #4]
LAPK2:
        subs    r8, r8, #1
        add     r7, r7, #8
        bne     LAPK0
LAPK3:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAPK4:
        mvn     r0, #0x11
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAPK5:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAPK6:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


