        .text
        .align  4
        .globl  _ippsFIR_EC_32f


_ippsFIR_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r8, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r3
        beq     LDLO8
        cmp     r5, #0
        beq     LDLO8
        cmp     r2, #0
        beq     LDLO8
        cmp     r8, #0
        beq     LDLO8
        cmp     r4, #0
        ble     LDLO7
        cmp     r11, #0
        ble     LDLO7
        cmp     r4, #0
        ble     LDLO5
        ldr     r12, [pc, #0x200]
        mov     r9, #0
        ldr     r7, [r12]
        sub     r12, r11, #6
        str     r12, [sp, #0x20]
        str     r2, [sp, #8]
LDLO0:
        cmp     r11, #0
        mov     r1, r7
        movle   r10, r9, lsl #2
        ble     LDLO4
        cmp     r11, #6
        blt     LDLO6
        add     r3, r8, #4
        mov     r10, r9, lsl #2
        str     r8, [sp, #0x10]
        ldr     r8, [sp, #0x20]
        add     r0, r6, r10
        mov     r2, #0
        str     r9, [sp, #0x18]
        str     r4, [sp, #0xC]
        str     r5, [sp, #4]
        str     r6, [sp]
        str     r7, [sp, #0x1C]
        str     r11, [sp, #0x14]
        mov     r4, r0
        mov     r9, r1
        mov     r5, r2
        mov     r6, r3
LDLO1:
        ldr     r1, [r6, #-4]
        rsb     r12, r5, #0
        ldr     r0, [r4, +r12, lsl #2]
        mvn     r12, #1
        rsb     r7, r5, r12
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r6]
        mvn     r12, #0
        rsb     r12, r5, r12
        ldr     r2, [r4, +r12, lsl #2]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r4, +r7, lsl #2]
        ldr     r2, [r6, #4]
        mov     r7, r0
        mov     r0, r1
        mvn     r9, #2
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        rsb     r9, r5, r9
        ldr     r1, [r4, +r9, lsl #2]
        ldr     r2, [r6, #8]
        mov     r9, r0
        mov     r0, r1
        mvn     r7, #3
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r6, #0xC]
        mov     r9, r0
        rsb     r7, r5, r7
        ldr     r0, [r4, +r7, lsl #2]
        add     r6, r6, #0x14
        add     r5, r5, #5
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        cmp     r5, r8
        mov     r9, r0
        ble     LDLO1
        mov     r0, r4
        mov     r2, r5
        mov     r1, r9
        ldr     r7, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #4]
        ldr     r6, [sp]
LDLO2:
        add     r3, r8, r2, lsl #2
        str     r8, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r5, [sp, #4]
        str     r6, [sp]
        mov     r5, r0
        mov     r4, r1
        mov     r6, r2
        mov     r8, r3
LDLO3:
        rsb     r12, r6, #0
        ldr     r0, [r5, +r12, lsl #2]
        ldr     r1, [r8], #4
        add     r6, r6, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r6, r11
        mov     r4, r0
        blt     LDLO3
        mov     r1, r4
        ldr     r8, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #4]
        ldr     r6, [sp]
LDLO4:
        ldr     r0, [r5, +r10]
        add     r9, r9, #1
        bl      __subsf3
        ldr     r2, [sp, #8]
        cmp     r9, r4
        str     r0, [r2, +r10]
        blt     LDLO0
LDLO5:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDLO6:
        mov     r10, r9, lsl #2
        mov     r2, #0
        add     r0, r6, r10
        b       LDLO2
LDLO7:
        mvn     r0, #4
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDLO8:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLO__2il0floatpacket.1


        .data
        .align  4


LDLO__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


