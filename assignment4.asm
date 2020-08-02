;---------------------------------------------------------
;Author:        Kien Truong
;Program name:  Assignment 4
;Course ID:     CPSC 240
;---------------------------------------------------------

extern printf         ;External C++ function for writing to standard output device

extern scanf

extern getchar

extern clearerr

extern stdin

extern FillArray

extern Display

extern Sum

global array_of_ints

segment .data

initialMess   db "We will compute the sum for you using only integers.", 10,0

promptMess    db "Are you ready? Press 'c' to continue or 'x' to exit. ",0

inputMess     db "Enter a sequence of long integers separated by white space."
              db " After the last input press Control+D.",0

numCountMess  db "The number of numbers entered was %ld.", 10, 10, 0

numInputMess  db "The number of numbers inputted: ", 10, 0

sumMess       db "The sum was %ld.", 10, 10, 0

loopAgainMess db "Are these values correct (y or n)?",0

goodbyeMess1  db "Kien Truong hopes you liked your sum. Please come again",10,0

goodbyeMess2  db "This software will return the last sum to the driver program."
              db " Bye", 10, 0

stringFormat db "%s", 0

intFormat    db "%ld", 0

segment .bss
integersArr resq 20   ;declaring an array that holds 20 elements (qword)

segment .text
array_of_ints:

  push rbp
  mov rbp, rsp
  push rbx
  push rcx
  push rdx
  push rdi
  push rsi
  push r8
  push r9
  push r10
  push r11
  push r12
  push r13
  push r14
  push r15

  ;===This will execute when we want to run the loop again====

  ;=====Show the initial message=======
  mov qword  rax, 0                         ;No floating points
  mov        rdi, stringFormat              ;"%s"
  mov        rsi, initialMess               ;"We will compute the sum for you using only integers."
  call       printf                         ;output

  ;=====Show the prompt========
  mov qword rax, 0                          ;No floating points
  mov       rdi, stringFormat               ;"%s"
  mov       rsi, promptMess                 ;"Are you ready? Press 'c' to continue or 'x' to exit. "
  call      printf                          ;output

  ;push qword 0  ;;;;;;
  mov  qword rax, 0                         ;No floating point
  call getchar                              ;get character input from user

  ;=====Comparing input char with letter c ASCII value====
  cmp rax, 99                               ;ASCII value of 'c'

  ;=====This will be executed if the input != c======
  jne exitArray

  loop_again:
  ;=====This will execute when the char input is c=====
  ;=====Show the prompt========
  mov qword rax, 0                         ;No floating points
  mov       rdi, stringFormat              ;"%s"
  mov       rsi, inputMess                 ;"Enter a sequence of long integers separated by white space."
                                           ;" After the last input press Control+D."
  call      printf                         ;output

  ;====This will pass the array and the size to the Fill function for input=====
  mov rax, 0                               ;No floating point
  mov rdi, integersArr                     ;Moves integer array to the first parameter in FillArray
  mov rsi, 20                              ;Passes the size to the second parameter in FillArray
  call     FillArray                       ;Calls FillArray function

  ;====This will store the value returned by the Fill function====
  mov r15, rax                             ;total elements in the array

  ;====Clear the fail state====
  mov rax, 0
  mov rdi, [stdin]
  call     clearerr

  ;===This will output the number of ints inputted======
  mov qword rax, 0                       ;No floating points
  mov rdi, numCountMess                  ;"The number of numbers entered was %ld."
  mov rsi, r15                           ;counter
  call     printf                        ;output

  mov qword rax, 0                       ;No floating points
  mov rdi, stringFormat                  ;"%s"
  mov rsi, numInputMess                  ;"The number of numbers inputted: "
  call     printf                        ;output

  ;====This will call the Display function to output all ints inputted=====
  mov qword rax, 0                       ;No floating points
  mov rdi, integersArr                   ;Passes the array to the first parameter in Display
  mov rsi, r15                           ;Passes the total array elements to the second parameter in Display
  call Display                           ;Calls Display function

  ;====For debugging====
  ;mov rax, 0
  ;mov rdi, [stdin]
  ;call     clearerr

  ctrlD:
  ;===Prompt for looping again======
  mov qword rax, 0                         ;No floating points
  mov       rdi, stringFormat              ;"%s"
  mov       rsi, loopAgainMess             ;"Are these values correct (y or n)?"
  call      printf                         ;output

  ;===Getting char input===
  ;push qword 0
  mov  qword rax, 0                       ;No floating points
  call getchar                            ;Gets input from user

  cmp rax, 121                            ;comparing against char 'y'

  jne loop_again

  ;===Helps debug when user hits only CtrlD (empty array)===
  cmp r15, 0

  je exitArray

  mov rax, 0                              ;No floating points
  mov rdi, integersArr                    ;Passes the array to the first parameter in Sum
  mov rsi, r15                            ;Passes number of elements to the second parameter in Sum
  call Sum                                ;Calls function Sum

  mov r12, rax                            ;Copies the sum found above to r12

  mov qword rax, 0                         ;No floating points
  mov       rdi, sumMess                   ;"The sum was %ld."
  mov       rsi, r12                       ;sum
  call      printf                         ;output

  mov rax, r12
  jmp jump
  exitArray:
  mov rax, 0

  jump:

  pop r15
  pop r14
  pop r13
  pop r12
  pop r11
  pop r10
  pop r9
  pop r8
  pop rsi
  pop rdi
  pop rdx
  pop rcx
  pop rbx
  pop rbp

  ret
