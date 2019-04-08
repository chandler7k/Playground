# -*- coding:utf-8 -*-
class Solution:
    # 返回对应char
    def __init__(self):
        self.s = ''
        self.dic = {}
    
    def FirstAppearingOnce(self):
        # write code here
        for i in self.s:
            if self.dic[i] == 1:
                return i
        return '#'

    def Insert(self, char):
        # write code here
        self.s += char
        if char in self.dic:
            self.dic[char] += 1
        else:
            self.dic[char] = 1