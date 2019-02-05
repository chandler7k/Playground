# -*- coding:utf-8 -*-
# 回溯的思想：
# 将问题的每一步解决的方法都遍历，
# 很想树状结构，每个步骤相当于叶子节点，当前步骤的解决方案相当于有多少个子节点。
# 当前子节点符合就继续走下去，如果不符合就返回到父节点节点，切换到另一个子节点。
class Solution:
    def hasPath(self, matrix, rows, cols, path):
        for i in range(rows):
            for j in range(cols):
                if matrix[i * cols + j] == path[0]:
                    if self.find(list(matrix),rows,cols,path[1:],i,j):
                        return True
        return False

    def find(self, matrix, rows, cols, path, i, j):
        if not path:
            return True
        
        matrix[i * cols + j] = '0'
        #防止重复走入该点
        if j + 1 < cols and matrix[i * cols + j + 1] == path[0]:
            return self.find(matrix,rows,cols,path[1:],i,j+1)
        elif j - 1 >= 0 and matrix[i * cols + j - 1] == path[0]:
            return self.find(matrix,rows,cols,path[1:],i,j - 1)
        elif i + 1 <rows and matrix[(i + 1) * cols + j] == path[0]:
            return self.find(matrix,rows,cols,path[1:],i+1,j)
        elif i - 1 >= 0 and matrix[(i-1) * cols + j] == path[0]:
            return self.find(matrix,rows,cols,path[1:],i-1,j)
        else:
            return False