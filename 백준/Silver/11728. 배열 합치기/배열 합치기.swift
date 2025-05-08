let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! },
    n = nm[0],
    m = nm[1]
var listA: [Int] = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var listB: [Int] = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let answer = (listA + listB).sorted { $0 < $1 }.map { "\($0) "}.joined()
print(answer)