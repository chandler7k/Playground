class Solution:
    def print1ToMaxOfNDigits(self, n):
        if n <= 0:
            return
        number = ['0'] * n
        #这里的做法是，利用数字排列。只要每一位排列现实0-9就可以了
        for i in range(10):
            number[0] = str(i)
            self.print1ToMaxOfNDigitsRecursively(number, n, 0)

    def print1ToMaxOfNDigitsRecursively(self, number, length, index):
        # length is n 
        if index == length - 1:
            self.printNumber(number)
            return
        for i in range(length):
            number[index + 1] = str(i)
            self.print1ToMaxOfNDigitsRecursively(number, length, index + 1)#这一位已经是一个数了，排列现实上一位，递归NB
        
    
    def printNumber(self, number):
        isBegining0 = True
        nlength = len(number)

        for i in range(nlength):
            if isBegining0 and number[i] != '0':
                isBegining0 = False
            elif not isBegining0:
                print('%c',number[i])
        print('')#这里是为啥


if __name__ == "__main__":
    b = [0] * 10
    b[0] = 1
    print(b)

# csdn
# def Print1ToMaxOfNDigits2(n):
#     if n <= 0:
#         return

#     number = ['0'] * n
#     for i in range(10):
#         number[0] = str(i)
#         Print1ToMaxOfNDigitsRecursively(number, n, 0)

# def PrintNumber(number):
#     isBeginning0 = True
#     nLength = len(number)

#     for i in range(nLength):
#         if isBeginning0 and number[i] != '0':
#             isBeginning0 = False
#         if not isBeginning0:
#             print('%c' %number[i])
#     print('')

# def Print1ToMaxOfNDigitsRecursively(number, length, index):
#     if index == length - 1:
#         PrintNumber(number)
#         return
#     for i in range(10):
#         number[index + 1] = str(i)
#         Print1ToMaxOfNDigitsRecursively(number, length, index+1)

# Print1ToMaxOfNDigits2(2)
