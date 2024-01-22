#include "iostream"
#include "algorithm"
const int SIZE = 1010;
using namespace std;

string sum(string& a, string& b)
{
    string strResult;

    int lenA = a.length();
    int lenB = b.length();
    int len = lenA > lenB ? lenA : lenB;

    int nA[SIZE] = { 0 };
    int nB[SIZE] = { 0 };
    int nResult[SIZE] = { 0 };

    for (int i = 0; i < lenA; ++i) nA[i] = a[lenA - 1 - i] - '0';
    for (int i = 0; i < lenB; ++i) nB[i] = b[lenB - 1 - i] - '0';

    for (int i = 0; i < len; ++i)
    {
        int nTmp = nA[i] + nB[i] + nB[i] + nResult[i];
        nResult[i] = nTmp % 10;
        nResult[i + 1] = nTmp / 10;
    }
    if (nResult[len] != 0) len++;

    for (int i = len - 1; i >= 0; i--)
        strResult += (nResult[i] + '0');

    return strResult;
}

void input(){
}
void solution(){

    string *memos = new string[251];
    memos[0] = "1";
    memos[1] = "1";
    memos[2] = "3";
    for(int i = 3; i<=250; i++){
        memos[i] = sum(memos[i - 1], memos[i - 2]);
    }
    while(true){
        int n; cin >> n;
        if (cin.fail() != false) break;
        cout<<memos[n]<<endl;
    }
}
int main(){ ios_base::sync_with_stdio(false); cout.tie(NULL); cin.tie(NULL);
    input();
    solution();
    return 0;
}