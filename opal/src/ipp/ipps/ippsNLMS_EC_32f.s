        .text
        .align  4
        .globl  _ippsNLMS_EC_32f


_ippsNLMS_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r8, [sp, #0x5C]
        ldr     r11, [sp, #0x60]
        ldr     r7, [sp, #0x64]
        ldr     r12, [sp, #0x68]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r2
        mov     r4, r3
        beq     LDLI8
        cmp     r1, #0
        beq     LDLI8
        cmp     r4, #0
        beq     LDLI8
        cmp     r11, #0
        beq     LDLI8
        cmp     r5, #0
        beq     LDLI8
        cmp     r12, #0
        beq     LDLI8
        cmp     r8, #0
        ble     LDLI7
        cmp     r7, #0
        ble     LDLI7
        ldr     r0, [r12]
        cmp     r8, #0
        ble     LDLI5
        ldr     lr, [pc, #0x288]
        mov     r10, #0
        sub     r2, r6, #4
        ldr     lr, [lr]
        sub     r9, r7, #4
        str     r9, [sp, #0x30]
        str     r2, [sp]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x28]
        str     r1, [sp, #0x20]
LDLI0:
        ldr     r1, [sp, #0x2C]
        cmp     r7, #0
        movle   r9, r10, lsl #2
        ble     LDLI4
        cmp     r7, #4
        blt     LDLI6
        mov     r9, r10, lsl #2
        add     r2, r6, r9
        str     r9, [sp, #0x18]
        ldr     r9, [sp]
        mov     r3, #0
        add     r12, r11, #4
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r5, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp, #0x24]
        str     r11, [sp, #0x14]
        mov     r4, r0
        mov     r10, r1
        mov     r5, r2
        mov     r6, r3
        mov     r8, r12
LDLI1:
        ldr     lr, [r8, #-4]
        mov     r1, r4
        rsb     r11, r6, #0
        str     lr, [sp, #0x34]
        ldr     lr, [sp, #0x1C]
        sub     lr, lr, r6
        ldr     r0, [r9, +lr, lsl #2]
        mov     r7, lr, lsl #2
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        str     r0, [r8, #-4]
        ldr     r1, [r5, +r11, lsl #2]
        sub     r11, r7, #4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r9, +r11]
        ldr     r11, [r8]
        mov     r10, r0
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8]
        mvn     lr, #0
        rsb     lr, r6, lr
        ldr     r1, [r5, +lr, lsl #2]
        sub     r7, r7, #8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r9, +r7]
        ldr     r10, [r8, #4]
        mov     r7, r0
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r8, #4]
        mvn     lr, #1
        rsb     lr, r6, lr
        ldr     r1, [r5, +lr, lsl #2]
        add     r8, r8, #0xC
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     lr, [sp, #0x30]
        add     r6, r6, #3
        mov     r10, r0
        cmp     r6, lr
        ble     LDLI1
        mov     r0, r4
        mov     r2, r5
        mov     r3, r6
        mov     r1, r10
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r7, [sp, #0x24]
        ldr     r11, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #4]
LDLI2:
        add     r12, r11, r3, lsl #2
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r5, [sp, #8]
        str     r6, [sp, #4]
        str     r9, [sp, #0x18]
        str     r11, [sp, #0x14]
        mov     r4, r0
        mov     r10, r1
        mov     r5, r2
        mov     r6, r3
        mov     r8, r12
LDLI3:
        ldr     lr, [sp, #0x1C]
        ldr     r11, [sp]
        ldr     r9, [r8]
        sub     lr, lr, r6
        mov     r1, r4
        ldr     r0, [r11, +lr, lsl #2]
        rsb     r11, r6, #0
        add     r6, r6, #1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [r8], #4
        ldr     r1, [r5, +r11, lsl #2]
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        cmp     r6, r7
        mov     r10, r0
        blt     LDLI3
        mov     r1, r10
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #4]
LDLI4:
        ldr     r12, [sp, #0x20]
        add     r10, r10, #1
        ldr     r0, [r12, +r9]
        bl      __subsf3
        str     r0, [r4, +r9]
        ldr     r1, [r5, +r9]
        bl      __mulsf3
        cmp     r10, r8
        blt     LDLI0
        ldr     r12, [sp, #0x28]
LDLI5:
        str     r0, [r12]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDLI6:
        mov     r9, r10, lsl #2
        mov     r3, #0
        add     r2, r6, r9
        b       LDLI2
LDLI7:
        mvn     r0, #4
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDLI8:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLI__2il0floatpacket.1


        .data
        .align  4


LDLI__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


