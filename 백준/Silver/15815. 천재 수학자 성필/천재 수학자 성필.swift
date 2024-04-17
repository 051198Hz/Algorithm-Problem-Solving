let posfix = readLine()!
var stack = [Int]()
for c in posfix{
    if c.isNumber {
        stack.append(Int(String(c))!)
        continue
    }
    let b = stack.removeLast()
    let a = stack.removeLast()
    switch c{
    case "+":
        stack.append(a+b)
    case "-":
        stack.append(a-b)
    case "*":
        stack.append(a*b)
    default:
        stack.append(a/b)
    }
    
}
print(stack.first!)