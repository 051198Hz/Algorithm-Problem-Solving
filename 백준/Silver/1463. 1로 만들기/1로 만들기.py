memos = [0]*1000001
number = int(input())
cnt = int(4)
memos[1] = 0
memos[2] = 1
memos[3] = 1

if(number == 1):
    print(0)
elif(number == 2):
    print(memos[2])
elif(number == 3):
    print(memos[3])
else:
    while cnt <= number:
        memos[cnt] = memos[int(cnt-1)] + 1
        if cnt%2==0:
            memos[cnt] = min( memos[int(cnt/2)]+1 , memos[cnt])
        if cnt%3==0:
            memos[cnt] = min( memos[int(cnt/3)]+1, memos[cnt] )
        cnt = cnt+1

    print(memos[number])
