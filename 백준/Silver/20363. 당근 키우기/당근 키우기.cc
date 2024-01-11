#include "iostream"
using namespace std;
typedef long long ll;
int main(){
    ll x,y; cin>>x>>y;
    ll min = x < y ? x : y;
    ll cnt = 0;

    for( ll i = min; i>0; i--){
        cnt++;
    }
    cnt /=10;
    cout<<cnt + x + y;

    return 0;
}
