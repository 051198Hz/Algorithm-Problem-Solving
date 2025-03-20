let r1s = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let r2 = (2*r1s[1]) - r1s[0]
print(r2)