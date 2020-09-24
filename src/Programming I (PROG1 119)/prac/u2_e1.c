// PROG1 - Week 2. Unit 2: Basic data types and operators - Exercise 1
// --> Task: Write a program that declares a variable of each type:
// short, unsigned short, long, unsigned long, int, unsigned int, 
// float, double and char. Assign a value to each variable at the
// time of declaration. The program should display the content of
// each variable on the screen. Use three different formats that
// exist for float and double type variables.

#include <stdio.h>

int main()
{
    short short_var           = -14;
    unsigned short ushort_var = 14;
    long long_var             = -124687;
    unsigned long ulong_var   = 124687;
    int int_var               = -69;
    unsigned int uint_var     = 42;
    float float_var           = -67.234;
    double double_var         = 0.235;
    char char_var             = 'a';

    printf("\033[32m==>\033[0m short variable: \033[1m%hi\033[0m\n",                             short_var);
    printf("\033[32m==>\033[0m unsigned short variable: \033[1m%hu\033[0m\n",                    ushort_var);
    printf("\033[32m==>\033[0m long variable: \033[1m%ld\033[0m\n",                              long_var);
    printf("\033[32m==>\033[0m unsigned long variable: \033[1m%lu\033[0m\n",                     ulong_var);
    printf("\033[32m==>\033[0m int variable: \033[1m%d\033[0m\n",                                int_var);
    printf("\033[32m==>\033[0m unsigned int  variable: \033[1m%u\033[0m\n",                      uint_var);
    printf("\033[32m==>\033[0m float variable (digital notation): \033[1m%f\033[0m\n",           float_var);
    printf("\033[32m==>\033[0m float variable (scientific notation g): \033[1m%g\033[0m\n",    float_var);
    printf("\033[32m==>\033[0m float variable (scientific notation e): \033[1m%e\033[0m\n",    float_var);
    printf("\033[32m==>\033[0m double variable (digital notation): \033[1m%lf\033[0m\n",       double_var);
    printf("\033[32m==>\033[0m double variable (scientific notation lg): \033[1m%lg\033[0m\n", double_var);
    printf("\033[32m==>\033[0m double variable (scientific notation le): \033[1m%le\033[0m\n", double_var);
    printf("\033[32m==>\033[0m char variable: \033[1m%c\033[0m\n",                               char_var);
    return 0;
}
