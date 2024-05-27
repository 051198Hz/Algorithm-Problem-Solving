import Foundation
let time = Int(readLine()!)!
for _ in 0..<time{
let length = Int(readLine()!)!
    var stickers = [[Int]](repeating:[0], count: 2)
    stickers[0].append(contentsOf: readLine()!.split{ $0 == " " }.map{ Int($0)! })
    stickers[1].append(contentsOf: readLine()!.split{ $0 == " " }.map{ Int($0)! })        
    var dp = [[Int]](repeating:[Int](repeating: 0, count: length+1), count: 2)
    dp[0][1]=stickers[0][1]
    dp[1][1]=stickers[1][1]
    if length > 1 {
for i in 2...length{
    dp[0][i] = max(dp[1][i-2],dp[1][i-1]) + stickers[0][i]
    dp[1][i] = max(dp[0][i-2],dp[0][i-1]) + stickers[1][i]
}
}
    print(max(dp[0].last!,dp[1].last!))
}