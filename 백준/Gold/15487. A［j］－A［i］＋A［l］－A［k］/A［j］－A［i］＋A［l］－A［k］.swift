import Foundation

final class FastScanner {
    private var data: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0]
    private var idx: Int = 0

    @inline(__always)
    func readInt() -> Int {
        var num = 0
        var sign = 1

        while data[idx] == 10 || data[idx] == 32 { idx += 1 } // skip space & newline
        if data[idx] == 45 { sign = -1; idx += 1 }

        while data[idx] >= 48 {
            num = num * 10 + Int(data[idx] - 48)
            idx += 1
        }
        return num * sign
    }
}

let scanner = FastScanner()
let n = scanner.readInt()

var arr = [Int](repeating: 0, count: n)
for i in 0..<n {
    arr[i] = scanner.readInt()
}

var leftBest = [Int](repeating: Int.min, count: n)
var rightBest = [Int](repeating: Int.min, count: n)

// (-A[i] + A[j]) + (-A[k] + A[l])
// 최소 i를 찾는다.
// 최대 l를 찾는다.

// 왼쪽에서부터 최대차이
var minLeft = arr[0]
leftBest[0] = Int.min  // j=0에서는 i<j 불가능

for j in 1..<n {
    leftBest[j] = leftBest[j-1] > (arr[j] - minLeft) ? leftBest[j-1] : (arr[j] - minLeft)
    // 방금 지나친 j는 다시 사용하지 않으므로, 다음의 j보다 이전이다.
    // 따라서 과거가 된 j를 i로 취급해 최솟값으로 활용할 수 있다.
    minLeft = minLeft < arr[j] ? minLeft : arr[j]
}

var maxRight = arr[n-1]
rightBest[n-1] = Int.min  // j=0에서는 i<j 불가능


// n >= 4
// 오른쪽에서부터 최대차이
for k in stride(from: n-2, through: 0, by: -1) {
    rightBest[k] = rightBest[k+1] > (maxRight - arr[k]) ? rightBest[k+1] : (maxRight - arr[k])
    maxRight = maxRight > arr[k] ? maxRight : arr[k]
}

var answer = Int.min

for t in 0..<(n-1) {
    guard leftBest[t] != Int.min else { continue }
    guard rightBest[t+1] != Int.min else { continue }
    answer = (leftBest[t] + rightBest[t+1]) > answer ? (leftBest[t] + rightBest[t+1]) : answer
}

print(answer)