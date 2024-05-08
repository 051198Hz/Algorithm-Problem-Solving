let nm = readLine()!.split(separator: " ").map{Int($0)!}
let numbers = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var isPrinted: [String:Bool] = [:]
var answer = ""
func combination(pool:[Int], picked:[Int] = [], depth:Int, lastIdx: Int = -1){
    if depth == 0{
        var seq = ""
        picked.forEach{ seq.append("\($0) ") }
        if isPrinted[seq] ?? false == false{
            isPrinted.updateValue(true, forKey: seq)
            answer += seq+"\n"
        }
        return
    }
    for i in pool.indices where i >= lastIdx{
        combination(pool: pool, picked: picked + [pool[i]], depth: depth-1, lastIdx: i)
    }
}
combination(pool: numbers, depth: nm[1])
print(answer)