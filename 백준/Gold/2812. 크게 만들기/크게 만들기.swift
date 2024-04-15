import Foundation

// MARK: - using FileIO, thanks to Wapas

//print(answer.map{ "\($0)" }.joined(separator: " "))
//collectoin을 전체출력할 땐 forEach 말고 [String]으로 변환 후 joined로 String으로 압축 후 print로 출력하는게 더 빠름

var file = FileIO()

let n = file.readInt()
let k = file.readInt()
let numbers = file.readString().map{ $0.wholeNumberValue! }
let capacity = n - k
var stack:[Int] = []

for i in stride(from: n-1, to: -1, by: -1){
    if stack.count < capacity{
        stack.append(numbers[i])
    }else if numbers[i] >= stack.last!{
        for j in stride(from: capacity - 2, to: -1, by: -1){
            if stack[j] > stack[j+1]{
                stack.remove(at: j+1)
                stack.append(numbers[i])
                break
            }
            if j == 0 {
                stack.remove(at: j)
                stack.append(numbers[i])
            }
        }
    }
}

print(stack.reversed().map{ "\($0)" }.joined())


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
