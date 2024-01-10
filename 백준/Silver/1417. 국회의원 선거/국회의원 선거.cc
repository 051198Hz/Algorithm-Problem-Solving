#include <iostream>
using namespace std;
int main(){
    //다솜이는 기호 1번이다.
    //다솜이는 최대 득표한 사람보다 1표 많으면 된다.
    //다솜이가 표를 매수하면, 다른 사람의 표는 줄어든다.

    //제일 많은 득표수가 a라고 하자.
    // 다솜+1 a-1 b ...
    //매 차례마다 현재 1등의 표를 먹다가, 현재 1등의 표가 자신보다 적으면 종료.
    int n; cin>>n;
    int *votes = new int[--n];
    int max = -1, maxIdx = -1;
    int myVote; cin>>myVote;
    for(int i = 0; i<n; i++){
        cin>>votes[i];
        if(votes[i] > max){
            max = votes[i];
            maxIdx = i;
        }
    }
    int cnt = 0;
    while (max>=myVote){
        max = -1;
        for(int j = 0; j<n; j++){
            if(votes[j] > max){
                max = votes[j];
                maxIdx = j;
            }
        }
        if(myVote>max){
            break;
        }
        cnt++;
        votes[maxIdx]--;
        myVote++;
    }
    cout<<cnt;


    return 0;
}