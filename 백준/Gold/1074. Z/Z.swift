import Foundation

func recursiveMove(fromRow: Int, fromCol: Int, size: Int) -> Bool {
    if size == 1 {
        count += 1
        if fromRow == r, fromCol == c {
            return true
        }
        return false
    }
    if (fromRow..<fromRow+size/2).contains(r), (fromCol..<fromCol+size/2).contains(c) {
        if recursiveMove(fromRow: fromRow, fromCol: fromCol, size: size/2) { return true }
    }else {
        count += (size/2)*(size/2)
    }
    if (fromRow..<fromRow+size/2).contains(r), (fromCol+size/2..<fromCol+size).contains(c) {
        if recursiveMove(fromRow: fromRow, fromCol: fromCol+size/2, size: size/2) { return true }
    } else {
        count += (size/2)*(size/2)
    }
    if (fromRow+size/2..<fromRow+size).contains(r), (fromCol..<fromCol+size/2).contains(c) {
        if recursiveMove(fromRow: fromRow+size/2, fromCol: fromCol, size: size/2) { return true }
    } else {
        count += (size/2)*(size/2)
    }
    if (fromRow+size/2..<fromRow+size).contains(r), (fromCol+size/2..<fromCol+size).contains(c) {
        if recursiveMove(fromRow: fromRow+size/2, fromCol: fromCol+size/2, size: size/2) { return true }
    }
    return false
}

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = input[0],
    r = input[1],
    c = input[2]

let size = Int(pow(Double(2), Double(n)))

var count = 0
_=recursiveMove(fromRow: 0, fromCol: 0, size: size)
print(count-1)