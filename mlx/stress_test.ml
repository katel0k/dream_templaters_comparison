let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "MLX execution time: %fs\n" (Sys.time() -. t);
  fx

let () =
  ignore @@ time (fun () -> Xhtml.Lib.get_string_for_stress) ()
