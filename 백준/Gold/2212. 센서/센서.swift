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
let m = io.readInt()

let sensors = (0..<n).map { _ in io.readInt() }.sorted { $0 < $1 }
let distances = (0..<sensors.count-1).map { i in sensors[i+1] - sensors[i] }.sorted { $0 < $1 }
let answer = distances.prefix(max(distances.count - (m-1), 0)).reduce(0, +)

print(answer)