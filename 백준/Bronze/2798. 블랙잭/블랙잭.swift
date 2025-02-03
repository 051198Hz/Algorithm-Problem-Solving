let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let cardList = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var answer = 0
func solution2798(_ startIndex: Int, _ sum: Int, _ depth: Int) {
    if depth == 3 {
        guard sum <= nm[1] else { return }
        let newAnswer = nm[1] - sum < nm[1] - answer ? sum : answer
        answer = newAnswer
        return
    }
    for i in (startIndex...(cardList.count-(3-depth))) {
        solution2798(i+1, sum + cardList[i], depth+1)
    }
}
solution2798(0, 0, 0)
print(answer)