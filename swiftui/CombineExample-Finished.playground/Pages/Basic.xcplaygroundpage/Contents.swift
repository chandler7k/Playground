import Combine

check("Empty") {
    Empty<Int, SampleError>()
}

check("Just") {
    Just(1)
}

check("Fail") {
    Fail(
        outputType: Int.self,
        failure: SampleError.sampleError)
}

check("filter"){
    [1,2,3,4].publisher.filter{
        $0%2==0
    }
}

/// publisher.sequence 有操作符熔合，所以这里实际上先contains，后publisher，
/// contains(3) 如果为真，sequence实际有到3那一部分，用原始publisher发送一个cancel，contains接收到cancel后再接受一个true
check("Contains3") {
    
    
    [1,2,3,4,5].publisher.print("[original]").contains(3)
}

check("Contains10") {
    
    /// contains(10)因为sequence没有10，所有全部遍历过后，用原始publisher弄一个finished
    [1,2,3,4,5].publisher.print("[original]").contains(10)
}
