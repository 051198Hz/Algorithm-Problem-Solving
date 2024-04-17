var stack:[Character] = []
for ps in readLine()!{
    if stack.last == "(" && ps == ")"{
        _=stack.popLast()
    }else{
        stack.append(ps)
    }
}
print(stack.count)