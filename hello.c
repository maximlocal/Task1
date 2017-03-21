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


		res = getHello(buf, BUF_SIZE);
		if (res != OK) 
		{
				printf("getHello ERROR!\n");
				return ERROR;
		}
		printf("%s", buf);


		res = getGoodbye(buf, BUF_SIZE);
		if (res != OK) 
		{
				printf("getGoodbye ERROR!\n");
				return ERROR;
		}
		printf("%s", buf);


		return OK;
}