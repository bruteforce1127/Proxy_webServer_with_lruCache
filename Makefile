CC = g++
CFLAGS = -g -Wall -I.
LDFLAGS = -lpthread

all: proxy

proxy: proxy_parse.o proxy.o
	$(CC) $(CFLAGS) -o proxy proxy_parse.o proxy.o $(LDFLAGS)

proxy_parse.o: proxy_parse.c proxy_parse.h
	$(CC) $(CFLAGS) -c proxy_parse.c -o proxy_parse.o

proxy.o: proxy_server_withCache.c proxy_parse.h
	$(CC) $(CFLAGS) -c proxy_server_withCache.c -o proxy.o

clean:
	rm -f proxy *.o

tar:
	tar -cvzf ass1.tgz proxy_server_withCache.c README Makefile proxy_parse.c proxy_parse.h
