        .text
        .align  4
        .globl  _ippsVADGetEnergyLevel_AMRWB_16s


_ippsVADGetEnergyLevel_AMRWB_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDGU0
        cmp     r1, #0
        beq     LDGU0
        add     r0, r0, #0x94
        mov     r2, #0xC
        bl      _ippsCopy_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LDGU0:
        mvn     r0, #7
        ldr     pc, [sp], #4


