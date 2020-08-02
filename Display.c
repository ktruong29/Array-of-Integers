/**************************************
Author:        Kien Truong
Program name:  Assignment 4
Course ID:     CPSC 240
***************************************/

#include <stdio.h>

void Display(unsigned long myArray[], long arrSize)
{
  for(long index=0; index < arrSize; index++)
  {
    printf("%ld",myArray[index]);
    printf("%s", "\n");
  }
}
