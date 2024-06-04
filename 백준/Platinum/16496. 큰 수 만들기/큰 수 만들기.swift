import Foundation
let k = Int(readLine()!)!
let array = readLine()!.split{ $0 == " " }.map{ Decimal(string: String($0))! }
let answer = array.sorted{
    let lhs = NSDecimalNumber(decimal: $0).stringValue
    let rhs = NSDecimalNumber(decimal: $1).stringValue
    return Decimal(string: lhs + rhs)! > Decimal(string: rhs + lhs )!
}.map{ NSDecimalNumber(decimal: $0).stringValue}.reduce(""){ $0 + $1 }
print( answer.first! == "0" ? "0" : answer )