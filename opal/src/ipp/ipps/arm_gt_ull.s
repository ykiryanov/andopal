        .text
        .align  4
        .globl  __arm_gt_ull


__arm_gt_ull:
        cmp     r1, r3
        cmpeq   r0, r2
        movls   r0, #0
        bls     LAHH0
        mov     r0, #1
        bx      lr
LAHH0:
        bx      lr


