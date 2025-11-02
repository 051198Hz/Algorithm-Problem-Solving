import Foundation

let n = Int(readLine()!)!
let values = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted { $0 < $1 }
var groups = [[Int]]()

var currentSum = Int.max
var answer = [Int]()

outer: for i in 0..<n-2 {
    for j in i+1..<n-1 {
        var lo = j+1, hi = n-1
        let abSum = values[i] + values[j]
        while lo <= hi {
            let mid = (lo + hi) / 2
            let total = abSum + values[mid]

            if currentSum > abs(total) {
                answer = [values[i], values[j], values[mid]]
                currentSum = abs(total)
            }
            // a + b + c가 0보다 크다면, 더 작은 값을 찾아야 하므로 hi를 낮춤
            if total > 0 {
                hi = mid - 1
                continue
            }
            // a + b + c가 0보다 작다면, 더 큰 값을 찾아야 하므로 lo를 높임
            if total < 0 {
                lo = mid + 1
                continue
            }
            if total == 0 {
                break outer
            }
        }
    }
}

print(answer.sorted{ $0 < $1 }.map { "\($0) "}.joined())

func abs(_ x: Int) -> Int {
    return x < 0 ? -x : x
}