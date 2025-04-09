let totalPrice = Int(readLine()!)!
let knownPrice = (0..<9).map { _ in Int(readLine()!)! }.reduce(0, +)
let answer = totalPrice - knownPrice
print(answer)