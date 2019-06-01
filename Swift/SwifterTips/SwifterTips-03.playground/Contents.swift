import Cocoa
//
//var str = "Hello, playground"
//// Selector
////Swift中默认方法对Objc不可见，必须添加@objc关键字，私有方法不可见，在private前添加@objc关键字
////当前作用域如果没有同名方法，可以不写参数，如果存在函数名相同的，编译器无法识别，必须使用强制转换
////let methodS1 = #selector(commonFunc as ()->())
////let methodS2 = #selector(commonFunc as (Int)->(Int))
////
////@objc func callMe(){
////
////}
////
////let someMethod = #selector(callMe)
//
//
////实例方法的动态调用
//class MyClassSL{
//    func methodSL(number: Int) -> Int{
//        return number + 1
//    }
//}
//
////正常的生成实例，然后调用方法
////这种方法只限制在了编译期，在编译期就已经决定了实例和调用的方法
//let objectSL1 = MyClassSL()
//let resultSL1 = objectSL1.methodSL(number: 1)
//
//
////这里使用Type.instanceMehtod去获取methodSL
////f1的类型是：(MyClassSL) -> (Int) -> Int 相当于一个科里化
//let f1 = MyClassSL.methodSL
//let objectSL2 = MyClassSL()
//let resultSL2 = f1(objectSL2)(1)
//
////注意如果有同名的类方法，使用Type.instanceMethod默认会得到类方法
//class MyClassSLJ{
//    class func methodSL(number: Int) -> Int{
//        return number + 1
//    }
//
//    func methodSL(number: Int) -> Int{
//        return number + 1
//    }
//}
//
////想要钦点方法，必须加类型声明
//let fSJ2: (MyClassSLJ) -> (Int) -> Int = MyClassSLJ.methodSL // func methodSL
//let fSJ21 = MyClassSLJ.methodSL // class func methodSL
//
//let fSJ1 = MyClassSLJ.methodSL
//
//// 单例
//class MyClassDL{
//    class var sharedManager: MyClassDL{
//        struct Static{
//            static let sharedInstance: MyClassDL = MyClassDL()
//        }
//        return Static.sharedInstance
//    }
//}
//
//// 写法2
//// 这种写法主要是swift1.2的时候没有存储属性，所以把sharedInstance放到外面
//// 但是要注意访问权限，应该把sharedInstance限制在当前文件，所以设置为private
////private let sharedInsteanceDL2 = MyClassDL2() 报错 现在不支持了
////class MyClassDL2{
////    class var sharedManager: MyClassDL2{
////        return sharedInsteanceDL2
////    }
////}
//
//// 当前
//// swift当前版本的let在底层会把初始化包装在一个 dispatch_once_block_invoke 中
//// 对于所有全局变量，swift都会使用dispatch_once_block_invoke
//// 而且这里有一个private init，不公开初始化方法，只能通过单例实现，也保证力实例的唯一性
//// 如果需要类似default的单例，也可以把private移除。
//class MyManager{
//    let sharedManager = MyManager()
//    private init() {
//
//    }
//}
//
//
//// 条件编译
//#if os(macOS)
//    typealias Color = NSColor
//#else
//    typealias Color = UIColor
//#endif
//
//
//// 编译标志
//// MARK： - hello
//// TODO: fix bug
//// FIXME: fix
////尚且不支持 WARNING: FIX API HERE
//
//// @UIApplicationMain
//// C语言程序以main入口
//// swift没有main，但是在AppDelagate内有@UIApplicationMain标记
//// 编译的时候会寻找这个标记，然后自动插入main函数
//// 如果要自定义main，就删除标记，然后创建main.swift 内部实现UIApplicationMain(CommandLine.argv, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
//// 第三个参数可以换成自己的UIApplication子类
//
//// @objc & dynamic
//
//
//
//protocol Ape2{
//
//    func method1() -> String
//}
//
//extension Ape2{
//    func method1() -> String{
//        return "hi"
//    }
//
//    func method2() -> String{
//        return "hi"
//    }
//
//    func method3() -> String{
//        return "mthod3"
//    }
//}
//
//
//struct B2: Ape2{
//    func method1() -> String {
//        return "hello"
//    }
//
//    func method2() -> String {
//        return "hello"
//    }
//
//}
//
//let b2 = B2()
//b2.method1()
//b2.method2()
//
//let a2 = b2 as Ape2
//a2.method1()
//a2.method2()
//a2.method3()
//
//
//func reverseString(_ s: inout [Character]) {
//    s = s.reversed()
//}
//
//// anyclass .self
//// AnyClass = AnyObject.Type 就是metaClass啊
////class ATA{
////    class func method(){
////        print("hello")
////    }
////}
////let typeATA: ATA.Type = ATA.self
////// .Type用来获取metaClass
////let ata = ATA()
////print(ata.self)
////let ataClass: AnyClass = ATA.self
////
////typeATA.method()
//
////(ataClass as! ATA.Type).method()
//
//// protocol.Protocl作用相当于self用来获取元类型
//
//// protocol 中的Self就是指实现这个协议的类型，因为你没法得知是谁实现了这个协议
//// Self 也包括实现这个协议的类型的子类
//
//protocol Copyable{
//    func copy() -> Self
//}
//class MySelfClass: Copyable{
//    var num = 1
//    func copy() -> Self {
//        let res = type(of: self).init()
//        res.num = num
//        return res
//    }
//
//    required init() {
//
//    }
//}
//
//let sobject = MySelfClass()
//sobject.num = 100
//
//let newso = sobject.copy()
//sobject.num = 1
//print(sobject.num)
//print(newso.num)
//
//
//
//// @objc
//// 修饰的放方法或者属性并不会向OC中一样动态派发，依然是swift中的静态调用
//// 想要动态调用就需要dynamic修饰
//// NSObject的非private方法都是默认@objc的
//
//
//// 可选协议
//// 旧版本实现可选协议方法是在对应方法前面加@objc， 但这样protocol只能由类来实现。
//// 将不必实现的协议方法在协议的extension写出默认方法就行了
//
//protocol OptionalProtocol{
//    func optionalMehtod()
//    func necessaryMethod()
//    func anotherOptionalMethod()
//}
//
//extension OptionalProtocol{
//    func optionalMehtod(){
//        print("implemented in extention")
//    }
//
//    func anotherOptionalMethod(){
//        print("another implemented in extension")
//    }
//}
//
//class OPProtocolClass: OptionalProtocol{
//    func necessaryMethod() {
//        print("implemented in class")
//    }
//
////    func optionalMehtod() {
////        print("optional imp in class")
////    }
//}
//
//let opproobj = OPProtocolClass()
//opproobj.necessaryMethod()
//opproobj.optionalMehtod()
//opproobj.anotherOptionalMethod()
//
//
//// 内存管理
//class ARCA: NSObject{
//    let b: ARCB
//    override init() {
//        b = ARCB()
//        super.init()
//        b.a = self
//    }
//
//    deinit {
//        print("a deinit")
//    }
//
//}
//
//class ARCB: NSObject{
//    weak var a: ARCA? = nil
//    deinit {
//        print("b deinit")
//    }
//}
//
//var arcObjA: ARCA? = ARCA()
//arcObjA = nil
//// unowned 设置以后即使他引用的内容已经释放了，但是仍然会保持一个对w已经释放对象的无效引用，它不能是Optional值，也不会指向nil
//// 官方建议确定不会被释放，尽量使用unowned，如果存在被释放的可能就用weak
//
//class ARCPerson{
//    let name: String
//    lazy var printName: () -> () = {
//        [unowned self] in
//        print("name is \(self.name)")
//    }
//    init(personName: String) {
//        name = personName
//    }
//
//    deinit {
//        print("person is deinit")
//    }
//}
//
//var xiaoMing: ARCPerson? = ARCPerson(personName: "xiaoming")
//xiaoMing!.printName()
////下面这种情况就是，将一个unowned self的闭包赋值给外部，然后将对象nil，再去调用的时候无法读取unowned直接崩溃
////let arcblocktest = xiaoMing!.printName
////xiaoMing = nil
////arcblocktest()
////Fatal error: Attempted to read an unowned reference but object 0x7ff32376b750 was already deallocated
//var mut = DispatchSemaphore(value: 1)
//var empty = DispatchSemaphore(value: 7)
//var full = DispatchSemaphore(value: 3)
//var boxflag = [90,70,60]
//var flag = false
//func product(){
//    DispatchQueue.global(qos: .default).async {
//        while true {
//            mut.wait()
//            empty.wait()
//            boxflag.append(Int.random(in: 1...10))
//
//            full.signal()
//            mut.signal()
//            print("\(boxflag.count)")
//        }
//    }
//}
//
//func consume(){
//    DispatchQueue.global(qos: .default).async {
//        while true {
//            if boxflag.count > 0{
//                mut.wait()
//                full.wait()
//                boxflag.removeLast()
//
//                full.signal()
//                mut.signal()
//                print("\(boxflag.count)")
//            }
//        }
//    }
//
//}
////product()
////consume()
//
//print("\(7/2)")
//print("\(Double(7.0/2))")
//
//
//
//
//
// 打印数组排列组合最小的值
//func printMinNumber(array: [Int]){
//    var array = array
//    array.sort { (x: Int, y: Int) -> Bool in
//        return Int(String(x)+String(y))! < Int(String(y)+String(x))!
//    }
//    var res = ""
//    for i in array{
//        res += String(i)
//    }
//    print(array)
//    print(res)
//}
//print("hello")
//
//printMinNumber(array: [9,21,123])

