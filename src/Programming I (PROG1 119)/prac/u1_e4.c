// PROG1 - Week 1. Unit 1: Console Input and Output - Exercise 4
// --> Task: Write a program that reads the height of a person in
// cm as well as his weight in Kg and writes his body mass index 
// on the computer screen. You have to use "scanf" and "printf"
// statements to read and write the information.
//
// The body mass index is defined by:
// bmi = 10000 * weight / (height * height)
// where the weight is in Kg and the height in cm.

#include <stdio.h>

int main ()
{
    unsigned int height;
    double weight;

    printf("Insert your height in cm: ");
    scanf("%u", &height);

    printf("Now, insert your weight in Kg: ");
    scanf("%lf", &weight);

    double bmi = 10000 * weight / (height * height);

    printf("\033[32m==> \033[0m\033[1mYour BMI (Body Mass Index) is %.2lf. \033[0m\033[32m<==\033[0m\n", bmi);
    return 0;
}
