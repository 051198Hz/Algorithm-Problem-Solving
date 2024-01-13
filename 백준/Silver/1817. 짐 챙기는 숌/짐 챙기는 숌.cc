#include <iostream>
using namespace std;
#define fastio ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
// 책의 개수 N과 박스에 넣을 수 있는 최대 무게 M
int n,m;
int* books;
void input(){
    cin>>n>>m;
    books = new int[m];
    for(int i = 0; i<n; i++){
        cin>>books[i];
    }
}
void solution(){
    //fig.
    //책은 입력되는 순서대로만 박스에 집어넣을 수 있음
    //책의 무게는 0<=무게<=M 이고 박스의 용량은 M이므로, 최소한 하나의 박스에 한개의 책이 확정적으로 들어갈 수 있다.
    //쓰여진 박스의 갯수를 result에 출력한다.
    //try
    //박스 하나의 여유공간을 나타낼 변수 선언 및 할당
    //모든 책을 탐색하며 그 책을 넣을 수 있는지 판단.
    //박스에 넣을 수 있다면 넣고
    //박스에 넣을 수 없다면 쓰여진 박스 갯수를 늘리고(쓰던 박스 포장), 새 박스로 교체 후 책을 넣음
    //edge
    //마지막 책을 넣은 후 박스 갯수를 늘려야 함
    //박스의 갯수가 0개일 수 있으므로, 반복문 안에서 수행되어야 함.
    
    int free = m;
    int result = 0;
    for(int i = 0; i < n; i++){
        //박스에 넣을 수 있다면 넣고
        if( free - books[i] >= 0){
            free -= books[i];
            //박스에 넣을 수 없다면 쓰여진 박스 갯수를 늘리고(쓰던 박스 포장), 새 박스로 교체 후 책을 넣음
        }else{
            result++;
            free = m - books[i];
        }
        if( i == n-1){ //마지막 책이라면 박스 갯수를 늘린다 (마지막 박스 포장)
            result++;
        }
    }
    cout<<result;
}
int main(){
//    fastio
    input();
    solution();
    return 0;
}