var numbers = readLine()!.split{ $0 == " "}.map{ Int($0)! }
sort: while true{
    for i in numbers.indices where i < 4{
        if numbers[i] > numbers[i+1]{
            numbers.swapAt(i, i+1)
            numbers.forEach{ print($0, terminator: " ")}
            print()
        }
    }
    for i in numbers.indices{
        if numbers[i] != i+1 { continue sort }
    }
    break
}