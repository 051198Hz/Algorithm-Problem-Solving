let lp = readLine()!.split { $0 == " " }.map { Int(String($0))! }.reduce(1, *)
let numbers = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let answer = numbers.map { $0 - lp }.reduce(into: "") {
    $0.write("\($1) ")
}
print(answer)