import Foundation
//별 4 동그라미 3 네모 2 세모 1
let roundCount = Int(readLine()!)!
for _ in 0..<roundCount{
    var ddakgiA = [Int](repeating:0, count: 5)
    var ddakgiB = [Int](repeating:0, count: 5)
	
    let ddakgiA$ = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    for i in stride(from: 1, to: ddakgiA$.count, by:1){
        ddakgiA[ddakgiA$[i]] += 1
    }
    let ddakgiB$ = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    for i in stride(from: 1, to: ddakgiB$.count, by:1){
        ddakgiB[ddakgiB$[i]] += 1
    }
		var isDraw = true
    for i in stride(from: 4, to: 0, by: -1){
    if ddakgiA[i] > ddakgiB[i] {
        print("A")
			isDraw = false
        break
    }
    if ddakgiB[i] > ddakgiA[i] {
        print("B")
			isDraw = false
        break
    }
    }
	if isDraw { print("D") }
}
	print()