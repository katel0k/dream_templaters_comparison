open Tyxml

let styles =
{|
.wrapper {
  background-color: grey;
  padding: 100px 20% 100px 20%;
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
  width: 100%;
  text-align: center;
  display: flex;
  justify-content: space-around;
  flex-direction: column;
  vertical-align: middle;
}

.repeating_values-colored {
  background-color: grey;
  height: 400px;
}
|}

let repeating_value ~is_colored = Html.(
    div ~a:[a_class
      (["repeating_value"] @ (if is_colored then ["repeating_values-colored"] else [""]))
      ]
  )

let doc = Html.(
  html
  (head (title @@ txt "hi") [
    style [txt styles]
  ])
  (body [
    div ~a:[a_class ["wrapper"]] [
      h1 ~a:[a_style {|font-size: 40px;color:aliceblue;|}] [txt "Cumtest"; br () ;txt "The future of testing"];
      p ~a:[a_id "padding"] [txt "Imagine, you want to compare several templaters doing the same task."]
    ];
    div ~a:[a_class ["test_suites"]] [
      h2 ~a:[a_style {|padding: 100px 20%|}] [txt "We are comparing those tests"];
      div ~a:[a_class ["repeating_values_wrapper"]] [
        repeating_value ~is_colored:true [txt "We can compare not one,"];
        repeating_value ~is_colored:false [txt "not two,"];
        repeating_value ~is_colored:true [txt "but three values!"];
      ]
    ]
  ])
    )

let rec _stress_render volume ind =
  let open Html in
    if ind < volume then
      (repeating_value ~is_colored:(ind mod 2 == 0) [txt (string_of_int ind)]) :: (_stress_render volume (ind + 1))
    else
      []

let stress_render volume = Html.(
  html
  (head (title @@ txt "Stress") [])
  (body [
    div (_stress_render volume 0)
  ])
)
