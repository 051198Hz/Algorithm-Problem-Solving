import Foundation

struct Queue<T>{
    fileprivate var inbox: [T] = []
    fileprivate var outbox: [T] = []
    init(array: [T]) {
        self.inbox = array
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
            outbox = inbox.reversed()
            //Array.removeAll()은 keepingCapacity가 false일 때, O(1)의 Performance를 갖는다.
            //https://stackoverflow.com/questions/54133045/performance-array-removeall-vs
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}


let n = Int(readLine()!)!

var cards = Array<Int>(1...n)
if cards.count == 1 {
    print(cards[0])
    exit(0)
}
var isDrop = true
var q = Queue<Int>(array: cards)

while(q.count != 1){
    let card = q.dequeue()!
    if !isDrop{
        q.enqueue(element: card)
    }
    isDrop.toggle()
}
print(q.front!)