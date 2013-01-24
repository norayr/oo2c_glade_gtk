all:	bin/hello_c

bin/hello_c:	src/hello_c.c src/gui.glade
	gcc -o bin/hello_c src/hello_c.c -export-dynamic \
	  `pkg-config --cflags --libs libglade-2.0`
