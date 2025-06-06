let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "%f\n" (Sys.time() -. t);
  fx

let () =
  Printf.printf "Dhtml\n";
  ignore @@ time Dream_html.to_string (Dhtml.Lib.stress_render 100);
  ignore @@ time Dream_html.to_string (Dhtml.Lib.stress_render 1000);
  ignore @@ time Dream_html.to_string (Dhtml.Lib.stress_render 10000);
  ignore @@ time Dream_html.to_string (Dhtml.Lib.stress_render 100000);
  ignore @@ time Dream_html.to_string (Dhtml.Lib.stress_render 1000000)
