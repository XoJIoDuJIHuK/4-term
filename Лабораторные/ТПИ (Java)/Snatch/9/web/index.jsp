<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Lab10</title>
  </head>

  <body>
  <div >
    <form action="Time" method="GET">
      <input type="submit" value="Получить информацию">
    </form>
  </div>

  <div >
    <form method="POST" action="GoToLogin">
      <input type="submit" value="Окно авторизации">
      </input>
    </form>
  </div>

  <div>
    <form method="GET" action="FirstServlet">
      <input type="submit"  style="" value="GET"/>
    </form>
    <form method="POST" action="FirstServlet">
      <input type="submit"  style="" value="POST"/>
    </form>
  </div>
  </body>
</html>
