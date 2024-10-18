//
//  main.swift
//  BJ1012
//
//  Created by Yune gim on 2024/10/18.
//

import Foundation

let t = Int(readLine()!)!

let dx: [Int] = [0, 0, -1, 1]
let dy: [Int] = [-1, 1, 0, 0]

for _ in 0..<t {
    var stack: [[Int]] = []
    var answer = 0
    let MNK = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
    let m = MNK[0], n = MNK[1], k = MNK[2]
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var isVisited = map
    
    (0..<k).forEach { _ in
        let xy = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
        map[xy[1]][xy[0]] = 1
        stack.append(xy)
    }    
outer: while !stack.isEmpty {
        let cxy = stack.popLast()!
        if isVisited[cxy[1]][cxy[0]] == 1 { continue outer }
        
        answer += 1
        
        var nPos: [[Int]] = []
        nPos.append(cxy)
    
inner: while !nPos.isEmpty{
            let nxy = nPos.popLast()!
            
            if nxy[0] < 0 || nxy[0] >= m || nxy[1] < 0 || nxy[1] >= n { continue inner }
            if isVisited[nxy[1]][nxy[0]] == 1 { continue inner }
            isVisited[nxy[1]][nxy[0]] = 1
            
            for i in 0..<4 {
                let nx = dx[i] + nxy[0]
                let ny = dy[i] + nxy[1]
                if nx < 0 || nx >= m || ny < 0 || ny >= n { continue }
                if isVisited[ny][nx] == 1 { continue }
                if map[ny][nx] == 0 { continue }
                nPos.append([nx,ny])
            }
        }
    }
    print(answer)
}
