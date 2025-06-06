let repeating_value ~children ~is_colored ~___eml_buffer = (
(* let ___eml_buffer = buffer in *)
(Buffer.add_string ___eml_buffer "<div class=\"");
(Printf.bprintf ___eml_buffer "%s" (Dream.html_escape (
                  if is_colored then "repeating_value repeating_values-colored" else "repeating_value" 
)));
(Buffer.add_string ___eml_buffer "\" >\n  ");
(Printf.bprintf ___eml_buffer "%s" (Dream.html_escape (
        children 
)));
(Buffer.add_string ___eml_buffer "\n</div>\n");
___eml_buffer
(* (Buffer.contents ___eml_buffer) *)
)

let range from till =
  let rec _range ind =
    if ind < till then ind::_range (ind + 1)
    else []
  in
  _range from

let stress_render volume _ = (
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<html>\n<head>\n  <title>Stress</title>\n</head>\n<body>\n  <div>\n  ");
(* (Printf.bprintf ___eml_buffer "%s" ( *)
        ignore (List.fold_left (fun buf ind -> (repeating_value ~children:(string_of_int ind) ~is_colored:(ind mod 2 == 0) ~___eml_buffer:buf))
          ___eml_buffer
          (range 0 volume))
;
(Buffer.add_string ___eml_buffer "\n  </div>\n</body>\n</html>\n");
(Buffer.contents ___eml_buffer)
)

let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "%f\n" (Sys.time() -. t);
  fx

let () =
  ignore @@ time (stress_render 100) ();
  ignore @@ time (stress_render 1000) ();
  ignore @@ time (stress_render 10000) ();
  ignore @@ time (stress_render 100000) ();
  ignore @@ time (stress_render 1000000) ()
  