var stack = ""
for ps in readLine()!{
    if stack.last == "(" && ps == ")"{
        stack.popLast()
        continue
    }
    stack.append(ps)
}
print(stack.count)