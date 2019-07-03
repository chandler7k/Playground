#include <iostream>
using namespace std;
int main() {
    int sum = 0, val = 1;
    while (val <=10){
        sum += val;
        ++val;
    }
    val = 50,sum = 0;
    while (val <=100){
        sum += val;
        ++val;
    }

    val = 10;
    while (val >= 0){
        cout << val-- <<endl;
    }
    cout << "sum of 1 to 10 is " << sum++ << endl;

    cout << "======" << endl;

    int value = 0;
    sum = 0;

    while (cin >> value){
        sum += value;
    }
    cout << "value is :" << sum << endl;
    return 0;
}