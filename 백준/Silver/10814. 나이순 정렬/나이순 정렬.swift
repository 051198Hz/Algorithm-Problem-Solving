import Foundation
var numbers = Int(readLine()!)!
var members = [Int:[String]]()
var answer = ""
for _ in 0..<numbers{
    let keyValue = readLine()!.components(separatedBy: " ")
    if let _ = members[Int(keyValue[0])!]{
        members[Int(keyValue[0])!]!.append(keyValue[1])
    }else{
        members.updateValue([keyValue[1]], forKey: Int(keyValue[0])!)
    }
}
for i in members.keys.sorted(by: <){
    for name in members[i]!{
        answer += "\(i) \(name)\n"
    }
}
print(answer)