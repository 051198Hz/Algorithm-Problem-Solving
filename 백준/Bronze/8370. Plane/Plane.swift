let n1k1n2k2 = readLine()!.split { $0 == " " }.map { Int(String($0))! }
print(n1k1n2k2[0]*n1k1n2k2[1] + n1k1n2k2[2]*n1k1n2k2[3])