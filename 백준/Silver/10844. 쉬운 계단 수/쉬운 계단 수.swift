import Foundation
let div = 1_000_000_000
let length = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 11), count: length+1)
for i in 1...9{ dp[1][i] = 1 }
if length > 1{
    for i in 2...length{
        for j in 0...9{
            if j == 0{
                dp[i][j] = dp[i-1][j+1]%div
                continue
            }
            if j == 9{
                dp[i][j] = dp[i-1][j-1]%div
                continue
            }
            dp[i][j] = dp[i-1][j-1]%div + dp[i-1][j+1]%div
        }
    }
}
print(dp[length].reduce(0){ $0 + $1 }%div)