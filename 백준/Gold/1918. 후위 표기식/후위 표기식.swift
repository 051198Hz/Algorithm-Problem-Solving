import Foundation

struct Stack<T>{
    var count: Int{
        return self.stack.count
    }
    var isEmpty: Bool{
        return stack.isEmpty
    }
    var top: T?{
        return stack.last
    }
    private var stack: [T] = []
    ///새 노드를 스택 위에 올림
    mutating func push(_ data: T){
        self.stack.append(data)
    }
    ///스택 최상단 노드의 데이터를 반환 후 노드 삭제
    mutating func pop()->T?{
        return self.stack.popLast()
    }
}

func getPostfix(Infix: String)->String?{
    var stack = Stack<Character>()
    var postfix = String()
    for element in Infix{
//        if element.isNumber || element == "."{
        if element.isUppercase{
            postfix.append(element)
        }else{
            if element == ")"{
                while(stack.isEmpty == false){
                    if stack.top! == "(" {
                        _ = stack.pop()!
                        break
                    }
                    postfix.append(stack.pop()!)
                }
            }else{
                while(stack.isEmpty == false){
                    //스택 안에 남아있는 연산자가 자신보다 높으면 안됨
                    //즉, 스택 top과 현재 op를 비교하여, top이 높으면
                    if stack.top!.isPrior(Op: element) == false {break}
                    if element != "(" { postfix.append(stack.pop()!) }
                }
                stack.push(element)
            }
        }
    }
    while(stack.isEmpty == false){
        postfix.append(stack.pop()!)
    }
    return postfix
}

extension Character{
    func isPrior(Op:Character)->Bool{
        //우선순위이므로 부등호의 방향은 반대
        return self.priority(inStack: true) <= Op.priority(inStack: false)
    }
    func priority(inStack:Bool)->Int{
        enum priority:Character{
            case LEFT_PARENT = "("
            case RIGHT_PARENT = ")"
            case PLUS = "+"
            case MINUS = "-"
            case MULTIPLY = "*"
            case DEVIDE = "/"
        }
        switch priority(rawValue: self){
        case .LEFT_PARENT:
            return inStack ? 3 : 0
        case .MULTIPLY,.DEVIDE:
            return 1
        case .PLUS,.MINUS:
            return 2
        default:
            return 987654321
        }
        return 987654321
    }
}

let input = readLine()!
let answer = getPostfix(Infix: input)
print(answer!)
