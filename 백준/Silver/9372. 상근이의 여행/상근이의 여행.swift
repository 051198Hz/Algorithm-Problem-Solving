let number = Int(readLine()!)!
for _ in 0..<number{
    let cityPlane = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    for _ in 0..<cityPlane[1]{
        _ = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    }
    print(cityPlane[0] - 1)
}