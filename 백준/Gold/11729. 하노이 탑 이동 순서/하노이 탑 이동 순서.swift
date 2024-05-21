import Foundation
//int인 from, to, through를 String으로 바꾼 풀이
let maxPlate = Int(readLine()!)!
var count = 0
var answer = ""
Hanoi(biggerPlate: maxPlate, from: "1", to: "3", through: "2")
print(count)
print(answer)
func Hanoi(biggerPlate: Int, from: String, to: String, through: String){
    if biggerPlate == 1{
        answer += "\(from) \(to)\n"
        count += 1
        return
    }
    Hanoi(biggerPlate: biggerPlate - 1, from: from, to: through, through: to)
    answer += "\(from) \(to)\n"
    count += 1
    Hanoi(biggerPlate: biggerPlate - 1, from: through, to: to, through: from)
}