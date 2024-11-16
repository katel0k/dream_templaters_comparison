let resulting_site =
"<!DOCTYPE html>
<html
lang=\"en\"><head><title>Dream-html</title></head><body><h1>Dream-html</h1><p>Is bad:(</p></body></html>"

let () =
  assert(
    Dream_html.to_string (Dhtml.page "bad") = resulting_site
  )