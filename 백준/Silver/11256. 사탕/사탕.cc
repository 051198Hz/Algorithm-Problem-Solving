#include "iostream"
#include "algorithm"
using namespace std;
int compare(int i, int j){
    return  j < i;
}
int main(){

    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);
    int T; cin>>T;
    while(T-->0){
        int j,n; cin>>j>>n;
        int*boxes = new int[n];
        for(int i = 0; i<n; i++){
            int tmp1,tmp2;
            cin>>tmp1>>tmp2;
            boxes[i] = tmp1*tmp2;
        }
        sort(boxes,boxes+n,compare);
        for(int i = 0; i<n; i++){
            j-=boxes[i];
            if(j<=0){
                cout<<i+1<<"\n";
                break;
            }
        }
    }
}