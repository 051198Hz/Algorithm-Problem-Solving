import Foundation

let decryptTable = [[0, 2, 0, 1],
                    [2, 1, 3, 0],
                    [0, 3, 2, 1],
                    [1, 0, 1, 3]]
let dnaNumberMap: [String.Element:Int] = ["A":0, "G":1, "C":2, "T":3]
let numberDnaMap: [Int:String.Element] = [0:"A", 1:"G", 2:"C", 3:"T"]


_=readLine()
var dna = readLine()!

var result: String.Element = " "
for i in dna.indices.reversed() {
    if result == " " { 
        result = dna[i]
        continue
    }
    let k = dnaNumberMap[dna[i]]!
    let p = dnaNumberMap[result]!
    let j = decryptTable[k][p]
    result = numberDnaMap[j]!
}
print(result)