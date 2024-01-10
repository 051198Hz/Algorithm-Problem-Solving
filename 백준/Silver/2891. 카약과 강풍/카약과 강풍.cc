#include "iostream"
using namespace std;
int main(){
    int n,s,r; cin>>n>>s>>r;
    int teams[10] = {0,};
    for(int i = 0; i<s;i++){
        int tmp; cin>>tmp;
        teams[--tmp]--;
    }
    for(int i = 0; i<r;i++){
        int tmp; cin>>tmp;
        teams[--tmp]++;
    }
    //여분을 가져온 팀의 카약이 부서졌다면 현재 값이 0
    //그대로라면 1
    //여분도 없고, 카약이 부서진 팀은 현재 값이 -1

    // 카약을 빌리지 못하는 팀의 갯수를 출력
    // 카약의 여분을 가져온 팀은 자신의 바로 앞, 바로 뒤 팀에게 빌려줄 수 있다.
    // 카약을 빌린 팀은 다른 팀에게 빌린 카약을 다시 빌려줄 수 없다.
    // 또, 카약을 하나 더 가져온 팀의 카약이 손상되었다면, 여분의 카약으로 경기에 출전하게되고, 이 카약은 다른 팀에게 빌려줄 수 없다.
    //case
    // 0 0 1 0 0
    //카약을 최대한 빌리고 빌려주는 경우를 만들자.

    //  빌릴 수 있었는데, 다른 팀이 가져가서 빌릴 수 없었던 경우가 있을까?
    // -1 -1 -1 -1 -1 0 0 0 0 0 1 1 1 1    0 0 0 0
    //그런 경우는 없을 것 같다.
    int result = 0;
    for(int i = 0; i<n; i++){
        if(teams[i] == -1){
            if(i-1 > -1 && teams[i-1] > 0){ //이전 팀에게 빌릴 수 있다면
                teams[i]++;
                teams[i-1]--;
            }else if(i+1 < n && teams[i+1] > 0){ //다음 팀에게 빌릴 수 있다면
                teams[i]++;
                teams[i+1]--;
            }else{
                result++;
            }
        }
    }

    cout<<result;
    return 0;
}