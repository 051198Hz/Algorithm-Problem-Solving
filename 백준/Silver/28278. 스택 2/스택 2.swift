var stack = [Int]()
var answer = ""
let n = Int(readLine()!)!

(0..<n).forEach { _ in
    let cmd = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
    switch cmd[0] {
    case 1:
        stack.append(cmd[1])
    case 2:
        answer.append("\(stack.popLast() ?? -1)\n")
    case 3:
        answer.append("\(stack.count)\n")
    case 4:
        answer.append("\(stack.isEmpty ? 1 : 0)\n")
    case 5:
        answer.append("\(stack.last ?? -1)\n")
    default: return
    }
}
print(answer)
