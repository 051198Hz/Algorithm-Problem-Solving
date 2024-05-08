let nm = readLine()!.split(separator: " ").map{ Int(String($0))!}
let numbers: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
var answer = ""
// 1~n까지의 수 중 1개를 뽑는다.
// 그 수를 제외한 1~n개중 1개를 뽑는다.
// m이 0이라면 출력한다.
func combination(picked: [Int] = [], pool: [Int], deepth: Int){
    if deepth == 0{
        picked.forEach{ answer += "\($0) " }
        answer += "\n"
        return
    }
    for i in pool.indices where pool[i] >= picked.last ?? 0{
        combination(picked: picked + [pool[i]], pool: pool, deepth: deepth-1)
    }
}

combination(pool: numbers, deepth: nm[1])
print(answer)