#include "iostream"
#include "string"
#include "vector"
#include "algorithm"
using namespace std;

int makeMinNumber(vector<int> numbers){
    string a = "", b = "";
    int size = numbers.size();
    for(int i = 0; i < size; i++){
        if(i%2==0){
            a+=to_string(numbers.front());
        }else{
            b+= to_string(numbers.front());
        }
        numbers.erase(numbers.begin());
    }
    return  stoi(a) + stoi(b);
}
int main(){
    //가장 작은 수가 가장 큰 자리수에 오도록 하고, 가장 큰 수가 가장 작은 자리수에 오도록 한다.
    //1과 0이 존제힐 때가 엣지케이스
    // 5 1 1 0 0 1
    //111이가 나와야 함,
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);
    int n;
    while(cin>>n){
        if(n==0) return 0;
            vector<int> numbers;
        int cntZero = 0;
        for(int i = 0; i<n; i++){
            int tmp;
            cin>>tmp;
            if( tmp == 0 ){
                cntZero++;
            }else{
                numbers.push_back(tmp);
            }
        }
        sort(numbers.begin(),numbers.end());
        numbers.insert(numbers.begin()+2,cntZero, 0);
        cout<<makeMinNumber(numbers)<<"\n";
        numbers.clear();
        numbers.shrink_to_fit();
    }
}