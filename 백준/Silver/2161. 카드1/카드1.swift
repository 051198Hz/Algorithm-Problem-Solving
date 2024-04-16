let n = Int(readLine()!)!
var cards: [Int] = Array(1...n)
var answer = ""
var count = n
var isDiscard = true

while(count > 1){
    var newCards:[Int] = []
    for i in 0..<count{
        if isDiscard {
            answer += "\(cards[i]) "
        }else{
            newCards.append(cards[i])
        }
        isDiscard.toggle()
    }
    cards = newCards
    count = cards.count
}
print("\(answer)\(cards.first!)")