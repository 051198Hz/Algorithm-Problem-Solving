import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    for index in commands.indices{
        let i = commands[index][0]-1
        let j = commands[index][1]-1
        let k = commands[index][2]-1
        let sortedArray = array[i...j].sorted()
        answer.append(sortedArray[k])
    }
    return answer
}