        .text
        .align  4
        .globl  _ippsConvert_32s32f


_ippsConvert_32s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        cmp     r0, #0
        mov     r4, r2
        beq     LCWJ7
        cmp     r1, #0
        beq     LCWJ7
        cmp     r4, #0
        ble     LCWJ6
        and     r3, r4, #3
        sub     r5, r4, r3
        cmp     r5, #0
        ble     LCWJ1
        mov     r2, #0
        add     r3, r1, #4
        add     r12, r1, #8
        str     r5, [sp, #4]
        str     r4, [sp, #8]
        add     r11, r0, #4
        add     r10, r0, #8
        add     r9, r1, #0xC
        add     r8, r0, #0xC
        mov     r7, r0
        mov     r6, r1
        str     r12, [sp]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
        mov     r5, r2
        mov     r4, r3
LCWJ0:
        ldr     r0, [r7], #0x10
        add     r5, r5, #4
        bl      __floatsisf
        str     r0, [r6], #0x10
        ldr     r0, [r11], #0x10
        bl      __floatsisf
        str     r0, [r4], #0x10
        ldr     r0, [r10], #0x10
        bl      __floatsisf
        ldr     r1, [sp]
        str     r0, [r1], #0x10
        ldr     r0, [r8], #0x10
        str     r1, [sp]
        bl      __floatsisf
        str     r0, [r9], #0x10
        ldr     r0, [sp, #4]
        cmp     r5, r0
        blt     LCWJ0
        ldr     r5, [sp, #4]
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LCWJ1:
        cmp     r5, r4
        bge     LCWJ5
        sub     r3, r4, r5
        cmp     r3, #6
        blt     LCWJ3
        mov     r3, r5, lsl #2
        add     r3, r3, #4
        sub     r8, r4, #6
        add     r7, r3, r0
        add     r6, r3, r1
        mov     r10, r0
        mov     r9, r1
LCWJ2:
        ldr     r0, [r7, #-4]
        add     r5, r5, #5
        bl      __floatsisf
        str     r0, [r6, #-4]
        ldr     r0, [r7]
        bl      __floatsisf
        str     r0, [r6]
        ldr     r0, [r7, #4]
        bl      __floatsisf
        str     r0, [r6, #4]
        ldr     r0, [r7, #8]
        bl      __floatsisf
        str     r0, [r6, #8]
        ldr     r0, [r7, #0xC]
        add     r7, r7, #0x14
        bl      __floatsisf
        str     r0, [r6, #0xC]
        cmp     r5, r8
        add     r6, r6, #0x14
        ble     LCWJ2
        mov     r1, r9
        mov     r0, r10
LCWJ3:
        add     r6, r0, r5, lsl #2
        add     r7, r1, r5, lsl #2
LCWJ4:
        ldr     r0, [r6], #4
        add     r5, r5, #1
        bl      __floatsisf
        str     r0, [r7], #4
        cmp     r5, r4
        blt     LCWJ4
LCWJ5:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWJ6:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWJ7:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


