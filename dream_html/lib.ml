let styles = Dream_html.HTML.style []  
  {|.wrapper {
  background-color: grey;
  padding: 100px 20%% 100px 20%%;
}
#padding {
  font-size: 20px;
  color: lightblue;
}
body {
  margin: 0;
}
.repeating_values_wrapper {
  display: flex;
  justify-content: space-evenly;
}
.repeating_value {
  width: 100%%;
  text-align: center;
  display: flex;
  justify-content: space-around;
  flex-direction: column;
  vertical-align: middle;
}
.repeating_values-colored {
  background-color: grey;
  height: 400px;
}|}

let repeating_value is_colored  = 
  let open Dream_html.HTML in
    if is_colored then
      div [class_ "repeating_value repeating_values-colored"]
    else
      div [class_ "repeating_value"]

let page =
  let open Dream_html in
  let open HTML in
  html [lang "en"] [
    head [] [
      title [] "My comparison test";
      styles
      ];
    body [] [
      div [class_ "wrapper"] [
        h1 [style_ "font-size: 40px;color:aliceblue;"] [txt "Cumtest "; br []; txt "The future of testing"];
      ];
      div [class_ "test_suites"] [
        h2 [style_ "padding: 100px 20%%"] [txt "We are comparing those tests"];
        div [class_ "repeating_values_wrapper"] [
          repeating_value true [txt "We can compare not one,"];
          repeating_value false [txt "not two,"];
          repeating_value true [txt "but three values!"];
        ]
      ]
    ]
  ]

let rec _stress_render ind =
  let open Dream_html in
    if ind < 10000 then
      (repeating_value (ind mod 2 == 0) [txt "%s" (string_of_int ind)]) :: (_stress_render (ind + 1))
    else
      []

let stress_render = 
  let open Dream_html in
  let open HTML in
  html [lang "en"] [
    head [] [
      title [] "Stress"
    ];
    body [] [
      div [] (_stress_render 0)
    ]
  ]
