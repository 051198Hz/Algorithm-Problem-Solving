import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var lis = [Int]()

for n in arr {
    let index = lowerBound(n, lis)
    if lis.count == index {
        lis.append(n)
        continue
    }
    lis[index] = n
}

print(lis.count)

func lowerBound(_ x: Int, _ arr: [Int]) -> Int {
    var lo = 0, hi = arr.count

    while lo < hi {
        let mid = (lo + hi) / 2
        if arr[mid] < x {
            lo = mid + 1
            continue
        }
        hi = mid
    }
    return lo
}