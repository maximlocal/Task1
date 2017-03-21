/*
 * hello.c
 */

#include <stdio.h>
#include <dlfcn.h>

#include "libhello.h"
#include "libgoodbye.h"

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
    		return ERROR;
    	}

		int (*func)(char*, int) = dlsym (handle, "getHello"); 
		res = (*func)(buf, BUF_SIZE);
		if (res != OK) 
		{
				printf("getHello ERROR!\n");
				return ERROR;
		}
		printf("%s", buf);

		dlclose (handle); 
		handle = NULL;
		func = NULL;


		res = getGoodbye(buf, BUF_SIZE);
		if (res != OK) 
		{
				printf("getGoodbye ERROR!\n");
				return ERROR;
		}
		printf("%s", buf);


		return 0;
}