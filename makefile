CC = g++
MACRO = DEBUGALL
CFLAGS = -g -w -D$(MACRO) -I/home/qinjin/C_projects/GSL/include/gsl -I/home/qinjin/C_projects/makefile_Test/Stack
LIBS = -L/home/qinjin/C_projects/GSL/lib/ -lgsl -lgslcblas
SOURCES = $(wildcard *.c)
OBJS := $(patsubst %.c, %.o,$(SOURCES))
EXECUTABLE = main


main: $(OBJS)
	@echo "source files:" $(SOURCES)
	@echo "object files:" $(OBJS)
	$(CC) $(OBJS)  -D$(MACRO) $(CFLAGS) -o $(EXECUTABLE) $(LIBS)
sinclude $(SOURCES:.c=.d)
%d: %c
	@echo "create depend"
	set -e; rm -f $@;\
	$(CC) -MM $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

clean:
	rm -f $(OBJS)
	rm -f $(EXECUTABLE)
	rm -f *.d.*
