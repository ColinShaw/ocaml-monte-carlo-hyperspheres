(* 
    Non-threaded
    ------------
    
    d dimensions 
    n iterations 
*)

let non_threaded_volume (d: int) (n: int) : float =
    Sphere.compute_result [Sphere.run_job d n] d

let _ = Printf.printf "%f\n" (non_threaded_volume 2 100000)