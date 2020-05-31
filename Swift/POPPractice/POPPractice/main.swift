//
//  main.swift
//  POPPractice
//
//  Created by houdini on 2020/5/24.
//  Copyright © 2020 POPPractice. All rights reserved.
//

import Foundation

print("Hello, World!")

protocol Ordered{
    func process(other: Self) -> Bool
}

func binarySearch<T: Ordered>(sortedKeys:[T], forkey k: T) -> Int{
    return 0;
}


//extension Collection where

extension Comparable{
    func process(other: Self) -> Bool {return self < other}
}

extension Ordered where Self:Comparable{
    func process(other: Self) -> Bool {return self < other} 
}

