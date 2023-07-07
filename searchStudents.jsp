<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>

<%
    String searchQuery = request.getParameter("search");

    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM student WHERE rollno = '" + searchQuery + "' OR name LIKE '%" + searchQuery + "%'");

        // Add your code to display the search results
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    
</head>
<body>

</body>
</html>
