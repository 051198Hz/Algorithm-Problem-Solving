var answer = ""
while let input = readLine(), let baseNumber = Int(input) , baseNumber != 0{
    answer.write(String((1...baseNumber).reduce(0, +))+"\n")
}
print(answer)