let abc = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (a, b, c) = (abc[0], abc[1], abc[2])

var answer = ""

if a == b && b == c {
    answer.write("\(10000 + (a*1000))")
} else if a == b || b == c || c == a {
    var k = a == b ? a : c
    k = b == c ? b : a
    k = c == a ? c : b
    answer.write("\(1000 + (k*100))")
} else {
    let k = max(a,max(b,c))
    answer.write("\(k*100)")
}
print(answer)