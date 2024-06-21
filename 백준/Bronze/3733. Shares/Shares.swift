while let input = readLine(){
    let nx = input.split{ $0 == " " }.map{ Int(String($0))! }
    let n = nx[0]+1, x = nx[1]
    let answer = x/n
    print(answer)
}