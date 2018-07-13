#include<stdio.h>
#include<stream>
void main()
{

char buff[126];
printf("输入文件名称:\n");
gets(buff);
int buf[1024];
FILE *fp = fopen(buff,"r");
while(1)
{

fgets(buf,200,fp);
printf("%s",buf);
gets(buf);
}

}
