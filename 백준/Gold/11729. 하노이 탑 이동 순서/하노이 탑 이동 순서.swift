import Foundation
//int인 from, to, through를 String으로 바꾼 풀이
let maxPlate = Int(readLine()!)!
var hanoi = Hanoi()
hanoi.getMoveWithCount(biggerPlate: maxPlate, from: "1", to: "3", through: "2")
print(hanoi.count)
print(hanoi.answer)
struct Hanoi{
    var count = 0
    var answer = ""
    mutating func getMoveWithCount(biggerPlate: Int, from: String, to: String, through: String){
        if biggerPlate == 1{
            answer += "\(from) \(to)\n"
            count += 1
            return
        }
        getMoveWithCount(biggerPlate: biggerPlate - 1, from: from, to: through, through: to)
        answer += "\(from) \(to)\n"
        count += 1
        getMoveWithCount(biggerPlate: biggerPlate - 1, from: through, to: to, through: from)
    }
}