# Systick configuration registers
.equ systick_csr,   0xE000E010
.equ systick_rvr,   0xE000E014
.equ systick_cvr,   0xE000E018
.equ systick_calib, 0xE000E01c
.equ timeout,       0x00FFFFFF

.section .vectors
vector_table:
    .word 0x20001000
    .word reset_handler
    .org 0x3C
    .word systick_handler
    .zero 400

    .section .text
    .align 1
    .type reset_handler, %function

reset_handler:             
    mov r5, #0x0

    #code to run the sys timer
    ldr r0, =systick_csr
    ldr r1, =systick_rvr
    ldr r2, =systick_cvr
    ldr r3, =timeout
    str r3, [r1]
    mov r3 , #0x0
    str r3, [r2]
    mov r3, #0x7
    str r3, [r0]
    
    b .

    .section .text
    .align 1
    .type systick_handler, %function

systick_handler:        
    add r5,r5,#0x1
break_here:
    bx lr