#include <iostream>
using namespace std;
int main(){
    string str; cin>>str;

    int cnt = 0;

    for(long long i = 1; i<str.size(); i++){
        if( str[i] != str[i-1]){
            cnt++;
        }
    }

    cnt++; cnt/=2;
    cout<<cnt;

    return 0;
}