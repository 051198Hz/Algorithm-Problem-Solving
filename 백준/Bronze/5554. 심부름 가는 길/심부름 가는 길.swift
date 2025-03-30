let totalTime = (0..<4).map { _ in Int(readLine()!)! }.reduce(0, +)
let x = totalTime / 60
let y = totalTime % 60
print(x)
print(y)