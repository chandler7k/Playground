# -*- coding:utf-8 -*-
class Solution:
    # s, pattern都是字符串
    def match(self, s, pattern):
        # write code here
        if len(s) == 0 and len(pattern) == 0:
            return True
        if (len(s) > 0 and len(pattern) == 0):
            return False
        # 注意s确保能去到对应下标不越界
        if len(pattern) > 1 and pattern[1] == '*':
            if len(s) > 0 and (pattern[0] == s[0] or pattern[0] == '.'):
                return (self.match(s, pattern[2:])) or (self.match(s[1:],pattern[2:])) or (self.match(s[1:],pattern))
                #依次： 忽略*， *只重复依次， *重复多次（因为重复多次在后面还要用*去匹配，所以patter不后移
            else:
                return self.match(s, pattern[2:])
        if len(s) > 0 and (pattern[0] == s[0] or pattern[0] == '.'):
            return self.match(s[1:],pattern[1:])
        return False