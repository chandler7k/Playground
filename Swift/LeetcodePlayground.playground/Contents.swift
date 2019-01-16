
class Solution {
    static func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else{
            return -1
        }
        return search1(nums: nums, left: 0, right: nums.count - 1, target: target)
    }
    
    static func search1(nums: [Int], left: Int, right: Int, target: Int) -> Int{
        if(left == right){
            if(nums[left] == target){
                return left
            }else{
                return -1
            }
        }
        
        let mid = (right + left) / 2
        
        
        
        if(nums[left] <= nums[mid]){
            if(target >= nums[left] && target <= nums[mid]){
                return search1(nums: nums, left: left, right: mid - 1,target: target)
            }else{
                return search1(nums:nums, left:mid + 1,right: right,target: target)
            }
        }else{
            if(target > nums[mid] && target <= nums[right]){
                return search1(nums:nums, left:mid + 1,right: right,target: target)
            }else{
                return search1(nums: nums, left: left, right: mid - 1,target: target)
            }
        }
        
        
        
    }
}

print(Solution.search([1,3], 1))

