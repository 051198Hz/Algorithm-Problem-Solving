#include <iostream>
using namespace std;
typedef struct prob{
    int easy;
    int hard;
}prob;
int main(){
    // 문제의 개수 N
    // 현정이의 역량 L
    // 현정이가 대회중에 풀 수 있는 문제의 최대 개수 K

    int n,l,k; cin>>n>>l>>k;
    prob probs[100];
    for(int i = 0; i<n; i++){
        int easy,hard;
        cin>>easy>>hard;
        probs[i] = prob{easy,hard};
    }
    int result = 0;
    for(int i = n-1; i>=0; i--){
        if(probs[i].hard <= l){
            result+=140;
            probs[i].hard = 51;
            probs[i].easy = 51;
            k--;
        }
        if(k==0){
            break;
        }
    }
    for(int i = 0; i<n; i++){
        if(k==0){
            break;
        }
        if(probs[i].easy <= l){
            result+=100;
            probs[i].hard = 51;
            probs[i].easy = 51;
            k--;
        }
    }
    cout<<result;

    return 0;
}