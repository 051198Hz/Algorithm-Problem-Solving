import Foundation
class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
}

let io = FileIO()

let m = io.readInt()
let n = io.readInt()

let stars: [[Int]] = (0..<m).map { _ in (0..<n).map { _ in io.readInt()} }
let indexList = stars.map { Set($0).sorted { $0 < $1 } }
var answer = 0
let pressedStars = stars.enumerated().map { i, v in v.map{ e in binSearch(indexList[i], e) } }

for i in 0..<stars.count-1 {
    for j in i+1..<stars.count {
        if pressedStars[i] == pressedStars[j] { answer += 1 }
    }
}

print(answer)

func binSearch(_ array: [Int], _ target: Int) -> Int {
    var s = 0
    var e = array.count-1
    while s <= e {
        let mid = (s + e) / 2
        if array[mid] == target  {
            return mid
        }
        if array[mid] > target {
            e = mid-1
        } else {
            s = mid+1
        }
    }
    return -1
}