var answer = ""

while let input = readLine() {
    let ab = input.split { $0 == " " }.map { Int(String($0))! },
        a = ab[0],
        b = ab[1]
    if a == 0 && b == 0 { break }
    if a.isFactor(of: b) { 
        answer.write("factor\n")
        continue
    }
    if a.isMultiple(of: b) {
        answer.write("multiple\n")
        continue
    }
    answer.write("neither\n")
}

print(answer)

extension Int {
    func isFactor(of a: Int) -> Bool {
        if self == 0 { return false }
        return (a % self) == 0
    }
    
    func isMultiple(of a: Int) -> Bool { 
        if a == 0 { return false }
        return (self % a) == 0
    }
}