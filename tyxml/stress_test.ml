let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "Tyxml execution time: %fs\n" (Sys.time() -. t);
  fx

let () =
  ignore @@ time (Format.asprintf "%a" (Tyxml.Html.pp ())) Thtml.Lib.stress_render
