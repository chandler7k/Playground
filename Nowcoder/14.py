def cut(length):
        if length < 2: 
            return 0
        if length == 2:
            return 1
        if length == 3:
            return 2
        # 子问题最优解 3为啥是3
        # f(n) = max(f(i) * f(n-i))
        products = [0,1,2,3]
        maxV = 0
        for i in range(4,length + 1):
            products.append(maxV)
            for j in range(1, int(i / 2 + 1)):
                temp = products[j] * products[i - j]
                if maxV < temp:
                    maxV = temp
                products[i] = maxV
        
        maxV = products[length]
        return maxV

if __name__ == "__main__":
    print(cut(4))
