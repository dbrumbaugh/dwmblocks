.POSIX:

PREFIX = /usr/local
CC = cc
CFLAGS = -I/usr/X11R6/include

LDFLAGS += -L/usr/X11R6/lib -I/usr/X11R6/include


dwmblocks: dwmblocks.o
	$(CC) ${CFLAGS} ${LDFLAGS} dwmblocks.o -lX11 -o dwmblocks
dwmblocks.o: dwmblocks.c config.h
	$(CC) ${CFLAGS} -c dwmblocks.c
clean:
	rm -f *.o *.gch dwmblocks
install: dwmblocks
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dwmblocks $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks

.PHONY: clean install uninstall
