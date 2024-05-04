var answer = ""
while let ab = readLine(){
    let ab = ab.split(separator: " ").map{ Int(String($0))! }
    if ab[0] == 0 && ab[1] == 0 { break } 
    answer += ab[0] > ab[1] ? "Yes\n" : "No\n"
}
print(answer)