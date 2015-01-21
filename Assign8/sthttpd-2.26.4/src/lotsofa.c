#include <stdio.h>

int main()
{
	printf("wget http://localhost:5/");
	for (int i = 0; i < 6000; i++)
		printf("A");
}

