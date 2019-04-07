arr1 = [1,9,5,7,3]
print(sorted(arr1))

arr2 = ['a','b','g','e','d']
print(sorted(arr2))
print('====2===')
print(sorted(arr2, key=lambda x:x[0]))

arr3 = [('l',1),('o',2),('t',6),('d',7)]
print(sorted(arr3, key = lambda x: x[1]))

print(enumerate(arr1))

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        length = len(nums)
        nums = enumerate(nums)
        nums = sorted(nums, key = lambda x: x[1])
        l,r = 0,length - 1
        while l < r:
            if nums[l][1] + nums[r][1] == target:
                return sorted([nums[l][0],nums[r][0]])
            elif nums[l][1] + nums[r][1] < target:
                l += 1
            else:
                r -= 1