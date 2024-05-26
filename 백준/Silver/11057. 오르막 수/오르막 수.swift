import Foundation
let length = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: length+1)
for i in 0...9{ dp[1][i] = 1 }
if length > 1{
    for i in 2...length{
        for j in 0...9{
            for k in 0...j{
                dp[i][j] += (dp[i-1][k]%10007)
            }
        }
    }
}

print((dp[length].reduce(0){ $0 + $1}%10007))