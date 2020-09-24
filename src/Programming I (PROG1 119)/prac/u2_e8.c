// PROG1 - Week 2. Unit 2: Basic data types and operators - Exercise 8
// --> Task: Write a program that asks for your age and calculates the
// lower and upper value of the cardiovascular range.
//
// The lower vakue is 65% of the maximum number of beats per minute for
// your age. The upper is 85% of that maximum. The maximum number of 
// beats is equal to 220 minus your age.
//
// For example, for a person of 25 years, the program output would be
// (notice that decimals are not shown): 
// Your cardiovascular range is between 127 and 166.

#include <stdio.h>

int main()
{
    unsigned int age;
    double lower_bpm, upper_bpm, max_bpm;

    printf("How old are you? ");
    scanf("%d", &age);

    max_bpm = 220 - age;
    lower_bpm = 0.65 * max_bpm;
    upper_bpm = 0.85 * max_bpm;

    printf("==> Your cardiovascular range is between %.0lf and %.0lf\n", lower_bpm, upper_bpm);
    return 0;
}
