
#include <stdio.h>
#include <math.h>


void min_max_avg(float **grid, int N, int M, 
                 float *min, float *max, float *avg, 
                 float *col_min, float *col_max, float *col_avg, 
                 float *row_min, float *row_max, float *row_avg) {


    int i, j;
    float temp_min = INFINITY;
    float temp_max = -INFINITY;
    float temp_avg = 0.0;


 


    // compute overall min
    for (i = 0; i < N; i+=2) {
        for (j = 0; j < M; j+=2) {

            float temp_min_0 = grid[i][j]; 
            if (grid[i][j] < temp_min) {
                  temp_min = temp_min_0;            }

            float temp_min_1 = grid[i+1][j]; 
            if (temp_min_1 < temp_min) {
                   temp_min = temp_min_1;          }

            float temp_min_2 = grid[i][j+1]; 
            if (temp_min_2 < temp_min) {
                   temp_min = temp_min_2 ;          }

            float temp_min_3 = grid[i+1][j+1]; 
            if (temp_min_3 < temp_min) {
                  temp_min =  temp_min_3;           }


            float temp_max_0 = grid[i][j]; 
            if (temp_max_0 > temp_max) {
                    temp_max = temp_max_0;            }

            float temp_max_1 = grid[i+1][j];
            if (temp_max_1 > temp_max) {
                    temp_max = temp_max_1;            }

            float temp_max_2 = grid[i][j+1];
            if (temp_max_2 > temp_max) {
                    temp_max = temp_max_2;            }

            float temp_max_3 = grid[i+1][j+1];
            if (temp_max_3 > temp_max) {
                temp_max = temp_max_3;            }



    
            temp_avg += grid[i][j];
            temp_avg += grid[i][j+1];
            temp_avg += grid[i+1][j];
            temp_avg += grid[i+1][j+1];
        
        }
    }

    *min = temp_min;
    // compute overall max
    /*
    for (i = 0; i < N; i+=2) {
        for (j = 0; j < M; j+=2) {
            if (grid[i][j] > temp_max) {
                temp_max = grid[i][j];            }
                 if (grid[i+1][j] > temp_max) {
                temp_max = grid[i+1][j];            }
                 if (grid[i][j+1] > temp_max) {
                temp_max = grid[i][j+1];            }
                 if (grid[i+1][j+1] > temp_max) {
                temp_max = grid[i+1][j+1];            }
        }
    }
    */

    *max = temp_max;
    // compute overall average
    /*
    for (i = 0; i < N; i+=2) {
        for (j = 0; j < M; j+=2) {
            temp_avg += grid[i][j];
            temp_avg += grid[i][j+1];
            temp_avg += grid[i+1][j];
            temp_avg += grid[i+1][j+1];

        }
    }
    */

    if (N * M > 0) {
        temp_avg /= (float)(M * N);
    } else {
        temp_avg = NAN;
    }

    *avg = temp_avg;


    // compute stats by row
     for (i = 0; i < N; i++) {
        row_min[i] = +INFINITY;
        row_max[i] = -INFINITY;
        row_avg[i] = 0;
        for (j = 0; j < M-6; j+=6) {
            if (grid[i][j] < row_min[i]) {
                row_min[i] = grid[i][j];
            }
            row_avg[i] += grid[i][j];

            if (grid[i][j+1] > row_max[i]) {
                row_max[i] = grid[i][j+1];
            }

            row_avg[i] += grid[i][j+1];

            if (grid[i][j+2] < row_min[i]) { 

                row_min[i] = grid[i][j+2];
            }

            row_avg[i] += grid[i][j+2];

            if (grid[i][j+3] > row_max[i]) {
                row_max[i] = grid[i][j+3];
            }

            row_avg[i] += grid[i][j+3];

            if (grid[i][j+4] < row_min[i]) {
                row_min[i] = grid[i][j+4];
            }
            row_avg[i] += grid[i][j+4];
            if (grid[i][j+5] > row_max[i]) {
                row_max[i] = grid[i][j+5];
            }
            row_avg[i] += grid[i][j+5];

        }

        for(;j < M ; j++)
        {
            if (grid[i][j] > row_max[i]) {
                row_max[i] = grid[i][j];
            }
            row_avg[i] += grid[i][j];
        }


        if (M == 0) {
            row_avg[i] = NAN;
        } else {
            row_avg[i] /= (float)M;
        }



    }


    // compute stats by col
    for (j = 0; j < M; j++) {
        col_min[j] = +INFINITY;
        col_max[j] = -INFINITY;
        col_avg[j] = 0;
        for (i = 0; i < N-6; i+=6) {

            if (grid[i][j] < col_min[j]) {
                col_min[j] = grid[i][j];
            }

            col_avg[j] += grid[i][j];

            if (grid[i+1][j] > col_max[j]) {
                col_max[j] = grid[i+1][j];
            }
            col_avg[j] += grid[i+1][j];

            if (grid[i+2][j] < col_min[j]) {
                col_min[j] = grid[i+2][j];
            }
            col_avg[j] += grid[i][j];

            if (grid[i+3][j] > col_max[j]) {
                col_max[j] = grid[i+3][j];
            }
            col_avg[j] += grid[i][j];

            if (grid[i+4][j] > col_max[j]) {
                col_max[j] = grid[i+4][j];
            }

            col_avg[j] += grid[i+4][j];


            if (grid[i+5][j] > col_max[j]) {
                col_max[j] = grid[i+5][j];
            }

            col_avg[j] += grid[i+5][j];
        }


        for(; i < N ; i++)
        {
            if (grid[i][j] < col_min[j]) {
                col_min[j] = grid[i][j];
            }
            col_avg[j] += grid[i][j];
        }
        if (N == 0) {
            col_avg[j] = NAN;
        } else {
            col_avg[j] /= (float)N;
        }
    }

/*
for(i = 0; i < N; i++)
{
	*row_min[i] = temp_row_min[i];
	*row_max[i] = temp_row_max[i];
	*row_avg[i] = temp_row_avg[i];
}

for(j = 0; j < M; j++)
{
	*col_min[j] = temp_col_min[j];
	*col_max[j] = temp_col_max[j];
	*col_avg[j] = temp_col_avg[j];
}
*/
} // min_max_avg

