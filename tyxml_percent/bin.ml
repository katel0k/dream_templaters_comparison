let index_request _ =
  Format.asprintf "%a" (Tyxml.Html.pp ~indent:true ()) Lib_percent.Lib.doc
  |> Dream.html

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" index_request
  ]