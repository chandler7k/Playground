# 结合律
左结合律：
```c++
cout << "hello" << " world" << endl;
//===
((cout << "hello") << " world") << endl;// 左侧优先
```
右结合律
```c++
int a,b;
a = b = 0;
// 等同于
(a = (b = 0)); // 右部优先，但返回的是最左侧的结果。
```