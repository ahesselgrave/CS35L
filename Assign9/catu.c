#include <unistd.h>
#include <stdlib.h>

int main()
{
	/* Allocate a single character that will print and be replaced */
	char* buffer = (char*) malloc(sizeof(char));

	while(read(0, buffer, 1))
		write(1, buffer, 1);
}
