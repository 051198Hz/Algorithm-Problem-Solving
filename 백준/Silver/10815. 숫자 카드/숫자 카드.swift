import Foundation

// MARK: - FileIO

//func stringToAscii(_ str: String) -> Int {
//    str.map { $0.asciiValue! }.map { Int($0) }.reduce(0) {$0 + $1}
//}

struct FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private mutating func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) mutating func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    mutating func readIntArray(_ K: Int) -> [Int] {
        var array = [Int]()
        
        for _ in 0..<K {
            array.append(readInt())
        }
        
        return array
    }
    
    @inline(__always) mutating func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) mutating func readLine() -> String {
        var now = read()
        
        while now == 10 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) mutating func readString() -> Int {
        var str = 0
        var now = read()
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        while now != 10 && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }
        return str
    }
    
    mutating func readStringArray(_ K: Int) -> [String] {
        var array = [String]()
        
        for _ in 0..<K {
            array.append(readString())
        }
        
        return array
    }
    
    @inline(__always) mutating func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}

//    while !((0..<n)~=idx) { //인덱스가 0..<n에 속하지 않을 때 까지, 즉 0..<n의 범위에 들어올 때 까지
//        idx = (idx+n) % n
//    } //양수인 n에 대하여, 인덱스가 음수이면 인덱스 % n 은 음수인 인덱스를 그대로 반환한다.
//deque 쓰는것 보다 insert 쓰는게 훨 빠른듯,,ㅠ
// let (N, P) = (io.readInt(), io.readInt())
// 동시에 두 변수 입력받을 수 있음.
// [].allsatisfy { 만족해야 할 조건문 }
// 열고 닫는 괄호가 있고, 이를 제외하고는 stack에서 숫자만 사용해도 좋은 경우, 괄호를 유니크한 수(ex:0)으로 취급하여 괄호와 숫자를 구분할 수 있음
// 반복문 앞에 outer: 등으로 라벨링을 하면 continue outer등으로 다중 반복문일 때 해당 라벨의 다음 반복으로 넘어감
//
//var file = FileIO()
//String(repeating: "long ", count: Int(readLine()!)!) 특정 문자열로 반복되는 문자열을 만들 수 있음
//let numbers = [1, 2, 3, 4, 5]
////앞에서 2개 가져오기
//print(numbers.prefix(2))    // Prints "[1, 2]"
////최대 개수 넘어도 상관없음
//print(numbers.prefix(10))   // Prints "[1, 2, 3, 4, 5]"
////뒤에서 2개 가져오기
//print(numbers.suffix(2))    // Prints "[4, 5]"
////최대 개수 넘어도 상관없음
//print(numbers.suffix(10))   // Prints "[1, 2, 3, 4, 5]"

//한번에 String으로 만들어 출력하기 print("\(poses.map{ String(dict[$0]!) }.joined(separator: " "))")
// 문자열 안에 문자열이 포함여부 String.contains(String) == ( self.range(of: other) != nil )
//swift 적당히 큰수 Decimal

//let seq = file.readIntArray(number)
//lazy var dp = seq
//보다
//let seq = file.readIntArray(number)
//var dp = [Int](repeating: 0, count: number)
//...
//for i in seq.indices{
//dp[i] = seq[i]
//가 더 빠름
//let nk = readLine()!.split{ $0 == " " }.map{ Int($0)! }
//let n = nk[0], k = nk[1]
//var w = [Int](repeating: 0, count: n+1)
//var v = [Int](repeating: 0, count: n+1)
//for i in 1...n{
//    let wv = readLine()!.split{ $0 == " " }.map{ Int($0)! }
//    w[i] = wv[0]
//    v[i] = wv[1]
//}
//var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)
//
////dp[i][j] = i번째 물건까지 살폈을 때 크기가 j인 배낭의 최대 가치
//
//for i in 1...n{
//    for j in 1...k{
//        if j - w[i] >= 0{ //i번째 물건을 배낭에 넣을 지 말지 결정
//            dp[i][j] = max( dp[i-1][j], dp[i-1][j - w[i]] + v[i] )
//        }else{
//            dp[i][j] = dp[i-1][j]
//        }
//    }
//}
//print(dp[n][k])
//별 4 동그라미 3 네모 2 세모 1

// a 1 4
// b 4 3 3 2 1
// a 5 2 4 3 2 1
// b 4 4 3 3 1
// a 4 3 2 1 1
// b 4 2 3 2 1
// a 4 4 3 2 1
// b 3 4 3 2
// a 5 4 4 2 3 1
// b 5 4 2 4 1 3import Foundationlet nm = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }

