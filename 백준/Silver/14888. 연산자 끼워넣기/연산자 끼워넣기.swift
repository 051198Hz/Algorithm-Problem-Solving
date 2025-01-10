func toOperator(_ number: Int, _ count: Int) -> [String] {
    let op: String = {switch number {
    case 0:
        return "+"
    case 1:
        return "-"
    case 2:
        return "*"
    default:
        return "/"
    }}()
    return [String](repeating: op, count: count)
}
let n = Int(readLine()!)!
var minAnswer = Int.max
var maxAnswer = Int.min
let numbers = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let operatorsCount = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let operators = operatorsCount.indices.map { toOperator($0, operatorsCount[$0]) }.flatMap{ $0 }
var usedOp = [Bool](repeating: false, count: operators.count)

func findMinMax(_ count: Int, _ number: Int) {
    if count >= numbers.count {
        minAnswer = min(number, minAnswer)
        maxAnswer = max(number, maxAnswer)
        return
    }
    for i in operators.indices {
        if usedOp[i] { continue }
        if numbers[count] == 0 && operators[i] == "/" { continue }
        let result: Int = {switch operators[i] {
        case "+" :
            return number + numbers[count]
        case "-":
            return number - numbers[count]
        case "*":
            return number * numbers[count]
        default:
            return number / numbers[count]
        }}()
        usedOp[i] = true
        findMinMax(count+1, result)
        usedOp[i] = false
    }
}
findMinMax(1, numbers.first!)
print(maxAnswer)
print(minAnswer)
