let n = Int(readLine()!)!
var x = 0
var y = 0
for _ in 0..<n{
	let winner = readLine()!
	switch winner{
		case "D": x += 1
		case "P": y += 1
		default: break
	}
	if abs(x - y) == 2 { break }
}
print("\(x):\(y)")