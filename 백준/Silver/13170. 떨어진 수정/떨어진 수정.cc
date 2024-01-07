#include "iostream"
#include "cmath"
using namespace std;
//p+w 이하의 w가 몇번 쌓일 수 있는지(망치질)을 구하자.
int main(){
    int n,k,p,w;
    cin>>n>>k>>p>>w;
    int result = ceil((double)p / (double )w);
    cout<<result;
    return 0;
}