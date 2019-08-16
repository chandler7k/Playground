#include <iostream>
using namespace std;
int main() {

    int arr[] = {1,2,3};
    int *p = arr;
    cout << p[1] << endl;
    cout << p << endl;
    cout << *p << endl;
    cout << p[-1] << endl;
    cout << p[2] << endl;
    return 0;
}