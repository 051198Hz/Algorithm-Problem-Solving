let n = Int(readLine()!)!
while let str = readLine(){
    if str.count > 5 && str.count < 10{
        print("yes")
        continue
    }
    print("no")
}