let answer = readLine()!.map{ Int(String($0))! }
var expectation = readLine()!.map{ Int(String($0))! }
func isCorrect()->Bool{
		for i in 0..<4{
		if answer[i] != expectation[i]{ return false}
	}
	return true
}
if isCorrect() { print(1) }
else{
	var count = 1
		step2: while !isCorrect(){
		//2단계 중 ball의 발생유무
		var strikeIdx: [Int] = []
		var isBalled = false
		for i in 0..<4{
			if expectation[i] == answer[i]{ //strike라면 다음 자리값 검사
				strikeIdx.append(i)
				continue } 
			if answer.contains(expectation[i]) == false{ //현재 자리값이 fail이라면
				var newExpectNum = expectation[i]
				while expectation.contains(newExpectNum) == true{ //계산값이 다른자리에 존재하지 않을 때 까지 반복
					newExpectNum = (newExpectNum + 1) % 10
				}
				expectation[i] = newExpectNum
				continue
			}
			isBalled = true
		}
		if isBalled{
			var strikes: [Int] = []
			for i in strikeIdx{
				let strike = expectation[i]
				strikes.append(strike)
			}
			for strike in strikes{
				let idx = expectation.firstIndex(of:strike)!
				expectation.remove(at:idx)
			}
			let shiftLast = expectation.removeLast()
			expectation.insert(shiftLast, at:0)
				for i in strikeIdx.indices{
					expectation.insert(strikes[i], at: strikeIdx[i])
			}
		}
		count += 1
	}
	print(count)
}
