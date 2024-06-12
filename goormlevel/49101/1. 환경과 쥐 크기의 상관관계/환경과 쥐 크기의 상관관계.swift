let n = Int(readLine()!)!

var ratCountA = [Int](repeating: 0, count: 100_000 + 1)
var ratCountB = [Int](repeating: 0, count: 100_000 + 1)
var minExValueA = 0
var minExValueB = 0
var maxCountA = Int.min
var maxCountB = Int.min

readLine()!.split{$0 == " " }.map{ Int(String($0))! }.forEach{
	// maxA = max(maxA, $0)
	// minA = min(minA, $0)
	ratCountA[$0] += 1
}
readLine()!.split{$0 == " " }.map{ Int(String($0))! }.forEach{ 
	// maxB = max(maxB, $0)
	// minB = min(minB, $0)
	ratCountB[$0] += 1 
}
for i in 1...100_000{
	let lowerBound = i-2 > 0 ? i-2 : 1
	let upperBound = i+2 <= 100_000 ? i+2 : 100_000
	let rangeCountA = ratCountA[lowerBound...upperBound].reduce(0){$0 + $1}
	let rangeCountB = ratCountB[lowerBound...upperBound].reduce(0){$0 + $1}
	if rangeCountA > maxCountA{
		minExValueA = i
		maxCountA = rangeCountA
	}
	if rangeCountB > maxCountB{
		minExValueB = i
		maxCountB = rangeCountB
	}
}
print(minExValueA, minExValueB)
print(minExValueA > minExValueB ? "good" : "bad")