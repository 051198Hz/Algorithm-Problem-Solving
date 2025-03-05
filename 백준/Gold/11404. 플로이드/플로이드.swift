let inf = 987654321
/// 도시의 개수 n이 주어지고 둘째 줄에는 버스의 개수 m
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var costInfo = [[Int]](repeating: [Int](repeating: inf, count: n+1), count: n+1)
(1...n).forEach { v in costInfo[v][v] = 0 }
(0..<m).forEach { _ in
    let abc = readLine()!.split { $0 == " " }.map { Int(String($0))! }, a = abc[0], b = abc[1], c = abc[2]
    costInfo[a][b] = min(costInfo[a][b], c)
}
for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            guard costInfo[i][j] > costInfo[i][k] + costInfo[k][j] else { continue }
            costInfo[i][j] = costInfo[i][k] + costInfo[k][j]
        }
    }
}

let answer = costInfo.suffix(costInfo.count-1).reduce(into: "") { partialResult, line in
    partialResult.write(line.suffix(line.count-1).map { $0 == inf ? 0 : $0 }.map { String($0) }.joined(separator: " ") + "\n")
}
print(answer)