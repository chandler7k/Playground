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
    return 0;
}