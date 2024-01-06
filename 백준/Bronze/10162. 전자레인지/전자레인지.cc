#include "iostream"
using namespace std;
int main(){
    int T,result = 0; cin>>T;
    int btns[3] = {300,60,10};
    int times[3] = {0,};
    for(int i = 0; i<3; i++){
        for (int j = 0; result <= T; ++j) {
            if(result+btns[i] <= T){
                result+=btns[i];
                times[i]++;
            }else{
                break;
            }
        }
    }
    if(result == T){
        for(int i = 0; i<3; i++){
            cout<<times[i]<<" ";
        }
        return 0;
    }
    cout<<-1;
    return 0;
}