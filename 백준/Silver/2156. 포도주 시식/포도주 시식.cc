#include <iostream>

using namespace std;

int arr[10001] = {0, };
int stair[10001] = {0, };

int N,result;

int main() {
    cin>>N;

    for (int i = 1; i <= N; ++i) {
        cin>>stair[i];
    }
    arr[0] = 0;
    arr[1] = stair[1];
    arr[2] = stair[2] + stair[1];

    result = arr[2];
    for (int i = 3; i <= N; ++i) {
        arr[i] = max(stair[i]+stair[i-1]+arr[i-3], stair[i]+arr[i-2]);
        arr[i] = max(arr[i],arr[i-1]);
        if(result<arr[i]) result=arr[i];
    }
    
    cout<<result;



    return 0;
}
