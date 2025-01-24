let ab = readLine()!.reversed().split { $0 == " " }.map { Int(String($0))! }
let answer = max(ab[0], ab[1])
print(answer)