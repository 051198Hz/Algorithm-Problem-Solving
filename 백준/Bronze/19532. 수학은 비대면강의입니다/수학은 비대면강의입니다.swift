let abcdef = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (a, b, c, d, e, f) = (abcdef[0], abcdef[1], abcdef[2], abcdef[3], abcdef[4], abcdef[5])
outer: for x in -999...999 {
    for y in -999...999 {
        guard a*x + b*y == c else { continue }
        guard d*x + e*y == f else { continue }
        print(x,y)
        break outer
    }
}