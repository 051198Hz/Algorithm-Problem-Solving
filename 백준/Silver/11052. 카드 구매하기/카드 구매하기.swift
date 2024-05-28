let targetNumber = Int(readLine()!)!
let packs = (readLine()!.split{ $0 == " " }.map{ Int($0)! } )
var dp = [Int](repeating: 0, count: targetNumber+1)
for i in 1...targetNumber{
    for j in 0..<i{
        dp[i] = max(dp[i], dp[i-j-1] + packs[j])
    }
}
print(dp[targetNumber])
