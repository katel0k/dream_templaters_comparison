let render param =
  <html>
  <body>
    <h1>
      <%s if (param = "secret_word") then
"Hooray!"
else
("The URL parameter was not " ^ param ^ ":(")
      %>
    </h1>
  </body>
  </html>


let word_request request =
  Dream.param request "word"
  |> render
  |> Dream.html