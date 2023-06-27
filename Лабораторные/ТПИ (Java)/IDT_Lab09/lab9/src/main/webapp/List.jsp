<!DOCTYPE html>
<html>
<head>
  <title>Input Page</title>
</head>
<body>
<h1>Input Page</h1>
<form action="inputServlet" method="post">
  <input type="hidden" name="id" value="1">
  <label for="input1">Name:</label>
  <input type="text" id="input1" name="channel_name"><br><br>
  <label for="input2">Href:</label>
  <input type="text" id="input2" name="href"><br><br>
  <input type="submit" value="Update" name="update">
  <input type="submit" value="Delete" name="delete">
  <input type="submit" value="Add" name="add">
</form>
</body>
</html>
