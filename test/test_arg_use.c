#include<stdio.h>
#include<string.h>

typedef struct clothes {
    char color[10];
    float height;   
} Clothes;

typedef struct person {
    int age;
    char name[10];
    Clothes *clothes; 
} Person;


int getAge(Person *p) {
    return p->age;
}

void changeAge(Person *p) {
    p->age = 50; 
}

void printAge(Person *p) {
    //int age = getAge(p);
    int age = p->age; 
    char *name = p->name;
    char *a = "hi";
    char *b = a + 1;
    //printf("Age is %d, name is %s\n", age, name);
    changeAge(p);
    //printf("Changed age is %d\n", p->age);
}


void changeAgePtr(int *age) {
   *age = 100;
}

void agePtr(Person *p) {
    int *age = &(p->age);
    changeAgePtr(age);    
    printf("Now age is %d\n", *age);
}


int main() {
    Clothes c = {"red", 3.40f};
    Person p = { 20, "Jack", &c };

    printAge(&p);
    return 0;    
}
