SRC	=	phack.c
OBJ	=	phack.o
CC	=       gcc
CFLAGS	=	-O -g -Wall -Wmissing-prototypes
LIBS	=	

all:	libst2205/libst2205.so setpic/setpic phack splice bgrep

install: all
	make -C libst2205 install

libst2205/libst2205.so: 
	make -C libst2205

setpic/setpic:
	make -C setpic

phack:	$(OBJ) $(SRC)
	$(CC) $(LDFLAGS) -o $(@) $(OBJ) $(LIBS)

splice:	splice.o splice.c
	gcc -o splice splice.o

bgrep:	bgrep.o bgrep.c
	gcc -o bgrep bgrep.o

clean:	
	make -C libst2205 clean
	make -C setpic clean
	rm -f $(OBJ) phack splice splice.o bgrep bgrep.o

distclean: clean
	rm -f fwimage.bak memimage.bak fwimage.bin
