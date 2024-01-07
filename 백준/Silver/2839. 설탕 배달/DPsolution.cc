#include "iostream"
#define maxSugarNumber 5001
using namespace std;
int sugars[maxSugarNumber];
int main(){
    int n; cin>>n;
    sugars[3] = 1;
    sugars[5] = 1;
    for(int i = 6; i<=n; i++){
        if(sugars[i-3] != 0 && sugars[i-5] != 0) {
            sugars[i] = sugars[i - 3] + 1 < sugars[i - 5] + 1 ? sugars[i - 3] + 1 : sugars[i - 5]+1;
        }else if(sugars[i-3] == 0 && sugars[i-5] != 0 ){
            sugars[i] = sugars[i - 5] + 1;
        }else if(sugars[i-5] == 0 && sugars[i-3] != 0){
            sugars[i] = sugars[i - 3] + 1;
        }
    }
    int result = sugars[n] > 0 ? sugars[n] : -1;
    cout<<result;
    return 0;
}
