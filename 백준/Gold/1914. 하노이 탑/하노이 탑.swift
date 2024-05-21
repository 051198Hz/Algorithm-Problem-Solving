import Foundation
let maxPlate = Int(readLine()!)!
var count = pow(2, maxPlate)-1
print(count)
var answer = ""
if maxPlate <= 20 {
    Hanoi(biggerPlate: maxPlate, from: 1, to: 3, through: 2)
    print(answer)
}
func Hanoi(biggerPlate: Int, from: Int, to: Int, through: Int){
    if biggerPlate == 1{
        answer += "\(from) \(to)\n"
        return
    }
    Hanoi(biggerPlate: biggerPlate - 1, from: from, to: through, through: to)
    answer += "\(from) \(to)\n"
    Hanoi(biggerPlate: biggerPlate - 1, from: through, to: to, through: from)
}