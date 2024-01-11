#include "iostream"
#include "algorithm"
using namespace std;
#define IAMSOFAST ios_base::sync_with_stdio(false);cin.tie(0);
int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);

    //try
    //코인 매도,매수 조건을 파악해본다.
    //첫날에 가능한 코인을 매수.
    //앞날과 뒷날보다 코인 가격이 높을 경우, 모두 매도
    //앞날과 뒷날보다 코인 가격이 낮을 경우, 모두 매수
    //앞날이 오늘보다 코인 가격이 같거나 낮을경우, 매수하지 않음.

    //어제가 오늘보다 코인 가격이 같거나 높고, 내일이 오늘보다 코인 가격이 높을경우 매수.
    //어제가 오늘보다 코인 가격이 같거나 낮고, 내일이 오늘보다 코인 가격이 낮을경우 매도.

    //오늘이 다음 날짜보다 코인 가격이 높을경우, 모두 매도.

    //오늘이 어제보다 코인 가격이 낮아졌을 경우, 어제 날짜로 매도.
    //오늘이 어제보다 코인 가격이 높아졌을 경우, 어제 가격으로 매수.
    //마지막 날 모든 코인 매도.

    //sol
    //내일이 오늘보다 코인 가격이 낮아졌을 경우, 전량 매도
    //내일이 오늘보다 코인 가격이 높아졌을 경우, 전량 매수

    long long money,days; cin>>days>>money;
    long long myCoin = 0;
    long long *charts = new long long [days+2];
    for(int i = 1; i<=days; i++){
        cin>>charts[i];
    }

    charts[0] = 0;
    charts[days+1] = 0;
    for(int i = 1; i <=days; i++){
        if( charts[i+1] > charts[i] ){ //매수
            myCoin += money/charts[i];
            money -= ( money/charts[i]) * charts[i];
            // money = money%charts[i] 로 하면 올솔이 안남,,, 왜지?
        }else if(  charts[i+1] < charts[i] ){ //매도
            money += myCoin*charts[i];
            myCoin = 0;
        }
    }
    cout<<money;
    return 0;
}
