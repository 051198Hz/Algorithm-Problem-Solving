import Foundation

// MARK: - using FileIO, thank to Wapas

var file = FileIO()


let n = file.readInt()
let permA = file.readIntArray(n)
var stack = [Int]()

var answer = [Int](repeating: -1, count: n)

for i in 0..<n{
    while !stack.isEmpty && permA[i] > permA[stack.last!]{
        let idx = stack.popLast()!
        answer[idx] = permA[i]
    }
    stack.append(i)
}

print(answer.map{ "\($0)" }.joined(separator: " "))

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
