class Solution:
    # 返回二维列表，内部每个列表表示找到的路径
    def FindPath(self,root,expectNumber):
        if root == None:
            return []
        result = []
        self.findpath(root,[],0,expectNumber,result)
        return result
    def findpath(self,root,path,cursum,expectNumber,result):
        cursum += root.val
        path.append(root)

        isLeaf = (root.left == None) and (root.right == None)
        if (cursum == expectNumber and isLeaf):
            onePath = []
            for node in path:
                onePath.append(node.val)
            result.append(onePath)

        if cursum < expectNumber:
            if root.left:
                self.findpath(root.left,path,cursum,expectNumber,result)
            if root.right:
                self.findpath(root.right,path,cursum,expectNumber,result)

        path.pop()