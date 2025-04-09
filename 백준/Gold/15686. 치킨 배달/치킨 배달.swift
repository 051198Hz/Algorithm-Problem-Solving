let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = input[0], m = input[1]

var house: [(Int, Int)] = []
var chicken: [(Int, Int)] = []
for y in 0..<n {
    let graph = readLine()!.split { $0 == " " }.map { Int($0) }
    for x in 0..<n {
        if graph[x] == 1 {
            house.append((y, x))
        }
        if graph[x] == 2 {
            chicken.append((y, x))
        }
    }
}

var result = Int.max

dfs(i: 0, selected: [])
print(result)

func dfs(i: Int, selected: [(Int, Int)]) {
    if selected.count == m {
        result = min(result, getDistance(coord: selected))
        return
    }
    
    for index in i..<chicken.count {
        dfs(i: index + 1, selected: selected + [chicken[index]])
    }
}

func getDistance(coord: [(Int, Int)]) -> Int {
    var distance = 0
    for h in house {
        var minDistance = Int.max
        for c in coord {
            minDistance = min(minDistance, abs(h.0 - c.0) + abs(h.1 - c.1))
        }
        distance += minDistance
    }
    return distance
}