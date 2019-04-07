class Solution:
    def longestSubstring(self, string):
        if len(string) == 0:
            return 0
        # start = 0
        # last = 0
        # curMax = 0
        # for last in range(len(string)):
        #     if string[last] in string[start:last+1]:
        #         start = string.index(string[last])+1
        #     curMax = max(curMax, last-start)
        dp = {}
        start = 0
        curmax = 0
        for i,val in enumerate(string):
            if val in dp:
                start = max(start, dp[val]+1)
            dp[val] = i
            curmax = max(curmax, i-start + 1)
        return curmax
if __name__ == "__main__":
    sol = Solution()
    string = "arabcacfr"
    print(sol.longestSubstring(string))

    dic = {
        'a':0,
        'b':1,
        'c':0
    }
    arr = 'abc'
    for i in range(len(arr)):
        print(dic[arr[i]])