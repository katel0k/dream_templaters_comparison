let () =
 assert (Ehtml.render "word" =
"<html>
<body>
  <h1>
    The URL parameter was not word:(
  </h1>
</body>
</html>\n\n\n")
