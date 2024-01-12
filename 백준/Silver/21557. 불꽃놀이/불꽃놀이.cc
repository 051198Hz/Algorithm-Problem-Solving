#include "iostream"
#define fastio ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
using namespace std;
typedef long long ll;
int main(){

    fastio;
    int n; cin>>n;
//    ll*fires = new ll[n];
    ll fires[200000] = {0,};
    for(int i =0; i<n; i++){
        cin>>fires[i];
    }

    //try
    // 양 끝을 제외한 폭죽을 터뜨림
    //폭죽을 터뜨릴 시, 터뜨린 폭죽의 양 폭죽의 높이가 1씩 줄어듬
    // N - 2번을 터뜨린 후, 양 끝에 남은 폭죽 더미의 높이 중 더 큰 값을 최소화하려고 함.
    //폭죽더미가 주어지는 순서와 실제 폭죽의 순서는 상관이 없다.
    //입력받은 폭죽더미를 오름차순으로 정렬하고 -> 현 소스는 입력되는 폭죽의 순서대로 진행한다.
    // 양 끝 값중 더 큰 값을 확인하여 더 큰 값의 폭죽더미에서 가장 가까운 폭죽을 터뜨린다.
    int first = 0;
    int size = n;
    while(size > 2){
        if( fires[first] > fires[n-1] ){
            fires[first]--; fires[first+2]--;
            fires[first+1] = fires[first];
            fires[first] = 0;
            first++;
            size--;
        }else{
            fires[n-3]--; fires[n-1]--;
            fires[n-2] = fires[n-1];
            fires[n-1] = 0;
            n--;
            size--;
        }
    }


    ll result = fires[first] > fires[n-1] ? fires[first] : fires[n-1];

    cout<<result;


    return 0;
}
