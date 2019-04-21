#include <stdio.h>
#include <stdlib.h>

typedef struct Clothes {
    char color[10];
    int length;
} Clothes;

typedef struct Person {
    int age;
    char name[10];
    Clothes *s;
} Person;

void f(Person *p1) {
    char *name = p1->name;
    char *color = p1->s->color;
    printf("%s is wearing %s today", name, color);
}

int main() {
    Clothes c1 = {"red"};
    struct Person person = {10, "Jack", &c1};
    f(&person);  
    return 0;
}
