var stack = [Int]()
var min = 1
_=readLine()!
for item in readLine()!.split(separator: " ").map({Int(String($0))!}){
    while(stack.last == min){
        stack.removeLast()
        min += 1
    }
    if item == min {
        min += 1
        continue
    }
    stack.append(item)
}
while(stack.last == min){
    stack.removeLast()
    min += 1
}
print( stack.count == 0 ? "Nice" : "Sad" )