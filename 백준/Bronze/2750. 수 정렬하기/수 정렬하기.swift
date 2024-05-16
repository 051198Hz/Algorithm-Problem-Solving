let number = Int(readLine()!)!
var numbers = Array<Int>()
for _ in 0..<number{
    numbers.append(Int(readLine()!)!)
}
numbers.sort{ $0 < $1 }
numbers.forEach{ print($0) }