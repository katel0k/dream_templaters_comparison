let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "Execution time: %fs\n" (Sys.time() -. t);
  fx

let () =
  ignore @@ time Dream_html.to_string Dhtml.Lib.stress_render
