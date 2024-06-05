enum Eat{
    case morning
    case launch
    case dinner
}
let td = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let t = td[0]
let drink = td[1]
var eat = Eat.launch
var answer = 280
if t <= 11{
    eat = .morning
}else if t > 16{
    eat = .dinner
}
if drink == 1 || eat != .launch {
    answer = 280
}
if eat == .launch && drink == 0{
    answer = 320
}
print(answer)