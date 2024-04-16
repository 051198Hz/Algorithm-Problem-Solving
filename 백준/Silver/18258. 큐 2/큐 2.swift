import Foundation

// MARK: - using FileIO, thanks to Wapas

//print(answer.map{ "\($0)" }.joined(separator: " "))
//collection을 전체출력할 땐 forEach 말고 [String]으로 변환 후 joined로 String으로 압축 후 print로 출력하는게 더 빠름

var file = FileIO()
let n  = file.readInt()
var q = QueueSingleArray<Int>()
var answer = ""
for _ in 0..<n {
    let cmd:Int = file.readString()
    switch cmd {
    case 335: //pop
        answer += "\(q.dequeue() ?? -1)\n"
    case 443: //size
        answer += "\(q.count)\n"
    case 559: //isEmpty
        answer += "\(q.isEmpty ? 1:0)\n"
    case 553: //front
        answer += "\(q.front ?? -1)\n"
    case 401: //rear
        answer += "\(q.rear ?? -1)\n"
    default: // push X
        q.enqueue(element: file.readInt())
    }
}

print(answer)
// MARK: - FileIO

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
struct QueueSingleArray<T>{
    fileprivate var inbox: [T] = []
    fileprivate var head = 0
    var isEmpty: Bool{
        return inbox.count - head <= 0
    }
    var front: T?{
        if isEmpty {return nil}
        let ret = inbox[head]
        return ret
    }
    var rear: T?{
        if isEmpty {return nil}
        return inbox.last
    }
    var count: Int{
        return inbox.count - head
    }
    mutating func enqueue(element: T){
        inbox.append(element)
    }
    mutating func dequeue()->T?{
        if isEmpty {return nil}
        let ret = inbox[head]
        head += 1
        return ret
    }
}