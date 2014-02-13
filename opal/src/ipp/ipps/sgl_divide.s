        .text
        .align  4
        .globl  __aeabi_fdiv
        .globl  __divsf3


LAFH_sgl_recip_table:
        .long   0x820fe040
        .long   0x860fa233
        .long   0x890f6604
        .long   0x8d0f2b9d
        .long   0x900ef2eb
        .long   0x930ebbdb
        .long   0x970e865b
        .long   0x990e525a
        .long   0x9c0e1fc8
        .long   0x9f0dee96
        .long   0xa20dbeb6
        .long   0xa40d901b
        .long   0xa60d62b8
        .long   0xa90d3681
        .long   0xab0d0b6a
        .long   0xad0ce169
        .long   0xaf0cb872
        .long   0xb10c907e
        .long   0xb30c6981
        .long   0xb50c4373
        .long   0xb70c1e4c
        .long   0xb80bfa03
        .long   0xba0bd691
        .long   0xbc0bb3ee
        .long   0xbd0b9214
        .long   0xbf0b70fc
        .long   0xc00b509e
        .long   0xc10b30f6
        .long   0xc30b11fd
        .long   0xc40af3ae
        .long   0xc50ad603
        .long   0xc70ab8f7
        .long   0xc80a9c85
        .long   0xc90a80a8
        .long   0xca0a655c
        .long   0xcb0a4a9d
        .long   0xcc0a3066
        .long   0xcd0a16b3
        .long   0xce09fd81
        .long   0xcf09e4cb
        .long   0xd009cc8e
        .long   0xd109b4c7
        .long   0xd2099d72
        .long   0xd309868d
        .long   0xd3097013
        .long   0xd4095a02
        .long   0xd5094458
        .long   0xd6092f11
        .long   0xd7091a2b
        .long   0xd70905a4
        .long   0xd808f178
        .long   0xd908dda5
        .long   0xd908ca2a
        .long   0xda08b703
        .long   0xdb08a430
        .long   0xdb0891ac
        .long   0xdc087f78
        .long   0xdc086d90
        .long   0xdd085bf3
        .long   0xde084aa0
        .long   0xde083993
        .long   0xdf0828cc
        .long   0xdf081849
        .long   0xe0080808
__aeabi_fdiv:
        sub     r12, pc, #0x42, 30
__divsf3:
        sub     r12, pc, #0x43, 30
        stmdb   sp!, {r4, r5}
        mov     r2, #0xFF, 30
        ands    r5, r2, r1, lsr #21
        teqne   r2, r5
        andnes  r4, r2, r0, lsr #21
        teqne   r2, r4
        beq     LAFH_SGL_DIV_SPECIAL
