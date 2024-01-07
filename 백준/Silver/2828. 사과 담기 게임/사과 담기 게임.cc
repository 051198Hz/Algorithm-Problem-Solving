#include "iostream"
#define maxAppleNumber 20

using namespace std;
int main(){
    int screen,basket; cin>>screen>>basket;
    int apple; cin>>apple;
    int result = 0;
    int dx = 0;
    int applePos[maxAppleNumber] = {0,};
    for(int i = 0; i<apple; i++){
        cin>>applePos[i];
    }
    for(int i = 0; i<apple; i++){
        int curApplePos = applePos[i];
        if(curApplePos > dx+basket){
            result+= (curApplePos - (dx+basket));
            dx += (curApplePos - (dx+basket));
        }else if(curApplePos <= dx){
            result += ((dx-curApplePos)+1);
            dx -= ((dx - curApplePos)+1);
        }
    }
    cout<<result;
    return 0;
}