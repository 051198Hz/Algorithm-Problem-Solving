import Foundation

// MARK: - FileIO

//func stringToAscii(_ str: String) -> Int {
//    str.map { $0.asciiValue! }.map { Int($0) }.reduce(0) {$0 + $1}
//}

struct FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private mutating func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) mutating func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    mutating func readIntArray(_ K: Int) -> [Int] {
        var array = [Int]()
        
        for _ in 0..<K {
            array.append(readInt())
        }
        
        return array
    }
    
    @inline(__always) mutating func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) mutating func readLine() -> String {
        var now = read()
        
        while now == 10 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) mutating func readString() -> Int {
        var str = 0
        var now = read()
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        while now != 10 && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }
        return str
    }
    
    mutating func readStringArray(_ K: Int) -> [String] {
        var array = [String]()
        
        for _ in 0..<K {
            array.append(readString())
        }
        
        return array
    }
    
    @inline(__always) mutating func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}

var file = FileIO()
let count = file.readInt()
var numbers = Array<Int>(repeating:0, count: 10001)
var answer = ""
for _ in 0..<count{
    let i = file.readInt()
    numbers[i] += 1
}
for i in numbers.indices where numbers[i] > 0{
    answer += String(repeating: "\(i)\n", count: numbers[i])
}
print(answer)