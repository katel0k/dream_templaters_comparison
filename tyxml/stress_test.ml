let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "%f\n" (Sys.time() -. t);
  fx

let () =
  Printf.printf "Tyxml\n";
  ignore @@ time (Format.asprintf "%a" (Tyxml.Html.pp ())) (Thtml.Lib.stress_render 100);
  ignore @@ time (Format.asprintf "%a" (Tyxml.Html.pp ())) (Thtml.Lib.stress_render 1000);
  ignore @@ time (Format.asprintf "%a" (Tyxml.Html.pp ())) (Thtml.Lib.stress_render 10000);
  ignore @@ time (Format.asprintf "%a" (Tyxml.Html.pp ())) (Thtml.Lib.stress_render 100000)
