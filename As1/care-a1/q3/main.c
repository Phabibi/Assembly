
#include <stdio.h>

int mystery(char *, int);

char *str = "Good mood food.";

void main () {
	int n = 15;

	for(int i = 0 ; i < n ; i++)
		printf("The return value was:  %d %d.\n",i, mystery(str,i));
	return;
}
