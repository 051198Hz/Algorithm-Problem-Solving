import Foundation
var answer = ""
while let str = readLine(), str != "#"{
    answer += "\(str.map{$0.lowercased()}.filter{ "aeiou".contains($0)}.count)\n"
}
print(answer)