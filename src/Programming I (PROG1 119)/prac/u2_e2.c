// PROG1 - Week 2. Unit 2: Basic data types and operators - Exercise 2
// --> Task: Modify the previous program so that it does not initialize
// the value of the variables when declaring them. The program must
// request and read by keyboard the value of each variable.

#include <stdio.h>

int main()
{
    short short_var;
    unsigned short ushort_var;
    long long_var;
    unsigned long ulong_var;
    int int_var;
    unsigned int uint_var;
    float float_var;
    double double_var;
    char char_var;

    printf("\033[32m==>\033[0m short variable: ");
    scanf("%hi", &short_var);
    printf("\033[32m==>\033[0m unsigned short variable: ");
    scanf("%hu", &ushort_var);
    printf("\033[32m==>\033[0m long variable: ");
    scanf("%ld", &long_var);
    printf("\033[32m==>\033[0m unsigned long variable: ");
    scanf("%lu", &ulong_var);
    printf("\033[32m==>\033[0m int variable: ");
    scanf("%d", &int_var);
    printf("\033[32m==>\033[0m unsigned int variable: ");
    scanf("%u", &uint_var);
    printf("\033[32m==>\033[0m float variable (digital notation): ");
    scanf("%f", &float_var);
    printf("\033[32m==>\033[0m double variable (digital notation): ");
    scanf("%lf", &double_var);
    printf("\033[32m==>\033[0m char variable: ");
    scanf(" %c", &char_var);

    printf("--------------------------------------------------------------\n");
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
