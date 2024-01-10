def solve(L,K,tasks):
    que = tasks.copy()
    solved = 0
    score = 0
    while que:
        if solved >= K : break
        easy, hard = que.pop(0)
        if hard<=L :
            score += 140
            solved += 1
        elif easy<=L:
            score += 100
            solved += 1
        else: break
    return score

    
if __name__=='__main__':
    N,L,K = list(map(int,input().split()))
    tasks = []
    for _ in range(N):
        tasks.append(list(map(int,input().split())))
    ans = solve(L,K,tasks)
    print(ans)