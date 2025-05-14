let decryptTable = [[0, 2, 0, 1],
                    [2, 1, 3, 0],
                    [0, 3, 2, 1],
                    [1, 0, 1, 3]]
let dnaNumberMap = ["A":0, "G":1, "C":2, "T":3]
let numberDnaMap = [0:"A", 1:"G", 2:"C", 3:"T"]

var stack = [Int]()

_=readLine()
var dna = readLine()!.map { dnaNumberMap[String($0)]! }

while !dna.isEmpty {
    let j = dna.popLast()!
    if stack.isEmpty {
        stack.append(j)
        continue
    }
    let k = stack.popLast()!
    let f = decryptTable[j][k]
    stack.append(f)
}
let answer = numberDnaMap[stack.popLast()!]!
print(answer)