import Foundation
let length = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 300+1)
var stairs = [Int](repeating: 0, count: 300+1)
for i in 1...length{
    stairs[i] = Int(readLine()!)!
}
dp[1] = stairs[1]
dp[2] = dp[1] + stairs[2]
if length > 2{
    for i in 3...length{
        dp[i] = max( stairs[i] + stairs[i-1] + dp[i-3], stairs[i] + dp[i-2] )
    }
}
print(dp[length])