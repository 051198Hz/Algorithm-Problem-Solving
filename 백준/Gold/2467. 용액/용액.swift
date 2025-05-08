let n = Int(readLine()!)!
let valueList = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var minSum = Int.max,
    v1 = Int.max,
    v2 = Int.max
var start = 0,
    end = n-1
while true {
    if start == end {
        break
    }
    // 특성값의 합이 전보다 작으면, 특성값을 갱신한다.
    let curSum = valueList[start] + valueList[end]
    if abs(0-curSum) < abs(0-minSum) {
        v1 = valueList[start]
        v2 = valueList[end]
        minSum = valueList[start] + valueList[end]
    }
    // 특성값의 합이 0이므로, 종료한다.
    if minSum == 0 { break }
    // 특성값의 합이 0보다 크므로, 큰 수를 작게 한다.
    if curSum > 0 {
        end -= 1
        continue
    }
    // 특성값의 합이 0보다 작으므로, 작은수를 크게 한다.
    if curSum < 0 {
        start += 1
        continue
    }
}
@inline(__always) func abs(_ n: Int) -> Int {
    return n > 0 ? n : -n
}
print(v1, v2)