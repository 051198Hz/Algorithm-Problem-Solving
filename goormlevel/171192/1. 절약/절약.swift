var buget = 0
let n = Int(readLine()!)!
var isSuccess = true
for _ in 0..<n{ 
	let info = readLine()!.split{ $0 == " " }.map{ String($0) }
	if isSuccess{
			switch info[0]{
		case "in": buget += Int(info[1])!
		case "out": 
		buget -= Int(info[1])!
		if buget < 0 { 
			isSuccess = false
		}
		default: break
	}
	}
}
print(isSuccess ? "success" : "fail")