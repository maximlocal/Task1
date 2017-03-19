/*
 * libgoodbye.c
 */

int getGoodbye(char *buf, const int bufSize)
{		
		const char str[] = "Goodbye World!\n";
		const int strSize = sizeof(str);

		if ((!buf) || (bufSize < strSize))
				return -1;

		for(int i = 0; i < strSize; ++i)
				buf[i] = str[i];

		return 0;
}	