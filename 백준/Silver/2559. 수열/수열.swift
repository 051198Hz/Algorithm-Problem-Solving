import Foundation

let nk = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = nk[0], k = nk[1]

var cSum = [0]
let numbers: [Int] = readLine()!.split{ $0 == " " }.map{
    let number = Int(String($0))!
    let k = cSum.last!
    cSum.append(k + number)
    return number
}
var maxSum = Int.min

for i in k..<cSum.count {
    maxSum = max(maxSum, cSum[i] - cSum[i-k])
}

print(maxSum)

