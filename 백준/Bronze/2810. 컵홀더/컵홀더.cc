#include "iostream"
using namespace std;
int main(){

    //가능한 경우들에 대해
    // S LL S
    // LL S LL
    // SSS
    // LL s
    // S LL
    // 커플 LL 사이에 S가 들어오면 그 S중 1명은 컵을 놓을 수 없음
    //  LL S S S LL 커플 2쌍 7명, 홀더 6개, 1명은 컵을 놓을 수 없음
    // 연속으로 LL이 들어오면, 1명은 컵을 놓을 수 없음
    // LL LL 3개의 컵홀더, 4명
    // S LL S LL
    // LL LL LL LL 커플 4쌍 8명, 홀더 5개, 3명은 컵을 놓을 수 없음
    // S LL S LL LL S 커플 3쌍 9명, 홀더 7개, 2명은 컵을 놓을 수 없음
    // ㅇ ㅇㅇ X ㅇㅇ Xo X OO 커플 4쌍 11명, 홀더 8개, 3명은 컵을 놓을 수 없음
    // LL LL 커플 2쌍 4명, 홀더 3개, 1명은 컵을 놓을 수 없음
    //따라서, 커플이 2쌍 이상이면, 2쌍부터 각 1쌍에 대해 1명씩 컵을 놓을 수 없게 됨.
    //총 문자열 갯수 - (if 커플이 있다면 : 커플 쌍-1) = 최대 사람의 수
    int n; cin>>n;
    int cnt = 0;
    string sitSeq; for(int i = 0; i<n; i++) {
        char tmp;
        cin >> tmp;
        if (tmp == 'L') {
            cnt++;
        }
        sitSeq += tmp;
    }
    if(cnt >3){
        cnt = (cnt/2) - 1;
    }else{
        cnt = 0;
    }
    cout<<sitSeq.size() - cnt;
    return 0;
}