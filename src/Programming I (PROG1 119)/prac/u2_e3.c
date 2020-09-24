// PROG1 - Week 2. Unit 2: Basic data types and operators - Exercise 4
// --> Task: Write a program that declares three variables of type
// short. Assign the value 30.000 to two of them. Add these two 
// variables and save the result in the third one. The program will
// show the value of the third variable on the screen.

#include <stdio.h>

int main()
{
    short num1 = 30000, num2 = 30000, num3;
    num3 = num1 + num2;
    printf("The result of the sum is %hi\n", num3);
    return 0;
}
