//
// Created by Yune gim on 2024/01/20.
//
#include "iostream"
using namespace std;
int n;
int*rewards;

void input(){
    cin>>n; rewards = new int[n];
    for(int i = 0; i<n; i++){
        cin>>rewards[i];
    }
}
void solution(){
    int result = 0;
    for(int i = n-2; i>=0; i--){
        if( rewards[i] >= rewards[i+1] ){
            int diff = rewards[i] - rewards[i+1] + 1;
            rewards[i] -= diff;
            result += diff;
        }
    }
    cout<<result;
}
int main(){
    input();
    solution();
    return 0;
}

