while let input = readLine(), input != "# 0 0" {
    let nameAgeWeight = input.split { $0 == " " }.map { String($0) }, 
        name = nameAgeWeight[0],
        age = Int(nameAgeWeight[1])!,
        weight = Int(nameAgeWeight[2])!
    let clubType = (age > 17) || (weight >= 80) ? "Senior" : "Junior"
    print(name, clubType)
}