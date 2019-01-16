<<<<<<< HEAD

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
        
        
        
=======
class Solution{
    static var stack1 = [Int]()
    static var stack2 = [Int]()
    
    static func push(node: Int){
        self.stack1.append(node)
    }
    
    static func pop() -> Int{
        if(self.stack2.isEmpty){
            while (!self.stack1.isEmpty) {
                let a = self.stack1.removeLast()
                self.stack2.append(a)
            }
        }
        return self.stack2.removeLast()
>>>>>>> 228b24f0fca0e429cc9eb54b0c4204c8556e4b27
    }
    
}

<<<<<<< HEAD
print(Solution.search([1,3], 1))

=======
Solution.push(node: 2)
Solution.push(node: 3)
Solution.pop()
>>>>>>> 228b24f0fca0e429cc9eb54b0c4204c8556e4b27
