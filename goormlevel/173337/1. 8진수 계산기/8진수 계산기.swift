import Foundation
let n = Int(readLine()!)!
let numbers = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
var calculator = [0]
var exp = 1
for number in numbers{
	var carry = number
	while true{
		// calculator[exp-1] += number
		// let limit = Int(pow(8.0, Double(exp)))
		calculator[exp-1] += carry
		carry = calculator[exp-1]/8
		calculator[exp-1] %= 8
		if carry == 0 { break }
		if calculator.count < exp+1{ calculator.append(0) }
		exp += 1
	}
	exp = 1
}
print(calculator.reversed().map{String($0)}.joined())

// print(1250%64)
