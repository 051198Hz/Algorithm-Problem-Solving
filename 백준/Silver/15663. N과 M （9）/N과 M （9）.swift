let nm = readLine()!.split(separator: " ").map{Int($0)!}
let numbers = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var isPrinted: [String:Bool] = [:]
var answer = ""
func combination(pool:[Int], picked:[Int] = [], depth:Int, visited: [Bool]){
    if depth == 0{
        var seq = ""
        picked.forEach{ seq.append("\($0) ") }
        if isPrinted[seq] ?? false == false{
            isPrinted.updateValue(true, forKey: seq)
            answer += seq+"\n"
        }
        return
    }
    for i in pool.indices where !visited[i]{
        var nowVisited = visited
        nowVisited[i] = true
        combination(pool: pool, picked: picked + [pool[i]], depth: depth-1,visited: nowVisited)
    }
}
combination(pool: numbers, depth: nm[1], visited: Array<Bool>(repeating: false, count: nm[0]) )
print(answer)