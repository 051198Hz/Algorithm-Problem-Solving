import Foundation

var wbPaperLength = Int(readLine()!)!
var wbPaper = Array<[String]>()

for _ in 0..<wbPaperLength{
    wbPaper.append(readLine()!.split{ $0 == " " }.map{ String($0) })
}
@discardableResult
func getNumberWB(paperLength: Int, StartX: Int, StartY:Int, paper: Array<[String]>)-> (Int, Int){
    var wNumber = 0
    for i in paper.indices where i >= StartY && i<StartY+paperLength{
        for j in paper.indices where j >= StartX && j<StartX+paperLength && paper[i][j] == "0"{
            wNumber += 1
        }
    }
    if wNumber == paperLength*paperLength{ return (1,0) }
    if wNumber == 0 { return (0,1) }
    
    let topLeft = getNumberWB(paperLength: paperLength/2, StartX: StartX, StartY: StartY, paper: paper)
    let topRight = getNumberWB(paperLength: paperLength/2, StartX: StartX+(paperLength/2), StartY: StartY, paper: paper)
    let bottomLeft = getNumberWB(paperLength: paperLength/2, StartX: StartX, StartY: StartY+(paperLength/2), paper: paper)
    let bottomRight = getNumberWB(paperLength: paperLength/2, StartX: StartX+(paperLength/2), StartY: StartY+(paperLength/2), paper: paper)
    
    return topLeft+topRight+bottomLeft+bottomRight
}
let wbNumber = getNumberWB(paperLength: wbPaperLength, StartX: 0, StartY: 0, paper: wbPaper)
print(wbNumber.0)
print(wbNumber.1)

func +(left: (Int,Int), right: (Int,Int)) -> (Int,Int) {
    return (left.0 + right.0, left.1 + right.1)
}