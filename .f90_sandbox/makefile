build := gfortran
filename := f90_sandbox

src := $(filename).f90

debug_flags := -Og\
			-Wall\
			-Wextra\
			-Wconversion\
			-fcheck=all\
			-g\
			-fbacktrace\
			-pedantic\
			-o

prod_flags := -O3\
			-fimplicit-none\
			-Wall\
			-g\
			-o
			
debug:
	$(build) $(debug_flags) $(filename) ${src}
	./$(filename)

prod:
	$(build) $(prod_flags) $(filename) ${src}
	./$(filename)