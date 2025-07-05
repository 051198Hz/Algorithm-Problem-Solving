#include<cstdio>
#include<queue>
#include<vector>
#include<algorithm>
#include<cstring>
#define pii pair<int,int>
using namespace std;
int N, M, G, R,can_size, ans;
int A[50][50];
vector<pii> can;
vector<int> Gr, Re;
int dy[] = { 0,0,1,-1 };
int dx[] = { 1,-1,0,0 };
bool C[10];
struct info { int y, x; };
struct _b { int color, time; }B[50][50];

bool oob(int y, int x)
{
	if (y < 0 || y >= N || x < 0 || x >= M) return false;
	return true;
}

int bfs()
{
	int res = 0;
	memset(B, -1, sizeof(B));
	queue<info> Q;
	int y = 0, x = 0;
	for (auto p:Gr)
	{
		y = can[p].first, x = can[p].second;
		B[y][x] = { 0,0 };
		Q.push({ y, x });
	}
	for (auto p:Re)
	{
		y = can[p].first ,x = can[p].second;
		Q.push({ y, x });
		B[y][x] = { 1,0 };
	}
	while (!Q.empty())
	{
		int cy = Q.front().y;
		int cx = Q.front().x;
		int color = B[cy][cx].color;
		int ct = B[cy][cx].time;
		Q.pop();
		if (B[cy][cx].color==3) continue;
		for (int i = 0; i < 4; i++)
		{
			int ny = cy + dy[i];
			int nx = cx + dx[i];
			if (!oob(ny, nx)||A[ny][nx]==0) continue;
			if (B[ny][nx].color == -1)
			{
				B[ny][nx].color = color;
				B[ny][nx].time = ct + 1;
				Q.push({ ny,nx,});
			}
			else if (B[ny][nx].color != 3)
			{
				if (B[ny][nx].color!=color&& B[ny][nx].time == ct + 1)
				{
					B[ny][nx].color = 3;
					res++;
				}
			}
		}
	}
	return res;
}

void go(int idx,int cnt,int g,int r)
{
	if (cnt > can_size) return;
	if (g > G) return;
	if (r > R) return;
	if (g == G && r == R) ans = max(ans, bfs());
	for (int i = idx; i < can_size; i++)
	{
		if (C[i]) continue;
		C[i] = true;
		Gr.push_back(i);
		go(i,cnt+1, g + 1, r);
		Gr.pop_back();
		Re.push_back(i);
		go(i, cnt+1,g, r + 1);
		Re.pop_back();
		C[i] = false;
	}
}

int main()
{
	scanf("%d %d %d %d", &N, &M, &G, &R);
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < M; j++)
		{
			scanf("%d", &A[i][j]);
			if (A[i][j] == 2) can.push_back({ i,j });
		}
	}
	can_size = can.size();
	go(0,0,0,0);
	printf("%d", ans);
}