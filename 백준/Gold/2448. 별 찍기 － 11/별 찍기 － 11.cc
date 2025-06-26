#include <stdio.h>
#include <cstring>  // memset
#include <vector>

char **fractal;
int n;

void draw(int fromRow, int fromCol, int size) {
    if (size == 3) {
        fractal[fromRow][fromCol+2] = '*';
        
        fractal[fromRow+1][fromCol+1] = '*';
        fractal[fromRow+1][fromCol+3] = '*';
        
        fractal[fromRow+2][fromCol] = '*';
        fractal[fromRow+2][fromCol+1] = '*';
        fractal[fromRow+2][fromCol+2] = '*';
        fractal[fromRow+2][fromCol+3] = '*';
        fractal[fromRow+2][fromCol+4] = '*';
        return;
    }
    draw(fromRow, fromCol + size/2, size/2);
    draw(fromRow + size/2, fromCol, size/2);
    draw(fromRow + size/2, fromCol + size, size/2);
}

int main() {
    
    scanf("%d", &n);
    fractal = new char*[n];
    int width = n * 2 - 1;

    for(int i = 0; i<n; i++) {
        fractal[i] = new char[width+1];
        memset(fractal[i], ' ', width);   // 공백 초기화
        fractal[i][width] = '\0';         // 문자열 종료
    }
    
    draw(0, 0, n);
    for(int i = 0; i<n; i++) {
        for(int j = 0; j<n+n-1; j++) {
            printf("%c", fractal[i][j]);
        }
        printf("\n");
    }
    return 0;
}