//첫째 줄에는 스위치 개수가 주어진다. 스위치 개수는 100 이하인 양의 정수이다.
//둘째 줄에는 각 스위치의 상태가 주어진다. 켜져 있으면 1, 꺼져있으면 0이라고 표시하고 사이에 빈칸이 하나씩 있다.
//셋째 줄에는 학생수가 주어진다. 학생수는 100 이하인 양의 정수이다.
//넷째 줄부터 마지막 줄까지 한 줄에 한 학생의 성별, 학생이 받은 수가 주어진다.
//남학생은 1로, 여학생은 2로 표시하고, 학생이 받은 수는 스위치 개수 이하인 양의 정수이다.
//학생의 성별과 받은 수 사이에 빈칸이 하나씩 있다.

let switchCount = Int(readLine()!)!
var switchList = [false] + readLine()!.split { $0 == " " }.map { $0 == "1" ? true : false }
let studentCount = Int(readLine()!)!
typealias Student = (Int, Int)
let studentList: [Student] = (0..<studentCount).map { _ in
    let studentDo = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    return Student(studentDo[0], studentDo[1])
}

for student in studentList {
    switch student.0 {
    case 1:
        for i in 1...100 {
            if i*student.1 > switchCount { break }
            switchList[i*student.1].toggle()
        }
    default:
        switchList[student.1].toggle()
        for i in 1...50 {
            if student.1 + i > switchCount || student.1 - i < 1{ break }
            guard switchList[student.1 + i] == switchList[student.1 - i] else { break }
            switchList[student.1 + i].toggle()
            switchList[student.1 - i].toggle()
        }
    }
}
let answer = (1...switchCount).map { i in
    "\(switchList[i] ? "1" : "0") " + (i % 20 == 0 ? "\n" : "")
}.joined()
print(answer)