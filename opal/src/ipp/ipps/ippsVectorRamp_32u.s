        .text
        .align  4
        .globl  _ippsVectorRamp_32u


_ippsVectorRamp_32u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r6, r0
        cmp     r6, #0
        mov     r8, r1
        mov     r5, r2
        mov     r4, r3
        beq     LAZY4
        cmp     r8, #0
        ble     LAZY3
        cmp     r8, #0
        ble     LAZY2
        mov     r12, #0xFE, 12
        mvn     lr, #0xE1, 12
        mov     r7, #0
        orr     r12, r12, #0xF, 4
        bic     lr, lr, #0xB, 4
        mvn     r9, #0
        mov     r10, #0
        mov     r11, r7
        str     r9, [sp]
        str     lr, [sp, #4]
        str     r12, [sp, #8]
LAZY0:
        mov     r0, r7
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #0
        strle   r12, [r6]
        ble     LAZY1
        ldr     r12, [sp, #8]
        mov     r2, r10
        mov     r3, r9
        add     r1, r12, #1, 2
        mov     r12, #0
        mov     r0, #0
        sub     r11, r12, #2, 12
        bl      __adddf3
        ldr     r3, [sp, #4]
        mov     r9, r0
        mov     r10, r1
        mov     r2, r11
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp]
        strge   r12, [r6]
        bge     LAZY1
        mov     r0, r9
        mov     r1, r10
        bl      __fixunsdfsi
        str     r0, [r6]
LAZY1:
        add     r7, r7, #1
        cmp     r7, r8
        add     r6, r6, #4
        blt     LAZY0
LAZY2:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAZY3:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAZY4:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


