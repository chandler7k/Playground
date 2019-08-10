#include <iostream>
#include <cstring>
#include <vector>
using namespace std;
int main() {

    //char init string & string init char
    string s("hello world");
    const char *str = s.c_str();

    // arr initialize vector
    int int_arr[] = {1,2,3,4,5};
    vector<int> ivec(begin(int_arr),end(int_arr));
    vector<int> subVec(int_arr + 1, int_arr + 4);
    int arr[10];
    cout << arr[0] << endl; // undefined
    return 0;
}