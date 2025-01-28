let n = Int(readLine()!)!
var answer = 0
(0..<n).forEach { _ in
    var appearCount = [[Int]](repeating: [], count: 26)
    var partialAnswer = 1
    for (index, alpha) in readLine()!.map({ String($0) }).enumerated() {
        let asciiValue = Int(alpha.first!.asciiValue!) - 97
        if !appearCount[asciiValue].isEmpty {
            if appearCount[asciiValue].last! != index - 1 {
                partialAnswer = 0
                break
            }
        }
        appearCount[asciiValue].append(index)
    }
    answer += partialAnswer
}
print(answer)