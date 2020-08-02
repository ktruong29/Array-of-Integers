/**************************************
Author:        Kien Truong
Program name:  Assignment 4
Course ID:     CPSC 240
***************************************/

#include<stdio.h>
#include<limits>
#include<ios>
#include<iostream>
extern "C" long FillArray(unsigned long *myArray, long size);
using namespace std;

long FillArray(unsigned long *myArray, long size)
{
  long index;
  long count;

  index = 0;
  count = 0;

  while(index < size && !(cin.eof()))
  {
    cin >> myArray[index];
    index++;
    count++;
  }
  //This will clear the input buffer and reset fail state when user hits CtrlD
  cin.ignore(numeric_limits<streamsize>::max(), '\n');
  cin.clear();

  return count-1;
}
