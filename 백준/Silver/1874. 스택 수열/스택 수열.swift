func solution(exp: [Int])->[String]?{
    var ops = [String]()
    var stack = [Int]()
    var max = 0
    
    for number in exp{
        if number > max{
            for i in (max + 1)...number{
                stack.append(i)
                ops.append("+")
            }
            max = number
        }
        if number != stack.popLast(){
            return nil
        }
        ops.append("-")
    }
    return ops
}

let input = Int(readLine()!)!

var exp = [Int]()

for _ in 0..<input{
    let number = Int(readLine()!)!
    exp.append(number)
}

if let ops = solution(exp: exp){
    ops.forEach{print($0)}
}else{
    print("NO")
}