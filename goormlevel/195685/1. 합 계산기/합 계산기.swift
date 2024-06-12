import Foundation

let t = Int(readLine()!)!
var answer = 0
for _ in 0..<t{
	let expression = readLine()!.split{ $0 == " " }.map{ String($0) }
	let op = expression[1], a = Int(expression[0])!, b = Int(expression[2])!
	switch op{
		case "+": answer += (a+b)
		case "-": answer += (a-b)
		case "*": answer += (a*b)
		case "/": answer += Int(trunc((Double(a)/Double(b))))
		default: break
	}
}
print(answer)