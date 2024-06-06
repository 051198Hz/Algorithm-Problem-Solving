let str1 = readLine()!.map{ String($0) }
let str2 = readLine()!.map{ String($0)}
var dp = [[Int]](repeating: [Int](repeating: 0, count: str1.count+1), count: str2.count+1)

for i in 1...str2.count{
    for j in 1...str1.count{
        if str1[j-1] == str2[i-1]{
            dp[i][j] = dp[i-1][j-1] + 1
            continue
        }
        dp[i][j] = max(dp[i-1][j], dp[i][j-1])
    }
}
print(dp[str2.count][str1.count])