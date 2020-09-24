// PROG1 - Week 2. Unit 2: Basic data types and operators - Exercise 4
// --> Task: Write a program that uses the sizeof() function to calculate
// and displays on the screen the size in bytes for each of the basic
// variable types in C.

#include <stdio.h>

int main()
{
    printf("==> A variable of type short is %d bytes\n",          sizeof(short));
    printf("==> A variable of type unsigned short is %d bytes\n", sizeof(unsigned short));
    printf("==> A variable of type int is %d bytes\n",            sizeof(int));
    printf("==> A variable of type unsigned int is %d bytes\n",   sizeof(unsigned int));
    printf("==> A variable of type long is %d bytes\n",           sizeof(long));
    printf("==> A variable of type unsigned long is %d bytes\n",  sizeof(unsigned long));
    printf("==> A variable of type float is %d bytes\n",          sizeof(float));
    printf("==> A variable of type double is %d bytes\n",         sizeof(double));
    printf("==> A variable of type char is %d byte\n",            sizeof(char));
    
    return 0;
}
