while True:
    try:
                
        number = int(input())

        memos = [0] * 251

        memos[0] = 1
        memos[1] = 1
        memos[2] = 3

        for i in range( 3 , number + 1 ):
            memos[int(i)] = memos[int(i-1)] + 2 * memos[int(i-2)]

        print(memos[ number])

    except:
        break
