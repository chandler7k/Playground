class Solution:
    def getMaxValue_Solution1(self, values, rows, cols):
        maxValues = [[0]*cols]*rows

        for i in range(rows):
            for j in range(cols):
                left = 0
                up = 0
                if i > 0:
                    up = maxValues[i-1][j]
                if j > 0:
                    left = maxValues[i][j-1]
                maxValues[i][j] = max(up, left) +values[i*cols + j]
        return maxValues[rows-1][cols-1]

if __name__ == "__main__":
    
    sol = Solution()
    arr = [1,10,3,8,12,2,9,6,5,7,4,11,3,7,16,5]
    print(sol.getMaxValue_Solution1(arr,4,4))