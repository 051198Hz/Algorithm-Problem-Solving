#include "iostream"
#include "algorithm"
#define IAMSOFAST ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
using namespace std;
typedef long long ll;
ll n,m;
void input(){
    cin>>n>>m;
}
void solution(){
    // figure
    // 나이트는 위 또는 아래로 이동 후 오른쪽으로만 이동할 수 있음
    // 보드의 가로세로 길이에 이동 횟수가 제한됨
    // 보드의 가로세로 길이에 따라 유리한 이동(덜 이동하는 방식)을 채택하는 문제
    // try
    // 4종류의 이동을 하려면 N >=3 이어야 하고 M >= 7이어야 한다. 그 미만의 경우는 최대 이동횟수는 하기와 같다.
    // N <= 2일때
    // M >= 5 이동 2
    // M < 4 이동1
    //
    // N >= 3일때
    // M <= 4일때 이동 M-1
    // 5 <= M <= 6 일때 이동 3
    // M>= 7일때 이동 4 + (M-7)
    // M >= 7일때, 1구간(7줄)마다 4개씩 사용 가능하므로
    // m/7 * 5 +
    if(n ==1){
        cout<<"1";
    }else
        if( n <= 2){
        if(m <= 2){
            cout<<"1";
        }else if(m  <= 4){
            cout<<"2";
        }else if( m <= 6){
            cout<<"3";
        }else{
            cout<<"4";
        }
    }else{
        if(m < 4 ){
            cout<<m;
        }else if( m >= 4 && m <= 6){
            cout<<"4";
        }else{
//            ll r = ((m-7) % 6) < 4 ? ((m-7) % 6) : 4;
//            cout<< 5 + ((m-7) / 6) * 4 + r;
            cout<< 5 + (m-7);
        }
    }
}
int main(){
//    IAMSOFAST;
    input();
    solution();
    return 0;
}
