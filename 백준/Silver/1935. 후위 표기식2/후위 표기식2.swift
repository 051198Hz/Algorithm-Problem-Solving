import Foundation

let n = Int(readLine()!)!
let postEx = readLine()!.map{String($0)}

var aToi = [Double]()
while(aToi.count < n){
    aToi.append(Double(readLine()!)!)
}

func calcPostex(postfix: [String])->Double{
    var stack = [Double]()
    postfix.forEach{
        if $0.first!.isUppercase{
            let number = aToi[ Int($0.first!.asciiValue! - 65) ]
            stack.append(number)
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
let answer = calcPostex(postfix: postEx)
print(String(format: "%.2f", answer))
