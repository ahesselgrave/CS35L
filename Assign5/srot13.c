#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define TRUE 1
#define FALSE 0
#define PTR 'c' //char
#define PTRPTR 'w' //word

void rot13(char *word, int size)
{
  for(int i = 0; i < size; i++)
  {
	if (tolower(word[i]) >='a' && tolower(word[i]) <= 'm')
		word[i] += 13;
	else if (tolower(word[i]) >='n' && tolower(word[i]) <= 'z')
		word[i] -= 13;
  }
}

int rot13cmp (char *a, char *b)
{
   int arrA_size;
   int arrB_size;

    //get array sizes
    for(arrA_size = 0; a[arrA_size] != '\n'; arrA_size++) {}
    for(arrB_size = 0; b[arrB_size] != '\n'; arrB_size++) {}

    size_t fill_size;

    //determine which is the longer array
    fill_size = arrA_size != arrB_size ?
             arrA_size > arrB_size ?
             arrA_size : arrB_size : arrA_size;

    char arrA[fill_size];
    char arrB[fill_size];

    //fill local arrays and pad with '\0'
    int i;
    for(i = 0; i < arrA_size; i++)        { arrA[i] = a[i]; }
    for(i = arrA_size; i < fill_size; i++) { arrA[i] = '\0'; }

    for(i = 0; i < arrB_size; i++)       { arrB[i] = b[i]; }
    for(i = arrB_size; i < fill_size; i++) { arrB[i] = '\0'; }

    rot13(arrA, fill_size);
    rot13(arrB, fill_size);
    return memcmp(arrA, arrB, fill_size);
}

int wrapper(const void *a, const void *b)
{
    char **aA = (char**)a;
    char **bB = (char**)b;

    return rot13cmp(*aA, *bB);
}

void allocErr(void* arr)
{
  if(arr == NULL)
  {
     fprintf(stderr, "%s", "Error: memory allocation failure.\n");
     exit(1);
  }
}

void ioErr()
{
  if(ferror(stdin))
  {
     fprintf(stderr, "%s", "Error: input/output failure.\n");
     exit(1);
  }
}

int main()
{
   int i = 0;
   int charIndex = 0;
   int wordIndex = 0;
   int NL_flag = FALSE;
   char **words;

    //initial setup
    words = (char**)malloc(sizeof(char*)); allocErr(words);
    words[0] = (char*)malloc(sizeof(char)); allocErr(words[0]);
    char c = getchar();           ioErr();
    
    while(!feof(stdin) && !ferror(stdin))
    {
      if(c != '\n')
      {
         words[wordIndex][charIndex] = c;
         words[wordIndex]=(char*)realloc(words[wordIndex],(++charIndex+1)*sizeof(char));
         allocErr(words[wordIndex]);
         NL_flag = FALSE;
      }
      else /* if(c == '\n') */
      {
         words[wordIndex][charIndex] = '\n';
         words = (char**)realloc(words, sizeof(char*)*(++wordIndex+1));
         allocErr(words);
         words[wordIndex] = (char*)malloc(sizeof(char));
         allocErr(words[wordIndex]);
         charIndex = 0;
         NL_flag = TRUE;
      }
      c = getchar();
      ioErr();
  }

  if(NL_flag)
  {
     if(words[wordIndex] != NULL)
        free(words[wordIndex]);
     words = (char**)realloc(words, sizeof(char*)*wordIndex--);
     allocErr(words);
  }
  else
     words[wordIndex][charIndex] = '\n';


  qsort(words, wordIndex+1, sizeof(char*), wrapper);

  for(i = 0; i <= wordIndex; i++)
  {
     int j;
     for (j = 0; words[i][j] != '\n'; j++)
     {
        putchar(words[i][j]);
        ioErr();
     }
     printf("\n");
  }

  for(i = 0; i <= wordIndex; i++)
 	if(words[i] != NULL)
		free(words[i]);

  if(words != NULL)
     free(words);

  return 0;
}

