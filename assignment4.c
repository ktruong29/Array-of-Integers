
/**************************************
Author:        Kien Truong
Program name:  Assignment 4
Course ID:     CPSC 240
***************************************/

#include <stdio.h>
long int array_of_ints();

int main()
{
  long int return_code = 99;

  printf("%s", "Welcome to an array of numbers\n");
  printf("%s", "Brought to you by Kien Truong\n\n");
  return_code = array_of_ints();

  printf("%s%ld%s", "\nThis is the C program responding.The decimal number that we"
         " received is ", return_code, ". \n");

  if(return_code == 0)
  {
    printf("%s","Hexadecimal of the number we received is: 0x000000000000"
           ". Have a nice day.\nThe C program will return a zero to the operating system.\n");
  }
  else if(return_code < 0)
  {
    printf("%s%lX%s","Hexadecimal of the number we received is: 0x",return_code,
           ". Have a nice day.\nThe C program will return a zero to the operating system.\n");
  }
  else
  {
      char ReversedDigits[16];
      long int i = 0;
      while(return_code > 0)
      {
        long int remain = return_code % 16;

        if(remain < 10)
        {
          ReversedDigits[i] = '0' + remain;
        }
        else
        {
          ReversedDigits[i] = 'A' + (remain - 10);
        }
        return_code = return_code / 16;
        i++;
      }

      while(i < 15)
      {
        ReversedDigits[i] = '0';
        i++;
      }

      printf("Hexadecimal of the number we received is: 0x");
      while(i--)
      {
        printf("%c", ReversedDigits[i]);
      }
      printf("%s", " Have a nice day.\nThe C program will return a zero to the operating system.\n");
  }

  return 0;
}
