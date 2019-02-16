# -*- coding:utf-8 -*-
class Solution:
    # s字符串
    def isNumeric(self, s):
        # write code here
        isAllowDot = True
        isAllowE = True
        for i in range(len(s)):
            if s[i] in '+-' and (i == 0 or s[i-1] in 'Ee') and i < len(s) - 1:
                continue
            elif isAllowDot and s[i] == '.':
                isAllowDot = False
                if i >= len(s) - 1 or s[i+1] not in '0123456789':
                    return False
            elif  isAllowE and s[i] in 'Ee':
                isAllowDot = False
                isAllowE = False
                if i >= len(s) - 1 or s[i+1] not in '0123456789+-':
                    return False
            elif s[i] not in '0123456789':
                return False
        return True