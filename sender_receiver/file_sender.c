#include<stdio.h>  
#include<stdlib.h>  
#include<string.h>  
#include<sys/socket.h>  
#include<sys/types.h>  
#include<unistd.h>  
#include<netinet/in.h>  
#include <errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <time.h>

#define DEF_IP_ADDR "120.25.228.76"
#define DEF_PORT_NUM 9527


static char *input_file_path;
static char *server_ip_addr;
static int  listen_port = 0;    

void check_args_client(int argc,char **argv)
{
	if (4 == argc)
	{
		server_ip_addr = argv[1];
		listen_port = atoi(argv[2]);
		input_file_path = argv[3];
	}
	else if (3 == argc)
	{
		server_ip_addr = DEF_IP_ADDR;
		listen_port = atoi(argv[1]);
		input_file_path = argv[2];		
	}
	else
	{
		printf("at least , give me a port number and file name\n");
		exit(0);
	}
	printf("%s : %d : %s\n", server_ip_addr, listen_port, input_file_path);
}

int main(int argc,char **argv)  
{  
	check_args_client(argc, argv);
    int sockfd;  
    int err;  
    struct sockaddr_in addr_ser;  
    char sendline[1024];
	int send_n;
	
	FILE *fp = fopen(input_file_path, "rb+");
	if (!fp)
	{
		printf("can't open : %s, %s\n", input_file_path, strerror(errno));
		return -1;
	}	
      
    sockfd=socket(AF_INET,SOCK_STREAM,0);  
    if(sockfd==-1)  
    {  
        printf("socket error\n");  
        return -1;  
    }  
      
    bzero(&addr_ser,sizeof(addr_ser));  
    addr_ser.sin_family=AF_INET;  
    addr_ser.sin_addr.s_addr=inet_addr(server_ip_addr);  
    addr_ser.sin_port=htons(listen_port);  
    err=connect(sockfd,(struct sockaddr *)&addr_ser,sizeof(addr_ser));  
    if(err==-1)  
    {  
        perror("connect error ");  
        return -1;  
    }  
      
    printf("connected with server...\n");  
    
	int total_bytes = 0;
	time_t cur_time;
    while(1)  
    {  
        send_n = fread(sendline, 1, 128, fp);
		if (send_n == 0)
		{
			printf("data send done: %d bytes sent\n", total_bytes);
			break;
		}
		else if (send_n < 0)
		{
			printf("file read err : %s\n", strerror(errno));
			return -1;
		}
		else
		{  	
			total_bytes += send_n;
			cur_time = time(NULL);
			printf("progress : %d, %d at %s\n", send_n, total_bytes, ctime(&cur_time));
			if (send_n != send(sockfd,sendline,send_n,0))
			{
				printf("send error. %s\n", strerror(errno));
				return -1;
			}
			usleep(50*1000);
		}
		fflush(stdout);	
    }  
      
    fclose(fp);
	shutdown(sockfd, SHUT_WR);
	
	recv(sockfd,sendline,1024,0);//wait for serevr to finish reading
	perror("finished ?:");
	
    return 0;  
}  
