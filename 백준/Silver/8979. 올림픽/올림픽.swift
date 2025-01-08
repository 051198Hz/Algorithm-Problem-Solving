struct Nation: Comparable {
    let number: Int
    let gold: Int
    let silver: Int
    let coper: Int
    static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs.gold == rhs.gold {
            if lhs.silver == rhs.silver {
                return lhs.coper < rhs.coper
            }else {
                return lhs.silver < rhs.silver
            }
        }
        return lhs.gold < rhs.gold
    }
}

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var currentTie = 0
var currentOrder = 1
var order: [Int: [Nation]] = [:]

var nations: [Nation] = (0..<nk[0]).map { _ in
    let gsc = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
    return Nation(number: gsc[0], gold: gsc[1], silver: gsc[2], coper: gsc[3])
}

nations.sort { $0 > $1 }

for nation in nations{
    if order[currentOrder] == nil {
        if nation.number == nk[1] { break }
        order[currentOrder] = [nation]
        currentTie += 1
        continue
    }
    if order[currentOrder]!.first! > nation {
        currentOrder += currentTie
        currentTie = 1
        order[currentOrder] = [nation]
        if nation.number == nk[1] { break }
        continue
    }
    if nation.number == nk[1] { break }
    order[currentOrder]?.append(nation)
    currentTie += 1
}
print(currentOrder)