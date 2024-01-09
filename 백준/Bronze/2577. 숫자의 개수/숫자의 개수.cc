#include <iostream>
using namespace std;
int main(){

    long long int result = 1;
    long int arr[10] = {0,};

    for (int i = 0; i < 3; i++)
    {
        long long int a = 0;
        scanf("%lld",&a);
        result*=a;
    }

    string str = to_string(result);
    for (int i = 0; i < str.size(); i++)
    {
        arr[ str.at(i) - '0'] += 1;
    }
    for (int i = 0; i < 10; i++)
    {
        cout<<arr[i]<<"\n";
    }
    
    
    
    return 0;
}