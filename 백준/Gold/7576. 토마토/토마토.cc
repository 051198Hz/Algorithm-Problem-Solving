#include <iostream>
#include <vector>
#include <queue>

using namespace std;
int M,N;
int map[1000][1000]={0,};
int visited[1000][1000] = {0,};

queue<pair<int,int>> chanceQ;
queue<pair<int,int>> tomato;

int day=1;
int zero = 0;

int dx[4] = {1,-1,0,0};
int dy[4] = {0,0,1,-1};

bool checkZero(){
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < M; ++j) {
            if(map[i][j]==0)
                return false;
        }
    }
    return true;
}
int validation(int x, int y){
    if(x>= 0 && x < N && y>=0 && y<M && map[x][y]!=-1 && map[x][y]!=1)
        return true;
    return false;
}

bool setChance(){
    int flag = false;
    while(!chanceQ.empty()){
        int x= chanceQ.front().first;
        int y = chanceQ.front().second;
        chanceQ.pop();
        tomato.push(make_pair(x,y));

        flag = true;
    }
    if(flag) return true;
    return false;
}

void printMap(){
    cout<<endl<<endl<<endl;
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < M; ++j) {
            cout<<map[i][j];
        }
        cout<<endl;
    }
    cout<<zero<<endl;
    cout<<endl<<endl<<endl;
}
/*
void printChance(){
    cout<<endl<<endl<<endl;
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < M; ++j) {
            cout<<chance[i][j];
        }
        cout<<endl;
    }
    cout<<zero<<endl;
    cout<<endl<<endl<<endl;
}
*/
void BFS(){
    while(!tomato.empty()){
        int x = tomato.front().first;
        int y = tomato.front().second;
        map[x][y]=1;
        visited[x][y] =1;
        //chance[x][y] = 0;
        tomato.pop();
        for (int i = 0; i < 4; ++i) {
            int nx = x + dx[i];
            int ny = y + dy[i];
            if(validation(nx,ny) && !visited[nx][ny]){
                //map[nx][ny] = 1;
                //chance[nx][ny] = 1;
                visited[nx][ny] = 1;
                chanceQ.push(make_pair(nx,ny));
            }
        }
    }
}


int main() {

    cin >> M >> N;

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < M; ++j) {
            cin >> map[i][j];
            if (map[i][j]==1) {
                tomato.push(make_pair(i,j));
            }
        }
    }

    do{
        BFS();
        if(!setChance()){
            break;
        }

    }while(day++);

    if(!checkZero()){
        cout<<-1;
    }else{
        cout<<day-1;
    }

    return 0;
}
