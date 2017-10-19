
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
unsigned times(unsigned, unsigned);

void main () {
	unsigned a = 2265;
	unsigned b = 545;


	printf("The product of %u and %u is %u.\n", a, b, times(a,b));
	return;
}

