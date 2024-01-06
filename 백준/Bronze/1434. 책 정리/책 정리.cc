#include "iostream"
using namespace std;
int main(){
    int n,m; cin>>n>>m;
    int boxs[50] = {0,};
    int books[50] = {0,};
    for(int i = 0; i< n; i++){
        cin>>boxs[i];
    }
    for(int i = 0; i< m; i++){
        cin>>books[i];
    }
    for(int i = 0; i<n; i++){
        for(static int j = 0; j<m; j++){
            if(boxs[i] - books[j] <0){
                break;
            }
            boxs[i]-=books[j];
        }
    }
    int result = 0;
    for(int i = 0; i<n;i++){
        result+=boxs[i];
    }
    cout<<result;
    return 0;
}