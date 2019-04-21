#include <stdio.h>
typedef struct Person {
    int age;
} person_t;
int b = 10;
int* a = &b;

int f(person_t* p) {
    p->age = *a;
    return p->age;
}

int main() {
    person_t p = {10};
    person_t* pt = &p;
    f(pt);
    return 0;
}
