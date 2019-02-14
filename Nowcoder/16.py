# -*- coding:utf-8 -*-
class Solution:
    def Power(self, base, exponent):
        # write code here
        #开始判断三种情况，注意-1
        if exponent == 0:
            return 1
        elif exponent == 1:
            return base
        elif exponent == -1:
            return 1 / base
        
        result = self.Power(base, exponent >> 1)#能用进位用进位
        result *= result
        #这里注意奇数处理
        if exponent & 1 == 1:
            result *= base
        return result