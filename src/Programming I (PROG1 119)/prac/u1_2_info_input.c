// Week 1. UNIT 1: Console Input and Output.
// 1.2 Information input (scanf).
// The "scanf" function reads information from the standart input (keyboard)
// and stores it in a variable. The following program reads a follar amount,
// converts it to euros and displays the result.

#include<stdio.h>

int main()
{
    double eur;
    // A variable like "dol" is the name assigned in the program to a specific 
    // memory region to store information. There are different types of 
    // built-in variables in C which will be reviewed later.
    double dol;

    printf("Write the amount in dollars: ");
    // The format "%lf" is used in the scanf function corresponds to the format
    // associated to the "double" type.
    scanf("%lf", &dol);
    eur = dol * 0.906;

    printf("%lf dollars are %.2lf euros.\n", dol, eur);

    return 0;
}
