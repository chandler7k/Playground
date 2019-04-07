class Solution:
    def getTranslation(self, num):
        
        strNum = str(num)
        return self.getTranslationCount(strNum)
    
    def getTranslationCount(self, strNum):
        
        count = 0
        length = len(strNum)
        counts = [0]*(length)
        for i in range(length-1,-1,-1):
            if i < length - 1:
                count = counts[i+1]
                # print(count)
            else:
                count = 1
            
            if i < length - 1:
                digit1 = int(strNum[i:i+2])
                if digit1 in range(10,26):
                    if i < length - 2:
                        count += counts[i+2]
                    else:
                        count += 1

            counts[i] = count
        return counts[0]
if __name__ == "__main__":
    sol = Solution()
    print(sol.getTranslation(12258))
    arr = [1,3,1,2,5,3]
    stringarr = "".join([str(i) for i in arr])
    arr2 = list(stringarr)
    print(stringarr)
    print(arr2)



