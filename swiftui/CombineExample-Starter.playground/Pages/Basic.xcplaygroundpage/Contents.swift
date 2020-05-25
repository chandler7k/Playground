import Combine

check("Empty") {
    Empty<Int, SampleError>()
}

check("Just") {
    Just("Hello SwiftUI")
}


check("sequence") {
    Publishers.Sequence<[Int],Never>(sequence: [1,2,3])
}

check("array"){
    [1,2,3].publisher
}

check("map") {
    [1,2,3].publisher.map {
        $0 * 2
    }
}

check("just map"){
    Just(5)
        .map{
            $0 * 2
    }
}

check("reduce") {
    [1,2,3,4,5].publisher.reduce(0, +)
}

check("scan") {
    [1,2,3,4,5].publisher.scan(0, +)
}

check("compact map") {
    /// compact map 将map中的结果为nil的过滤
    ["1","2","3","cat","4"].publisher.compactMap {
        Int($0)
    }
}


check("flat map1") {
    [[1,2,3],["a","b","c"]].publisher
        .flatMap {
            $0.publisher
    }
}

check("flat map 2") {
    ["A","B","C"].publisher.flatMap { letter in
        [1,2,3].publisher.map {
            "\(letter)\($0)"
        }
    }
}

check("remove dublicates") {
    ["S","SW","SW"].publisher.removeDuplicates()
}


check("Fail") {
    Fail<Int,SampleError>(error: .sampleError)
}
enum MyError : Error {

    case sampleError
}
check("map error") {
    Fail<Int,SampleError>(error: .sampleError)
        .mapError {
            _ in MyError.sampleError
    }
}


check("throw") {
    ["1","2","Swift"].publisher.tryMap { s -> Int in
        guard let value = Int(s) else{
            throw MyError.sampleError
        }
        return value
    }.replaceError(with: -1)
}

check("throw") {
    ["1","2","Swift"].publisher.tryMap { s -> Int in
        guard let value = Int(s) else{
            throw MyError.sampleError
        }
        return value
    }.catch{_ in Just(-1)}
}

//enum MyError : Error {
//
//    case sampleError
//}

check("catch and continue") {
    ["1","2","Swift","3"].publisher.flatMap { s in
        return Just(s)
            .tryMap { s -> Int in
            guard let value = Int(s) else{
                throw MyError.sampleError
            }
            return value
        }.catch { _ in
            Just(-1)
        }
    }
    
}
