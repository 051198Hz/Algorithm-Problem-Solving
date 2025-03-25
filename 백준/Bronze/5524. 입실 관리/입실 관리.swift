let n = Int(readLine()!)!
let answer = (0..<n).map { _ in readLine()!.lowercased() }.joined(separator: "\n")
print(answer)
