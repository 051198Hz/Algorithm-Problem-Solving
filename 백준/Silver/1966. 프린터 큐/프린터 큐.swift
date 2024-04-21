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

var file = FileIO()
outer: for _ in 0..<file.readInt(){
    var docs = Queue<Doc>()
    var descendValues = Heap<Int>(<)
    let (count, targetIndex) = (file.readInt(), file.readInt())
    for i in 0..<count{
        let value = file.readInt()
        descendValues.insert(element: value)
        docs.enqueue(element: Doc(Num: i, Value: value))
    }
    var repeatCnt = 0
    while true{
        let doc = docs.dequeue()!
        if doc.Value != descendValues.first!{
            docs.enqueue(element: doc)
            continue
        }
        repeatCnt += 1
        if doc.Num == targetIndex {
            print(repeatCnt)
            continue outer
        }
        if doc.Value == descendValues.first!{
            descendValues.delete()
        }
    }
}

struct Doc: Comparable{
    let Num: Int
    let Value: Int
    static func < (lhs: Doc, rhs: Doc) -> Bool {
        lhs.Value > rhs.Value
    }

}

struct Queue<T>{
    fileprivate var inbox: [T] = []
    fileprivate var outbox: [T] = []
    init(inbox: [T] = [], outbox: [T] = []) {
        self.inbox = inbox
        self.outbox = outbox
    }
    var isEmpty: Bool{
        return outbox.isEmpty && inbox.isEmpty
    }
    var front: T?{
        return outbox.isEmpty ? inbox.first : outbox.last
    }
    var rear: T?{
        if outbox.isEmpty { return inbox.last }
        return outbox.first
    }
    var count: Int{
        return outbox.count + inbox.count
    }
    mutating func enqueue(element: T){
        inbox.append(element)
    }
    mutating func dequeue()->T?{
        if outbox.isEmpty{
            //outbox.isEmpty == true 일때만 O(n)인 reverse()를 사용하기때문에 전체적으로는 O(1)이라고 할 수 있음
            outbox = inbox.reversed()
            //Array.removeAll()은 keepingCapacity가 false일 때, O(1)의 Performance를 갖는다.
            //https://stackoverflow.com/questions/54133045/performance-array-removeall-vs
            inbox.removeAll()
        }
        return outbox.popLast()
    }
    mutating func popLast()->T?{
        if isEmpty {return nil}
        if outbox.isEmpty{
            let ret = outbox.first
            outbox.removeFirst()
            return ret
        }
        return inbox.popLast()
    }
}

//최소힙
struct Heap<T: Comparable>{
    private var heap = [T]()
    var compare : (T, T) -> Bool
    var first: T?{
        return heap.first
    }
    var capacity: Int{
        return heap.capacity
    }
    var count: Int{
        return heap.count
    }
    var isEmpty: Bool{
        return heap.isEmpty
    }
    init(_ sort: @escaping (T, T) -> Bool){
        compare = sort
    }
    init(data: T, _ sort: @escaping (T, T) -> Bool){
        heap.append(data)
        compare = sort
    }
    mutating func insert(element: T){
        //heap의 마지막 노드에 추가
        heap.append(element)
        var currentPosition = heap.count-1
        var parentPosition = getParent(currentPosition)
        //부모보다 값이 클 때 까지 swap, 인덱스가 0이라면 루트노드이므로 break
        while currentPosition > 0 && compare(heap[parentPosition], heap[currentPosition]){
            heap.swapAt(currentPosition, parentPosition)
            currentPosition = parentPosition
            parentPosition = getParent(currentPosition)
        }
    }
    mutating func delete()->T?{
        if heap.count == 0 { return nil }
        let ret = heap.first
        var parrentPosition = 0
        var leftPosition = getLeftChild(0)
        var rightPosition = getRightChild(0)
        heap.swapAt(0, heap.count-1)
        _=heap.popLast()
        while true{
            var selectedChild = 0
            if leftPosition >= heap.count { break }
            if rightPosition >= heap.count { selectedChild = leftPosition }
            else{
                if compare(heap[leftPosition], heap[rightPosition]) { selectedChild = rightPosition }
                else { selectedChild = leftPosition}
            }
            if compare(heap[parrentPosition], heap[selectedChild]){
                heap.swapAt(parrentPosition, selectedChild)
                parrentPosition = selectedChild
            }else{ break }
            leftPosition = getLeftChild(parrentPosition)
            rightPosition = getRightChild(parrentPosition)
        }
        return ret
    }
    private func getParent(_ index: Int)->Int{
        return (index-1)/2
    }
    private func getLeftChild(_ index: Int)->Int{
        return (2 * index) + 1
    }
    private func getRightChild(_ index: Int)->Int{
        return (2 * index) + 2
    }

}
