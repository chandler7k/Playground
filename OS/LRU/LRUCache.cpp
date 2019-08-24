//
// Created by 邹奂霖 on 2019-08-24.
//

class LRUCache{
private:
    struct Node{
        int key;
        int value;
        Node(int k, int value):key(k), value(value){}
    };

public:
    LRUCache(int c):capacity(c){}

};
