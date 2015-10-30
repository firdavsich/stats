<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Netflow statistic</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">


  </head>
  <body>
<div class="jumbotron">
<h2 align=center>Netflow stats</h2>

<form role="form">

 <div class="container">
  <div class="row">
   <div class='col-sm-6'>
    <div class="form-group">
     <div class='input-group date' id='datetimepicker2'>
      <input type="date" name="date" class="form-control"/>
      <span class="input-group-addon">
      <span class="glyphicon glyphicon-calendar"></span>
     </span>

    </div>

<div class="form-group">
  <label for="sel1">Select list:</label>
  <select class="form-control" id="sel1">
    <option>1</option>
    <option>2</option>
    <option>3</option>
    <option>4</option>
  </select>
</div>

</div>
 <button type="submit" class="btn btn-success">Go</button>
</div>

   </div>

  </div>

 </div>

</div>

</form>
<div class="container">
<?php
$output = shell_exec('stats.sh summ_no_tjk 2015-10-29');
echo "<pre>$output</pre>";
?>
</div>

</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>