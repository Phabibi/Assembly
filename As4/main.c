
#include <stdio.h>

// unsigned char mod(long x, unsigned char m);
// long dot_prod(void *A, void *B, int n, int i, int j);
void matrix_prod(void *A, void *B, void *C, int n);
void print_matrix(void *A, int n);


#define N 4


char A[N][N] = {5, 11, 10,  3,
                10,  6,  2,  1,
                 6,  3, 14, 13,
                 8,  5,  2,  0};

char B[N][N] = {10, 12, 14,  5,
                12, 10,  1,  1,
                12,  0, 12, 10,
                12,  0,  1, 10};

char A2[N][N] = {3, 10, 1, 3,
                5, 1, 11, 0,
                 0, 10, 1, 1,
                1, 0, 6, 2};

char B2[N][N] = { 2, 1, 12, 2,
                 2, 4, 13, 2,
                10, 11, 4, 0,
                1, 2, 2, 12};

char C[N][N];
char G[N][N];


void main () {
    int i, j;

    matrix_prod(A, B, C, N);
    matrix_prod(A2, B2, G, N);


    print_matrix(C, N);
    print_matrix(G, N);
    //print_matrix(C, N);
    return;
}


void print_matrix(void *A, int n) {
    int i, j;
    char val;
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            val = *((char*)(A + i*n + j));
            printf("%2x", val & 0xff);
        }
        putchar('\n');
    }
    putchar('\n');
}

