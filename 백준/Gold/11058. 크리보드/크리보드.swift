import Foundation
let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)
for i in 1...n{
    dp[i] = i
    for j in 0...i-1{
        //전복붙붙붙...
        if i - j - 3 > 0{ dp[i] = max(dp[i], dp[j]+dp[j]*(i-j-2)) }
        //전복붙
        else if i - j - 3 == 0{ dp[i] = max(dp[i], dp[j]*2) }
    }
}
print(dp[n])