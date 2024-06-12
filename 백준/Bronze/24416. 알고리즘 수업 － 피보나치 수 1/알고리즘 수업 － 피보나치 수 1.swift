var dp = [Int](repeating: 0, count: 41)
dp[1] = 1
dp[2] = 1
let n = Int(readLine()!)!
for i in 3...n{
    dp[i] = dp[i-1] + dp[i-2]
}
print(dp[n],n-2)