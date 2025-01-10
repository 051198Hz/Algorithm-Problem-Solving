var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 21), count: 21), count: 21)

while true {
    var answer = ""
    var abc = readLine()!.split { $0 == " " }.map{ Int(String($0))! }
    guard abc != [-1, -1, -1] else { break }
    answer.write("w(\(abc[0]), \(abc[1]), \(abc[2])) = ")
    if !abc.filter({ $0 <= 0 }).isEmpty {
        abc = [0, 0, 0]
    }
    if !abc.filter({ $0 > 20 }).isEmpty {
        abc = [20, 20, 20]
    }
    for a in 0...abc[0] {
        for b in 0...abc[1] {
            for c in 0...abc[2] {
                if a == 0 || b == 0 || c == 0 {
                    dp[a][b][c] = 1
                    continue
                }
                else if a < b && b < c{
                    dp[a][b][c] = dp[a][b][c-1] + dp[a][b-1][c-1] - dp[a][b-1][c]
                    continue
                } else {
                    dp[a][b][c] = dp[a-1][b][c] + dp[a-1][b-1][c] + dp[a-1][b][c-1] - dp[a-1][b-1][c-1]
                }
            }
        }
    }
    answer.write("\(dp[abc[0]][abc[1]][abc[2]])")
    print(answer)
}