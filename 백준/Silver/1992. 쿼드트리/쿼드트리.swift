func isAllSame(fromRow: Int, fromCol: Int, size: Int) -> Bool {
    let first = image[fromRow][fromCol]

    for i in fromRow..<fromRow+size {
        for j in fromCol..<fromCol+size {
            if first != image[i][j] { return false }
        }
    }
    return true
}

let n = Int(readLine()!)!
let image = (0..<n).map { _ in readLine()!.map { String($0) }}

func compress(fromRow: Int, fromCol: Int, size: Int) -> String {
    if isAllSame(fromRow: fromRow, fromCol: fromCol, size: size) {
        return image[fromRow][fromCol]
    }
    let compressed = compress(fromRow: fromRow, fromCol: fromCol, size: size/2) +
                    compress(fromRow: fromRow, fromCol: fromCol + size/2, size: size/2) +
                    compress(fromRow: fromRow + size/2, fromCol: fromCol, size: size/2) +
                    compress(fromRow: fromRow + size/2, fromCol: fromCol + size/2, size: size/2)

    return "(\(compressed))"
}

let result = compress(fromRow: 0, fromCol: 0, size: n)
print(result)