sources = $(wildcard src/*.c)
objects = $(sources:.c=.o)
flags = -g -Wall -lm -ldl -fPIC -rdynamic
LPATH = $(HOME)/.local

liblist.a: $(objects)
	ar rcs $@ $^

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@

install:
	make
	make liblist.a
	mkdir -p $(LPATH)/include/list
	cp -r ./src/include/* $(LPATH)/include/list/.
	cp ./liblist.a $(LPATH)/lib/.

clean:
	-rm *.out
	-rm *.o
	-rm *.a
	-rm src/*.o

lint:
	clang-tidy src/*.c src/include/*.h
