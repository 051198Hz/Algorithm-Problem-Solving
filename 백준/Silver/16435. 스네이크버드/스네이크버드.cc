#include "iostream"
using namespace std;
int main(){
    int n,l; cin>>n>>l;
    int*fruits = new int[10001]{0,};
    //높이가 p인 과일을 먹으면 뱀새의 길이는 p+1이 된다.
    int max = 0;
    //스네이크 버드의 최대 길이를 출력한다.
    for(int i = 0; i<n; i++){
        int tmp;
        cin>>tmp;
        max = tmp > max ? tmp : max;
        fruits[tmp]++;
    }
    // 과일의 높이가 자신과 같거나 낮고, 과일이 존재할 때 먹을 수 있다.
    // 뱀새의 현재 높이에서 먹을 수 있는 과일이 없을 경우 종료한다.
    //같은 높이의 과일이 여러개 존재할 수 있다.
    for (int i = 1; i<=max; i++) {
        if(fruits[i] != 0 && i <= l){
            l+=fruits[i];
        } else if( fruits[i] == 0 && i == l ){
            break;
        }
    }
    cout<<l;

    return 0;
}