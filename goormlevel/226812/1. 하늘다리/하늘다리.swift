let n = Int(readLine()!)!
let mountines = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
var stack = [Int]()
var result = 0
var i = 0
repeat {
	if i == n { break }
	if stack.isEmpty {
		stack.append(mountines[i])
		i += 1
		continue
	}
	if stack.last! == mountines[i] {
		//5....5....5 처럼 하나의 산이 여러 산과 다리로 이어질 수 있음!
		// stack.removeLast()
		result += 1
		i += 1
		continue
	}
	if stack.last! < mountines[i]{
		stack.removeLast()
		continue
	}
	stack.append( mountines[i] )
	i+=1
} while true
print(result)