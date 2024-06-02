let mk = readLine()!.split{ $0 == " "}.map{ Int($0)! }
print( (mk[0] % mk[1]) == 0 ? "Yes" : "No" )