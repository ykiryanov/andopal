        .text
        .align  4
        .globl  _VEC_memcpy
        .globl  __VEC_memcpy
        .globl  _VEC_memset
        .globl  __VEC_memset
        .globl  _VEC_memzero
        .globl  __VEC_memzero


_VEC_memcpy:
__VEC_memcpy:
        b       memcpy
_VEC_memset:
__VEC_memset:
        b       memset
_VEC_memzero:
__VEC_memzero:
        b       memset


