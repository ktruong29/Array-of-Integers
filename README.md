# An Array of Numbers
---
The purpose of this program is to know how to use array in X86 and understand
how parameters are passed from assembly code to C/C++/X86 functions

This program will do the following:
* Input a sequence of long integers separated by white space
* Stops iteration when Ctrl-D is used
* Stores the sequence of long integers by calling FillArray function written in C++
* Receives the total number of elements inputted by the user
* Displays the values inputted by calling Display function written in C
* Computes and displays the sum of integers by calling Sum function written in X86
* Run the loop again if user enters "y" when get prompted
* Exit the loop if user enters "n" when get prompted
* The sum will be returned to the caller program
* The main program will convert the sum to hexadecimal and output it on the terminal

This program has five different source files:
* The main module (assignment4.c): outputs the title of the program and the
person who made this program.
* An X86 assembly file (assignment4.asm), which is a function written in X86 language and
is called from the driver program. This program declares an empty array of quad-word
integers in the bss segment. This module in X86 calls the following functions:
  * Fill module (C++): get data from the user's keyboard
  * Display module (C): shows the user the data that the user has just inputted
  * Sum module (X86): adds together all the numbers in the array and passes the total
  back to X86 assembly file.
* A bash script is used to compile the two previously mentioned files, link
them to create one executable file, and lastly load that newly created
executable file.

## Prerequisites
---
* A virtual machine
* Install g++ and nasm

## Instructions on how to run the program
---
Choose one of the following:
1. chmod +x run.sh then ./run.sh              
2. sh run.sh
