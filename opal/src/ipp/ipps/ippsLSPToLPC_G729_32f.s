        .text
        .align  4
        .globl  _ippsLSPToLPC_G729_32f


_ippsLSPToLPC_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        beq     LDID10
        cmp     r7, #0
        beq     LDID10
        ldr     r2, [pc, #0x5FC]
        ldr     r3, [pc, #0x5FC]
        ldr     r0, [r6]
        ldr     r4, [r2]
        add     r2, sp, #0x48
        ldr     r8, [r3]
        mov     r1, r4
        mov     r11, #2
        str     r8, [r2]
        bl      __mulsf3
        ldr     r3, [pc, #0x5DC]
        add     r2, sp, #0x48
        ldr     r5, [r3]
        str     r0, [r2, #4]
        sub     r3, r6, #8
        add     r9, r3, #0x10
        mov     r10, #8
        str     r8, [sp, #0x14]
        str     r7, [sp, #0x18]
        str     r6, [sp, #4]
LDID0:
        ldr     r0, [r9], #8
        mov     r1, r4
        bl      __mulsf3
        add     r2, sp, #0x48
        add     r7, r2, r10
        ldr     r1, [r7, #-4]
        mov     r6, r0
        bl      __mulsf3
        ldr     r1, [r7, #-8]
        mov     r7, r0
        sub     r8, r11, #1
        mov     r0, r1
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        add     r2, sp, #0x48
        cmp     r8, #1
        str     r0, [r2, +r11, lsl #2]
        ble     LDID4
        sub     r7, r8, #1
        cmp     r7, #5
        blt     LDID2
        mov     r7, r8, lsl #2
        str     r9, [sp, #0x1C]
        str     r10, [sp]
        str     r5, [sp, #0xC]
        str     r11, [sp, #8]
        str     r4, [sp, #0x10]
LDID1:
        add     r11, sp, #0x48
        ldr     r4, [r11, +r8, lsl #2]
        mov     r0, r6
        add     r10, r11, r7
        ldr     r9, [r10, #-4]
        ldr     r5, [r10, #-8]
        sub     r7, r7, #0x10
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r4, [r10, #-0xC]
        str     r0, [r11, +r8, lsl #2]
        mov     r0, r6
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r9, [r10, #-0x10]
        str     r0, [r10, #-4]
        mov     r1, r4
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [r10, #-8]
        mov     r0, r6
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, #-0x14]
        bl      __addsf3
        sub     r8, r8, #4
        cmp     r8, #6
        str     r0, [r10, #-0xC]
        bge     LDID1
        ldr     r9, [sp, #0x1C]
        ldr     r10, [sp]
        ldr     r5, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r4, [sp, #0x10]
        sub     r7, r8, #1
LDID2:
        str     r5, [sp, #0xC]
        str     r11, [sp, #8]
        str     r4, [sp, #0x10]
LDID3:
        add     r11, sp, #0x48
        add     r5, r11, r8, lsl #2
        ldr     r1, [r5, #-4]
        ldr     r4, [r11, +r8, lsl #2]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r5, #-8]
        bl      __addsf3
        str     r0, [r11, +r8, lsl #2]
        cmp     r7, #1
        mov     r8, r7
        subgt   r7, r7, #1
        bgt     LDID3
        ldr     r5, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r4, [sp, #0x10]
LDID4:
        add     r7, sp, #0x48
        ldr     r0, [r7, #4]
        mov     r1, r6
        add     r10, r10, #4
        bl      __addsf3
        add     r11, r11, #1
        cmp     r11, #5
        str     r0, [r7, #4]
        ble     LDID0
        ldr     r6, [sp, #4]
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r0, [r6, #4]
        add     r2, sp, #0x20
        str     r8, [r2]
        mov     r1, r4
        bl      __mulsf3
        add     r9, sp, #0x20
        str     r0, [r9, #4]
        sub     r6, r6, #4
        add     r6, r6, #0x10
        mov     r11, #2
        mov     r10, #8
        str     r8, [sp, #0x14]
        str     r7, [sp, #0x18]
LDID5:
        ldr     r0, [r6], #8
        mov     r1, r4
        bl      __mulsf3
        add     r2, sp, #0x20
        add     r8, r2, r10
        ldr     r1, [r8, #-4]
        mov     r7, r0
        bl      __mulsf3
        ldr     r1, [r8, #-8]
        mov     r8, r0
        sub     r9, r11, #1
        mov     r0, r1
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        add     r2, sp, #0x20
        cmp     r9, #1
        str     r0, [r2, +r11, lsl #2]
        ble     LDID9
        sub     r8, r9, #1
        cmp     r8, #5
        blt     LDID7
        mov     r8, r9, lsl #2
        str     r6, [sp]
        str     r10, [sp, #4]
        str     r11, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x10]
LDID6:
        add     r11, sp, #0x20
        ldr     r4, [r11, +r9, lsl #2]
        mov     r0, r7
        add     r10, r11, r8
        ldr     r6, [r10, #-4]
        ldr     r5, [r10, #-8]
        sub     r8, r8, #0x10
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r4, [r10, #-0xC]
        str     r0, [r11, +r9, lsl #2]
        mov     r0, r7
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r6, [r10, #-0x10]
        str     r0, [r10, #-4]
        mov     r1, r4
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        str     r0, [r10, #-8]
        mov     r0, r7
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, #-0x14]
        bl      __addsf3
        sub     r9, r9, #4
        cmp     r9, #6
        str     r0, [r10, #-0xC]
        bge     LDID6
        ldr     r6, [sp]
        ldr     r10, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        sub     r8, r9, #1
LDID7:
        str     r11, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x10]
LDID8:
        add     r11, sp, #0x20
        add     r5, r11, r9, lsl #2
        ldr     r1, [r5, #-4]
        ldr     r4, [r11, +r9, lsl #2]
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r5, #-8]
        bl      __addsf3
        str     r0, [r11, +r9, lsl #2]
        cmp     r8, #1
        mov     r9, r8
        subgt   r8, r8, #1
        bgt     LDID8
        ldr     r11, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x10]
LDID9:
        add     r8, sp, #0x20
        ldr     r0, [r8, #4]
        mov     r1, r7
        add     r10, r10, #4
        bl      __addsf3
        add     r11, r11, #1
        cmp     r11, #5
        str     r0, [r8, #4]
        ble     LDID5
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        add     r6, sp, #0x48
        ldr     r4, [r6, #0x10]
        ldr     r0, [r6, #0x14]
        add     r9, sp, #0x20
        mov     r1, r4
        bl      __addsf3
        add     r10, sp, #0x20
        str     r0, [r6, #0x14]
        ldr     r5, [r10, #0x10]
        ldr     r0, [r10, #0x14]
        mov     r1, r5
        bl      __subsf3
        ldr     r11, [r6, #0xC]
        str     r0, [r10, #0x14]
        mov     r1, r11
        mov     r0, r4
        bl      __addsf3
        ldr     r4, [r10, #0xC]
        str     r0, [r6, #0x10]
        mov     r0, r5
        mov     r1, r4
        bl      __subsf3
        ldr     r5, [r6, #8]
        str     r0, [r10, #0x10]
        mov     r0, r11
        mov     r1, r5
        bl      __addsf3
        ldr     r11, [r10, #8]
        str     r0, [r6, #0xC]
        mov     r0, r4
        mov     r1, r11
        bl      __subsf3
        ldr     r4, [r6, #4]
        str     r0, [r10, #0xC]
        mov     r1, r4
        mov     r0, r5
        bl      __addsf3
        ldr     r5, [r10, #4]
        str     r0, [r6, #8]
        mov     r0, r11
        mov     r1, r5
        bl      __subsf3
        ldr     r1, [r6]
        str     r0, [r10, #8]
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r10]
        str     r0, [r6, #4]
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [pc, #0x148]
        str     r0, [r10, #4]
        str     r8, [r7]
        add     r5, sp, #0x48
        ldr     r6, [r5, #4]
        ldr     r8, [r9, #4]
        ldr     r4, [r2]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #4]
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        ldr     r6, [r5, #8]
        ldr     r8, [r9, #8]
        str     r0, [r7, #0x28]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #8]
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        ldr     r6, [r9, #0xC]
        ldr     r8, [r5, #0xC]
        str     r0, [r7, #0x24]
        mov     r1, r6
        mov     r0, r8
        bl      __addsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #0xC]
        mov     r1, r6
        mov     r0, r8
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        ldr     r6, [r9, #0x10]
        ldr     r8, [r5, #0x10]
        str     r0, [r7, #0x20]
        mov     r1, r6
        mov     r0, r8
        bl      __addsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #0x10]
        mov     r1, r6
        mov     r0, r8
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        ldr     r5, [r5, #0x14]
        ldr     r9, [r9, #0x14]
        str     r0, [r7, #0x1C]
        mov     r0, r5
        mov     r1, r9
        bl      __addsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #0x14]
        mov     r0, r5
        mov     r1, r9
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #0x18]
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LDID10:
        mvn     r0, #7
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
        .long   LDID__2il0floatpacket.2
        .long   LDID__2il0floatpacket.1
        .long   LDID__2il0floatpacket.3
        .long   LDID__2il0floatpacket.4


        .data
        .align  4


LDID__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LDID__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC0
LDID__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x40
LDID__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x3F


