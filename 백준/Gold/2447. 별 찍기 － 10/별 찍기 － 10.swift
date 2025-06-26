let n = Int(readLine()!)!
var fractal = [[String]](repeating: [String](repeating: " ", count: n), count: n)

func draw(fromRow: Int, fromCol: Int, size: Int) {
    if size == 3 {
        fractal[fromRow][fromCol] = "*"
        fractal[fromRow][fromCol+1] = "*"
        fractal[fromRow][fromCol+2] = "*"

        fractal[fromRow+1][fromCol] = "*"
        fractal[fromRow+1][fromCol+2] = "*"

        fractal[fromRow+2][fromCol] = "*"
        fractal[fromRow+2][fromCol+1] = "*"
        fractal[fromRow+2][fromCol+2] = "*"
        return
    }
    draw(fromRow: fromRow, fromCol: fromCol, size: size/3)
    draw(fromRow: fromRow, fromCol: fromCol + size/3, size: size/3)
    draw(fromRow: fromRow, fromCol: fromCol + size/3 + size/3, size: size/3)

    draw(fromRow: fromRow + size/3, fromCol: fromCol, size: size/3)
    draw(fromRow: fromRow + size/3, fromCol: fromCol + size/3 + size/3, size: size/3)

    draw(fromRow: fromRow + size/3 + size/3, fromCol: fromCol, size: size/3)
    draw(fromRow: fromRow + size/3 + size/3, fromCol: fromCol + size/3, size: size/3)
    draw(fromRow: fromRow + size/3 + size/3, fromCol: fromCol + size/3 + size/3, size: size/3)
}

draw(fromRow: 0, fromCol: 0, size: n)
let result = fractal.map { $0.reduce(into: "") { $0.write($1) } }.joined(separator: "\n")

print(result)