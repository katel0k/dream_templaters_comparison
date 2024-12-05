let () =
  Dream.run @@
  (fun _ -> Dream_html.respond Dhtml.Lib.page)