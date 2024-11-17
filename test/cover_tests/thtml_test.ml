let () = assert(
  Format.asprintf "%a" (Tyxml.Html.pp ()) Thtml.doc = ""
)