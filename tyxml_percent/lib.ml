open Tyxml

let styles = [%html
  [Html.txt {|
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
    }|}]
]

let repeating_value ~is_colored ~children = [%html
"<div class=" ["repeating_value"; if is_colored then "repeating_values-colored" else ""] ">"children"</div>"
]

let doc = [%html
{|<html>|}
  "<head>"
      "<title>My comparison test</title>"
      "<style>"styles"</style>"
  "</head>"
  {|<body>
    <div class=wrapper>
      <h1 style="font-size: 40px;color:aliceblue;">Cumtest <br> The future of testing</h1>
      <p id=padding>
        Imagine, you want to compare several templaters doing the same task.
      </p>
    </div>
    <div class=test_suites>
      <h2 style="padding: 100px 20%">We are comparing those tests</h2>
      <div class="repeating_values_wrapper">|}[
            repeating_value ~is_colored:true ~children:[Html.txt "We can compare not one,"];
            repeating_value ~is_colored:false ~children:[Html.txt "not two,"];
            repeating_value ~is_colored:true ~children:[Html.txt "but three values!"];
    ]{|</div>
    </div>
  </body>
</html>|}]

let rec _stress_render volume ind =
  if ind < volume then
    (repeating_value ~is_colored:(ind mod 2 == 0) ~children:[Html.txt (string_of_int ind)]) :: (_stress_render volume (ind + 1))
  else
    []

let stress_render volume = 
  [%html
{|<html>
  <head>
      <title>My comparison test</title>
      <style>Stress</style>
  </head>
  <body>
    <div>|}
      (_stress_render volume 0)
    {|</div>
  </body>
  </html>|}]
