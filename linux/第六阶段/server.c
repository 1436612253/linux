#include<sys/types.h>
#include<sys/socket.h>
#include<sys/in.h>
int socket(int arge,char *argv[])
{
	int socket = socket(AF_INET,SOCK_STREAM,0);
	if(socket <  0)
	{
			return 1;	
	}
	bind()
}
