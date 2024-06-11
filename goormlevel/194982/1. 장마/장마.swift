import Foundation
let nm = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = nm[0], m = nm[1]
//n 집개수 m 장마기간
var heights = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var isRained: [Int] = []
for i in 1...m{
    let rangeRain = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    for i in rangeRain[0]...rangeRain[1]{
        heights[i-1] += 1
        isRained.append(i-1)
    }
    if i%3 == 0{
        Set(isRained).forEach{
            heights[$0] -= 1
        }
        isRained = []
    }
}
heights.forEach{ print("\($0) ", terminator: "") }