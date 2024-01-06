#include "iostream"
using namespace std;
int main(){
    int a,b,c;
    while(cin>>a>>b>>c){
        int answer = b-a >= c-b ? b-a:c-b;
        cout<<answer-1<<"\n";
    }
    return 0;
}