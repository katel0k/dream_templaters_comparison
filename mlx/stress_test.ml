let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "%f\n" (Sys.time() -. t);
  fx

let () =
  Printf.printf "MLX\n";
  ignore @@ time (fun () -> Xhtml.Lib.get_string_for_stress 100) ();
  ignore @@ time (fun () -> Xhtml.Lib.get_string_for_stress 1000) ();
  ignore @@ time (fun () -> Xhtml.Lib.get_string_for_stress 10000) ();
  ignore @@ time (fun () -> Xhtml.Lib.get_string_for_stress 100000) ();
  ignore @@ time (fun () -> Xhtml.Lib.get_string_for_stress 1000000) ()
