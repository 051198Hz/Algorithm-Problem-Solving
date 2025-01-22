let n = Int(readLine()!)!
let scores = readLine()!.split { $0 == " " }.map { Double(String($0))! }
let max = scores.max()!
let answer = scores.map { $0 / max * 100 }.reduce(0, +) / Double(scores.count)
print(answer)