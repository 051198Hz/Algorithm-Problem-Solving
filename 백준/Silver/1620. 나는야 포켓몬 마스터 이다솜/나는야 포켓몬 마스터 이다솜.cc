#include "iostream"
#include "unordered_map"
#define fastio ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
using namespace std;
int n,m;

unordered_map<string,int> dictStrNum;
unordered_map<int,string> dictNumStr;

void input(){
    cin>>n>>m;
    for(int i = 0; i < n; i++){
        string name; cin>>name;
        dictNumStr.insert(make_pair(i+1,name));
        dictStrNum.insert(make_pair(name,i+1));
    }
}
void solution(){
    for(int i = 0; i<m; i++){
        string input; cin>>input;
        if( atoi(input.c_str()) == 0){ // 포켓몬 이름이라면
            cout<<dictStrNum[input]<<"\n";
        }else{
            cout<<dictNumStr[stoi(input)]<<"\n";
        }
    }
}
int main(){
    fastio;
    input();
    solution();
    return 0;
}