_=readLine()!
var idx = 0
var towers:[(height:Int,idx:Int)] = readLine()!.split(separator: " ").map{
    idx += 1
    return (height:Int(String($0))!, idx: idx)
}
var arrived = [Bool](repeating: false, count: towers.count + 1)
var lazers = [(height:Int,idx:Int)]()

var answer = [Int](repeating: 0, count: towers.count)

while(true){
    
    lazers.append(towers.popLast()!)
    if towers.isEmpty {
        break
    }
    while(lazers.isEmpty == false && towers.last!.height > lazers.last!.height){
        answer[lazers.popLast()!.idx - 1] = towers.last!.idx
    }

}

answer.forEach{ print($0,terminator: " ") }