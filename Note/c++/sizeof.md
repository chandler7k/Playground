# sizeof
sizeof 运算结果依赖于其作用的类型：
1. 对char或者类型为char的表达式执行sizeof，结果为1
2. 引用类型，sizeof返回被引用的对象的空间大小
3. 指针，返回指针本身空间大小
4. 解引用指针，返回指针指向对象所占的空间大小
5. 数组，返回整个数组所占的空间大小，并不会吧数组名字当作指针处理。
6. string对象，返回该类型固定部分的大小(测试的是24)，不会计算对象中的元素占用了多少空间，不会返回string对象占用的空间大小。