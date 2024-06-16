var cards: Set<Int> = []
var answer = String()
_=Int(readLine()!)!
readLine()!.split{ $0 == " " }.map{ Int(String($0))! }.forEach{ cards.insert($0) }
_=Int(readLine()!)!
let numbers = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }.forEach{
    if cards.contains($0){ answer.write("\(1) ") }
    else { answer.write("\(0) ")}
}
print(answer)