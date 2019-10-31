CC = gcc

#default: libexamples.a
default: libexamples.so

#libexamples.a: examples.o
libexamples.so: examples.o
#	ar rcs $@ $^
	$(CC) -shared examples.o -o libexamples.so
    
examples.o: examples.c examples.h
	$(CC) -c -fPIC $<

clean:
	rm -f *.o *.a *.so 
