let n = Int(readLine()!)!
var input = [(Int, Int)]()
(0..<n).forEach { _ in
    let fromTo = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    input.append((fromTo[0], fromTo[1]))
}
let lines = input.sorted{ $0.0 < $1.0 }.map { $0.1 }

var dp = [Int](repeating: 1, count: lines.count)

for i in 0..<lines.count {
    for j in 0..<i {
        if lines[i] > lines[j] {
            dp[i] = max(dp[i], dp[j] + 1 )
        }
    }
}
print(lines.count - dp.max()!)