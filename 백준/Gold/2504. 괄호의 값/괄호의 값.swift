import Foundation

var stack: [Int] = []

l: for c in readLine()!{
    switch c{
    case "(": stack.append(-1)
    case "[": stack.append(-2)
    case ")":
        if let last = stack.last{
            //이전값이 여는 괄호라면, 3점을 append
            if last == -1{
                stack.removeLast()
                stack.append(2)
                continue
            }
            //숫자라면, 괄호 내 모든 숫자를 더한 결과를 append
            var result = 0
            while stack.last != nil{
                if stack.last! == -2 {
                    print(0)
                    exit(0)
                }
                if stack.last! == -1 {
                    stack.removeLast()
                    stack.append(2 * result)
                    continue l
                }
                result += stack.removeLast()
            }
            //()()())()()()
            //반복문을 탈출하지 못했다면 입력의 첫번째 까지 여는 괄호가 없는것이므로, notVPS
            print(0)
            exit(0)
        } else {
            print(0)
            exit(0)
        }
    default:
        if let last = stack.last{
            //이전값이 여는 괄호라면, 3점을 append
            if last == -2 {
                stack.removeLast()
                stack.append(3)
                continue
            }
            //숫자라면, 괄호 내 모든 숫자를 더한 결과를 append
            var result = 0
            while stack.last != nil{
                if stack.last! == -1 {
                    print(0)
                    exit(0)
                }
                if stack.last! == -2 {
                    stack.removeLast()
                    stack.append(3 * result)
                    continue l
                }
                result += stack.removeLast()
            }
            //()()())()()()
            //반복문을 탈출하지 못했다면 입력의 첫번째 까지 여는 괄호가 없는것이므로, notVPS
            print(0)
            exit(0)
        } else {
            print(0)
            exit(0)
        }
    }
}

if stack.allSatisfy({ $0 != -1 && $0 != -2}){
    print(stack.reduce(0){ $0 + $1 })
    exit(0)
}
print(0)
