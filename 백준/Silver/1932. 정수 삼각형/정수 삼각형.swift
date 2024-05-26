import Foundation
let length = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating:0, count: length), count: length)
var tri = [[Int]](repeating: [], count: length)
for i in 0..<length{
    tri[i] = readLine()!.split{ $0 == " " }.map{ Int($0)! }
}
dp[0][0] = tri[0][0]
for i in 1..<length{
    for j in 0..<tri[i].count{
        if j == 0{
            dp[i][j] = dp[i-1][j] + tri[i][j]
            continue
        }
        if j == tri.count-1{
            dp[i][j] = dp[i-1][j-1] + tri[i][j]
            continue
        }
        dp[i][j] = max(dp[i-1][j] + tri[i][j], dp[i-1][j-1] + tri[i][j])
    }
}
print(dp.last!.max()!)