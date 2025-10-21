import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var indegrees = [Int:Int]()
    var outdegrees = [Int:Int]()
    var nodeNumbers = Set<Int>()
    
    for edge in edges {
        let from = edge[0]
        let to = edge[1]
        nodeNumbers.insert(from)
        nodeNumbers.insert(to)
        outdegrees[from, default: 0] += 1
        indegrees[to, default: 0] += 1
    }
    

    var creationNode = 0
    var meviusGraphCount = 0
    var dougnutGraphCount = 0
    var stickGraphCount = 0
    var totalGraphCount = 0
    
    // 도넛 모양 그래프 수는 생성정점 out - (8자 + 막대)
    for key in nodeNumbers {
        // 생성정점의 out이 총 그래프의 갯수, out은 2개 이상, in은 0
        if outdegrees[key, default: 0] >= 2 && indegrees[key, default: 0] == 0 {
            totalGraphCount = outdegrees[key]!
            creationNode = key
            continue
        }
        // 막대모양 그래프의 갯수는 in이 1개 이상, out이 0개인 노드의 수
        if outdegrees[key, default: 0] == 0 && indegrees[key, default: 0] >= 1 {
            stickGraphCount += 1
            continue
        }
        // 8자 모양 그래프 수는 in이 2개 이상, out이 2개인 노드의 수
        if outdegrees[key, default: 0] == 2 && indegrees[key, default: 0] >= 2 {
            meviusGraphCount += 1
            continue
        }
    }
    dougnutGraphCount = totalGraphCount - (meviusGraphCount + stickGraphCount)
    
    return [creationNode, dougnutGraphCount, stickGraphCount, meviusGraphCount]
}