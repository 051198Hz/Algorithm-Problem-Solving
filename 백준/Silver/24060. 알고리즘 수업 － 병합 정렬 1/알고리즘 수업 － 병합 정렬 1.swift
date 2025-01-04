import Foundation

//merge_sort(A[p..r]) { # A[p..r]을 오름차순 정렬한다.
//    if (p < r) then {
//        q <- ⌊(p + r) / 2⌋;       # q는 p, r의 중간 지점
//        merge_sort(A, p, q);      # 전반부 정렬
//        merge_sort(A, q + 1, r);  # 후반부 정렬
//        merge(A, p, q, r);        # 병합
//    }
//}
var saved = 0
func merge_sort( _ collection: inout [Int], _ p: Int, _ r: Int) -> Bool {
    if p < r {
        let q = Int(floor(Double(p+r) / 2.0))
        if merge_sort(&collection, p, q) { return true }
        if merge_sort(&collection, q+1, r) { return true }
        if merge(&collection, p: p, q: q, r: r) { return true }
    }
    return false
}

//
//# A[p..q]와 A[q+1..r]을 병합하여 A[p..r]을 오름차순 정렬된 상태로 만든다.
//# A[p..q]와 A[q+1..r]은 이미 오름차순으로 정렬되어 있다.
//merge(A[], p, q, r) {
//    i <- p; j <- q + 1; t <- 1;
//    while (i ≤ q and j ≤ r) {
//        if (A[i] ≤ A[j])
//        then tmp[t++] <- A[i++]; # tmp[t] <- A[i]; t++; i++;
//        else tmp[t++] <- A[j++]; # tmp[t] <- A[j]; t++; j++;
//    }
//    while (i ≤ q)  # 왼쪽 배열 부분이 남은 경우
//        tmp[t++] <- A[i++];
//    while (j ≤ r)  # 오른쪽 배열 부분이 남은 경우
//        tmp[t++] <- A[j++];
//    i <- p; t <- 1;
//    while (i ≤ r)  # 결과를 A[p..r]에 저장
//        A[i++] <- tmp[t++];
//}
//p = 0, q = 0, r = 1
func merge(_ collection: inout [Int], p: Int, q: Int, r: Int) -> Bool{
    var tmp: [Int] = []
    var i = p, j = q+1
    while i <= q && j <= r {
        if collection[i] <= collection[j] {
            tmp.append(collection[i])
            i += 1
        } else {
            tmp.append(collection[j])
            j += 1
        }
    }
    while i <= q {
        tmp.append(collection[i])
        i += 1
    }
    while j <= r {
        tmp.append(collection[j])
        j += 1
    }
    i = p
    for element in tmp {
        saved += 1
        if saved == ak[1] {
            print("\(element)")
            return true
        }
        collection[i] = element
        i += 1
    }
    return false
}

var ak = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
var collection = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
if !merge_sort(&collection, 0, ak[0]-1) {
    print("-1")
}