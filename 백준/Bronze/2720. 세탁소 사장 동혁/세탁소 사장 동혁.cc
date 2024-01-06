#include "iostream"
using namespace std;
int main(){
    int n; cin>>n;
    int units[4] = {25,10,5,1};
    int cnts[4] = {0,};
    for(int i = 0; i<n; i++){
        int change; cin>>change;
        cnts[0] = change/units[0];
        change = change%units[0];
        cnts[1] = change/units[1];
        change = change%units[1];
        cnts[2] = change/units[2];
        change = change%units[2];
        cnts[3] = change/units[3];
        change = change%units[3];
        cout<<cnts[0]<<" "<<cnts[1]<<" "<<cnts[2]<<" "<<cnts[3]<<"\n";
    }
    return 0;
}