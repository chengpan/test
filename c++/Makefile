TARGET=main
OBJS=main.o
CPPFLAGS=-Wall -std=c++0x
LDFLAGS=-pthread

${TARGET}:${OBJS}
	g++ $^ -o $@ ${LDFLAGS}
%.o:%.cpp
	g++ $^ -c -o $@ ${CPPFLAGS} 
clean:
	rm -f ${TARGET} ${OBJS}
