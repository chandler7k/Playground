//
//  main.swift
//  FLC
//
//  Created by 邹奂霖 on 2019/6/2.
//  Copyright © 2019 邹奂霖. All rights reserved.
//

import Foundation

func nextPermutation(_ nums: inout [Int]) {
    let length = nums.count
    if (length == 0){
        return
    }
    
    var firstSmallIndex = -1
    var firstLargeIndex = -1
    for i in (0..<length-1).reversed(){
        print(i)
        if nums[i] < nums[i+1]{
            firstSmallIndex = i
            break
        }
    }
    
    if firstSmallIndex == -1{
        nums = nums.reversed()
        return
    }
    
    for i in (firstSmallIndex+1...length-1).reversed(){
        if(nums[firstSmallIndex] < nums[i]){
            firstLargeIndex = i
            break
        }
    }
    nums.swapAt(firstSmallIndex, firstLargeIndex)
    print(firstSmallIndex)
    print(firstLargeIndex)
    print(nums)
    nums = nums[0...firstSmallIndex] + nums[firstSmallIndex+1...length-1].reversed()
    
    
}


var arr = [1,5,1]
nextPermutation(&arr)
print(arr)
