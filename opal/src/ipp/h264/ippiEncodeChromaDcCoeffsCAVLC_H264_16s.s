        .text
        .align  4
        .globl  _ippiEncodeChromaDcCoeffsCAVLC_H264_16s


_ippiEncodeChromaDcCoeffsCAVLC_H264_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r4, [sp, #0x38]
        ldr     lr, [sp, #0x30]
        ldr     r12, [sp, #0x34]
        cmp     r0, #0
        str     r4, [sp, #4]
        beq     LLCP19
        cmp     r1, #0
        beq     LLCP19
        cmp     r2, #0
        beq     LLCP19
        cmp     r3, #0
        beq     LLCP19
        cmp     lr, #0
        beq     LLCP19
        cmp     r12, #0
        beq     LLCP19
        ldr     r4, [sp, #4]
        cmp     r4, #0
        beq     LLCP19
        ldrsh   r4, [r0, #6]
        mov     r8, #0
        mov     r5, #1
        cmp     r4, #0
        bne     LLCP0
        mov     r7, r8
        mov     r6, r7
        mov     r4, r5
        b       LLCP2
LLCP0:
        cmp     r4, #1
        beq     LLCP18
        cmn     r4, #1
        beq     LLCP18
        mov     r7, r8
        strh    r4, [r12]
        mov     r6, r7
        mov     r4, r6
LLCP1:
        mov     r5, r8
        mov     r8, #1
LLCP2:
        ldrsh   r9, [r0, #4]
        cmp     r9, #0
        addeq   r10, r5, #1
        moveq   r5, #0
        beq     LLCP6
        cmp     r4, #0
        beq     LLCP3
        cmp     r9, #1
        beq     LLCP15
        cmn     r9, #1
        beq     LLCP15
LLCP3:
        rsb     r4, r7, #0
        mov     r10, r8, lsl #1
        add     r4, r12, r4, lsl #1
        strh    r9, [r4, +r10]
        mov     r4, #0
LLCP4:
        cmp     r8, #0
        mov     r10, #0
        moveq   r5, r10
        beq     LLCP5
        ldr     r9, [sp, #4]
        add     r9, r8, r9
        strb    r5, [r9, #-1]
LLCP5:
        add     r8, r8, #1
LLCP6:
        ldrsh   r9, [r0, #2]
        cmp     r9, #0
        str     r9, [sp]
        addeq   r9, r10, #1
        beq     LLCP10
        cmp     r4, #0
        beq     LLCP7
        ldr     r4, [sp]
        cmp     r4, #1
        beq     LLCP16
        ldr     r4, [sp]
        cmn     r4, #1
        beq     LLCP16
LLCP7:
        mov     r4, r8, lsl #1
        str     r4, [sp, #8]
        rsb     r9, r7, #0
        ldr     r11, [sp, #8]
        add     r4, r12, r9, lsl #1
        ldr     r9, [sp]
        strh    r9, [r4, +r11]
        mov     r4, #0
LLCP8:
        cmp     r8, #0
        beq     LLCP9
        ldr     r9, [sp, #4]
        add     r5, r5, r10
        and     r5, r5, #0xFF
        add     r9, r8, r9
        strb    r10, [r9, #-1]
LLCP9:
        add     r8, r8, #1
        mov     r9, #0
LLCP10:
        ldrsh   r0, [r0]
        cmp     r0, #0
        addeq   r9, r9, #1
        beq     LLCP14
        cmp     r4, #0
        beq     LLCP11
        cmp     r0, #1
        beq     LLCP17
        cmn     r0, #1
        beq     LLCP17
LLCP11:
        rsb     r4, r7, #0
        add     r12, r12, r4, lsl #1
        mov     r4, r8, lsl #1
        strh    r0, [r12, +r4]
LLCP12:
        cmp     r8, #0
        beq     LLCP13
        ldr     r0, [sp, #4]
        add     r0, r8, r0
        strb    r9, [r0, #-1]
        add     r9, r5, r9
        and     r5, r9, #0xFF
LLCP13:
        add     r8, r8, #1
        mov     r9, #0
LLCP14:
        strb    r7, [r1]
        strb    r6, [r2]
        strb    r8, [r3]
        add     r9, r5, r9
        mov     r0, #0
        strb    r9, [lr]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LLCP15:
        cmn     r9, #1
        mov     r4, #0
        mov     r10, r4
        mov     r9, #1
        moveq   r10, r9
        add     r7, r7, #1
        cmp     r7, #3
        orr     r6, r10, r6, lsl #1
        and     r6, r6, #0xFF
        movlt   r4, r9
        b       LLCP4
LLCP16:
        ldr     r4, [sp]
        add     r7, r7, #1
        mov     r9, #1
        cmn     r4, #1
        mov     r4, #0
        moveq   r4, r9
        orr     r6, r4, r6, lsl #1
        mov     r4, #0
        cmp     r7, #3
        and     r6, r6, #0xFF
        movlt   r4, r9
        b       LLCP8
LLCP17:
        cmn     r0, #1
        movne   r0, #0
        moveq   r0, #1
        orr     r6, r0, r6, lsl #1
        add     r7, r7, #1
        and     r6, r6, #0xFF
        b       LLCP12
LLCP18:
        cmn     r4, #1
        movne   r6, #0
        mov     r7, r5
        moveq   r6, #1
        mov     r4, r7
        b       LLCP1
LLCP19:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


