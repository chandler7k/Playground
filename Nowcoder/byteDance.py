
# import sys
# def dpNumber(cost):
#     n = 1024 - cost
#     coins = [1,4,16,64]
#     dp = [float("inf")] * (n+1)
#     dp[0] = 0
#     for i in range(n + 1):
#         for j in range(len(coins)):
#             if coins[j] <= i:
#                 dp[i] = min(dp[i], dp[i-coins[j]]+1)
#     return dp[n] if dp[n] <= n else - 1

# if __name__ == "__main__":
#     cost = int(sys.stdin.readline().strip())
#     print dpNumber(cost)



# 2

import sys


if __name__ == "__main__":
    line = sys.stdin.readline().strip().split()
    n,m = line[0],line[1]
    line = sys.stdin.readline().strip().split()
        # 把每一行的数字分隔后转化成int列表

    if m <= n:
        line = line.sort()
        print line[len(line) - m - 1]
