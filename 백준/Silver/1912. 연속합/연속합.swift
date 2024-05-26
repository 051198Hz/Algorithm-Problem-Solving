import Foundation
let length = Int(readLine()!)!
var dp = [Int](repeating: 0, count: length)
var seq = readLine()!.split{ $0 == " " }.map{ Int($0)! }
dp[0] = seq[0]
for i in 1..<length{
    dp[i] = max( seq[i], dp[i-1] + seq[i] )
}
print(dp.max()!)