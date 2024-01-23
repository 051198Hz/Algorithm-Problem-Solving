#include <iostream>
#include <queue>
#include <stdio.h>
#include <vector>
#include <algorithm>

using namespace std;
int graph[1001][1001] = { 0 };
int visited[1001] = { 0 };
int visited2[1001] = { 0 };
vector<int> graph01[1001];

void DFS(int v) {
	visited[v] = 1;
	cout << v << ' ';

	for (int i = 0; i < graph01[v].size(); i++) {
		int next = graph01[v][i];

		if (visited[next] == 0 ) {

			DFS(next);
		}
	}
}
void BFS(int v) {
	queue<int> q;
	q.push(v);
	visited2[v] = 1;

	while(!q.empty()){

		int x = q.front();
		q.pop();
		cout << x << ' ';
		for (int i = 0; i < graph01[x].size(); i++) {
			int next = graph01[x][i];
			if (visited2[next] == 0) {
				q.push(next);
				visited2[next] = 1;
			}
		}
	}
}
int main()
{
	int N, M, V;

	cin >> N >> M >> V;

	for (int i = 0; i < M; i++) {
		int tmp1, tmp2;
		cin >> tmp1 >> tmp2;
		graph[tmp1][tmp2] = 1;
		graph[tmp2][tmp1] = 1;
		graph01[tmp1].push_back(tmp2);
        graph01[tmp2].push_back(tmp1);
	}
    	for (int i = 1; i <= N; i++) {
		sort(graph01[i].begin(), graph01[i].end());
	}
	DFS(V);
	cout << endl;
	BFS(V);
}