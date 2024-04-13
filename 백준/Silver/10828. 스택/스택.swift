
let times = Int(readLine()!)!
var stack: [Int] = []
for _ in 0..<times{
    let action = readLine()!.split(separator: " ").map{String($0)}
    switch action[0]{
    case "push":
        stack.append(Int(action[1])!)
        break
    case "pop":
        print( stack.popLast() ?? -1 )
        break
    case "size":
        print( stack.count )
        break
    case "empty":
        print( stack.isEmpty ? 1 : 0 )
        break
    case "top":
        print( stack.last ?? -1)
        break
    default:
        break
    }
}