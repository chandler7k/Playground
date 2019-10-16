#include <iostream>
#define MAXSIZE 20
#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE
typedef int Status;
typedef int ElemType;

typedef struct {
    ElemType data[MAXSIZE];
    int length;
}SqList;

Status GetElem(SqList L, int i, ElemType *e) {
    if (L.length == 0 || i < 1 || i > L.length) {
        return ERROR;
    }
    *e = L.data[i - 1];
    return OK;
}


int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}