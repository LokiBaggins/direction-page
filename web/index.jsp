<%@ page import="java.sql.*" %>
<%@ page import="dbConnection.ConnectionPool" %>
<%--
  Created by IntelliJ IDEA.
  User: SBT-Meshkov-AV
  Date: 02.11.2015
  Time: 6:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
    <h1>Welcome JSP page_update1</h1>
    <%
      try {

        Connection conn = ConnectionPool.getInstance().getConnection();

        String selDataStr = "SELECT * FROM categories;";
        PreparedStatement selData = conn.prepareStatement(selDataStr);

        ResultSet rsSel = selData.executeQuery();


    %>

    <h3>BEFORE_TABLE</h3>
    <table>
      <tr>
        <td>ID</td>
        <td>CATEGORY_NAME</td>
      </tr>
      <% while (rsSel.next()) { %>
      <tr>
        <td><%= rsSel.getInt(1) %></td>
        <td><%= rsSel.getString(2) %></td>
      </tr>
      <% }
      conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }%>
    </table>

  </body>
</html>
