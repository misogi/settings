#include <stdio.h>

int main(void)
{
	int c;
	while(c = getchar()){
		printf("%d 0x%02X\n", c, c);
	}
	return 0;
}