LAFH_RETURN_MAIN_A:
        and     r3, r1, #0x7E, 16
        ldr     r12, [r12, +r3, lsr #15]
        teq     r0, r1
        orrmi   r4, r4, #1
        bic     r1, r1, #0xFF, 8
        mov     r3, r1, lsl #15
        movs    r3, r3, lsr #25
        sbc     r3, r3, #0x3F
        mov     r2, r12, asr #24
        bic     r12, r12, #0xFF, 8
        mla     r2, r3, r2, r12
        orr     r1, r1, #2, 10
        umull   r3, r12, r1, r2
        sub     r4, r4, r5
        bic     r0, r0, #0xFF, 8
        orr     r0, r0, #2, 10
        smull   r12, r5, r3, r2
        cmp     r0, r1
        subcc   r4, r4, #4
        movcc   r0, r0, lsl #3
        movcss  r0, r0, lsl #2
        rsc     r2, r5, r2, lsl #11
        smull   r12, r5, r2, r0
        add     r4, r4, #0x7E, 30
        rsb     r0, r1, r0, lsl #22
        mul     r3, r5, r1
        cmp     r4, #0xFD, 30
        bcs     LAFH_SPECIAL_EXPONENT
        subs    r0, r3, r0
        addmi   r5, r5, #1
LAFH_RETURN_MAIN_PATH:
        movs    r4, r4, rrx
        movs    r0, r5, rrx
        adc     r0, r0, r4, lsl #22
        ldmia   sp!, {r4, r5}
        bx      lr
LAFH_B_INF:
        cmp     r4, r7
        moveq   r0, #0xFF, 8
        addeq   r0, r0, #3, 10
        movne   r0, r2
        ldmia   sp!, {r6, r7}
        ldmia   sp!, {r4, r5}
        bx      lr
LAFH_B_ZERO:
        cmp     r4, #0
        moveq   r0, #0xFF, 8
        addeq   r0, r0, #3, 10
        movne   r0, r2
        orrne   r0, r0, #0x7F, 8
        orrne   r0, r0, #2, 10
LAFH_RETURN:
        ldmia   sp!, {r6, r7}
        ldmia   sp!, {r4, r5}
        bx      lr
LAFH_SGL_DIV_SPECIAL_B:
        cmp     r4, r7
        orrhi   r0, r0, #1, 10
        bhi     LAFH_RETURN
        cmp     r5, r7
        movhi   r0, r1
        orrhi   r0, r0, #1, 10
        bhi     LAFH_RETURN
        beq     LAFH_B_INF
        cmp     r5, #0
        beq     LAFH_B_ZERO
LAFH_norm_b:
        sub     r3, r3, #1
        mov     r5, r5, lsl #1
        cmp     r5, #2, 10
        bcc     LAFH_norm_b
        mov     r1, r5
        tst     r6, r4, lsr #23
        teqne   r6, r4, lsr #23
        beq     LAFH_SGL_DIV_SPECIAL_A
        mov     r6, #0xFF, 30
        and     r5, r6, r1, lsr #21
        and     r4, r6, r0, lsr #21
        sub     r4, r4, r3, lsl #2
        orr     r4, r4, r2, lsr #31
        bic     r0, r0, #2, 2
        ldmia   sp!, {r6, r7}
        b       LAFH_RETURN_MAIN_A
LAFH_SGL_DIV_SPECIAL:
        stmdb   sp!, {r6, r7}
        mov     r6, #0xFF
        mov     r3, #0
        eor     r2, r0, r1
        and     r2, r2, #2, 2
        bic     r4, r0, #2, 2
        bic     r5, r1, #2, 2
        mov     r7, r6, lsl #23
        tst     r6, r5, lsr #23
        teqne   r6, r5, lsr #23
        beq     LAFH_SGL_DIV_SPECIAL_B
LAFH_SGL_DIV_SPECIAL_A:
        cmp     r4, #0
        moveq   r0, r2
        beq     LAFH_RETURN
        cmp     r4, r7
        moveq   r0, r4
        orrhi   r0, r0, #1, 10
        orreq   r0, r0, r2
        bcs     LAFH_RETURN
LAFH_norm_a:
        add     r3, r3, #1
        mov     r4, r4, lsl #1
        cmp     r4, #2, 10
        bcc     LAFH_norm_a
        mov     r0, r4
        mov     r6, #0xFF, 30
        and     r5, r6, r1, lsr #21
        and     r4, r6, r0, lsr #21
        sub     r4, r4, r3, lsl #2
        orr     r4, r4, r2, lsr #31
        bic     r1, r1, #2, 2
        ldmia   sp!, {r6, r7}
        b       LAFH_RETURN_MAIN_A
LAFH_SPECIAL_EXPONENT:
        subs    r0, r3, r0
        addmi   r5, r5, #1
        mov     r2, r4, lsl #31
        mov     r4, r4, asr #2
        cmp     r4, #0xFD
        bge     LAFH_SGL_OVERFLOW_DIV
        stmdb   sp!, {r6, r7}
        cmp     r0, #0
        subcc   r0, r0, r1
        mov     r3, #0
        sub     r4, r3, r4
        cmp     r4, #0x1A
        movhi   r5, #0
        mov     r3, #1
        mov     r12, r3, lsl r4
        sub     r12, r12, r3
        and     r12, r5, r12
        mov     r5, r5, lsr r4
        orr     r7, r0, r12
        and     r6, r5, #1
        mov     r5, r5, lsr #1
        and     r3, r5, #1
        orr     r3, r7, r3
        mov     r4, #0
        cmp     r3, #0
        movne   r4, #1
        and     r4, r4, r6
        cmp     r4, #0
        addne   r5, r5, #1
        orr     r0, r5, r2
        ldmia   sp!, {r6, r7}
        ldmia   sp!, {r4, r5}
        bx      lr
LAFH_SGL_OVERFLOW_DIV:
        cmp     r4, #0xFE
        bcs     LAFH_SGL_OF_DIV
        movs    r0, r5, lsr #1
        adc     r0, r0, #0
        cmp     r0, #1, 8
        bcs     LAFH_SGL_OF_DIV
        add     r0, r0, r4, lsl #23
        orr     r0, r2, r0
        ldmia   sp!, {r4, r5}
        bx      lr
LAFH_SGL_OF_DIV:
        mov     r0, #0x7F, 8
        add     r0, r0, #2, 10
        orr     r0, r2, r0
        ldmia   sp!, {r4, r5}
        bx      lr


