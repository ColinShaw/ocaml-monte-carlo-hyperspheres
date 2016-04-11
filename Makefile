threaded:  
	rm -rf _build
	mkdir _build
	cp src/sphere.ml src/threaded.ml _build
	cd _build && ocamlc -thread -o sphere unix.cma threads.cma sphere.ml threaded.ml
	cp _build/sphere .
	
non_threaded:  
	rm -rf _build
	mkdir _build
	cp src/sphere.ml src/non_threaded.ml _build
	cd _build && ocamlc -o sphere unix.cma sphere.ml non_threaded.ml
	cp _build/sphere .	
	
clean: 
	rm -rf *.cmo *.cmi *.o *.cmx *.s sig_proc.* sphere
	rm -rf _build