class Solution:
    # time: O(n2), space: O(1), 稳定
    def insertSort(self, arr):
        length = len(arr)
        for i in range(1, length):
            for j in range(i,0,-1):
                if arr[j] < arr[j-1]:
                    arr[j], arr[j-1] = arr[j-1], arr[j]
                else:
                    break
        return arr
    def shellSort(self, arr):
        # wwell this is a test 
        # but the magic keyboard is not good as HHKB
        pass
    


if __name__ == "__main__":
    sol = Solution()
    print(sol.insertSort([2,6,4,3]))
