let n = Int(readLine()!)!
let maxValues = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let initValues = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let pushCount = Int(readLine()!)!

var carry = pushCount
var counter: [Int] = initValues
for i in stride(from: n-1, through: 0, by: -1){
		counter[i] += carry
		carry = 0
	if counter[i] > maxValues[i]{
		carry = counter[i] / (maxValues[i]+1)
		counter[i] %= ( maxValues[i]+1 )
	}
	// print("counter[i]",counter[i])
	// print("carry:",carry)
	if carry == 0 { break }
}

counter.forEach{ print($0,terminator: "")}