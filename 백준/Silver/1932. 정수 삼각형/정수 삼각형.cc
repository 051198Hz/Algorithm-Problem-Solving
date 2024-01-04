#include <iostream>
#include <algorithm>

using namespace std;

int d[501][501] = {0,};
int N;

int main() {

    cin>>N;

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j <= i ; ++j) {
            cin>>d[i][j];
        }
    }

    for (int i = N-1; i >= 0; --i) {
        for (int j = i; j >= 0; --j) {
            d[i][j] = max(d[i+1][j+1],d[i+1][j]) + d[i][j];
        }
    }

    cout<<d[0][0];

    return 0;
}
