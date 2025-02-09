let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "%f\n" (Sys.time() -. t);
  fx

let () =
  Printf.printf "EML\n";
  ignore @@ time (Ehtml.Lib.stress_render 100) ();
  ignore @@ time (Ehtml.Lib.stress_render 1000) ();
  ignore @@ time (Ehtml.Lib.stress_render 10000) ();
  ignore @@ time (Ehtml.Lib.stress_render 20000) ()
