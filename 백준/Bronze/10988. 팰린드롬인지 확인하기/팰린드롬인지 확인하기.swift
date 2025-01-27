let word = readLine()!.map { String($0) }
var answer = "0"
for i in word.indices {
    if word[i] != word[word.count-1-i] {
        break
    }
    if i == word.count / 2 {
        answer = "1"
        break
    }
}
print(answer)