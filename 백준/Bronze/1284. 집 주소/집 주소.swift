while let input = readLine(), input != "0" {
    let length = input.map {
        switch $0 {
        case "1" : return 2
        case "0" : return 4
        default: return 3
        }
    }.reduce(input.count + 1, +)
    print(length)
}