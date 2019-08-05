#include <iostream>
using namespace std;
extern const int buf = 512;
//constexpr int *constPtr = nullptr;
constexpr int *constPrt = nullptr; // 顶部const
typedef double wages;
using hello = double ;
using hptr = double*;

int (^myblock)(int) = ^(int num){
    return num * num;
};

int foo(){
    return 1;
}

//int x = 1;
//decltype(foo()) sum = x;

// decltype
const int ci = 0, &cj = ci;

decltype(ci) x = 0;

decltype(cj) y = x;

//decltype(cj) z; error :z是引用，引用必须初始化

int main() {
    cout << "===========================" << endl;
    int ival = 1024;
    int &refVal = ival;
    refVal = 3;
    cout << ival;
//    int dval = 1.01;

    cout << "===========================" << endl;
    ival = 42;
    int *ip1 = &ival;
//    int *ip2 = ival; // error： 必须是有取地址符修饰

    double dval;
    double *dp2 = &dval;

//    int *ip3 = dp2;
//    ip3 = &dval;
    cout << ip1<< endl;
    *ip1 = 0;
    cout << *ip1 << endl;

    int *ip3 = nullptr;
//    cout << ip2 << endl;

    int *mp1, *mp2, *mp3;

    cout << "===========================" << endl;
    ival = 1024;
    int *p1 = &ival;
    int **pp2 = &p1;

    cout << *p1 << " " <<**pp2 << endl;

    int *rp1;
    int *&r1 =rp1;
    r1 = &ival;
    *r1 = 0;
    cout << ival << endl;
    *rp1 = 10;
    cout << *rp1 << endl;
    cout << ival << endl;


    cout << "===========================" << endl;
    const int buffer_size = 512;
    int errNumb = 0;
    int *const curErr = &errNumb;
    const double pi = 3.14;
    const double *const pip = &pi;
    const int *const pnon1 = &buffer_size;
//    pi = 4.65;

    cout << myblock(3) << endl;
    hello fu = 3.4;
    cout << fu << endl;
    hptr h = &fu;
    cout << *h;
    cout << "===========================" << endl;
    auto ai = 0, *pai = &ai;
    cout << *pai << endl;

    const int aci = 0;
    const auto f = aci;
    auto *autptr = &aci;
    cout << "===========================" << endl;
    // 顶层Const指针必须初始化
    int noConstInt = 10;
    const int constInt = 10;
    int *const constPtr = &noConstInt;

    // 底层const指针不必初始化
    const int *lowLevelConstPrt;
    cout << *lowLevelConstPrt << endl;

    const int *lowlevelNullConstrPtr = nullptr;
    cout << *lowlevelNullConstrPtr << endl;


    int &nullRef = noConstInt;
    // 引用的const都是底层const，const int&可以绑定普通int上。
    const int &constNullRef = noConstInt;

    int deci = 42, *decp = &deci, &decr = deci;
    cout << decr << " " << &decr << endl;

    decltype(decr+0) b;


    return 0;
}