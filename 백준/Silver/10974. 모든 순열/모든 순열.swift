import Foundation

//N이 주어졌을 때, 1부터 N까지의 수로 이루어진 순열을 사전순으로 출력하는 프로그램을 작성하시오.
let input = Int(readLine()!)!

func printPermutation(numbers: [Int], picks:[Int] = []){
    if picks.count == numbers.count{
        picks.forEach{print($0,terminator: " ")}
        print()
        return
    }
    
    for number in numbers where picks.contains(number) == false{
        let newPicks = [Int](picks+[number])
        printPermutation(numbers: numbers,picks:newPicks)
    }
}

let numbers = [Int](1...input)
printPermutation(numbers: numbers)

//for i in 1...input{
//    for j in 1...input{
//        for k in 1...input{
//            if print(i,j,k)
//        }
//    }
//}
