// 协议和类方法中的self
//Swift中，希望在协议中使用的类型就是实现这个协议本身的类型的话，使用Self
protocol Copyable{
    func copy() -> Self
}
class MycpClass: Copyable{
    var num = 1
    func copy() -> Self {
        let cp = type(of: self).init()
        cp.num = num
        return cp
    }
    required init(){
        
    }
}

let objcp = MycpClass()
objcp.num = 100

let newobjcp = objcp.copy()
objcp.num = 1

print(objcp.num)
print(newobjcp.num)
