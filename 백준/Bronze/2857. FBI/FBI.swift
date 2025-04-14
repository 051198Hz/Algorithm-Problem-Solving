import Foundation

var fbiList = [Int]()
(1...5).forEach { index in
    let name = readLine()!
    guard name.contains("FBI") else { return }
    fbiList.append(index)
}
let answer = fbiList.isEmpty ? "HE GOT AWAY!" : fbiList.map { String($0) }.joined(separator: " ")
print(answer)