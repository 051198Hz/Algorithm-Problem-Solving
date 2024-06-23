(0..<Int(readLine()!)!).forEach{ _ in
    let xy = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
    let x = xy[0], y = xy[1]
    print(x+y)
}