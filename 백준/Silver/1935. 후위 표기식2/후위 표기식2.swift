import Foundation
let n = Int(readLine()!)!
print(String(format: "%.2f", calcPostex(postfix: readLine()!.map{String($0)})))
func calcPostex(postfix: [String])->Double{
    var aToi = [Double]()
    for _ in 0..<n{
        aToi.append(Double(readLine()!)!)
    }
    var stack = [Double]()
    postfix.forEach{
        if $0.first!.isUppercase{
            stack.append(aToi[ Int($0.first!.asciiValue! - 65) ])
        }else{
            let b = stack.popLast()!
            let a = stack.popLast()!
            var res = 0.0
            switch $0{
            case "+": res = a+b
            case "-": res = a-b
            case "*": res = a*b
            default: res = a/b
            }
            stack.append(res)
        }
    }
    return stack.popLast()!
}
