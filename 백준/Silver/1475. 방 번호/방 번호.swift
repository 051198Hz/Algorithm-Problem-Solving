import Foundation
var plasticNum: [Int] = Array(repeating: 0, count: 10)
for n in (readLine()!) {
    plasticNum[Int(String(n))!] += 1
}

plasticNum[6] = (plasticNum[6] + plasticNum.removeLast() + 1) / 2
print(plasticNum.max()!)