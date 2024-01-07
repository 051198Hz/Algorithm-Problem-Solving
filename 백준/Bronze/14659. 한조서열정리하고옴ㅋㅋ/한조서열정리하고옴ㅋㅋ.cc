#include "iostream"
#define maxAcherNumber 30000
using namespace std;
int main(){
    int n; cin>>n;
    int archers[maxAcherNumber] = {0,};
    for(int i = 0; i<n; i++){
        cin>>archers[i];
    }
    int result = 0;
    for(int i = 0; i<n; i++){
        int cnt = 0;
        for( int j = i+1; j<n; j++){
            if(archers[i] < archers[j]){
                break;
            }
            cnt++;
        }
        result = result > cnt ? result:cnt;
    }
    cout<<result;
    return 0;
}