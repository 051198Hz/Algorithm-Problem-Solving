#include "iostream"
#define fastio ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
using namespace std;
typedef long long ll;
string board = "";
string result = "";
bool havingNumber = false;
bool onlyDot = true;
void input(){
    cin>>board;
}
void solution(){

    //4p + 2q AAAAp + BBq
    //2로 나누어지는지 확인.
    // cnt%4 == 0 AAAA으로만 나타낼 수 있음
    // cnt%4 == 2 AAAAp + BB로만 나타낼 수 있음
    // cnt&4 == 1 || cnt%4 > 2 AAAAp + BB로 나타낼 수 없음.
    //엣지케이스
    //문자열에 X가 1개도 없을 경우.
    // 문자열에 .이 없어 마지막 문자열까지 .을 만나지 않을경우
    int cnt = 0;
    for(ll i = 0; i<board.size(); i++){
        if(board[i] == '.' || i == board.size()-1){
            if(cnt > 0){
                if(i==board.size()-1 && board[i] != '.') cnt++;
                if(cnt%4 == 0){
                    string tmp(cnt,'A');
                    result+=tmp;
                    havingNumber = true;
                }else if(cnt%4 == 2){
                    string tmp(cnt-2,'A');
                    tmp+="BB";
                    result+=tmp;
                    havingNumber = true;
                }else{
                    result = "-1";
                    break;
                }
            }if(i == board.size()-1  && cnt == 0 && board[i] != '.'){
                result = "-1";
                break;
            }
            cnt = 0;
            if(board.size() == 1 && board[i] != '.'){
                result = "-1";
            }else if(i == board.size()-1 && board[i] == '.'){
                result+='.';
            }
            else if(i != board.size()-1){
                result+='.';
            } //마지막 문자열이 X이거나 . 임

        }else if(board[i] != '.'){
            cnt++;
            onlyDot = false;
        }
    }
    if(havingNumber == false && onlyDot == false) result = "-1";
    cout<<result;
}
int main(){
    fastio;
    input();
    solution();
    return 0;
}
