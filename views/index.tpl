<!DOCTYPE html>

<html>
<head>
  <title>Jivox</title>
  
</head>

<body>
<center>
<h1>The Social Network</h1>
<h3>Select Direct Contacts!</h3>
  <form method="post">
    <label for="A">
    A:&nbsp;
    </label>
    <select id="A" name="A">
    <option value="-1">Select Contact for A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="D">D</option>
    <option value="E">E</option>
    </select>
    <br/><br />
    <label for="B" name="B">
    B:&nbsp;
    </label>
    <select id="B">
    <option value="-1">Select Contact for B</option>
    <option value="A">A</option>
    <option value="C">C</option>
    <option value="D">D</option>
    <option value="E">E</option>
    </select>
    <br/><br />
    <label for="C">
    C:&nbsp;
    </label>
    <select id="C" name="C">
    <option value="-1">Select Contact for C</option>
    <option value="A">A</option>
    <option value="B">B</option>
    <option value="D">D</option>
    <option value="E">E</option>
    </select>
    <br/><br />
    <label for="D">
    D:&nbsp;
    </label>
    <select id="D" name="D">
    <option value="-1">Select Contact for D</option>
    <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="E">E</option>
    </select>
    <br/><br />
    <label for="E">
    E:&nbsp;
    </label>
    <select id="E" name="E">
    <option value="-1">Select Contact for E</option>
    <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="D">D</option>
    </select>
    <br/><br />
    <input type="button" id="submit" value="GO!">
  </form>
  <br/>
  <br />
  <h3>Extended Contact List</h3>
  <div id="result" style="margin-top: 20px;">
  </div>
  </center>
  <script type="text/javascript" src="static/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $("#submit").on("click",function(){
        if($("#A").val()=="-1"||$("#B").val()=="-1"||$("#C").val()=="-1"||$("#D").val()=="-1"||$("#A").val()=="-1"){
          $("#result").html("Please fill all the details");
        } else {
        $.ajax({
          url:"/",
          method:"POST",
          data:{
            A: $("#A").val(),
            B: $("#B").val(),
            C: $("#C").val(),
            D: $("#D").val(),
            E: $("#E").val()
          }
        }).done(function(data){
          res = "A:=";
          for (var i = 1; i < data.A.length; i++) {
            res = res + " > " + data.A[i];
          }
          res += "<br />B:=";
          for (var i = 1; i < data.B.length; i++) {
            res = res + " > " + data.B[i];
          }
          res += "<br />C:=";
          for (var i = 1; i < data.C.length; i++) {
            res = res + " > " + data.C[i];
          }
          res += "<br />D:=";
          for (var i = 1; i < data.D.length; i++) {
            res = res + " > " + data.D[i];
          }
          res += "<br />E:=";
          for (var i = 1; i < data.E.length; i++) {
            res = res + " > " + data.E[i];
          }
          $("#result").html(res);
        });
      }
      });
    });
  </script>
</body>
</html>
