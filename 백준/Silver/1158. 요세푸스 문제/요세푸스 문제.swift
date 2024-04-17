let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = nk.first!
var k = nk.last!
var stack = [Int](stride(from: n, to: 0, by: -1))
var tmpStack = [Int]()
var count = 0
var answer = "<"
while(!stack.isEmpty){
    count += 1
    if count % k == 0{
        answer += "\(stack.removeLast()), "
    }else{
        tmpStack.append(stack.removeLast())
    }
    if stack.isEmpty {
        stack = tmpStack.reversed()
        tmpStack = []
    }
}
answer.removeLast()
answer.removeLast()
print(answer+">")