#include "iostream"
#define maxUnitCnt 6
using namespace std;
int main(){
    int units[6] = {500, 100, 50, 10, 5, 1};
    int changes; cin>>changes; changes = 1000 - changes;
    int cnt = 0;
    for(int i = 0; i < maxUnitCnt; i++){
        if(changes == 0) break;
        cnt += changes / units[i];
        changes%=units[i];
    }

    cout<<cnt;

    return 0;
}