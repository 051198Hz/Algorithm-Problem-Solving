import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
var b = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
let m = Int(readLine()!)!
var c: [Int] = readLine()!.split{ $0 == " " }.map { Int(String($0))! }.reversed()
var result = ""
var poped: [Int] = []
var answer = ""
for i in 0..<n { //값을 뱉어내는건 큐 이므로 큐의 모든 원소를 저장
    if a[i] == 0 {
        poped.append(b[i])
    }
}
for _ in 0..<m { //마지막 큐의 원소부터 출력, 큐의 출력이 부족하다면 c의 첫 원소부터 출력
    answer.append("\(poped.popLast() ?? c.popLast()!) ")
}
print(answer)
