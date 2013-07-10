/*
入力したキーコードを調べる
zshでHome/End/Delキーを使えるようにする @ Fedora16 - kamaruのメモその他諸々 
http://d.hatena.ne.jp/ka_maru/20111206/1323143769
*/
#include <stdio.h>

int main(void)
{
	int c;
	while(c = getchar()){
		printf("%d 0x%02X\n", c, c);
	}
	return 0;
}