<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #f00;
        }
        p {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Error</h1>
    <p><%= exception.getMessage() %></p>
    <p><%= exception.toString() %></p>
    <pre>
        <% 
          java.io.StringWriter sw = new java.io.StringWriter();
          java.io.PrintWriter pw = new java.io.PrintWriter(sw);
          exception.printStackTrace(pw);
          out.println(sw.toString());
        %>
    </pre>
</body>
</html>
