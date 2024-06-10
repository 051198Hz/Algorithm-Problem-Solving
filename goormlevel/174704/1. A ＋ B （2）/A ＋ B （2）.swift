import Foundation
let input = readLine()!.split{ $0 == " " }.map{ Double($0)! }.reduce(0){ $0+$1}
print(String(format:"%.6f", input))