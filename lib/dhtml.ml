let page param =
  let open Dream_html in
  let open HTML in
  (* automatically injects <!doctype html> *)
  html [lang "en"] [
    head [] [
      title [] "Dream-html" ];
    body [] [
      h1 [] [txt "Dream-html"];
      if (param = "cool") then
        p [] [txt "Is cool!"]
      else if (param = "bad") then
        p [] [txt "Is bad:("]
      else
        p [] [txt "Is okay."];
    ]
  ]