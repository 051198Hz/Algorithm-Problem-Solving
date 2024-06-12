let nc = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = nc[0], c = nc[1]
let overTs = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
var codeCount = 1
for i in overTs.indices where i>0{
	let interT = overTs[i] - overTs[i-1]
	if interT > c { codeCount = 0 }
	codeCount += 1
}
print(codeCount)