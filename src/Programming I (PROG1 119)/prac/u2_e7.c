// PROG1 - Week 2. Unit: Basic data types and operators - Exercise 7
// --> Task: Write a program that asks the user to type in a letter
// and then another one. The program must show the distance between
// both letters.
//
// For example, if the user types 'a' and then 'c' the program will
// display the following message:
// The distance between 'a' and 'c' is 2.

#include <stdio.h>

int main()
{
    char letter1, letter2;
    unsigned int letter_distance;

    printf("Insert a letter: ");
    scanf(" %c", &letter1);
    printf("Insert another letter: ");
    scanf(" %c", &letter2);

    letter_distance = letter2 - letter1;

    printf("==> The distance between \'%c\' and \'%c\' is %d \n", letter1, letter2, letter_distance);
    return 0;
}
