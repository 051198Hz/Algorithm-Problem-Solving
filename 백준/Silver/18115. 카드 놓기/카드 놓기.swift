import Foundation

// MARK: - FileIO

func stringToAscii(_ str: String) -> Int {
    str.map { $0.asciiValue! }.map { Int($0) }.reduce(0) {$0 + $1}
}

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

var file = FileIO()
var n = file.readInt()
var cnt = 1
let str = file.readLine().components(separatedBy: " ").reversed()
var hands = Deque<Int>(sequence: [])
for c in str{
    switch Int(c)!{
    case 1: hands.push_front(cnt)
    case 2:
        let first = hands.pop_front()!
        hands.push_front(cnt)
        hands.push_front(first)
    default: hands.push_back(cnt)
    }
    cnt += 1
}
for _ in 0..<n{
    print(hands.pop_front()!,terminator: " ")
}
struct QueueSingleArray<T>{
    fileprivate var inbox: [T] = []
    fileprivate var head = 0
    init(inbox: [T] = [], head: Int = 0) {
        self.inbox = inbox
        self.head = head
    }
    var isEmpty: Bool{
        return inbox.count - head <= 0
    }
    var front: T?{
        if isEmpty {return nil}
        let ret = inbox[head]
        return ret
    }
    var rear: T?{
        if isEmpty {return nil} // 이렇지 않으면, inbox.count == head여도 inbox의 마지막 값을 반환하고있음
        return inbox.last
    }
    var count: Int{
        return inbox.count - head
    }
    mutating func enqueue(element: T){
        inbox.append(element)
    }
    mutating func dequeue()->T?{
        if isEmpty {return nil}
        let ret = inbox[head]
        head += 1
        return ret
    }
    mutating func popLast()->T?{
        if isEmpty {return nil}
        return inbox.popLast()
    }
}


 struct Deque<T>{
//    push_front X: 정수 X를 덱의 앞에 넣는다.
//    push_back X: 정수 X를 덱의 뒤에 넣는다.
//    pop_front: 덱의 가장 앞에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
//    pop_back: 덱의 가장 뒤에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
//    size: 덱에 들어있는 정수의 개수를 출력한다.
//    empty: 덱이 비어있으면 1을, 아니면 0을 출력한다.
//    front: 덱의 가장 앞에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
//    back: 덱의 가장 뒤에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
    private var frontBox = QueueSingleArray<T>()
    private var backBox = QueueSingleArray<T>()
    init(sequence:[T]){
        frontBox = QueueSingleArray<T>()
        backBox = QueueSingleArray(inbox: sequence)
    }
    var size: Int{
        return frontBox.count + backBox.count
    }
    var empty: Bool{
        return frontBox.isEmpty && backBox.isEmpty
    }
    var front: T?{
        if frontBox.isEmpty { return backBox.front }
        return frontBox.rear
    }
    var back: T?{
        if backBox.isEmpty { return frontBox.front}
        return backBox.rear
    }
    mutating func push_front(_ element: T){
        frontBox.enqueue(element: element)
    }
    mutating func push_back(_ element: T){
        backBox.enqueue(element: element)
    }
    @discardableResult mutating func pop_front()->T?{
        if frontBox.isEmpty { return backBox.dequeue() }
        return frontBox.popLast()
    }
    @discardableResult mutating func pop_back()->T?{
        if backBox.isEmpty { return frontBox.dequeue() }
        return backBox.popLast()
    }
}
