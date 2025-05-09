import Foundation

let MAX = 100005
var checkPoint = [Int64](repeating: 0, count: MAX)
var psum = [Int64](repeating: 0, count: MAX)

// 입력 예시
let nt = readLine()!.split(separator: " ").map { Int($0)! },
    n = nt[0],
    t = nt[1]

for _ in 0..<n {
    let k = Int(readLine()!)!
    for _ in 0..<k {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let s = line[0]
        let e = line[1]
        checkPoint[s] += 1
        checkPoint[e] -= 1
    }
}

// 누적합 계산
psum[0] = checkPoint[0]
for i in 1..<MAX {
    psum[i] = psum[i - 1] + checkPoint[i]
}

// 슬라이딩 윈도우
var maxSum: Int64 = 0
var thisSum: Int64 = 0
var left = 0
var right = t - 1
var resultLeft = 0
var resultRight = t

for i in 0..<t {
    thisSum += psum[i]
}
maxSum = thisSum

while right < MAX - 1 {
    thisSum -= psum[left]
    left += 1
    right += 1
    thisSum += psum[right]
    
    if thisSum > maxSum {
        maxSum = thisSum
        resultLeft = left
        resultRight = right + 1
    }
}

print("\(resultLeft) \(resultRight)")