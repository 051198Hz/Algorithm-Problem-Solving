let t = Int(readLine()!)!
var output = ""


var dp = [[Int]](repeating: [Int](repeating: 0, count: 2001), count: 11)

dp[0][0] = 1

for i in 1...10 {
    for j in 1...2000 {
        for l in stride(from: 0, through: j/2, by: 1) {
            dp[i][j] += dp[i-1][l]
        }
    }
}

for _ in 0..<t {
    let nm = readLine()!.split { $0 == " " }.map { Int($0)! },
        n = nm[0],
        m = nm[1]
    let answer = dp[n].prefix(m+1).reduce(0, +)
    output.write("\(answer)\n")
}

print(output)