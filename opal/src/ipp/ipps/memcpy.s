        .text
        .align  4
        .globl  __aeabi_memcpy8
        .globl  __aeabi_memcpy4
        .globl  __aeabi_memcpy


__aeabi_memcpy:
__aeabi_memcpy8:
__aeabi_memcpy4:
        stmdb   sp!, {r0, r3 - r12, lr}
LAIV_prefetch_setup:
        mov     r5, r1
        bic     r5, r5, #3
        pld     [r5]
        pld     [r5, #0x20]
        pld     [r5, #0x40]
        cmp     r2, #4
        bls     LAIV_finish
        rsb     r4, r0, #0
        ands    r4, r4, #2
        ldrneb  r5, [r1], #1
        ldrneb  r6, [r1], #1
        subne   r2, r2, #2
        strneb  r5, [r0], #1
        strneb  r6, [r0], #1
        ands    r4, r0, #1
        ldrneb  r5, [r1], #1
        subne   r2, r2, #1
        strneb  r5, [r0], #1
        and     r3, r1, #3
        cmp     r3, #3
        beq     LAIV_memcpyoffby3
        cmp     r3, #2
        beq     LAIV_memcpyoffby2
        cmp     r3, #1
        beq     LAIV_memcpyoffby1
LAIV_memcpyoffby0:
        and     r4, r0, #0x1C
        rsb     r4, r4, #0x20
        and     r5, r2, #0x1C
        cmp     r4, r2
        movhi   r4, r5
        cmp     r4, #0
        beq     LAIV_offby0mainloop
        rsb     r3, r4, #0x20
        and     r3, r3, #0x1C
        sub     r2, r2, r4
        add     r12, pc, #0
        add     pc, r12, r3
LAIV_offby0cachelinealignload:
        ldr     r4, [r1], #4
        ldr     r5, [r1], #4
        ldr     r6, [r1], #4
        ldr     r7, [r1], #4
        ldr     r8, [r1], #4
        ldr     r9, [r1], #4
        ldr     r10, [r1], #4
        ldr     r11, [r1], #4
        add     r12, pc, #0
        add     pc, r12, r3
LAIV_offby0cachelinealignstore:
        str     r4, [r0], #4
        str     r5, [r0], #4
        str     r6, [r0], #4
        str     r7, [r0], #4
        str     r8, [r0], #4
        str     r9, [r0], #4
        str     r10, [r0], #4
        str     r11, [r0], #4
LAIV_offby0mainloop:
        cmp     r2, #0x80
        bmi     LAIV_offby0endofmainloop
        pld     [r1, #0x60]
        pld     [r1, #0x80]
        ldmia   r1!, {r4 - r11}
        stmia   r0!, {r4 - r11}
        ldmia   r1!, {r4 - r11}
        stmia   r0!, {r4 - r11}
        sub     r2, r2, #0x40
        b       LAIV_offby0mainloop
LAIV_offby0endofmainloop:
        cmp     r2, #0x80
        bls     LAIV_offby0nopreload
        pld     [r1, #0x80]
LAIV_offby0nopreload:
LAIV_offby0finishcachelines:
        cmp     r2, #0x20
        bmi     LAIV_offby0endoffinishcachelines
        ldmia   r1!, {r4 - r11}
        stmia   r0!, {r4 - r11}
        sub     r2, r2, #0x20
        b       LAIV_offby0finishcachelines
LAIV_offby0endoffinishcachelines:
        ands    r3, r2, #0x1C
        beq     LAIV_finish
        sub     r2, r2, r3
        rsb     r3, r3, #0x20
        add     r12, pc, #0
        add     pc, r12, r3
LAIV_offby0finishload:
        ldr     r4, [r1], #4
        ldr     r5, [r1], #4
        ldr     r6, [r1], #4
        ldr     r7, [r1], #4
        ldr     r8, [r1], #4
        ldr     r9, [r1], #4
        ldr     r10, [r1], #4
        ldr     r11, [r1], #4
        add     r12, pc, #0
        add     pc, r12, r3
LAIV_offby0finishstore:
        str     r4, [r0], #4
        str     r5, [r0], #4
        str     r6, [r0], #4
        str     r7, [r0], #4
        str     r8, [r0], #4
        str     r9, [r0], #4
        str     r10, [r0], #4
        str     r11, [r0], #4
        rsb     r2, r2, #4
        add     r12, pc, #0
        add     pc, r12, r2, lsl #2
LAIV_finishloadby0:
        ldrb    r3, [r1], #1
        ldrb    r4, [r1], #1
        ldrb    r5, [r1], #1
        ldrb    r6, [r1], #1
        add     r12, pc, #0
        add     pc, r12, r2, lsl #2
LAIV_finishstoreby0:
        strb    r3, [r0], #1
        strb    r4, [r0], #1
        strb    r5, [r0], #1
        strb    r6, [r0], #1
        ldmia   sp!, {r0, r3 - r12, pc}
LAIV_memcpyoffby1:
        bic     r3, r1, #3
        ldr     lr, [r3], #4
        mov     lr, lr, lsr #8
        and     r4, r0, #0x1C
        rsb     r4, r4, #0x20
        and     r5, r2, #0x1C
        cmp     r4, r2
        movhi   r4, r5
        cmp     r4, #0
        beq     LAIV_offby1mainloop
        rsb     r6, r4, #0x20
        and     r6, r6, #0x1C
        sub     r2, r2, r4
        add     r12, pc, #0
        add     pc, r12, r6, lsl #2
LAIV_offby1cachelinealignload:
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
LAIV_offby1mainloop:
        cmp     r2, #0xA0
        bmi     LAIV_offby1endofmainloop
        pld     [r3, #0x60]
        pld     [r3, #0x80]
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #24
        mov     lr, r4, lsr #8
        orr     r4, lr, r5, lsl #24
        mov     lr, r5, lsr #8
        orr     r5, lr, r6, lsl #24
        mov     lr, r6, lsr #8
        orr     r6, lr, r7, lsl #24
        mov     lr, r7, lsr #8
        orr     r7, lr, r8, lsl #24
        mov     lr, r8, lsr #8
        orr     r8, lr, r9, lsl #24
        mov     lr, r9, lsr #8
        orr     r9, lr, r10, lsl #24
        mov     lr, r10, lsr #8
        orr     r10, lr, r11, lsl #24
        mov     lr, r11, lsr #8
        stmia   r0!, {r1, r4 - r10}
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #24
        mov     lr, r4, lsr #8
        orr     r4, lr, r5, lsl #24
        mov     lr, r5, lsr #8
        orr     r5, lr, r6, lsl #24
        mov     lr, r6, lsr #8
        orr     r6, lr, r7, lsl #24
        mov     lr, r7, lsr #8
        orr     r7, lr, r8, lsl #24
        mov     lr, r8, lsr #8
        orr     r8, lr, r9, lsl #24
        mov     lr, r9, lsr #8
        orr     r9, lr, r10, lsl #24
        mov     lr, r10, lsr #8
        orr     r10, lr, r11, lsl #24
        mov     lr, r11, lsr #8
        stmia   r0!, {r1, r4 - r10}
        sub     r2, r2, #0x40
        b       LAIV_offby1mainloop
LAIV_offby1endofmainloop:
        cmp     r2, #0x80
        bls     LAIV_offby1nopreload
        pld     [r3, #0x80]
LAIV_offby1nopreload:
LAIV_offby1finishcachelines:
        cmp     r2, #0x20
        bmi     LAIV_offby1endoffinishcachelines
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #24
        mov     lr, r4, lsr #8
        orr     r4, lr, r5, lsl #24
        mov     lr, r5, lsr #8
        orr     r5, lr, r6, lsl #24
        mov     lr, r6, lsr #8
        orr     r6, lr, r7, lsl #24
        mov     lr, r7, lsr #8
        orr     r7, lr, r8, lsl #24
        mov     lr, r8, lsr #8
        orr     r8, lr, r9, lsl #24
        mov     lr, r9, lsr #8
        orr     r9, lr, r10, lsl #24
        mov     lr, r10, lsr #8
        orr     r10, lr, r11, lsl #24
        mov     lr, r11, lsr #8
        stmia   r0!, {r1, r4 - r10}
        sub     r2, r2, #0x20
        b       LAIV_offby1finishcachelines
LAIV_offby1endoffinishcachelines:
        ands    r6, r2, #0x1C
        subeq   r1, r3, #3
        beq     LAIV_finish
        sub     r2, r2, r6
        rsb     r6, r6, #0x20
        add     r12, pc, #0
        add     pc, r12, r6, lsl #2
LAIV_offby1finishload:
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #24
        str     r12, [r0], #4
        mov     lr, r4, lsr #8
        sub     r1, r3, #3
        rsb     r2, r2, #4
        add     r12, pc, #0
        add     pc, r12, r2, lsl #2
LAIV_finishloadby1:
        ldrb    r3, [r1], #1
        ldrb    r4, [r1], #1
        ldrb    r5, [r1], #1
        ldrb    r6, [r1], #1
        add     r12, pc, #0
        add     pc, r12, r2, lsl #2
LAIV_finishstoreby1:
        strb    r3, [r0], #1
        strb    r4, [r0], #1
        strb    r5, [r0], #1
        strb    r6, [r0], #1
        ldmia   sp!, {r0, r3 - r12, pc}
LAIV_memcpyoffby2:
        bic     r3, r1, #3
        ldr     lr, [r3], #4
        mov     lr, lr, lsr #16
        and     r4, r0, #0x1C
        rsb     r4, r4, #0x20
        and     r5, r2, #0x1C
        cmp     r4, r2
        movhi   r4, r5
        cmp     r4, #0
        beq     LAIV_offby2mainloop
        rsb     r6, r4, #0x20
        and     r6, r6, #0x1C
        sub     r2, r2, r4
        add     r12, pc, #0
        add     pc, r12, r6, lsl #2
LAIV_offby2cachelinealignload:
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
LAIV_offby2mainloop:
        cmp     r2, #0xA0
        bmi     LAIV_offby2endofmainloop
        pld     [r3, #0x60]
        pld     [r3, #0x80]
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #16
        mov     lr, r4, lsr #16
        orr     r4, lr, r5, lsl #16
        mov     lr, r5, lsr #16
        orr     r5, lr, r6, lsl #16
        mov     lr, r6, lsr #16
        orr     r6, lr, r7, lsl #16
        mov     lr, r7, lsr #16
        orr     r7, lr, r8, lsl #16
        mov     lr, r8, lsr #16
        orr     r8, lr, r9, lsl #16
        mov     lr, r9, lsr #16
        orr     r9, lr, r10, lsl #16
        mov     lr, r10, lsr #16
        orr     r10, lr, r11, lsl #16
        mov     lr, r11, lsr #16
        stmia   r0!, {r1, r4 - r10}
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #16
        mov     lr, r4, lsr #16
        orr     r4, lr, r5, lsl #16
        mov     lr, r5, lsr #16
        orr     r5, lr, r6, lsl #16
        mov     lr, r6, lsr #16
        orr     r6, lr, r7, lsl #16
        mov     lr, r7, lsr #16
        orr     r7, lr, r8, lsl #16
        mov     lr, r8, lsr #16
        orr     r8, lr, r9, lsl #16
        mov     lr, r9, lsr #16
        orr     r9, lr, r10, lsl #16
        mov     lr, r10, lsr #16
        orr     r10, lr, r11, lsl #16
        mov     lr, r11, lsr #16
        stmia   r0!, {r1, r4 - r10}
        sub     r2, r2, #0x40
        b       LAIV_offby2mainloop
LAIV_offby2endofmainloop:
        cmp     r2, #0x80
        bls     LAIV_offby2nopreload
        pld     [r3, #0x80]
LAIV_offby2nopreload:
LAIV_offby2finishcachelines:
        cmp     r2, #0x20
        bmi     LAIV_offby2endoffinishcachelines
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #16
        mov     lr, r4, lsr #16
        orr     r4, lr, r5, lsl #16
        mov     lr, r5, lsr #16
        orr     r5, lr, r6, lsl #16
        mov     lr, r6, lsr #16
        orr     r6, lr, r7, lsl #16
        mov     lr, r7, lsr #16
        orr     r7, lr, r8, lsl #16
        mov     lr, r8, lsr #16
        orr     r8, lr, r9, lsl #16
        mov     lr, r9, lsr #16
        orr     r9, lr, r10, lsl #16
        mov     lr, r10, lsr #16
        orr     r10, lr, r11, lsl #16
        mov     lr, r11, lsr #16
        stmia   r0!, {r1, r4 - r10}
        sub     r2, r2, #0x20
        b       LAIV_offby2finishcachelines
LAIV_offby2endoffinishcachelines:
        ands    r6, r2, #0x1C
        subeq   r1, r3, #2
        beq     LAIV_finish
        sub     r2, r2, r6
        rsb     r6, r6, #0x20
        add     r12, pc, #0
        add     pc, r12, r6, lsl #2
LAIV_offby2finishload:
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #16
        str     r12, [r0], #4
        mov     lr, r4, lsr #16
        sub     r1, r3, #2
        rsb     r2, r2, #4
        add     r12, pc, #0
        add     pc, r12, r2, lsl #2
LAIV_finishloadby2:
        ldrb    r3, [r1], #1
        ldrb    r4, [r1], #1
        ldrb    r5, [r1], #1
        ldrb    r6, [r1], #1
        add     r12, pc, #0
        add     pc, r12, r2, lsl #2
LAIV_finishstoreby2:
        strb    r3, [r0], #1
        strb    r4, [r0], #1
        strb    r5, [r0], #1
        strb    r6, [r0], #1
        ldmia   sp!, {r0, r3 - r12, pc}
LAIV_memcpyoffby3:
        bic     r3, r1, #3
        ldr     lr, [r3], #4
        mov     lr, lr, lsr #24
        and     r4, r0, #0x1C
        rsb     r4, r4, #0x20
        and     r5, r2, #0x1C
        cmp     r4, r2
        movhi   r4, r5
        cmp     r4, #0
        beq     LAIV_offby3mainloop
        rsb     r6, r4, #0x20
        and     r6, r6, #0x1C
        sub     r2, r2, r4
        add     r12, pc, #0
        add     pc, r12, r6, lsl #2
LAIV_offby3cachelinealignload:
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
LAIV_offby3mainloop:
        cmp     r2, #0xA0
        bmi     LAIV_offby3endofmainloop
        pld     [r3, #0x60]
        pld     [r3, #0x80]
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #8
        mov     lr, r4, lsr #24
        orr     r4, lr, r5, lsl #8
        mov     lr, r5, lsr #24
        orr     r5, lr, r6, lsl #8
        mov     lr, r6, lsr #24
        orr     r6, lr, r7, lsl #8
        mov     lr, r7, lsr #24
        orr     r7, lr, r8, lsl #8
        mov     lr, r8, lsr #24
        orr     r8, lr, r9, lsl #8
        mov     lr, r9, lsr #24
        orr     r9, lr, r10, lsl #8
        mov     lr, r10, lsr #24
        orr     r10, lr, r11, lsl #8
        mov     lr, r11, lsr #24
        stmia   r0!, {r1, r4 - r10}
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #8
        mov     lr, r4, lsr #24
        orr     r4, lr, r5, lsl #8
        mov     lr, r5, lsr #24
        orr     r5, lr, r6, lsl #8
        mov     lr, r6, lsr #24
        orr     r6, lr, r7, lsl #8
        mov     lr, r7, lsr #24
        orr     r7, lr, r8, lsl #8
        mov     lr, r8, lsr #24
        orr     r8, lr, r9, lsl #8
        mov     lr, r9, lsr #24
        orr     r9, lr, r10, lsl #8
        mov     lr, r10, lsr #24
        orr     r10, lr, r11, lsl #8
        mov     lr, r11, lsr #24
        stmia   r0!, {r1, r4 - r10}
        sub     r2, r2, #0x40
        b       LAIV_offby3mainloop
LAIV_offby3endofmainloop:
        cmp     r2, #0x80
        bls     LAIV_offby3nopreload
        pld     [r3, #0x80]
LAIV_offby3finishcachelines:
LAIV_offby3nopreload:
        cmp     r2, #0x20
        bmi     LAIV_offby3endoffinishcachelines
        ldmia   r3!, {r4 - r11}
        orr     r1, lr, r4, lsl #8
        mov     lr, r4, lsr #24
        orr     r4, lr, r5, lsl #8
        mov     lr, r5, lsr #24
        orr     r5, lr, r6, lsl #8
        mov     lr, r6, lsr #24
        orr     r6, lr, r7, lsl #8
        mov     lr, r7, lsr #24
        orr     r7, lr, r8, lsl #8
        mov     lr, r8, lsr #24
        orr     r8, lr, r9, lsl #8
        mov     lr, r9, lsr #24
        orr     r9, lr, r10, lsl #8
        mov     lr, r10, lsr #24
        orr     r10, lr, r11, lsl #8
        mov     lr, r11, lsr #24
        stmia   r0!, {r1, r4 - r10}
        sub     r2, r2, #0x20
        b       LAIV_offby3finishcachelines
LAIV_offby3endoffinishcachelines:
        ands    r6, r2, #0x1C
        subeq   r1, r3, #1
        beq     LAIV_finish
        sub     r2, r2, r6
        rsb     r6, r6, #0x20
        add     r12, pc, #0
        add     pc, r12, r6, lsl #2
LAIV_offby3finishload:
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        ldr     r4, [r3], #4
        orr     r12, lr, r4, lsl #8
        str     r12, [r0], #4
        mov     lr, r4, lsr #24
        sub     r1, r3, #1
LAIV_finish:
        rsb     r2, r2, #4
        add     r12, pc, #0
        add     pc, r12, r2, lsl #2
LAIV_finishloadby3:
        ldrb    r3, [r1], #1
        ldrb    r4, [r1], #1
        ldrb    r5, [r1], #1
        ldrb    r6, [r1], #1
        add     r12, pc, #0
        add     pc, r12, r2, lsl #2
LAIV_finishstoreby3:
        strb    r3, [r0], #1
        strb    r4, [r0], #1
        strb    r5, [r0], #1
        strb    r6, [r0], #1
        ldmia   sp!, {r0, r3 - r12, pc}


