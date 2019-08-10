#include <iostream>
#include <cstring>
using namespace std;
int main() {
//    unsigned cnt = 42;//不是常量表达式 不对啊，也没报错啊
//    constexpr unsigned sz = 42; //  是常量表达式
//
//    int arr[cnt];
//    int *path[sz];
//    int *bbdd[cnt];
//    string bad[cnt];

    const unsigned sz = 3;
    int ial[sz] = {0,2,3};
    int a5[2] = {1,2};
    string a4[3] = {"hello","world"};
    cout << a4[2] << endl;
    const char cha4[6] = "danie";// char数组最后有一个'\0'站位；

    int froma[] = {1,2,3};
//    int tobarr[4];不能拷贝初始化
//    tobarr = froma;
    int *ptrs[10];
    int ptoarr[10];
    int (*parray)[10] = &ptoarr;
    int (&arrref)[10] = ptoarr;

    unsigned scores[11] = {};
//    unsigned grade;
//    while(cin >> grade){
//        if(grade <= 100){
//            ++scores[grade/10];
//        }
//    }
//    cout << scores << endl;

    string numstring[] = {"one","two","three"};
    string *p = &numstring[0];
    string *p2 = numstring;
//    int ia[] = [1,2,3,4,5];
//    auto ia2(ia);
//    ia2 = 32;
    int ptrarr[] = {1,2,3,4};
    int *ptrsdf = ptrarr;
    ptrsdf ++;
    cout << *ptrsdf << endl;

    // c++ 11
    int iiterarr[] = {1,2,3,4,5};
    int *bg = begin(iiterarr);
    int *ed = end(iiterarr);

    int last = *(iiterarr + 3);
    cout << last << endl;

    int tptrarr1[] = {1,2,3};
    int tptrarr2[] = {1,2,3};
//    cout << tptrarr1 + tptrarr2  << endl;

    return 0;
}