//struct Rain{
//    var str = ""
//    let n: Int
//    let m: Int
//    //n 집개수 m 장마기간
//    var heights: [Int]
//    var isRained: [Int] = []
//    mutating func rainy(){
//        for i in 1...m{
//            let rangeRain = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }
//            for i in rangeRain[0]...rangeRain[1]{
//                heights[i-1] += 1
//                isRained.append(i-1)
//            }
//            if i%3 == 0{
//                for i in Set(isRained){
//                    heights[i] -= 1
//                }
//                isRained = []
//            }
//        }
//        for i in 0..<n{  str.write("\(heights[i]) ")}
//        print(str)
//    }
//}
//
//let nm = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }
//var heights = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }
//var rain = Rain(n: nm[0], m: nm[1], heights: heights)
//rain.rainy()
//print(rain.str)
//
//
//func makeOneDigit(_ num: Int)->Int{ //각 자릿수를 모두 더한 1자리의 수를 반환하는 함수
//    if num/10 == 0 { return num } //한자리라면, 반환한다.
//    var digit = Int( pow(10.0, Double(String(num).count-1) ) ) //100
//    var result = num/digit //9
//    var restNum = num%digit // 99
//    while digit != 1{
//        digit /= 10 //10
//        let nextSumNumber = restNum/digit //9
//        result += nextSumNumber //18
//        if result/10 != 0{ //두자리수라면, 한자리수로 만듬
//            result = makeOneDigit(result) //9
//        }
//        restNum %= digit //9
//    }
//    return result
//}
//
//let n = makeOneDigit(999)
//print(n)

//let n = Int(readLine()!)!
//let numbers = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
//var calculator = [0]
//var exp = 1
//for number in numbers{
//    var carry = number
//    while true{
//        // calculator[exp-1] += number
////        let limit = Int(pow(8.0, Double(exp)))
////        print(carry)
////        print(limit)
//        calculator[exp-1] += carry
//        carry = calculator[exp-1]/8
//        calculator[exp-1] %= 8
//        if carry == 0 { break }
//        if calculator.count < exp+1{ calculator.append(0) }
//        exp += 1
//    }
//    exp = 1
//}
//print(calculator.reversed().map{String($0)}.joined())
//import Foundation
//
//typealias treePos = (Int,Int)
//let dx = [0,0,-1,1]
//let dy = [-1,1,0,0]
//
//let n = Int(readLine()!)!
//var grid: [[Int]] = []
//var notColored: [treePos] = [] //물들어야 할 칸 목록
//var beColored: [(treePos, Int)] = [] //물들임이 다른 칸의 물들임에 영향을 미치지 않도록 분리하여 처리
//(0..<n).forEach{ i in
//    var j = 0
//    let areas = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
//    //입력을 검사하여 물들여야 할 칸 리스트업
//    areas.forEach{
//        let notColoredNumber = Int(String($0))!
//        if notColoredNumber > 0 { notColored.append((i,j)) } //0이 아니라면 물들여야할 칸
//        j += 1
//    }
//    grid.append(areas)
//}
//var answer = 0
//coloring: while !notColored.isEmpty{ //물들 칸이 없을 때 까지 진행
//    //완전히 물들지 않은 칸의 0인 인접칸을 계산하는 반복문
//    while !notColored.isEmpty{
//        let coloringPos = notColored.removeLast()
//        let cx = coloringPos.0, cy = coloringPos.1
//        var colorCount = 0 //0인 인접칸의 갯수
//        for i in 0..<4 { //상하좌우에 0이 있는지 탐색
//            let nx = cx+dx[i]
//            let ny = cy+dy[i]
//            if nx < 0 || nx >= n || ny < 0 || ny >= n { continue } //범위 벗어나면 다음위치 탐색
//            if grid[nx][ny] == 0{ colorCount += 1 }
//        }
//        //바로 값 대입시 다른 칸의 인접칸 계산에 영향미침, 별도 처리
//        beColored.append((coloringPos,colorCount))
//    }
//    //계산에 따른 물들지 않은 칸을 물들이기 위한 반복문
//    while !beColored.isEmpty{
//        let coloringInfo = beColored.removeLast()
//        let pos = coloringInfo.0, count = coloringInfo.1
//        let x = pos.0, y = pos.1
//        grid[x][y] = max(grid[x][y] - count, 0) //물든 결과의 음수방지 처리
//        if grid[x][y] != 0 { notColored.append(pos)} //완전히 물들지 않았다면 다음 계산 대상으로 이월
//    }
//    answer += 1 //물든 칸이 있으므로 날짜 증가
//}
//print(answer)

var file = FileIO()
var cards: Set<Int> = []
var answer = String()
let cardCount = file.readInt()
for _ in 0..<cardCount{
    cards.insert(file.readInt())
}
let numberCount = file.readInt()
for _ in 0..<numberCount{
    if cards.contains(file.readInt()){ answer.write("\(1) ") }
    else { answer.write("\(0) ")}
}
print(answer)
