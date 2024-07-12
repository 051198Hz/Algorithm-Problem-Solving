let nk = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = nk[0], k = nk[1]
var result = ""
var stack = [Int]()
while let input = readLine(){
	let cmdValue = input.split{ $0 == " " }.map{ String($0) }
	let cmd = cmdValue[0]
	if cmd == "push" && stack.count >= k {
		result += "Overflow\n"
		continue
	}
	if cmd == "pop" && stack.isEmpty {
		result += "Underflow\n"
		continue
	}
	switch cmd{
		case "push":
		let value = Int(cmdValue[1])!
		stack.append(value)
		default: 
		result += "\(stack.removeLast())\n"
	}
}
print(result)