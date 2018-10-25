#include <stdio.h>
#include <string.h>

typedef struct {
    int age;
    char name[10];
} Person;

void func(Person *p) {
    p->age = 15;
    char *name = p->name;
    strncpy(name, "New_name", 10);  
    printf("%s\n", name);
}

int main() {
    Person p = { 15, "Jack" };
    func(&p);
}
