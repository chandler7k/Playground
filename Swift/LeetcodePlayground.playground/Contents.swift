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
    }
    
}

Solution.push(node: 2)
Solution.push(node: 3)
Solution.pop()
