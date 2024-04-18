import Foundation

extension Character{
    var leftPS:Character{
        if self == ")"{
            return "("
        }else if self == "]"{
            return "["
        }
        return "0"
    }
    var isLeftPS: Bool{
        if self == "(" || self == "["{
            return true
        }
        return false
    }
    var isPS: Bool {
        if self == ")" || self == "]" || self == "(" || self == "["{
            return true
        }
        return false
    }
}

while let str = readLine() {
    if str == "." { exit(0) }
    var stack: [Character] = []
    for c in str where c.isPS{
        if c == "." { break }
        if c.isLeftPS {
            stack.append(c)
            continue
        }
        if c.leftPS == stack.last{
            _=stack.popLast()
            continue
        }
        stack.append("F")
        break
    }
    if stack.count == 0{
        print("yes")
        continue
    }
    print("no")
}
