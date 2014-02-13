        .text
        .align  4
        .globl  _ippsMinMaxIndx_64f


_ippsMinMaxIndx_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     lr, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        mov     r5, r0
        cmp     r5, #0
        beq     LBFS4
        cmp     r2, #0
        beq     LBFS4
        cmp     lr, #0
        beq     LBFS4
        cmp     r3, #0
        beq     LBFS4
        cmp     r12, #0
        beq     LBFS4
        cmp     r1, #0
        ble     LBFS5
        ldr     r9, [r5]
        ldr     r8, [r5, #4]
        cmp     r1, #0
        mov     r4, #0
        mov     r7, r9
        mov     r6, r8
        movle   r11, r4
        movle   r10, r11
        ble     LBFS3
        mov     r11, r4
        mov     r10, r11
        str     r10, [sp, #0x10]
        str     r11, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
        str     r1, [sp, #0x18]
LBFS0:
        ldr     r11, [r5]
        ldr     r10, [r5, #4]
        mov     r0, r9
        mov     r1, r8
        mov     r2, r11
        mov     r3, r10
        bl      __gtdf2
        cmp     r0, #0
        ble     LBFS1
        mov     r9, r11
        mov     r8, r10
        str     r4, [sp, #0x10]
LBFS1:
        mov     r0, r7
        mov     r1, r6
        mov     r2, r11
        mov     r3, r10
        bl      __ltdf2
        cmp     r0, #0
        bge     LBFS2
        mov     r7, r11
        mov     r6, r10
        str     r4, [sp, #0x14]
LBFS2:
        ldr     r2, [sp, #0x18]
        add     r4, r4, #1
        add     r5, r5, #8
        cmp     r4, r2
        blt     LBFS0
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LBFS3:
        str     r9, [r2]
        str     r8, [r2, #4]
        str     r7, [lr]
        str     r6, [lr, #4]
        str     r10, [r3]
        mov     r0, #0
        str     r11, [r12]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBFS4:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBFS5:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


