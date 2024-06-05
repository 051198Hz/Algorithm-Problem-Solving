let td = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let t = td[0] <= 11 || td[0] > 16 ? true : false
let drink = td[1] == 1 ? true : false
var answer = 320
if drink == true || t != false {
    answer = 280
}
print(answer)