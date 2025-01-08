let n = Int(readLine()!)!
var answer = ""
let plate = (0..<n).map { _ in
    readLine()!.map { String($0) }
}
enum Section {
    case head
    case armL
    case armR
    case bone
    case legL
    case legR
}
var curSection: Section = .head
var boneY: Int = 0
var sectionLength = [Int](repeating: 0, count: 5)
for x in 0..<n {
    if curSection == .armR {
        curSection = .bone
    }
    if curSection == .legR {
        curSection = .legL
    }
    for y in 0..<n {
        if plate[x][y] == "*" {
            switch curSection {
            case .head:
                curSection = .armL
                continue
            case .armL:
                sectionLength[0] += 1
            case .armR:
                sectionLength[1] += 1
            case .bone:
                sectionLength[2] += 1
            case .legL:
                if y > boneY {
                    sectionLength[4] += 1
                    continue
                }
                sectionLength[3] += 1
                curSection = .legR
            case .legR:
                sectionLength[4] += 1
                curSection = .legL
            }
        }
        guard y > 0 && y < n-1 && x > 0 && x < n-1 else { continue }
        if plate[x-1][y] + plate[x][y-1] + plate[x][y] + plate[x][y+1] + plate[x+1][y] == "*****"{
            guard curSection == .armL else { continue }
            answer.write("\(x+1) \(y+1)\n")
            sectionLength[0] -= 1
            curSection = .armR
            continue
        }
        if plate[x+1][y] + plate[x+1][y-1] + plate[x][y] + plate[x+1][y+1] == "_***" {
            guard curSection == .bone else { continue }
            curSection = .legL
            boneY = y
        }
    }
}
answer.write(sectionLength.map { String($0) }.joined(separator: " "))
print(answer)