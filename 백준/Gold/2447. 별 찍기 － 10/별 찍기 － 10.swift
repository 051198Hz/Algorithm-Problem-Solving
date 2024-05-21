struct Fractal{
    var length: Int?
    var answer = ""
    mutating func addLF(){ answer += "\n" }
    mutating func drawFractal(x: Int, y: Int, length: Int){
        if length == 1 { answer += "*" }
        else if (x / (length/3)) % 3 == 1 && (y / (length/3)) % 3 == 1 {
            answer += " "
        }
        else{
            drawFractal(x: x, y: y, length: length/3)
        }
    }
}
let length = Int(readLine()!)!
var fractal = Fractal(length: length)
for i in 0..<length{
    for j in 0..<length{
        fractal.drawFractal(x: i, y: j, length: length)
    }
    fractal.addLF()
}
print(fractal.answer)