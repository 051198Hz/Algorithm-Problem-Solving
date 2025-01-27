let croatiaWord = readLine()!.map { String($0) }
let croatiaAlphabetTwo = ["c=", "c-", "d-", "lj", "nj", "s=", "z="]
let croatiaAlphabetThree = ["dz="]
var answer = 0
var passCount = 0
for i in croatiaWord.indices {
    if passCount > 0 {
        passCount -= 1
        continue
    }
    if croatiaAlphabetTwo.contains(croatiaWord.suffix(croatiaWord.count - i).prefix(2).joined()) {
        answer += 1
        passCount += 1
        continue
    }
    if croatiaAlphabetThree.contains(croatiaWord.suffix(croatiaWord.count - i).prefix(3).joined()) {
        answer += 1
        passCount += 2
        continue
    }
    answer += 1
}
print(answer)