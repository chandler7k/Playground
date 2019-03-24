#include <stdio.h>

void (^outside)(void) = ^{
    printf("hello block!\n");
};

int main(){
    outside();
    return 0;
}