# -*- coding:utf-8 -*-
class Solution:
    def NumberOf1(self, n):
        # write code here
        flag = 0
#Python 2 will automatically set the type based on the size of the value. A guide of max values can be found below.

# The Max value of the default Int in Python 2 is 65535, anything above that will be a long

# For example:

# >> print type(65535)
# <type 'int'>
# >>> print type(65536*65536)
# <type 'long'>
# In Python 3 the long datatype has been removed and all integer values are handled by the Int class. The default size of Int will depend on your CPU architecture.

        # python 2 整型有 32位 和 64位一说，还有长整型
        # python 3 没有长整型，当前版本python2 也可以实现int 和 long int的自动转变，真他妈坑。
        # 这里确保n锁定在32位 
        while n&0xffffffff:
            flag += 1
            n = (n-1) & n
        return flag