FC = gfortran
# program_src = main.f90
program_exe = gravitation.exe
execute = ./gravitation.exe

# source files and objects
SRCS = $(patsubst %.f90, %.o, $(wildcard *.f90))

# program name
PROGRAM = main.f90

all: $(PROGRAM)

$(PROGRAM):
	$(FC) $(FLFLAGS) -o $@ $<

# compile:
# 	$(FC) $(program_src) -o $(program_exe)

run:
	$(execute)

# I don't know makefile well enough to know Why
# But `make` Really didn't like having nothing after the compiling command
.SILENT:
end:
	$(newline)