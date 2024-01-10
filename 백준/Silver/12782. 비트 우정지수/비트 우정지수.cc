#include "iostream"
#include "string"
using namespace std;
int main(){
    int T; cin>>T;
    while (T-->0){
        int*diff = new int[1000000]{0,};
        string a,b; cin>>a>>b;
        int cntP = 0, cntN = 0;
        for(int i = 0; i<a.size(); i++){
            diff[i] = (int)(a[i]-'0') - (int)(b[i]-'0');
            if(diff[i] == 1){
                cntP++;
            }else if(diff[i] == -1){
                cntN++;
            }
        }
        int result = cntP > cntN ? cntP : cntN;
        cout<<result<<"\n";
        delete [] diff;
    }

    return 0;
}