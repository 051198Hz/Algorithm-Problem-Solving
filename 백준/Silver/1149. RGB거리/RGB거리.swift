let n = Int(readLine()!)!
var dp = (0..<n).map { _ in readLine()!.split { $0 == " " }.map { Int(String($0))! }}

for i in 1..<n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + dp[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + dp[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + dp[i][2]
}

let answer = dp[n-1].min()!
print(answer)