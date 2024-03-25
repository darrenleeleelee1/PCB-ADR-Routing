
all: a

a: a.o
	$(CCC) $(CCFLAGS) a.o -o a $(CCLNFLAGS)
a.o: a.cpp
	$(CCC) -c $(CCFLAGS) a.cpp -o a.o

clean:
	rm --force a a.o ex2 ex2.o

################################

# Uncomment for CPLEX_Enterprise_Server126
# SYSTEM     = x86-64_linux
# LIBFORMAT  = static_pic
# CPLEXDIR      = /opt/ibm/ILOG/CPLEX_Enterprise_Server126/CPLEX_Studio/cplex
# CONCERTDIR    = /opt/ibm/ILOG/CPLEX_Enterprise_Server126/CPLEX_Studio/concert

# Uncomment for CPLEX_Studio124
SYSTEM     = x86-64_linux
LIBFORMAT  = static_pic
CPLEXDIR      = /DATA/songbx0622/CPLEX/path/cplex
CONCERTDIR    = /DATA/songbx0622/CPLEX/path/concert

################

CCC = g++ -std=c++14 -g

CCOPT = -m64 -O3 -fPIC -fno-strict-aliasing -fexceptions -DNDEBUG -DIL_STD -D_GNU_SOURCE

CPLEXBINDIR   = $(CPLEXDIR)/bin/$(BINDIST)
CPLEXLIBDIR   = $(CPLEXDIR)/lib/$(SYSTEM)/$(LIBFORMAT)
CONCERTLIBDIR = $(CONCERTDIR)/lib/$(SYSTEM)/$(LIBFORMAT)

CCLNFLAGS = -L$(CPLEXLIBDIR) -lilocplex -lcplex -L$(CONCERTLIBDIR) -lconcert -lm -pthread -ldl

# -ldl needed for CPLEX version > 12.6


CONCERTINCDIR = $(CONCERTDIR)/include
CPLEXINCDIR   = $(CPLEXDIR)/include

CCFLAGS = $(CCOPT) -I$(CPLEXINCDIR) -I$(CONCERTINCDIR) 
