let nm = readLine()!.split(separator: " ").map{ Int(String($0))!}
// 1~n까지의 수 중 1개를 뽑는다.
// 그 수를 제외한 1~n개중 1개를 뽑는다.
// m이 0이라면 출력한다.
func combination(picked: [Int] = [], pool: [Int], deepth: Int){
    if deepth == 0{
        picked.forEach{ print($0, terminator: " ") }
        print()
        return
    }
    for i in pool.indices {
        combination(picked: picked + [pool[i]], pool: pool.suffix(pool.count-i-1), deepth: deepth-1)
    }
}

combination(pool: Array<Int>(1...nm[0]), deepth: nm[1])