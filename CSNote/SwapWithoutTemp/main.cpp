#include <iostream>
using namespace std;

void swapWithExOR(int &a, int &b)
{
    a = a ^ b;
    b = b ^ a;
    a = a ^ b;
}

void swapWithPointer(int *a, int *b)
{
    *a = *a + *b;
    *b = *a - *b;
    *a = *a - *b;
}

int main() {
    int a = 2;
    int b = 6;
    swapWithExOR(a,b);
    cout << a << " and " << b << endl;

    int c = 3;
    int d = 4;
    swapWithPointer(&c,&d);
    cout << c << " " << d;
    return 0;
}