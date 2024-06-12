let n = Int(readLine()!)!
let vowels = ["a", "e", "i", "o", "u"]
var answer = String()
(0..<n).forEach{ _ in
	let sentence = readLine()!
	var filterdSentence = String()
	sentence.forEach{
		if vowels.contains(String($0.lowercased())){ filterdSentence.write(String($0)) }
	}
	if filterdSentence.isEmpty{ answer.write("???\n") }
	else{ answer.write(filterdSentence + "\n")}
}
print(answer)