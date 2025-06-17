let name = readLine()!

var alphaCountMap = [String.Element: Int]()
let isEven = name.count % 2 == 0
var answer = ""
var isOdd = false
var targetOdd = ""

for alpha in name {
    if alphaCountMap[alpha] == nil {
        alphaCountMap[alpha] = 0
    }
    alphaCountMap[alpha]! += 1
}

for alpha in alphaCountMap.keys.sorted { $0 < $1 } {
    if answer == "I'm Sorry Hansoo" { break }
    if isEven {
        guard alphaCountMap[alpha]! >= 2, alphaCountMap[alpha]! % 2 == 0 else { 
            answer = "I'm Sorry Hansoo"
            break 
        }
        answer += String(repeating: alpha, count: alphaCountMap[alpha]!/2)
    } else {

        if alphaCountMap[alpha]! % 2 == 1 { 
            if isOdd {  
                answer = "I'm Sorry Hansoo"
                break
            }
            targetOdd = "\(alpha)"
            isOdd = true
        } else if alphaCountMap[alpha]! < 2 || alphaCountMap[alpha]! % 2 != 0 {
            answer = "I'm Sorry Hansoo"
            break
        }
        answer += String(repeating: alpha, count: alphaCountMap[alpha]!/2)
    }
}

if answer != "I'm Sorry Hansoo" {
    let reverse = answer.reversed()
    answer += targetOdd
    answer += reverse
}
print(answer)