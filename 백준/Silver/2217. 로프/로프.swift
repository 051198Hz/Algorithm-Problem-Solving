import Foundation
var ropes : [Int] = []
let ropeNum = Int(readLine()!)!
for _ in 0..<ropeNum{
    ropes.append(Int(readLine()!)!)
}
ropes.sort(by: {$0 > $1})
var maxW = 0
for i in 0..<ropeNum{
    let curMaxW = ropes[i] * (i + 1)
    maxW = curMaxW > maxW ? curMaxW : maxW
}
print(maxW)


