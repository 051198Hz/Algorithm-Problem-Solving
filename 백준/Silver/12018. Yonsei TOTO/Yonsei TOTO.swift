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
        while currentPosition > 0 && compare(heap[currentPosition], heap[parentPosition]){
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
                if compare(heap[rightPosition], heap[leftPosition]) { selectedChild = rightPosition }
                else { selectedChild = leftPosition}
            }
            if compare(heap[selectedChild], heap[parrentPosition]){
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

let lectureNumber = file.readInt()
var owndMiliege = file.readInt()
var needMilieges = Heap<Int>(<)
var passibleLectureNumber = 0
for _ in 0..<lectureNumber{
    let applyNumber = file.readInt()
    let limitNumber = file.readInt()
    if (limitNumber - applyNumber) > 0 {
        _=file.readIntArray(applyNumber)
        needMilieges.insert(element: 1)
    }else{
        let ms = file.readIntArray(applyNumber).sorted(by: >)
        needMilieges.insert(element: ms[limitNumber-1])
    }
}
while !needMilieges.isEmpty{
    let needMiliege = needMilieges.delete()!
    if owndMiliege - needMiliege < 0 { break }
    owndMiliege -= needMiliege
    passibleLectureNumber += 1
}
print(passibleLectureNumber)
