let times = Int(readLine()!)!
for _ in 0..<times{
    var stack: [Int] = []
    let ps = readLine()!
    var isVPS = true
    for element in ps{
        switch element{
        case "(" : stack.append(0)
        default : if stack.popLast() == nil{
            isVPS = false
            break
        }
        }
    }
    if isVPS{
        if stack.isEmpty{
            print("YES")
        }else{
            print("NO")
        }
    }else{
        print("NO")
    }
}