/*
 * libgoodbye.c
 */

int getGoodbye(char *buf, const int bufSize)
{		
		const char str[] = "Goodbye World!\n";
		const int strSize = sizeof(str);

		if ((!buf) || (bufSize < strSize))
				return -1;

		strcpy(buf, str);

		return 0;
}	