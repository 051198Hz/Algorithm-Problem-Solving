let nsp = readLine()!.split { $0 == " " }.map { Int(String($0))! }
if nsp[0] == 0 { print(1) }
else {
    let scores = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    //태수의 새로운 점수가 랭킹 리스트에서 몇 등 하는지 구하는 프로그램을 작성하시오.
    var answer = 1
    //태수의 점수보다 큰 점수, 태수의 점수와 같은 점수.
    answer += scores.filter { $0 > nsp[1] }.count
    answer += scores.filter { $0 == nsp[1] }.count
    answer = answer <= nsp[2] ? answer - scores.filter { $0 == nsp[1] }.count: -1
    print(answer)
}