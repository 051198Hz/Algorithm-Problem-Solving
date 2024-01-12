#include "iostream"
#include "algorithm"
#define fastio ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
using namespace std;
typedef long long ll;
ll tips[100000];
int peepNum;
int compare(int a, int b){
    return a > b;
}
void input(){
    cin>>peepNum;
//    tips = new int[peepNum];

    for(int i = 0; i<peepNum; i++){
        cin>>tips[i];
    }
}
void solution(){
    sort(tips,tips+peepNum,compare);
//    for(int i = 0; i<peepNum; i++){
//        cout<<tips[i];
//    }
    ll sum = 0;
    for(int i = 0; i<peepNum; i++){
        ll tip = tips[i] - i >= 0 ? tips[i] - i : 0;
        sum += tip;
    }
    cout<<sum;
}
int main(){
    fastio;
    input();
    solution();
    return 0;
}
