

#include <iostream>
#include <vector>
#include <queue>

int map[1000000] = { 0, };
bool visited[1000000] = { 0,};

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

	visited[N] = true;
	map[N] = 0;

	while (!q.empty()) {
		int next = q.front();
		
		q.pop();
		if (next == K)break;

		if ((next + 1 < 1000000) &&(next + 1 >= 0) && (!visited[next + 1])) {
			q.push(next + 1);
			map[next + 1] = map[next] + 1;
			visited[next + 1] = true;
		}
		if ((next - 1 < 1000000) && (next - 1 >=0) && (!visited[next - 1] )) {
			q.push(next - 1);
			map[next -1] = map[next] + 1;
			visited[next - 1] = true;
		}
		if ((next * 2 < 1000000) && (next *2 >= 0) && (!visited[next * 2])) {
			q.push(next * 2);
			map[next *2] = map[next] + 1;
			visited[next*2] = true;
		}

	}
	return map[K];
}


int main() {

	cin >> N >> K;

	cout<<BFS(N);

	return 0;

}