import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 16)
dp[0] = 2
for i in 1...n {
    dp[i] = dp[i-1] + dp[i-1] - 1
}
print(pow(Decimal(dp[n]), 2))