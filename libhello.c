/*
 * libhello.c
 */

int getHello(char *buf, const int bufSize)
{		
		const char str[] = "Hello World!\n";
		const int strSize = sizeof(str);

		if ((!buf) || (bufSize < strSize))
				return -1;

		strcpy(buf, str);

		return 0;
}	