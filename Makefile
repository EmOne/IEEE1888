ARCH ?=
CROSS_COMPILE ?=

CC := $(CROSS_COMPILE)gcc
AR := $(CROSS_COMPILE)ar

COMMON_OBJS   = ieee1888_XMLgenerator.o ieee1888_XMLparser.o ieee1888_client.o ieee1888_object_factory.o ieee1888_server.o ieee1888_util.o
LFLAG = -lpthread

CFLAGS := -g -O0

all:	ieee1888_sample_app ieee1888_sample_gw

ieee1888_sample_app: ieee1888_sample_app.o $(COMMON_OBJS)
		$(CC) $(CFLAGS) $(COMMON_OBJS) ieee1888_sample_app.o -o ieee1888_sample_app $(LFLAG)

ieee1888_sample_gw: ieee1888_sample_gw.o $(COMMON_OBJS)
		$(CC) $(CFLAGS) $(COMMON_OBJS) ieee1888_sample_gw.o -o ieee1888_sample_gw $(LFLAG)

clean: 
	rm -f *.o ieee1888_sample_gw ieee1888_sample_app *~
