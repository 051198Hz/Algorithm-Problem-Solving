import Foundation

func solution(_ numbers:[Int]) -> String {
    let answer = numbers.sorted(by: compare).map{ String($0) }.reduce(""){ $0 + $1 }
    var notOnlyZero = false
    answer.forEach{ if $0 != "0"{
        notOnlyZero = true
    }}
    if answer.count > 1 && !notOnlyZero{
        return "0"
    }
    return answer
}

func compare(lhs: Int, rhs: Int)->Bool{
    let strLhs = String(lhs)
    let strRhs = String(rhs)
    
    return strLhs + strRhs > strRhs + strLhs ? true : false
    
}