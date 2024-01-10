#include "iostream"
using namespace std;
int main(){
    //강산이의 총 휴가 v를 p일씩 쪼갠다. p일 내에 l일만 사용할 수 있다.

    int l,p,v;
    while(cin>>l>>p>>v){
        static int T = 0; T++;
        if( l == 0 && p == 0 && v == 0){
            return 0;
        }

        int a = v/p;
        int b = v%p;
        int c = b/l;
        //쪼개고 남은 일수는 p일 미만이므로, 최대 l일일 수 있다.
        if(c == 0){
            c = b%l;
        }else{
            c = l;
        }
        int result = a*l + c;
        cout<<"Case"<<" "<<T<<": "<<result<<"\n";
    }
}