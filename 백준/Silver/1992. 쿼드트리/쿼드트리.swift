import Foundation
var wbPaperLength = Int(readLine()!)!
var wbPaper = Array<[Bool]>()
var answer = "("
for _ in 0..<wbPaperLength{
    wbPaper.append(readLine()!.map{ (String($0) as NSString).boolValue })
}
func compress(paperLength: Int, StartX: Int, StartY:Int, paper: Array<[Bool]>)->String{
    var answer = ""
    var wNumber = 0
    for i in paper.indices where i >= StartY && i<StartY+paperLength{
        for j in paper.indices where j >= StartX && j<StartX+paperLength && paper[i][j] == false{
            wNumber += 1
        }
    }
    if wNumber == paperLength*paperLength{ 
        answer += "0"
        return answer }
    if wNumber == 0 {
        answer += "1"
        return answer
    }
    
    var topLeft = compress(paperLength: paperLength/2, StartX: StartX, StartY: StartY, paper: paper)
    if topLeft.count != 1{
        topLeft = "(" + topLeft + ")"
    }
    var topRight = compress(paperLength: paperLength/2, StartX: StartX+(paperLength/2), StartY: StartY, paper: paper)
    if topRight.count != 1{
        topRight = "(" + topRight + ")"
    }
    var bottomLeft = compress(paperLength: paperLength/2, StartX: StartX, StartY: StartY+(paperLength/2), paper: paper)
    if bottomLeft.count != 1{
        bottomLeft = "(" + bottomLeft + ")"
    }
    var bottomRight = compress(paperLength: paperLength/2, StartX: StartX+(paperLength/2), StartY: StartY+(paperLength/2), paper: paper)
    if bottomRight.count != 1{
        bottomRight = "(" + bottomRight + ")"
    }
    
    return topLeft+topRight+bottomLeft+bottomRight
}
var wbNumber = compress(paperLength: wbPaperLength, StartX: 0, StartY: 0, paper: wbPaper)
if wbNumber.count != 1{ wbNumber = "(" + wbNumber + ")" }
print( wbNumber )

func +(left: (Int,Int), right: (Int,Int)) -> (Int,Int) {
    return (left.0 + right.0, left.1 + right.1)
}
