# -*- coding:utf-8 -*-
class Solution:
    def VerifySquenceOfBST(self, sequence):
        # write code here
        if not sequence:
            return
        length = len(sequence)
        rootid = length - 1
        root = sequence[rootid]
        iflag = 0
        for iflag in range(length):
            if sequence[iflag] > root:
                break
        jflag = 0
        for jflag in range(iflag,length):
            if sequence[jflag] < root:
                return False
        left = True
        if iflag > 0:
            left = self.VerifySquenceOfBST(sequence[:iflag])
        
        right = True
        if jflag < length - 1:
            right = self.VerifySquenceOfBST(sequence[iflag:length-1])
        return left and right
