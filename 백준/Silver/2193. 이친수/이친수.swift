import Foundation
var length = Int(readLine()!)!
var pinaryNumbers = Array<Decimal>(repeating: 1, count: 91)
for i in pinaryNumbers.indices where i > 2 && i <= length{
    pinaryNumbers[i] = pinaryNumbers[i-1] + pinaryNumbers[i-2]
}
print(pinaryNumbers[length])