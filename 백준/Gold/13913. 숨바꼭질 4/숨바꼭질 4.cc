#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;
int map[1000001] = { 0, };
unsigned int visited[1000001] = { 0,};
vector<int> path;
int N, K;

using namespace std;
/*
int abss(int abs) {

	if (abs > 0) return abs;
	else if (abs == 0)return 0;
	else return -1 * abs;

}

int main()
{
	int N, K, cnt = 0 ,i = 0;

	cin >> N >> K;

	while (true) {
		cnt++;
		int min = 100000;
		int tmp[3];
		tmp[0] = abss(N - K) - (N - 1);
		tmp[1] = abss(N - K) -  (N + 1);
		tmp[2] = abss(N - K) - (N * 2);


		for (i = 0; i < 3; i++) {
			if (min> abss(tmp[i])) min = tmp[i];
			cout << "min = " <<min << endl;
		}
		if (min == 0) break;
		N = abss(N - K) - min;
		cout << N << endl;
	}

	cout << cnt;

	return 0;

}
*/

int BFS(int N) {
	queue<int> q;
	q.push(N);

	visited[N] = N;
	map[N] = 0;

	while (!q.empty()) {
		int next = q.front();

		q.pop();
		if (next == K){
            int i = K;
            path.push_back(K);
            while(i!=N){
                path.push_back(map[i]);
                i = map[i];
            }
            break;
        }

		if ((next + 1 < 1000000) &&(next + 1 >= 0) && (!visited[next + 1])) {
			q.push(next + 1);
			map[next + 1] = next;
			visited[next + 1] = 1;
		}
		if ((next - 1 < 1000000) && (next - 1 >=0) && (!visited[next - 1] )) {
			q.push(next - 1);
			map[next -1] = next;
			visited[next - 1] = 1;

        }
		if ((next * 2 < 1000000) && (next *2 >= 0) && (!visited[next * 2])) {
			q.push(next * 2);
			map[next *2] = next;
			visited[next*2] = 1;
        }

	}
	return map[K];
}


int main() {

	cin >> N >> K;

	BFS(N);

    cout<<path.size()-1<<endl;

    for (int i = path.size()-1; i >=0; i--) {
        cout<<path[i]<<' ';
    }
    
	return 0;

}