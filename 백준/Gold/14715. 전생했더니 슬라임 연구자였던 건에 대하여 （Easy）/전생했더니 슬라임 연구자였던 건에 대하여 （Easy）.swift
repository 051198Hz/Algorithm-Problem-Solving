import Foundation


var k = Int(readLine()!)!
var lastSlimeCount = 0
var divider = 2
while k != 1 {
    while k % divider == 0 {
        lastSlimeCount += 1
        k /= divider
    }
    divider += 1
}
let answer = Int(log2(Double(lastSlimeCount)).rounded(.up))

print(answer)