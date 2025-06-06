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

let n = io.readInt()
let values = (0..<n).map { _ in io.readInt() }.sorted { $0 < $1 }

var min = Int.max
var answers = [Int]()

for i in 0..<n-1 {
    binSearch(i+1)
    func binSearch(_ s: Int){
        var s = s
        var e = values.count-1
        
        while s <= e {
            let mid = (s+e)/2
            let sum = abs(values[i] + values[mid])
            if min > sum {
                min = sum
                answers = [values[i], values[mid]]
            }
            if values[mid] >= -values[i] {
                e = mid-1
            } else {
                s = mid+1
            }
        }
    }
}
print( answers.sorted { $0 < $1}.map { "\($0) " }.joined())