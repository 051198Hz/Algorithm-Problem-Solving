let nk = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = nk[0], k = nk[1]
var dp = [[Int]](repeating: [Int](repeating:0,count: k+1), count: n+1)
for i in 0...k{
    dp[0][i] = 1
}
for i in 1...n{
    for j in 1...k{
        for t in 0...i{
            dp[i][j] += dp[t][j-1] % 1000000000
        }
        dp[i][j] %= 1000000000
    }
}
print(dp[n][k])