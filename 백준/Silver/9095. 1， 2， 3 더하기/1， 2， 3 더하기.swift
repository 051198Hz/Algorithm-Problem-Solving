import Foundation
var times = Int(readLine()!)!
var dp = Array<[Int]>(repeating: [Int](repeating: 0, count: 4), count: 11)
dp[1][1] = 1
dp[2][1] = 1
dp[2][2] = 1
dp[3][1] = 2
dp[3][2] = 1
dp[3][3] = 1
for i in 4...10{
    for j in 1...3{
            dp[i][j] = dp[i-j][1] + dp[i-j][2] + dp[i-j][3]
    }
}
for _ in 0..<times{
    let number = Int(readLine()!)!
    print(dp[number].reduce(0){ $0 + $1})
}