// autorelease
// 尽量使用初始化方法去生成Data或者Image，目前的Swift版本已经取消了大部分autorelease API，所以还是很安全的

// 值类型和引用类型
//class MyRefClass{
//    var num = 0
//}
//
//var myrefObj = MyRefClass()
//var a = [myrefObj]
//var b = a
//b.append(myrefObj)
//
//myrefObj.num = 100
//
//print(b[0].num)
//print(b[1].num)
//
//// 频繁操作尽然推荐使用 NSMutableArray 和 NSMutableDictionary
//// 目标容器小的情况下再用Swift 自身的 Array 和 Dictionary？？？
//
//// unsafepointer
//func unsafeMethod(_ num: UnsafePointer<CInt>){
//    print(num.pointee)
//}
//
//var unsafea: CInt = 123
//unsafeMethod(&unsafea)
//
//let unsafeArr = NSArray(object: "meow")
//let unsafestr = unsafeBitCast(CFArrayGetValueAtIndex(unsafeArr, 0), to: CFString.self)
//
//// unsafepointer 并不会自动管理内存，就算对象nile了，也依然存在内存中
//// 应该把他们deinitialize和deallocate，释放指针指向和指针自己本身
//
//
////public struct UnsafeMutablePointer<Memory>{
////    init(_ other: COpaquePointer) {
////
////    }
////}
//
//
//// GCD
//let workingQueue = DispatchQueue(label: "my_queue")
//
//workingQueue.async {
//    print("work hard")
//    Thread.sleep(forTimeInterval: 2)
//
//    DispatchQueue.main.async {
//        print("work done, update UI")
//    }
//}
//
//// result
//
//enum AnErrorType: Error{
//    case failuerReason1
//    case failureReason2
//}
//
//func failableFunction(num: Int) -> Result<Bool, AnErrorType>{
//    if num == 2{
//        return .failure(.failuerReason1)
//    }else if num == 1{
//        return .failure(.failureReason2)
//    }
//    return .success(true)
//
//}
//
//print(failableFunction(num: 4))
//
//let queue = DispatchQueue(label: "com.example.queue")
//
//enum EntropyError: Error{
//    case entropyDepleted
//}
//
//struct AsyncRandomGenerator{
//    static let entropyLimit = 5
//    var count = 0
//
//    mutating func fetchRemoteRandomNumber(completion: @escaping (Result<Int, EntropyError>) -> Void){
//        let result: Result<Int, EntropyError>
//        if count < AsyncRandomGenerator.entropyLimit{
//            result = .success(Int.random(in: 1...100))
//        }else{
//            result = .failure(.entropyDepleted)
//        }
//        count += 1
//        queue.asyncAfter(deadline: .now() + 2) {
//            completion(result)
//        }
//    }
//}
//
//var generator = AsyncRandomGenerator()
//(0..<AsyncRandomGenerator.entropyLimit + 1).forEach { i in
//    print("this is the \(i)")
//    generator.fetchRemoteRandomNumber(completion: { (result) in
//        switch result {
//        case .success(let number):
//            print(number)
//        case .failure(let error):
//            print("source of randomess failed: \(error)")
//        }
//    })
//}
//
//
//print("waiting on some numbers")
//dispatchMain()


// extension hirach
//class exHi{
//    var name = ""
//    init() {
//
//    }
//
//    @objc private func sayWTF(){
//        print("wtf")
//    }
//
//}
//
//extension exHi{
//    func sayname(){
//        print(self.name)
//        sayWTF()
//    }
//}
//
//class sonexHi: exHi{
//    override init() {
//
//    }
//}
//
//let sehi = sonexHi()
//sehi.name = "hello world"
//sehi.sayname()
//
//// next :
//let timer: TimeInterval = 2.0
//
//DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timer) {
//    print("output after 2 secs")
//}
//
//
//DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timer) {
//    print("out put after 2 secs")
//}
//
//
//DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
//    print("out put after 2 secs")
//}


class Buffer{
    var test: [Int] = []
}

enum TaggedPointer{
    case buffer(Buffer)
    case inline(Int64)
}

print(MemoryLayout<TaggedPointer>.size)
print(MemoryLayout<TaggedPointer>.alignment)
