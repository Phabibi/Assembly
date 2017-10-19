
all:	x 

x:	main.o multi.o
	gcc -o x multi.o main.o


main.o:	main.s
	gcc -c main.s

multi.o:	multi.s
	gcc -g -c multi.s


main.s:	main.c
	gcc -fno-builtin -O2 -S main.c


