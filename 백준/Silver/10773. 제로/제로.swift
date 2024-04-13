if let times = Int(readLine()!){
    var stack:[Int] = []
    for _ in 0..<times{
        let number = Int(readLine()!)!
        if number == .zero{
            _=stack.popLast()
        }else{
            stack.append(number)
        }
    }
    let answer = stack.reduce(0){ $0 + $1}
    print(answer)
}