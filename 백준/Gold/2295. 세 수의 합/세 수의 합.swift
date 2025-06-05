let N = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}
arr.sort()

func BS(_ s: Int, _ e: Int, _ t: Int) -> Bool {
    var s = s
    var e = e
    while s <= e {
        let mid = (s + e) / 2
        if queue[mid] == t {
            return true
        } else if queue[mid] > t {
            e = mid - 1
        } else { s = mid + 1 }
    }
    return false
}
var queue = [Int]()
for i in 0...N-1 {
    for j in i...N-1 {
        queue.append(arr[i] + arr[j])
    }
}
queue.sort()
var p = 0
var max = -1
for i in stride(from: N - 1, to: 0, by: -1) {
    for j in 0..<i {
        let a = arr[i] - arr[j]
        if BS(0, queue.count - 1, a) {
            print(arr[i])
            p = 1
            break
        }
    }
    if p == 1 {break}
}