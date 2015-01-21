#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
	char c = getchar();
	while(!feof(stdin))
	{
		putchar(c);
		c = getchar();
	}
}
