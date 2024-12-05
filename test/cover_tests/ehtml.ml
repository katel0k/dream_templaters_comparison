let () =
 assert (Ehtml.render () =
 {|<html>
<head>
    <title>My comparison test</title>
    <style>
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
</style>

</head>
<body>
    <div class="wrapper">
        <h1 style="font-size: 40px;color:aliceblue;">Cumtest <br> The future of testing</h1>
        <p id="padding">
            Imagine, you want to compare several templaters doing the same task.
        </p>
    </div>
    <div class="test_suites">
        <h2 style="padding: 100px 20%">We are comparing those tests</h2>
        <div class="repeating_values_wrapper">
            <div class="repeating_value repeating_values-colored" >
  We can compare not one,
</div>

            <div class="repeating_value" >
  not two,
</div>

            <div class="repeating_value repeating_values-colored" >
  but three values!
</div>

        </div>
    </div>
</body>
</html>
|})
