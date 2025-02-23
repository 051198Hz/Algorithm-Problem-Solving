let ampere = Int(readLine()!)!
let wattVolt = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let answer = wattVolt[0] / wattVolt[1] >= ampere ? 1 : 0
print(answer)