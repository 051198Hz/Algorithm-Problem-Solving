var numbers = [Int]()
readLine()!.map{ numbers.append(Int(String($0))!) }
numbers.sort{ $0 > $1 }
numbers.forEach{ print($0,terminator: "")}