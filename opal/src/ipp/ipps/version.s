        .data
        .align  4
        .globl  wince_libversion
        .globl  __wince_creation_date__


wince_libversion:
        .byte   0x6C,0x69,0x62,0x72,0x61,0x72,0x79,0x20,0x76,0x65,0x72,0x73,0x69,0x6F,0x6E,0x3A
        .byte   0x56,0x32,0x2E,0x30,0x2E,0x33,0x32,0x61,0x00,0x00,0x00,0x00
__wince_creation_date__:
        .byte   0x4D,0x61,0x72,0x20,0x20,0x32,0x20,0x32,0x30,0x30,0x36,0x20,0x31,0x35,0x3A,0x35
        .byte   0x35,0x3A,0x33,0x31,0x00

