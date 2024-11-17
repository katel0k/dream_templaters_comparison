open Tyxml
let to_ocaml = Html.(
  (a ~a:[a_href "ocaml.org"] [txt "OCaml!"])
  )

let doc = Html.(
  html
    (head (title (txt "hi")) [])
    (body [to_ocaml])
)