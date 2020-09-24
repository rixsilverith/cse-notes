#include<stdio.h>

int main()
{
    printf("Hello world!\n");

    // We can also output info this way:
    fprintf(stdout, "Hello world, with fprintf.\n");

    // We can also output color.
    printf("\033[31mThis is red text.\n");
    printf("\033[32mThis is green text.\n");
    printf("\033[33mThis is yellow text.\n");
    printf("\033[34mThis is blue text.\n");
    printf("\033[37mThis is white text.\n");
    printf("\033[0mThis text is reseted.\n");

    printf("\033[1m This text is in bold.\n");
    printf("\033[3m This text is in italics.\n");
    printf("\033[4m This text is underlined.\n");
    printf("\033[9m This text is strikethrough.\n");
    
    printf("\033[0m This is \033[4m NOT \033[0m very important.\n");
    return 0;
}
