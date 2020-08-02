#!/bin/bash


#Author: Kien Truong
#Program name: Assignment
#Course ID: CPSC 240

rm *.o
rm *.out

echo "This is program <Demonstrate Integer Array>"

echo "Assemble the module assignment4.asm"
nasm -f elf64 -l assignment4.lis -o assign4.o assignment4.asm

echo "Compile the C module assignment4.c"
gcc -c -m64 -Wall -std=c11 -o assignment4.o assignment4.c -fno-pie -no-pie

echo "Compile the C++ module FillArray.cpp"
g++ -c -m64 -Wall -std=c++14 -o FillArray.o FillArray.cpp -fno-pie -no-pie

echo "Compile the C module Display.c"
gcc -c -m64 -Wall -std=c11 -o Display.o Display.c -fno-pie -no-pie

echo "Assemble the module Sum.asm"
nasm -f elf64 -l Sum.lis -o Sum.o Sum.asm

echo "Link the object files already created"
g++ -m64 -o assignment4.out assignment4.o assign4.o FillArray.o Display.o Sum.o -fno-pie -no-pie -std=c++14

echo "The program will run"
./assignment4.out

echo "The bash script file is now closing."
