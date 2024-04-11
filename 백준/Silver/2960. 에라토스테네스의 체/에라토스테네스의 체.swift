let nk = readLine()!.split(separator: " ").map{Int(String($0))!}

var isPirme = [Bool](repeating: true, count: nk[0]+1)
isPirme[0] = false
isPirme[1] = false
var count = 0
for i in 2...nk[0]{
    if isPirme[i] {
        var j = 1
        while j*i <= nk[0] {
            if isPirme[j*i] == true {
                isPirme[j*i] = false
                count += 1
                if count == nk[1]{
                    print(j*i)
                }
            }
            j += 1
        }
    }
}