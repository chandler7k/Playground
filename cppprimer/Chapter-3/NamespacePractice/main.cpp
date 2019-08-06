#include <iostream>
#include <string>
#import <cctype>
using std::string;
using std::cin;
using std::cout; using std::endl;
int main(){
//    int i;
//    cin >> i;
//    std::cout << i << endl;

    cout << "==========================" << endl;
    string s1;
    string s2 = s1;
    string s3 = "hello";
    string s4(10,'c');
    cout << s4 << endl;
    // copy初始化
    s1 = "s1";
    cout << s1 << " s2: " << s2 << endl;
    s2 = "s2copy";
    cout << s1 << " s2: " << s2 << endl;

    // 直接初始化
    string ss1 = "ss1";
    string ss2(ss1);
    cout << ss1 << " " << ss2 << endl;

    ss1 = "to ss2";
    cout << ss1 << " " << ss2 << endl;

//    string blanktest;
//    cin >> blanktest;
//    cout << blanktest << endl;
//
//    string beBlack,afBlank;
//    cin >> beBlack >> afBlank;
//    cout << beBlack << afBlank << endl;

//    string world;
//    while (cin >> world)
//        cout << world << endl;

// getline
//    string line;
//    while(getline(cin, line))
////        if(!line.empty())
//        if(!line.size() > 80)
//            cout << line << endl;

//    auto len = line.size();

    string strrqwer = "hello";
    string phrase = "hello world";
    string slang = "hiya";
    if(slang >= phrase)
        cout << "slang > phrase" << endl;


//    string word;
//    while(getline(cin, word))
//        cout << word << endl;

//    string word2;
//    while(cin >> word2)
//        cout << word2 << endl;

//    string cp1,cp2;
//    cin >> cp1 >> cp2;
//    cout << (cp1 > cp2 ? cp1 : cp2) << endl;
//
    string strfor("some string");
    for(auto c: strfor){
        cout << c << endl;
    }

//    string sforf("hello world !!");
//    decltype(sforf.size()) punct_cnt = 0;
//    for(auto c: sforf){
//        if(ispunct(c)) {
//            cout << ++punct_cnt << endl;
//            cout << punct_cnt << endl;
//        }
//    }
//    for(auto &c: strfor){
//        c = toupper(c);
//    }
//    cout << strfor << endl;
//    cout << strfor[-5] << endl;

    for(char c: strfor){
        c = toupper(c);
    }
    cout << strfor << endl;


    return 0;
}