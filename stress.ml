let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "%f\n" (Sys.time() -. t);
  fx


let volumes = [
  1; 2; 5; 10; 20; 50; 100; 200; 500; 1000; 2000; 5000; 10000; 20000; 50000; 100000; 200000; 500000; 1000000
]

let generators = [
  (fun volume -> Ehtml.Lib.stress_render volume ());
  (fun volume -> Dream_html.to_string @@ Dhtml.Lib.stress_render volume);
  (fun volume -> Xhtml.Lib.get_string_for_stress volume);
  (fun volume -> (Format.asprintf "%a" @@ Tyxml.Html.pp ()) (Thtml.Lib.stress_render volume));
  (fun volume -> (Format.asprintf "%a" @@ Tyxml.Html.pp ()) (Lib_percent.Lib.stress_render volume))
]

let () =
  Printf.printf "\n";
  List.map
    (
      fun volume ->
      List.combine generators (List.init (List.length generators) (fun _ -> volume))
      |> List.map (fun (f, v) -> time f v)
    )
    volumes
  |> ignore
