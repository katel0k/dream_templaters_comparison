let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "Execution time: %fs\n" (Sys.time() -. t);
  fx

let () =
  ignore @@ time (Format.asprintf "%a" (Tyxml.Html.pp ())) Lib_percent.Lib.stress_render
