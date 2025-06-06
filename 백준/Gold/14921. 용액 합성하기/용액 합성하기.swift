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
let powerList = (0..<n).map { _ in io.readInt() }
var minValue = Int.max

for i in 0..<n-1 {
    binSearch(i+1)
    func binSearch(_ left: Int) {
        var left = left
        var right = powerList.count - 1
        while left <= right {
            let mid = (left + right) / 2
            let sum = abs(powerList[i] + powerList[mid])
            if abs(minValue) > sum {
                minValue = powerList[i] + powerList[mid]
            }
            if powerList[mid] >= -powerList[i] {
                right = mid-1
            } else {
                left = mid+1
            }
        }
        
    }
}
print(minValue)