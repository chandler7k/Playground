#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main() {
    vector<int> ivec;
    vector<vector<int>> hh;
    vector<string> articles = {"a","an"};
    vector<string>v1{"a"};

    vector<int>v2;
    for(int i = 0; i!= 100;i++){
        v2.push_back(i);
    }
    string word;
    vector<string>text;
//    while(cin >>word){
//        if(word == "stop")
//            break;
//        text.push_back(word);
//    }
//
//    for(auto &word: text){
//        for(auto &c: word){
//            c = toupper(c);
//        }
//        cout << word << endl;
//    }

    auto b = v1.begin(),e = v1.end();


//    vector<int> v{1,3,4,5,6};
//    for(auto &i: v){
//        i *= i;
//    }
//
//    for(auto i: v){
//        cout << i << " ";
//    }
//    cout <<endl;
    string iterString("some string");
//    if(iterString.begin() != iterString.end()){
//        auto it = iterString.begin();
//        *it = toupper(*it);
//        ++it;
//    }
    for(auto it = iterString.begin(); it != iterString.end();++it){
        *it = toupper(*it);
    }
    cout << iterString << endl;

    vector<int>::iterator it;
    string::iterator it2;

    vector<int>::const_iterator it3;
    string::const_iterator it4;

    vector<int> noncV;
    const vector<int> conV;

    auto noncit = noncV.begin();
    auto conit = conV.begin();
    conit = conV.cbegin();

//    for(auto it = noncV.begin();it != noncV.end() && !it->empty();++it){
//
//    }

    return 0;
}