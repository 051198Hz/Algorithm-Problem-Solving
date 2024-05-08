let count = Int(readLine()!)!
let sequences = readLine()!.split(separator: " ").map{ Int($0)! }
var length = 0
var dp: [Int] = Array(repeating:1, count: count)
dp[0] = 1
for i in sequences.indices where i > 0{
    for j in sequences.indices where j < i{
        let n1 = sequences[i]
        let n2 = sequences[j]
        if sequences[i] > sequences[j]{
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}

print(dp.max()!)