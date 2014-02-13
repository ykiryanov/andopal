        .text
        .align  4
        .globl  _ippsPreemphasize_32f_I


_ippsPreemphasize_32f_I:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r5, r1
        cmp     r5, #0
        mov     r4, r0
        mov     r6, r3
        beq     LDJV5
        cmp     r6, #0
        beq     LDJV5
        cmp     r2, #0
        ble     LDJV4
        sub     r11, r5, #4
        ldr     r10, [r11, +r2, lsl #2]
        sub     r8, r2, #1
        cmp     r8, #0
        ble     LDJV3
        cmp     r8, #6
        blt     LDJV1
        mov     r2, r8, lsl #2
        sub     r2, r2, #4
        add     r9, r2, r5
        add     r7, r2, r11
        str     r5, [sp]
LDJV0:
        ldr     r1, [r7, #4]
        ldr     r5, [r9, #4]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        str     r0, [r9, #4]
        ldr     r1, [r7]
        ldr     r5, [r9]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r5, [r9, #-4]
        str     r0, [r9]
        ldr     r1, [r7, #-4]
        mov     r0, r4
        sub     r8, r8, #5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        str     r0, [r9, #-4]
        ldr     r1, [r7, #-8]
        ldr     r5, [r9, #-8]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        str     r0, [r9, #-8]
        ldr     r1, [r7, #-0xC]
        ldr     r5, [r9, #-0xC]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        str     r0, [r9, #-0xC]
        cmp     r8, #6
        sub     r7, r7, #0x14
        sub     r9, r9, #0x14
        bge     LDJV0
        ldr     r5, [sp]
LDJV1:
        add     r11, r11, r8, lsl #2
        add     r9, r5, r8, lsl #2
LDJV2:
        ldr     r1, [r11], #-4
        ldr     r7, [r9]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        sub     r8, r8, #1
        str     r0, [r9], #-4
        cmp     r8, #0
        bgt     LDJV2
LDJV3:
        ldr     r1, [r6]
        ldr     r7, [r5]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        str     r0, [r5]
        mov     r0, #0
        str     r10, [r6]
        ldmia   sp!, {r1, r4 - r11, pc}
LDJV4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LDJV5:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


