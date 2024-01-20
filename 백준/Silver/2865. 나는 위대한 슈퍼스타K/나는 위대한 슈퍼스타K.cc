#include "iostream"
#include "algorithm"
using namespace std;

int n,m,k;
double scores[100] = {0,};
int compare(double a, double b){
    return a>b;
}
void input(){
    cin>>n>>m>>k;
    for(int i = 0; i<m; i++){
        for(int j = 0; j<n; j++){
            int idx = 0;
            double score = 0;
            cin>>idx>>score;
            scores[idx-1] = scores[idx-1] > score ? scores[idx-1] : score;
        }
    }
}
void solution(){
    sort(scores,scores+n,compare);
    double result = 0;
//    for(int i = 0; i<n;i++){
//        cout<<scores[i]<<" ";
//    }
    for(int i = 0; i<k;i++){
        result += scores[i];
    }
    cout<<fixed;
    cout.precision(1);
    cout<<result;
}
int main(){
    input();
    solution();
    return 0;
}