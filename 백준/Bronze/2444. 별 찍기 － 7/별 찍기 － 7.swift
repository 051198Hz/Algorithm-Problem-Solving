let n = Int(readLine()!)!-1
var answer = ""
for i in stride(from: -1*n, through: n, by: 1) {
    answer.write(String(repeating: " ",count: abs(i)))
    answer.write(String(repeating: "*", count: (2*n)-1 - (2*abs(i)-2)))
    answer.write("\n")
}
print(answer)