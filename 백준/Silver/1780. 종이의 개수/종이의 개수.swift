struct Classification {
    var nega: Int
    var zero: Int
    var posi: Int

    static func += (lhs: inout Classification, rhs: Classification) {
        lhs.nega += rhs.nega
        lhs.zero += rhs.zero
        lhs.posi += rhs.posi
    }
}

func isAllSame(fromRow: Int, fromCol: Int, size: Int) -> Bool {
    let first = paper[fromRow][fromCol]
    
    for i in (fromRow..<fromRow+size){
        for j in (fromCol..<fromCol+size){
            if paper[i][j] != first { return false }
        }
    }
    return true
}

func paperClassificate(fromRow: Int, fromCol: Int, size: Int) -> Classification {
    var paperClass = Classification(nega: 0, zero: 0, posi: 0)
    if isAllSame(fromRow: fromRow, fromCol: fromCol, size: size) {
        switch paper[fromRow][fromCol] {
            case -1:
                paperClass += Classification(nega: 1, zero: 0, posi: 0)
            case 0:
                paperClass += Classification(nega: 0, zero: 1, posi: 0)
            default:
                paperClass += Classification(nega: 0, zero: 0, posi: 1)
        }
    } else {
        paperClass += paperClassificate(fromRow: fromRow, fromCol: fromCol, size: size/3)
        paperClass += paperClassificate(fromRow: fromRow, fromCol: fromCol+size/3, size: size/3)
        paperClass += paperClassificate(fromRow: fromRow, fromCol: fromCol+size/3+size/3, size: size/3)
        
        paperClass += paperClassificate(fromRow: fromRow+size/3, fromCol: fromCol, size: size/3)
        paperClass += paperClassificate(fromRow: fromRow+size/3, fromCol: fromCol+size/3, size: size/3)
        paperClass += paperClassificate(fromRow: fromRow+size/3, fromCol: fromCol+size/3+size/3, size: size/3)
        
        paperClass += paperClassificate(fromRow: fromRow+size/3+size/3, fromCol: fromCol, size: size/3)
        paperClass += paperClassificate(fromRow: fromRow+size/3+size/3, fromCol: fromCol+size/3, size: size/3)
        paperClass += paperClassificate(fromRow: fromRow+size/3+size/3, fromCol: fromCol+size/3+size/3, size: size/3)
    }
    return paperClass
}

let n = Int(readLine()!)!

let paper = (0..<n).map {  _ in
    readLine()!.split { $0 == " " }.map { Int(String($0))! }
}

let answer = paperClassificate(fromRow: 0, fromCol: 0, size: n)
print(answer.nega)
print(answer.zero)
print(answer.posi)