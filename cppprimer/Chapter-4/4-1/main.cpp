#include <iostream>
#include <string>
#include <vector>
using namespace std;
int getvalue(int i){
    return ++i;
}
int main() {
    int i = 0;
//    cout << i << " " << ++i << endl;
    bool b = -1;
//    cout << b << endl;
    int k = 0;
//    k = {3.212}; error: 窄化转换
//    k = getvalue(k);
    while((k = getvalue(k)) != 42){
        cout << k << endl;
    }

    int j;double l;
    l = j = 3.23;
    cout << j << " " << l << endl;
    j = l = 2.124;
    cout << j << " " << l << endl;

    vector<int> vc{1,2,3};
    auto pbeg = vc.begin();
    while(pbeg != vc.end() && *pbeg >= 0){
//        cout << *pbeg++ << endl; // 后置++暂存旧值
        *pbeg = *pbeg++;
        cout << *pbeg << endl;
    }

//    cout << vc << endl;
    int *as;
    cout << sizeof *as << endl;


    string s = "sdfafdsasdfsadfsdaf";
    cout << sizeof(s) << endl; // 24, 是String固定部分的大小



    return 0;
}