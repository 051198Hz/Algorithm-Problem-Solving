#include "iostream"
#include "algorithm"
using namespace std;
typedef struct prob{
    int time;
    int iv;
}prob;
int compare(prob a, prob b){
    return a.time < b.time;
}
int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    //패널티가 V인 문제를 풀 때 T분이 소요됐다면, T+20V에 해당하는 패널티를 얻습니다.
    //얻는 최소의 패널티를 출력하시오.
    //try
    //문제를 풀면 반드시 패널티는 얻는다.
    //패널티가 없는 문제를 나중에 풀고, 패널티가 있는 문제를 먼저 푼다.
    //패널티가 있는 문제를 푸는 순서가 중요한데, 패널티가 있는 문제를 풀면 풀수록 패널티는 늘어난다.
    //패널티는 시간+패널티 배수 에 의해 결정되므로, 늘어나는 시간과 패널티배수를 적게 가져가야 한다
    //패널티가 있는 문제를 정렬하는 기준이 무엇이냐 인데,,
    //시간이 적게 걸리는 문제를 먼저 풀 경우에 패널티 배수가 높으면
    //시간이 오래 걸리는 문제이지만 패널티 배수가 적을 경우에 비해 패널티는 최소가 아니다.

    //sol.
    //라고 생각했지만 패널티는 그 문제에서 받은 패널티만 합산에 적용된다.
    //문제를 언제 풀든 패널티 배수에 의한 패널티 누적은 같고, 누적 시간이 커지면 패널티 누적도 크므로
    //풀이 시간이 적게 걸리는 문제를 먼저 푸는것이 최소 패널티를 얻는 방법이다.

    int T = 11;
    int sumD = 0;
    int panalty = 0;
    prob* probs = new prob[11];
    while(T-->0){
        int d, v; cin>>d>>v;
        probs[T] = prob{d,v};
    }
    sort(probs,probs+11, compare);
    for(int i = 0; i<11; i++){
        sumD += probs[i].time;
        panalty+=sumD +( probs[i].iv * 20);
    }
    cout<<panalty;

    return 0;
}