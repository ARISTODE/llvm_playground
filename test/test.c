#include <stdio.h>
#include <string.h>

typedef struct {
    int age;
    char name[10];
} Person;

void func1(char *name) {
    printf("%s", name);
    strncpy(name, "new_name", 10);
}

void func2(int* age) { 
    /* int *tmp_age = age; */
    int **tt = &age;
    int *age1 = *tt;
    /* printf("%d", *tmp_age); */
    /* *age = 20; */
}

void func3(int age) {
    age = age + 1;
    printf("%d\n", age);
}

void func4(Person *p) {
    char* name = p->name; 
    printf("%s\n", name);
}

int func5(int *age, int* age2) {
    *age += 1;
    func2(age);
    return 1;
}

void callFuncP(int(operation)(int*, int*)) {
    int a = 5;
    operation(&a, &a);
}

int main() {
    Person p = { 15, "Jack" };
    func2(&p.age);
    func1(p.name);
    func3(p.age);
    func4(&p);
    callFuncP(func5);
}
