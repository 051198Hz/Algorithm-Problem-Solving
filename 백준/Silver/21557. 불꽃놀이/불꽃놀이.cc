#include "iostream"
#include "vector"
#include "algorithm"
using namespace std;
typedef long long ll;
int main(){
    int n; cin>>n;
    vector<ll>fires(n);
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

    //sort(fires.begin(),fires.end());

    while(fires.size() > 2){
        if( fires.front() > fires.back() ){
            fires[0]--;fires[2]--;
            fires.erase(fires.begin()+1);
        }else{
            fires.at(fires.size()-3)--; fires.back()--;
            fires.erase(fires.end()-2);
        }
    }


    ll result = fires[0] > fires[1] ? fires[0] : fires[1];

    cout<<result;


    return 0;
}
