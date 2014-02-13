        .text
        .align  4
        .globl  _ippsDotProd_G729A_32f


_ippsDotProd_G729A_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r7, r1
        mov     r6, r2
        mov     r5, r3
        beq     LDHS3
        cmp     r7, #0
        beq     LDHS3
        cmp     r5, #0
        beq     LDHS3
        cmp     r6, #0
        ble     LDHS4
        ldr     r12, [pc, #0xFC]
        cmp     r6, #0xC
        mov     r11, #0
        ldr     r4, [r12]
        blt     LDHS1
        sub     r10, r6, #0xC
        add     r9, r0, #8
        add     r8, r7, #8
        str     r0, [sp]
LDHS0:
        ldr     r1, [r8, #-8]
        ldr     r0, [r9, #-8]
        add     r11, r11, #0xA
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r8]
        mov     r4, r0
        ldr     r0, [r9]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r9, #8]
        ldr     r2, [r8, #8]
        mov     r4, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [r9, #0x10]
        ldr     r1, [r8, #0x10]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [r9, #0x18]
        ldr     r1, [r8, #0x18]
        add     r9, r9, #0x28
        add     r8, r8, #0x28
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r11, r10
        mov     r4, r0
        ble     LDHS0
        ldr     r0, [sp]
LDHS1:
        add     r8, r0, r11, lsl #2
        add     r7, r7, r11, lsl #2
LDHS2:
        ldr     r0, [r8], #8
        ldr     r1, [r7], #8
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        add     r11, r11, #2
        cmp     r11, r6
        mov     r4, r0
        blt     LDHS2
        mov     r0, #0
        str     r4, [r5]
        ldmia   sp!, {r1, r4 - r11, pc}
LDHS3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LDHS4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   LDHS__2il0floatpacket.1


        .data
        .align  4


LDHS__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


