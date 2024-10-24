import Foundation

let nk = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = nk[0], k = nk[1]

var cSum = [0]
let numbers: [Int] = readLine()!.split{ $0 == " " }.map{  Int(String($0))! }
numbers.forEach{ cSum.append(cSum.last! + $0) }

var maxSum = Int.min

let answer = (k..<cSum.count).map{ i in max(maxSum, cSum[i] - cSum[i-k]) }.max()!

print(answer)