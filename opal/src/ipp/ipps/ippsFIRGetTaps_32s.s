        .text
        .align  4
        .globl  _ippsFIRGetTaps_32s


_ippsFIRGetTaps_32s:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LBTH4
        cmp     r1, #0
        beq     LBTH4
        ldr     r3, [r0]
        ldr     r2, [pc, #0xE4]
        cmp     r2, r3
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r11, pc}
        ldr     r10, [r0, #0xC]
        ldr     r5, [r0, #4]
        cmp     r10, #0
        ble     LBTH3
        cmp     r10, #6
        mov     r9, #0
        sublt   r6, r1, #4
        blt     LBTH1
        sub     r6, r1, #4
        sub     r8, r10, #6
        sub     r7, r5, #4
LBTH0:
        ldr     r1, [r7, #8]
        ldr     r0, [r7, #4]
        sub     r4, r10, r9
        add     r9, r9, #5
        bl      __fixdfsi
        str     r0, [r6, +r4, lsl #2]
        ldr     r0, [r7, #0xC]
        ldr     r1, [r7, #0x10]
        mov     r4, r4, lsl #2
        sub     r11, r4, #8
        bl      __fixdfsi
        sub     r1, r4, #4
        str     r0, [r6, +r1]
        ldr     r0, [r7, #0x14]
        ldr     r1, [r7, #0x18]
        bl      __fixdfsi
        str     r0, [r6, +r11]
        ldr     r0, [r7, #0x1C]
        ldr     r1, [r7, #0x20]
        sub     r11, r4, #0xC
        sub     r4, r4, #0x10
        bl      __fixdfsi
        str     r0, [r6, +r11]
        ldr     r0, [r7, #0x24]
        ldr     r1, [r7, #0x28]!
        bl      __fixdfsi
        cmp     r9, r8
        str     r0, [r6, +r4]
        ble     LBTH0
LBTH1:
        mov     r0, r9, lsl #3
        sub     r0, r0, #4
        add     r5, r0, r5
LBTH2:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #8]!
        bl      __fixdfsi
        sub     r1, r10, r9
        add     r9, r9, #1
        cmp     r9, r10
        str     r0, [r6, +r1, lsl #2]
        blt     LBTH2
LBTH3:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBTH4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493231


