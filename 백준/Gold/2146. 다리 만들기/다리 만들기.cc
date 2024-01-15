#include <iostream>
#include <queue>
#include <utility>
using namespace std;
int map[101][101] = {0,};
int visited[101][101] = {0,};

int map_size = 0;
int landNumber = 2;
int m = 987654321;

int dx[4] = {0,0,-1,1};
int dy[4] = {-1,1,0,0};

int Min(int a,int b){ if(a>b)return b; return a; }

int bridging(int,queue<pair<int,int>>&,int[][101]);

int validation(int x, int y){
    if( x >=0 && x<map_size && y>=0 && y<map_size)
        return 1;
    return 0;
}

void numbering(int x ,int y){

    queue<pair<int,int>> q;
    int visited2[101][101] = {0,};
    q.push(make_pair(x,y));
    queue<pair<int,int>> bridge;
    visited[y][x] =1;
    map[y][x] = landNumber;

    while(!q.empty()) {
        int cx = q.front().first;
        int cy = q.front().second;
        map[cy][cx] = landNumber;
        q.pop();
        for (int i = 0; i < 4; ++i) {
            int nx = cx + dx[i];
            int ny = cy + dy[i];
            if (validation(nx, ny)) {
                if (visited[ny][nx] == 0 && map[ny][nx] != 0) {
                    visited[ny][nx] = 1;
                    visited2[ny][nx] = 1;
                    q.push(make_pair(nx, ny));
                } else if (visited[ny][nx] == 0 && map[ny][nx] == 0) {
                    visited2[ny][nx] = 1;
                    bridge.push(make_pair(nx, ny));

                }
            }
        }
    }

    bridging(landNumber,bridge,visited2);

    landNumber++;

}

int bridging(int landNumber,queue<pair<int,int>>&bridge,int visited2[][101]){

    while(!bridge.empty()) {
        int cx = bridge.front().first;
        int cy = bridge.front().second;
        bridge.pop();
        for (int i = 0; i < 4; ++i) {
            int nx = cx + dx[i];
            int ny = cy + dy[i];

            if (validation(nx, ny)){
                if(visited2[ny][nx] == 0 && map[ny][nx] == 0) {
                    if(visited2[ny][nx] > m)
                        return m;
                    bridge.push(make_pair(nx, ny));
                    visited2[ny][nx] = visited2[cy][cx] + 1;

                }else if (map[ny][nx] > 0 && map[ny][nx] != landNumber){
                        m = Min(m, visited2[cy][cx]);
                    return 0;
                }
            }
        }
    }

    return m;
}

int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);

    cin>>map_size;

    for (int i = 0; i < map_size; ++i) {
        for (int j = 0; j < map_size; ++j) {
            cin>>map[i][j];
        }
    }


    for (int i = 0; i < map_size; ++i) {
        for (int j = 0; j < map_size; ++j) {
            if(map[i][j] != 0 && visited[i][j] == 0)
                numbering(j,i);
        }
    }

    cout<<m;
    return 0;
}