        .text
        .align  4
        .globl  _ippsThreshold_LTInv_64f


_ippsThreshold_LTInv_64f:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x54
        ldr     r9, [r11, #4]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r8, r3
        beq     LBMK27
        cmp     r6, #0
        beq     LBMK27
        cmp     r5, #0
        ble     LBMK28
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBMK8
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mov     r4, #0
        beq     LBMK10
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r8
        mov     r3, r9
        bl      __divdf3
        str     r1, [r11, #-0x6C]
        eor     r1, r1, #2, 2
        subs    r12, r5, #2
        str     r0, [r11, #-0x64]
        str     r1, [r11, #-0x70]
        bmi     LBMK5
        add     r0, r7, #8
        mov     r2, r6
        mov     r1, r7
        add     r10, r6, #8
        str     r9, [r11, #-0x4C]
        str     r6, [r11, #-0x78]
        str     r7, [r11, #-0x7C]
        str     r12, [r11, #-0x5C]
        str     r4, [r11, #-0x58]
        str     r5, [r11, #-0x74]
        mov     r6, r0
        mov     r7, r1
        mov     r9, r2
LBMK0:
        ldr     r0, [r7]
        ldr     r3, [r11, #-0x4C]
        mov     r2, r8
        str     r0, [r11, #-0x54]
        ldr     r12, [r7, #4]
        str     r12, [r11, #-0x50]
        ldr     r4, [r6]
        ldr     r5, [r6, #4]
        bic     r1, r12, #2, 2
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMK2
        ldr     r3, [r11, #-0x4C]
        bic     r1, r5, #2, 2
        mov     r0, r4
        mov     r2, r8
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMK1
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x50]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r1, [r11, #-0x2C]
        ldr     r3, [r11, #-0x2C]
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [r11, #-0x60]
        str     r1, [r11, #-0x68]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMK9
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x68]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [r9]
        str     r1, [r9, #4]
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x68]
        ldr     r2, [r11, #-0x54]
        ldr     r3, [r11, #-0x50]
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        b       LBMK4
LBMK1:
        ldr     r2, [r11, #-0x54]
        ldr     r3, [r11, #-0x50]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [r9]
        str     r1, [r9, #4]
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [r11, #-0x70]
        ldrge   r12, [r11, #-0x6C]
        ldr     lr, [r11, #-0x64]
        str     r12, [r10, #4]
        str     lr, [r10]
        b       LBMK4
LBMK2:
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x50]
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [r11, #-0x70]
        ldrge   r12, [r11, #-0x6C]
        ldr     lr, [r11, #-0x64]
        str     r12, [r9, #4]
        bic     r1, r5, #2, 2
        str     lr, [r9]
        ldr     r3, [r11, #-0x4C]
        mov     r0, r4
        mov     r2, r8
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMK3
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        b       LBMK4
LBMK3:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r12, [r11, #-0x70]
        ldrge   r12, [r11, #-0x6C]
        ldr     lr, [r11, #-0x64]
        str     r12, [r10, #4]
        str     lr, [r10]
LBMK4:
        ldr     r12, [r11, #-0x58]
        ldr     lr, [r11, #-0x5C]
        add     r10, r10, #0x10
        add     r12, r12, #2
        str     r12, [r11, #-0x58]
        cmp     r12, lr
        add     r9, r9, #0x10
        add     r6, r6, #0x10
        add     r7, r7, #0x10
        ble     LBMK0
        ldr     r4, [r11, #-0x58]
        ldr     r9, [r11, #-0x4C]
        ldr     r5, [r11, #-0x74]
        ldr     r6, [r11, #-0x78]
        ldr     r7, [r11, #-0x7C]
LBMK5:
        mov     r12, #0
        cmp     r4, r5
        str     r12, [r11, #-0x50]
        bge     LBMK7
        ldr     r5, [r7, +r4, lsl #3]
        mov     r10, r4, lsl #3
        add     r7, r10, r7
        ldr     r7, [r7, #4]
        mov     r2, r8
        mov     r3, r9
        bic     r1, r7, #2, 2
        mov     r0, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMK6
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        mov     r3, r7
        bl      __divdf3
        str     r0, [r6, +r4, lsl #3]
        add     r10, r6, r10
        str     r1, [r10, #4]
        b       LBMK7
LBMK6:
        mov     r0, r5
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r0, [r11, #-0x70]
        strlt   r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x64]
        str     r0, [r6, +r10]
        ldr     r0, [r11, #-0x6C]
        add     r10, r6, r10
        str     r0, [r10, #4]
LBMK7:
        ldr     r0, [r11, #-0x50]
        ldmdb   r11, {r4 - r11, sp, pc}
LBMK8:
        mvn     r0, #0x12
        ldmdb   r11, {r4 - r11, sp, pc}
LBMK9:
        ldr     r2, [r11, #-0x54]
        ldr     r3, [r11, #-0x50]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [r11, #-0x2C]
        mov     r0, #0
        bl      __divdf3
        str     r1, [r9, #4]
        str     r0, [r9]
        ldr     r1, [r11, #-0x2C]
        mov     r0, #0
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        b       LBMK4
LBMK10:
        subs    r3, r5, #4
        strmi   r4, [r11, #-0x50]
        bmi     LBMK13
        add     lr, r7, #8
        add     r0, r6, #8
        add     r1, r6, #0x10
        add     r2, r6, #0x18
        mov     r10, r6
        mov     r12, r7
        str     r4, [r11, #-0x50]
        add     r9, r7, #0x10
        add     r8, r7, #0x18
        str     r2, [r11, #-0x34]
        str     r1, [r11, #-0x70]
        str     r0, [r11, #-0x38]
        str     r10, [r11, #-0x48]
        str     lr, [r11, #-0x30]
        str     r12, [r11, #-0x2C]
        str     r3, [r11, #-0x4C]
        str     r4, [r11, #-0x58]
        str     r5, [r11, #-0x74]
        str     r6, [r11, #-0x78]
        str     r7, [r11, #-0x7C]
LBMK11:
        ldr     r1, [r11, #-0x2C]
        ldr     r3, [r11, #-0x30]
        ldr     r0, [r1]
        str     r0, [r11, #-0x60]
        ldr     r1, [r1, #4]
        str     r1, [r11, #-0x64]
        ldr     r2, [r3]
        str     r2, [r11, #-0x54]
        ldr     r3, [r3, #4]
        str     r3, [r11, #-0x5C]
        ldr     r7, [r9]
        ldr     r6, [r9, #4]
        ldr     r5, [r8]
        ldr     r4, [r8, #4]
        bl      __muldf3
        str     r0, [r11, #-0x40]
        mov     r10, r1
        str     r10, [r11, #-0x3C]
        mov     r0, r7
        mov     r1, r6
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [r11, #-0x40]
        str     r0, [r11, #-0x44]
        str     r1, [r11, #-0x68]
        mov     r3, r10
        bl      __muldf3
        mov     r10, r0
        str     r1, [r11, #-0x6C]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMK18
        ldr     r3, [r11, #-0x6C]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r10
        mov     r0, #0
        bl      __divdf3
        mov     r10, r0
        str     r1, [r11, #-0x6C]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMK17
        ldr     r2, [r11, #-0x44]
        ldr     r3, [r11, #-0x68]
        ldr     r1, [r11, #-0x6C]
        mov     r0, r10
        bl      __muldf3
        ldr     r2, [r11, #-0x40]
        ldr     r3, [r11, #-0x3C]
        str     r1, [r11, #-0x68]
        ldr     r1, [r11, #-0x6C]
        str     r0, [r11, #-0x44]
        mov     r0, r10
        bl      __muldf3
        str     r0, [r11, #-0x3C]
        mov     r10, r1
        ldr     r0, [r11, #-0x44]
        ldr     r1, [r11, #-0x68]
        ldr     r2, [r11, #-0x54]
        ldr     r3, [r11, #-0x5C]
        bl      __muldf3
        ldr     r12, [r11, #-0x48]
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r0, [r11, #-0x44]
        ldr     r1, [r11, #-0x68]
        ldr     r2, [r11, #-0x60]
        ldr     r3, [r11, #-0x64]
        bl      __muldf3
        ldr     r12, [r11, #-0x38]
        mov     r2, r5
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r0, [r11, #-0x3C]
        mov     r1, r10
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r11, #-0x70]
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r0, [r11, #-0x3C]
        mov     r1, r10
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [r11, #-0x34]
        str     r0, [r2]
        str     r1, [r2, #4]
LBMK12:
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x4C]
        add     r8, r8, #0x20
        add     r0, r0, #4
        str     r0, [r11, #-0x58]
        cmp     r0, r1
        ldr     r0, [r11, #-0x34]
        add     r9, r9, #0x20
        add     r0, r0, #0x20
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x70]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x70]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x30]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x2C]
        ble     LBMK11
        ldr     r4, [r11, #-0x58]
        ldr     r5, [r11, #-0x74]
        ldr     r6, [r11, #-0x78]
        ldr     r7, [r11, #-0x7C]
LBMK13:
        cmp     r4, r5
        bge     LBMK7
        ldr     r3, [pc, #0x264]
        mov     r12, #0xFF, 12
        orr     r8, r12, #3, 4
        add     r6, r6, r4, lsl #3
        add     r10, r7, r4, lsl #3
LBMK14:
        ldr     r9, [r10]
        ldr     r7, [r10, #4]
        mov     r2, #0
        mov     r0, r9
        mov     r3, #0
        mov     r1, r7
        bl      __nedf2
        cmp     r0, #0
        beq     LBMK16
        mov     r1, r8
        mov     r2, r9
        mov     r3, r7
        mov     r0, #0
        bl      __divdf3
LBMK15:
        add     r4, r4, #1
        str     r0, [r6]
        str     r1, [r6, #4]
        cmp     r4, r5
        add     r6, r6, #8
        add     r10, r10, #8
        blt     LBMK14
        b       LBMK7
LBMK16:
        ldr     r3, [pc, #0x1F8]
        ldr     r0, [r3]
        ldr     r1, [r3, #4]
        mov     r3, #4
        str     r3, [r11, #-0x50]
        b       LBMK15
LBMK17:
        ldr     r2, [r11, #-0x60]
        ldr     r3, [r11, #-0x64]
        mov     r12, #0xFF, 12
        orr     r10, r12, #3, 4
        mov     r0, #0
        mov     r1, r10
        bl      __divdf3
        ldr     r12, [r11, #-0x48]
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r2, [r11, #-0x54]
        ldr     r3, [r11, #-0x5C]
        mov     r0, #0
        mov     r1, r10
        bl      __divdf3
        ldr     r12, [r11, #-0x38]
        mov     r2, r7
        str     r0, [r12]
        str     r1, [r12, #4]
        mov     r0, #0
        mov     r1, r10
        mov     r3, r6
        bl      __divdf3
        ldr     r12, [r11, #-0x70]
        str     r0, [r12]
        str     r1, [r12, #4]
        mov     r0, #0
        mov     r1, r10
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
        ldr     r2, [r11, #-0x34]
        str     r0, [r2]
        str     r1, [r2, #4]
        b       LBMK12
LBMK18:
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x64]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMK26
        ldr     r2, [r11, #-0x60]
        ldr     r3, [r11, #-0x64]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
LBMK19:
        ldr     r12, [r11, #-0x48]
        mov     r2, #0
        mov     r3, #0
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x5C]
        bl      __nedf2
        cmp     r0, #0
        beq     LBMK25
        ldr     r2, [r11, #-0x54]
        ldr     r3, [r11, #-0x5C]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
LBMK20:
        ldr     r12, [r11, #-0x38]
        mov     r2, #0
        mov     r3, #0
        str     r0, [r12]
        str     r1, [r12, #4]
        mov     r0, r7
        mov     r1, r6
        bl      __nedf2
        cmp     r0, #0
        beq     LBMK24
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
LBMK21:
        ldr     r12, [r11, #-0x70]
        mov     r2, #0
        mov     r3, #0
        str     r0, [r12]
        str     r1, [r12, #4]
        mov     r0, r5
        mov     r1, r4
        bl      __nedf2
        cmp     r0, #0
        beq     LBMK23
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
LBMK22:
        ldr     r2, [r11, #-0x34]
        str     r0, [r2]
        mov     r0, #4
        str     r1, [r2, #4]
        str     r0, [r11, #-0x50]
        b       LBMK12
LBMK23:
        ldr     r1, [pc, #0x48]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        b       LBMK22
LBMK24:
        ldr     r12, [pc, #0x38]
        ldr     r0, [r12]
        ldr     r1, [r12, #4]
        b       LBMK21
LBMK25:
        ldr     r12, [pc, #0x28]
        ldr     r0, [r12]
        ldr     r1, [r12, #4]
        b       LBMK20
LBMK26:
        ldr     r12, [pc, #0x18]
        ldr     r0, [r12]
        ldr     r1, [r12, #4]
        b       LBMK19
LBMK27:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
LBMK28:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
        .long   ippConstantOfINF_64f


