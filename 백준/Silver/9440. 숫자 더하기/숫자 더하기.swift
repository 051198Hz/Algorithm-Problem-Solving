var input = readLine()!.split(separator: " ")
while(input.count != 1){
    let zeroCnt = [String](repeating:"0", count:input.filter{ $0 == "0" }.count )
    var numbers = input.filter{ $0 != "0"}.map{String($0)}
    numbers = numbers[1..<numbers.count].map{String($0)}.sorted()
    var n1 = [String]()
    var n2 = [String]()
    numbers.insert(contentsOf: zeroCnt , at: 2)
    for i in 0..<numbers.count{
        if i % 2 == 0{
            n1.append(numbers[i])
        }else{
            n2.append(numbers[i])
        }
    }
    let answer = Int(n1.joined())! + Int(n2.joined())!
    print(answer)
    input = readLine()!.split(separator: " ")
}