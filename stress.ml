(* open Lib

(* let () =
  Printf.printf "\n";
  List.map
    (
      fun volume ->
      List.combine generators (List.init (List.length generators) (fun _ -> volume))
      |> List.map (fun (f, v) -> time f v)
    )
    volumes
  |> ignore *)

let () =
List.map
(
  fun volume ->
    (* Printf.printf "%d\n" volume; *)
   time (List.nth generators 3) volume
)
  (range 1 10000)
|> ignore *)

(* open Printf *)


let repeating_value ~is_colored = Tyxml.Html.(
  div ~a:[a_class
    (["repeating_value"] @ (if is_colored then ["repeating_values-colored"] else [""]))
    ]
)

let rec _stress_render volume ind =
  let open Tyxml.Html in
    if ind < volume then
      (repeating_value ~is_colored:(ind mod 2 == 0) [txt (string_of_int ind)]) :: (_stress_render volume (ind + 1))
    else
      []

let stress_render volume = Tyxml.Html.(
  html
  (head (title @@ txt "Stress") [])
  (body [
    div (_stress_render volume 0)
  ])
)

let st volume = (Format.asprintf "%a" @@ Tyxml.Html.pp ()) (stress_render volume)

let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "%f\n" (Sys.time() -. t);
  fx

open Benchmark
let x = 17

let () =
  let s = latency1 ~repeat:5 10000L st x in
    (* tabulate s; *)
    print_gc s;
    print_newline ();
  let s = throughput1 ~repeat:5 1 st x in
    (* tabulate s; *)
    print_gc s;
    print_newline ();
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
  time st x |> ignore;
