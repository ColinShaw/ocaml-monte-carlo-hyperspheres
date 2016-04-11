This is an example of computing n-dimensional hyperspheres using 
Monte Carlo methods in OCaml, with compile targets for both 
threaded and non-threaded executables.  This serves both as a 
fun toy for computing the n-dimensional hyperspheres as well as 
something of a reference for threading. 

You can build these from the Makefile by issuing:

    make threaded       - Build the threaded 'sphere' application
    
    make non_threaded   - Build the non-threaded 'sphere' application
    
    make clean          - Clean up the _build directory