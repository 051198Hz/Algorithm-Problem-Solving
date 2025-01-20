let nk = readLine()!.split { $0 == " " }.map { Int(String($0))!}
let coinList = (0..<nk[0]).map { _ in Int(readLine()!)! }.reversed()
var k = nk[1]
var answer = 0
for coin in coinList {
    answer += k/coin
    k %= coin
}
print(answer)