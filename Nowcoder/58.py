# -*- coding:utf-8 -*-
class Solution:
    def ReverseSentence(self, s):
        # write code here
        if not s:
            return s
        s1 = s.split(' ')
        s1 = list(reversed(s1))
        
        return ' '.join(s1)
if __name__ == "__main__":
    str1 = 'av cs vf.'
    print(str1.split(' '))
    print(list(reversed(str1.split())))