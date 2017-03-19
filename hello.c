/*
 * hello.c
 */

#include <stdio.h>
#include <dlfcn.h>

#define OK 0
#define ERROR -1

#define BUF_SIZE 20

int main()
{
		char buf[BUF_SIZE] = "";
		int res = 0;
		

    	void *handle = dlopen ("libhello.so", RTLD_LAZY); 
    	if (handle == 0)
    	{
    		printf("Didn't open the library libhello.so\n");
    		return -1;
    	}

		int (*func)(char*, int) = dlsym (handle, "getHello"); 
		res = (*func)(buf, BUF_SIZE);
		if (res != OK) 
		{
				printf("getHello ERROR!\n");
				return -1;
		}
		printf("%s", buf);

		dlclose (handle); 
		handle = NULL;
		func = NULL;

		
		printf("Goodbye world\n");


		return 0;
}