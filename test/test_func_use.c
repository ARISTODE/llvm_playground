#include <stdio.h>

int f (int a) {
    return a;
}

int main() {
    f(5);
    int (*ff)(int) = &f;
    (*ff)(8);
    return 0;
}
