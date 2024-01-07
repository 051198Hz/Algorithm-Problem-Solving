#include "iostream"
#define maxunitNumber 2
using namespace std;
int main(){
//규칙 추론
//3일때 -1
//4일때 -1
//5일때 1 5m
//6일때 2 3n
//7일때 -1
//8일때 2봉지 3n+5m
//9일때 3봉지 3n
//10일때 2봉지 5m
//11일때 3봉지 3n+5m
//12 -1
//13 3n+5m
//14 -1
//15 5m
//16 3n+5m
    
    //즉, n은 다음의 경우중 하나임
    //n=5p
    //n=3q
    //n=5p+3q
    //n!=5p+3q
    //엣지 케이스는 n이 3과 5의 공배수를 포함하고 있을 경우
    //5의 배수인것을 먼저 체크하여 해소

    //sol.
    //1. 어떤 수 x가 주어졌을 때, 이수에 3을 뺀 후 나머지가 5의 배수라면, 5로 빼기 시작함
    //2. 그렇지 않다면 1번으로 돌아감.

    int units[maxunitNumber] = {5,3};
    int n; cin>>n;
    int result = 0;
    if(n==3){
        cout<<1; return 0;
    }else if(n==4){
        cout<<-1; return 0;
    }else if(n==5){
        cout<<1; return 0;
    }
    while(n>2){
        if(n%5==0){
            result+=n/5;
            n%=5;
            break;
        }else if( (n-3)%5 ==0 ){
            n-=3;
            result++;
        }else{
            n-=3;
            result++;
        }
    }
    if(n==0){
        cout<<result;
    }else{
        cout<<-1;
    }
    return 0;
}



