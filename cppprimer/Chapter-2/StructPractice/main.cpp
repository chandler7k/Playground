#include <iostream>
#include <string>
using namespace std;
struct Sales_data{
    unsigned sold = 0;
    double revenue = 0.0;
    string name;
};

struct Foo{};

int main() {
    Sales_data data1, data2;
    std::cout << "Hello, World!" << std::endl;
    return 0;
}