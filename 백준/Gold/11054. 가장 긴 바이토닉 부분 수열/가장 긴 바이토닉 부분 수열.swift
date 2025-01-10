let n = Int(readLine()!)!
let s = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var dp1 = [Int](repeating: 1, count: n)
var dp2 = [Int](repeating: 1, count: n)
for i in s.indices {
    for j in 0..<i {
        if s[i] > s[j] {
            dp1[i] = max(dp1[i], dp1[j]+1)
        }
        if s[n-i-1] > s[n-j-1] {
            dp2[n-i-1] = max(dp2[n-i-1], dp2[n-j-1]+1)
        }
    }
}
var answer = Int.min
for i in 0..<n {
    if answer < dp1[i] + dp2[i] {
        answer = dp1[i] + dp2[i]
    }
}
print(answer-1)