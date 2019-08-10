#include <iostream>
#include <vector>
using namespace std;
int main() {
    int ia[3][4] = {
            {0,1,2,3},
            {0,2,1,4},
            {2,4,5,3}
    };
//    ia[2][3] = arr
    size_t  cnt = 0;
    for(auto &row: ia){
        for(auto &col: row){
            col = cnt;
            ++cnt;
        }
    }
    for(const auto &row: ia){
        for(auto col: row){
            cout << col << endl;
        }
    }
    cout << ia << endl;

    //多维度数组名实际是一个指向首位元素的指针，首位元素也是数组。
    int (*p)[4] = ia;
    p = &ia[2];
    for(auto p = ia;p != ia+3 ;p++){
        for(auto q = *p;q != *p+4;q++){
            // *p 得到该层数组，接触引用得到的数组，数组名代表他是指向首个元素的指针。所以用*p
            cout << "capzip" << endl;
        }
    }

    // beigin end
    for(auto p = begin(ia); p!= end(ia); p++){
        for(auto q = begin(*p); q != end(*p); q++){
            cout << "fuck" << endl;
        }
    }

    using int_array = int[4];
    typedef int int_array[4];

    for (int_array *p= ia; p!= ia + 3; ++p) {
        for(int *q = *p; q!= *p + 4;++q){
            cout << *q << endl;
        }

    }
    return 0;
}