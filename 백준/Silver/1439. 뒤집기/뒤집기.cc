#include <iostream>
#include <string>

using namespace std;

int main() {
    string bin;
    int cnt = 0;
    getline(cin,bin);
    cnt++;
    for (int i = 0; i < bin.size(); i++) {
        if(bin[i]!=bin[i-1]&&i>0){
            cnt++;
        }
    }
    cnt/=2;
    cout<<cnt;
    return 0;
}
