// PROG1 - Week 1. Unit 1: Console Input and Output - Exercise 5.
// -> Task: Write a program to simulate your final score using the
// continuous evaluation method (see course guide). The grade is 
// based on the results of the five exams and it's obtained applying
// the following equation:
//          C = (P1 + 2*P2 + 2*P3 + 2*P4 + 3*P5) / 10
// where (P1, ..., P5) represent the grade of each exam. The program
// has to ask for the grades of each exam and it will provide the
// final score.

#include <stdio.h>

int main()
{
    double p1_score, p2_score, p3_score, p4_score, p5_score;
    
    printf("==> Partial exam 1 score: ");
    scanf("%lf", &p1_score);

    printf("==> Partial exam 2 score: ");
    scanf("%lf", &p2_score);

    printf("==> Partial exam 3 score: ");
    scanf("%lf", &p3_score);

    printf("==> Partial exam 4 score: ");
    scanf("%lf", &p4_score);

    printf("==> Partial exam 5 score: ");
    scanf("%lf", &p5_score);

    double grade = (p1_score + 2*p2_score + 2*p3_score + 2*p4_score + 3*p5_score)/10;
    printf("\033[32m==>\033[0m \033[1mYour final score is %.2lf\033[0m \033[32m<==\033[0m\n", grade);

    return 0;
}
