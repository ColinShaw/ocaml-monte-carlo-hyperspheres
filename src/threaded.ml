(* 
    Threaded
    --------
    
    d dimensions 
    n iterations 
    t threads
*)

let create_threads (n: int) (d: int) (i: int) : ('a * 'b) list =
    let rec ct (n: int) (m: int) (t: ('a * 'b) list) : ('a * 'b) list =
        if   m=0 
        then t 
        else    let a = ref Sphere.zero_tally 
             in let b = Thread.create (fun () -> a := Sphere.run_job d i) 
             in ct n (m-1) ((b,a)::t)
    in ct n n []
    
let rec join_threads (t: ('a * 'b) list) : 'c list =
    let rec jt (t: ('a * 'b) list) (x: 'c list) : 'c list =
        match t with 
            | h'::t' -> let (a,b) = h' 
                        in Thread.join (a ());
                        jt t' (!b::x)
            | _      -> x 
    in jt t []

let threaded_volume (d: int) (n: int) (t: int) : float =
       let c = create_threads t d (n/t)
    in let r = join_threads c
    in Sphere.compute_result r d 

let _ = Printf.printf "%f\n" (threaded_volume 2 100000 4);;    