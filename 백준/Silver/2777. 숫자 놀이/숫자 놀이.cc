#include "iostream"
#include "string"
#define fastio ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
using namespace std;
int cases;
void input(){
    cin>>cases;
}

void solution(){
    //figure
    // 입력받은 n에 대하여, 9 이하의 어떤 수들로 나타낼 수 있는 수열을 오름차수 정렬한 것을 숫자로 할때
    // 그 숫자를 출력하시오
    //try
    // 입력받은 n에 대해서 인수 분해
    // 인수 중 2자리 이상인 인수에 대해 다시 인수분해 시행 , 즉 모든 인수가 9 이하일 때까지 반복
    // 상기 과정에 대해 인수분해 할 수 없는 10 이상의 수가 있다면 -1을 출력 후 종료
    // 인수분해가 모두 끝났으면 수들을 오름차순으로 정렬 후 출력
    // 인수 분해에 대하여
    // 어떤 수를 두 수로 인수분해하는 방법은?
    // n을 1부터 9까지로 나눈다.
    // 이때 나누어 떨어지지 않으면, -1을 출력하고 종료
    // 나누어 떨어지는 수를 i라고 할때, 배열의 맨 마지막 수와의 곱이 9 이하이면 마지막 수 * i가 배열의 맨 마지막수가 된다.
    // 그렇지 않으면, 배열의 맨 끝에 i를 추가한다.
    // n을 i로 나눈 몫을 n에 할당한다.
    // i를 초기화한다.
    // 더이상 나누어 떨어지지 않을 때 까지 상기 과정을 반복한다,
    // n이 1이라면 n이 모두 인수분해 된 것이므로, 배열의 크기를 출력 후 종료
    // 그렇지 않다면, 인수분해 되지 않은것이므로 -1을 출력 후 종료
    while (cases-->0){
        int n; cin>>n;
        string result="1";
        for( int i = 2; i < 10; i++){
            if(n%i == 0){
                char c;
                if( (result[result.size() - 1] - '0') * i <= 9){
                    c = ( (result[result.size() - 1] - '0') * i ) + '0';
                    result[result.size() - 1] = c;
                }else{
                    c = i + '0';
                    result+=c;
                }
//                cout<<result<<"\n";
                n/=i;
                i = 1;
            }
        }
        if(n == 1){
            cout<<result.size()<<"\n";
        }else{
            cout<<-1<<"\n";
        }
    }
}
int main(){
    fastio;
    input();
    solution();
    return 0;
}