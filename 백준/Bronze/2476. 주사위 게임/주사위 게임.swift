let diceNumbers = [1,2,3,4,5,6].reversed()
let peepCount = Int(readLine()!)!
let numberList = (0..<peepCount).map { _ in readLine()!.split { $0 == " " }.map { Int(String($0))! }}
var maxValue = Int.min
game: for numbers in numberList {
    for diceNumber in diceNumbers {
        if (numbers.filter { $0 == diceNumber }.count) >= 3 {
            maxValue = max(maxValue, 10000 + diceNumber*1000)
            continue game
        }
    }
    for diceNumber in diceNumbers {
        if (numbers.filter { $0 == diceNumber }.count) >= 2 {
            maxValue = max(maxValue, 1000 + diceNumber*100)
            continue game
        }
    }
    for diceNumber in diceNumbers {
        maxValue = max(maxValue, diceNumber*100)
    }
}
print(maxValue)