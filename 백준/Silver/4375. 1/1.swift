var answer = ""
while let n = readLine(), let number = Int(n){
    var onlyOne = 1
    var count = 1
    while onlyOne % number != 0{
        onlyOne = ( (onlyOne*10) + 1 ) % number
        count += 1
    }
    print(count)
}