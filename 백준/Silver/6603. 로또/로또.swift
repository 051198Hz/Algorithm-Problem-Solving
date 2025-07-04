import Foundation

var answer = ""

while let input = readLine(), input != "0" {

    func selection(_ current: Int, _ numbers: [String]) {
        if numbers.count == 6  {
            let output = numbers.joined(separator: " ")
            answer.write("\(output)\n")
            return
        }

        for i in current..<ks.count {
            if isVisited[i] { continue }
            isVisited[i] = true
            selection(i, numbers + [ks[i]])
            isVisited[i] = false
        }
    }

    let ks = input.split { $0 == " " }.map { String($0) }
    var isVisited = [Bool](repeating: false, count: ks.count)

    for i in 1..<ks.count {
        isVisited[i] = true
        selection(i, [ks[i]])
        isVisited[i] = false
    }

    answer.write("\n")
}

print(answer)