while(true){
    var input = readLine()!.split(separator: " ")
    if input.count == 1 { break }
    let zeroCnt = [String](repeating:"0", count:input.filter{ $0 == "0" }.count )
    var numbers = input.filter{ $0 != "0"}.map{String($0)}
    numbers = numbers[1..<numbers.count].map{String($0)}.sorted()
    var n1 = [String]() //제일 작은 수
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
}