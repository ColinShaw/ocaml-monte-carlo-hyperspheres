(* n-dimensional hypersphere inclusion tests *)

let gen_rand_val (u: unit) : float =
    Random.float 2. -. 1.

let gen_rand_list (n: int) : float list =
    let rec grl (n: int) (c: int) (l: float list) : float list =
        if   c=0 
        then l 
        else grl n (c-1) ((gen_rand_val ())::l) 
    in grl n n []    

let test_rand_list (l: float list) : bool =
    (List.fold_left (fun s v -> s +. v *. v) 0. l) <= 1. 

let inclusion_test (n: int) : bool =
    test_rand_list (gen_rand_list n) 



(* Result tallying *)

type tally = {pass: int; total: int}

let zero_tally = {pass=0; total=0}

let run_job (d: int) (n: int) : tally =
    let rec rj (d:int) (n: int) (c: int) (t: tally) : tally =
        if   c=0 
        then t 
        else if   inclusion_test d 
             then rj d n (c-1) {pass=t.pass+1; total=t.total+1}
             else rj d n (c-1) {pass=t.pass;   total=t.total+1}
    in rj d n n zero_tally
    
let add_tally (a: tally) (b: tally) : tally =
    {pass=a.pass+b.pass; total=a.total+b.total}
    
let add_tally_list (t: tally list) : tally =
    List.fold_left (fun s v -> add_tally s v ) zero_tally t



(* Having to do with computing final result *)

let bounding_volume (d: int) : float =
    2. ** (float_of_int d)

let compute_result (t: tally list) (d: int) : float =
       let t'    = add_tally_list t 
    in let pass  = float_of_int t'.pass
    in let total = float_of_int t'.total 
    in (bounding_volume d) *. pass /. total