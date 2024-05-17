let myMBTI = readLine()!
let number = Int(readLine()!)!
var answer = 0
for _ in 0..<number{
    if readLine()! == myMBTI{
        answer += 1
    }
}
print(answer)