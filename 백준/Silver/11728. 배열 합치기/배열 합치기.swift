let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! },
    n = nm[0],
    m = nm[1]
var listA: [Int] = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var listB: [Int] = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var answerList = [Int]()
var pA = 0
var pB = 0
while pA < listA.count || pB < listB.count {
    if pA >= listA.count {
        answerList.append(listB[pB])
        pB += 1
        continue
    }
    if pB >= listB.count {
        answerList.append(listA[pA])
        pA += 1
        continue
    }
    if listA[pA] < listB[pB] {
        answerList.append(listA[pA])
        pA += 1
        continue
    }
    if listB[pB] < listA[pA] {
        answerList.append(listB[pB])
        pB += 1
        continue
    }
    answerList.append(listA[pA])
    pA += 1
}
let answer = answerList.map { "\($0) "}.joined()
print(answer)