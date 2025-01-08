let vowels = "aeiou".map { String($0) }

func checkPwd(pwd: inout [String], countV: Int, countC: Int, prevC: String) -> Bool{
    var countV = countV
    var countC = countC
    let curC = pwd.last ?? ""
    if curC == "" { return true }
    if vowels.contains(curC) {
        countC = 0
        countV += 1
    }
    if !vowels.contains(curC) {
        countV = 0
        countC += 1
    }
    if countV == 3 || countC == 3 { return false }
    if prevC == curC {
        if !(prevC+curC == "ee" || prevC+curC == "oo"){ return false }
    }
    _=pwd.popLast()
    return checkPwd(pwd: &pwd, countV: countV, countC: countC, prevC: curC)
}
var answer = ""
while let input = readLine(), input != "end" {
    var hasVowel = false
    var pwd: [String] = input.map {
        let c = String($0)
        if vowels.contains(c) { hasVowel = true }
        return c
    }
    pwd = pwd.reversed()
    guard hasVowel && checkPwd(pwd: &pwd, countV: 0, countC: 0, prevC: "") else {
        answer.write("<\(input)> is not acceptable.\n")
        continue
    }
    answer.write("<\(input)> is acceptable.\n")
}
print(answer)
