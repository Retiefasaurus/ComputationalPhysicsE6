# Written By Retief Lubbe on Friday 4th of May
# Computational Physics Exercise 6
#
# This is a make file that Compliles and Runs fortran code

#Note we need to add -Ofast because memory of function argument gets stored in stack
#and it might exceed the size of stack default
orbital:
	gfortran -Ofast orbits.f90 main.f90 -o ./run.out ;
	./run.out;
	xmgrace fort.10 original.10;
