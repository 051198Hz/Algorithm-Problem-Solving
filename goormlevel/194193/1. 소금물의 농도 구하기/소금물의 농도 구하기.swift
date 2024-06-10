import Foundation
let nm = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = Double(nm[0]), m = Double(nm[1])
let cacl = n * 0.07
let requid = cacl / (n + m) //0.0x
let floored =  floor(requid*10000) / 100
print(String(format: "%.2f", floored))