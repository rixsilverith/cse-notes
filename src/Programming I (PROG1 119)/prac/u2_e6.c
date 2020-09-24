// PROG1 - Week 2. Unit 2: Basic data types and operators - Exercise 6
// --> Task: Write a program that asks for a character and then for an
// integer. The program should write the ASCII numeric code of the typed
// character and the character that is obtained by adding the integer
// to the typed character as well as the ASCII numeric code of this
// new character.

#include <stdio.h>

int main()
{
    char character, new_char;
    int number;

    printf("Gimme a character: ");
    scanf(" %c", &character);
    printf("Gimme a integer: ");
    scanf("%d", &number);

    new_char = character + number;
    
    printf("==> ASCII numeric code of the typed character is %hhu\n", character);
    printf("==> Character that is obtained by adding the integer to the typed character is %c\n", new_char);
    printf("==> ASCII numeric code of this new character is %hhu\n", new_char);
    return 0;
}
