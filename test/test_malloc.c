#include <stdio.h>
#include <stdlib.h>

struct Person {
    int age;
    int height; 
};


int main() {
    struct Person* p = (struct Person*)malloc(sizeof(struct Person));
    p->age = 10; 
    p->height = 10;
    return 0;
}
