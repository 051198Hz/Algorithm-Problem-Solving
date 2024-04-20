import Foundation

// MARK: - FileIO

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

var file = FileIO()

//이전 누르던 손가락과의 줄이 다르면, count += 2
//줄이 같을 경우에 스택의 마지막 값보다 눌러야 할 프랫의 크기가 크다면 스택 push, count += 1
//줄이 같을 경우에 스택의 마지막 값보다 눌려야 할 프랫의 크기가 적다면, 같거나 작을 때 까지 pop, count += 1
//자신과 같은 값을 만났을 경우 break, 작을 경우 push, count += 1

let stringN = file.readInt()
_=file.readInt()
var holdPrets: [[Int]] = [[Int]](repeating: [], count: 6+1)
var count = 0
for _ in 0..<stringN{
    let n = file.readInt()
    let pret = file.readInt()
    while true{
        if holdPrets[n].isEmpty {
            holdPrets[n].append(pret)
            count += 1
            break
        }
        if holdPrets[n].last! == pret { break }
        if holdPrets[n].last! < pret {
            holdPrets[n].append(pret)
            count += 1
            break
        }
        holdPrets[n].removeLast()
        count += 1
    }
}
print(count)
