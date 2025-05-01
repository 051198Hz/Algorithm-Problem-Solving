//X가 3으로 나누어 떨어지면, 3으로 나눈다.
//X가 2로 나누어 떨어지면, 2로 나눈다.
//1을 뺀다.
let n = Int(readLine()!)!
var dp = [Int](repeating: Int.max, count: n+1)
dp[1] = 0
for i in 1...n {
    if i*3 <= n && ((i*3)%3 == 0) {
        dp[i*3] = min(dp[i*3], dp[i]+1)
    }
    if i*2 <= n && ((i*2)%2 == 0) {
        dp[i*2] = min(dp[i*2], dp[i]+1)
    }
    if i+1 <= n {
        dp[i+1] = min(dp[i+1], dp[i]+1)
    }
}
print(dp[n])