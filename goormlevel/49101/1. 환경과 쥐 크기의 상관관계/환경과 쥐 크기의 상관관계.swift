let n = Int(readLine()!)!

var ratCountA = [Int](repeating: 0, count: 100_000 + 1)
var ratCountB = [Int](repeating: 0, count: 100_000 + 1)
var minExValueA = 0
var minExValueB = 0
var maxCountA = Int.min
var maxCountB = Int.min

readLine()!.split{$0 == " " }.map{ Int(String($0))! }.forEach{ ratCountA[$0] += 1 }
readLine()!.split{$0 == " " }.map{ Int(String($0))! }.forEach{ ratCountB[$0] += 1 }

for i in 1...100_000{
	let lowerBound = max( i-2, 0 )
	let upperBound = min(i+2 ,100_000)
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