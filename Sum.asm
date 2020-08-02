;---------------------------------------------------------
;Author:        Kien Truong
;Program name:  Assignment 4
;Course ID:     CPSC 240
;---------------------------------------------------------
global Sum

segment .data
;empty

segment .bss
;empty

segment .text

Sum:

  mov r13, 0    ;sum
  mov rcx, 0

  forLoop:
    mov r14, [rdi + 8 * rcx]  ;Moves the current element to r14 for adding purposes
    add r13, r14              ;Addition r13 += r14
    inc rcx                   ;Increment the counter to compare with the size of array

    cmp rcx, rsi              ;Condition the exit the loop (counter == total elements)

    jne forLoop

    mov rax, r13              ;Returns the sum to the caller function

ret
