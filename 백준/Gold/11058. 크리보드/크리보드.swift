import Foundation
let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)
for i in 1...n{
    dp[i] = i
    for j in 0...i-1{
        if i - j - 3 > 0{ //전복붙붙붙...
            dp[i] = max(dp[i], dp[j]+dp[j]*(i-j-2))
        }
        else if i - j - 3 == 0{ //전복붙
            dp[i] = max(dp[i], dp[j]*2)
        }
        else{ //이전출력+a
            dp[i] = max(dp[i], dp[j] + i-j)
        }
    }
}
print(dp[n])