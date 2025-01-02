import Foundation

class Dequeue {
    var left: [Int] = []
    var right: [Int] = []
    var leftIdx = 0
    var rightIdx = 0
    var count: Int {
        return (left.count + right.count) - (leftIdx + rightIdx)
    }
    var isEmpty: Bool {
        return leftIdx + rightIdx >= left.count + right.count
    }
    var first: Int? {
        if isEmpty {
             return nil
         }
         
        if leftIdx >= left.count {
            return right[rightIdx]
         }
         
         return left.last
    }
    var last: Int? {
        if isEmpty {
             return nil
         }
         
        if rightIdx >= right.count {
            return left[leftIdx]
         }
         
         return right.last
    }
    func popFirst()->Int?{
        if isEmpty {
             return nil
         }
         
        if leftIdx >= left.count {
            let element = right[rightIdx]
            rightIdx += 1
            return element
         }
         
        return left.popLast()
    }
    func popLast()->Int?{
        if isEmpty {
             return nil
         }
         
        if rightIdx >= right.count {
            let element = left[leftIdx]
            leftIdx += 1
            return element
         }
         
        return right.popLast()
    }
    func appendFirst(_ element: Int) {
        left.append(element)
    }
    func appendLast(_ element: Int) {
        right.append(element)
    }
}

let deq = Dequeue()
//1 X: 정수 X를 덱의 앞에 넣는다. (1 ≤ X ≤ 100,000)
//2 X: 정수 X를 덱의 뒤에 넣는다. (1 ≤ X ≤ 100,000)
//3: 덱에 정수가 있다면 맨 앞의 정수를 빼고 출력한다. 없다면 -1을 대신 출력한다.
//4: 덱에 정수가 있다면 맨 뒤의 정수를 빼고 출력한다. 없다면 -1을 대신 출력한다.
//5: 덱에 들어있는 정수의 개수를 출력한다.
//6: 덱이 비어있으면 1, 아니면 0을 출력한다.
//7: 덱에 정수가 있다면 맨 앞의 정수를 출력한다. 없다면 -1을 대신 출력한다.
//8: 덱에 정수가 있다면 맨 뒤의 정수를 출력한다. 없다면 -1을 대신 출력한다.
let n = Int(readLine()!)!
var answer = ""
(0..<n).forEach{ _ in
    let cmd = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
    switch cmd[0] {
    case 1:
        deq.appendFirst(cmd[1])
    case 2:
        deq.appendLast(cmd[1])
    case 3:
        answer.append("\(deq.popFirst() ?? -1)\n")
    case 4:
        answer.append("\(deq.popLast() ?? -1)\n")
    case 5:
        answer.append("\(deq.count)\n")
    case 6:
        answer.append("\(deq.isEmpty ? 1 : 0)\n")
    case 7:
        answer.append("\(deq.first ?? -1)\n")
    case 8:
        answer.append("\(deq.last ?? -1)\n")
    default: return
    }
    
}
print(answer)
