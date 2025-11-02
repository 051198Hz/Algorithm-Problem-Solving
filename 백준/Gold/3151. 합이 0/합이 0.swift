import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted { $0 < $1 }
var count = 0
if n > 2 {
    for i in 0..<n - 2 {
        for j in i + 1..<n - 1 {
            let target = -(arr[i] + arr[j])
            let left = lowerBound(target, arr, j + 1, n)
            let right = upperBound(target, arr, j + 1, n)
            count += right - left
        }
    }
}

print(count)

func lowerBound(_ x: Int, _ arr: [Int], _ start: Int, _ end: Int) -> Int {
    var lo = start, hi = end
    while lo < hi {
        let mid = (lo + hi) / 2
        // x와 같거나 큰 수 중에 제일 작은 인덱스
        if arr[mid] < x {
            lo = mid + 1
            continue
        }
        hi = mid
    }
    return lo
}

func upperBound(_ x: Int, _ arr: [Int], _ start: Int, _ end: Int) -> Int {
    var lo = start, hi = end
    while lo < hi {
        let mid = (lo + hi) / 2
        // arr중 더 큰 수의 첫 인덱스를 찾아야하므로 lo를 높임
        if arr[mid] <= x {
            lo = mid + 1
            continue
        }
        hi = mid
    }
    return lo
}