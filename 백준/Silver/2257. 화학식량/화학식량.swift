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

//
//deque 쓰는것 보다 insert 쓰는게 훨 빠른듯,,ㅠ

// let (N, P) = (io.readInt(), io.readInt())
// 동시에 두 변수 입력받을 수 있음.


// [].allsatisfy { 만족해야 할 조건문 }
//
//func isVPS(PS: String)->Bool{
//    
//    return false
//}
//var file = FileIO()
////입력이 최대 30이므로
////VPS인지 평가 후, VPS라면 계산하고 그렇지 않으면 0을 출력한다.
//let PS = file.readLine()
//if isVPS(PS: PS){
//    
//}
//var isRightP = false

extension Character{
    var isAtom: Bool{
        if self == "H" || self == "C" || self == "O" { return true}
        return false
    }
    var isRightP: Bool{
        return self == ")" ? true : false
    }
    var isLeftP: Bool{
        return self == "(" ? true : false
    }
    var toWeight: String{
        return self == "H" ? "1" : self == "C" ? "12" : self == "O" ? "16" : notNumber
    }

}
extension String{
    var isRightP: Bool{
        return self == ")" ? true : false
    }
    var isLeftP: Bool{
        return self == "(" ? true : false
    }
}
extension Int{
    var toString: String{
        return String(self)
    }
}
let notNumber = "notNumber"
var file = FileIO()

var stack: [String] = []
var postfix: [String] = []
for c in file.readLine(){
    //왼쪽 괄호면, append
    if c.isLeftP {
        stack.append(String(c))
        continue
    }
    //오른쪽 괄호면, 괄호 내 모든 숫자를 더한 후 append
    if c.isRightP {
        var tmpStack:[Int] = []
        while !stack.last!.isLeftP {
            tmpStack.append(Int(stack.removeLast())!)
        }
        stack.removeLast()
        stack.append(tmpStack.reduce(0){ $0 + $1 }.toString)
        continue
    }
    //알파벳이면, 마지막 요소가 숫자인지 확인 후 덧셈 연산
    if c.isAtom {
        stack.append(c.toWeight)
        continue
    }
    if c.isNumber {
        let multiWeight = Int(stack.removeLast())! * c.wholeNumberValue!
        stack.append(multiWeight.toString)
        continue
    }
}
let answer = stack.reduce(0){ Int($0) + Int($1)! }
print(answer)
