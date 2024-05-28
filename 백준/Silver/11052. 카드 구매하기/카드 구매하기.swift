import Foundation
let targetNumber = Int(readLine()!)!
let packs = [0] + (readLine()!.split{ $0 == " " }.map{ Int($0)! } )
var dp = [Int](repeating: 0, count: targetNumber+1)
dp[1] = packs[1]
//카드를 1개 살 때 최대값
//카드를 2개 살 때 최대값
//...
//카드를 n개 살 때 최대값

// 카드를 1개 살 때 최댓값
// = 카드팩 0개살 때 최댓값 + 1개짜리 카드팩, 1개짜리 카드팩
// 카드를 2개 살 때 최댓값
// = 카드팩 0개살 때 최댓값 + 2개짜리 카드팩, 카드 1개살 때 최댓값 + 1개짜리 카드팩
// 카드를 3개 살 때 최댓값
// = 카드 0개살 때 최댓값 + 3개짜리 카드팩, 카드팩 1개살 때 최댓값 + 2개짜리 카드팩, 카드팩 2개살 때 최댓값 + 1개짜리 카드팩
// p[i] = max(dp[i], dp[j] + packs[i-j])
if targetNumber > 1{
    for i in packs.indices where i > 1{
        for j in 0..<i{
            dp[i] = max(dp[i], dp[j] + packs[i-j])
        }
    }
}
print(dp[targetNumber])