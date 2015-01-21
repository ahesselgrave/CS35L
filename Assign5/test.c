int main()
{
	char** cstarstar = (char**) malloc(sizeof(char*));
	cstarstar[0]     = (char*)  malloc(sizeof(char));
	cstarstar[0]     = (char*)  realloc(sizeof(char), 2*sizeof(char));
	free(cstarstar);
}
