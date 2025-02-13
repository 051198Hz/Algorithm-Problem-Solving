let abv = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let nv = abv[2] - abv[0]
var answer = nv/(abv[0]-abv[1])
let k = nv%(abv[0]-abv[1])
answer += k + abv[0] % abv[0] > 0 ? 2 : 1
print(answer)