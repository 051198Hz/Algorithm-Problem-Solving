#include "iostream"
using namespace std;

int main(){
    string str; getline(cin,str);
    string UCPC = "UCPC";
    int pos = 0;
    for(int i = 0; i<str.size(); i++){
        if(str[i] == UCPC[pos]){
            pos++;
        }
        if(pos==4){
            cout<<"I love UCPC";
            return 0;
        }
    }
    cout<<"I hate UCPC";
    return 0;
}