<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String rollno = request.getParameter("rollno");
String s1 = request.getParameter("s1");
String s2 = request.getParameter("s2");
String s3 = request.getParameter("s3");
String s4 = request.getParameter("s4");
String s5 = request.getParameter("s5");
String s6 = request.getParameter("s6");

if (rollno != null && !rollno.isEmpty()) {
    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("INSERT INTO result VALUES (?, ?, ?, ?, ?, ?, ?)");
        
        ps.setString(1, rollno);
        ps.setString(2, s1);
        ps.setString(3, s2);
        ps.setString(4, s3);
        ps.setString(5, s4);
        ps.setString(6, s5);
        ps.setString(7, s6);
        
        ps.executeUpdate();
  //      response.sendRedirect("adminHome.jsp");
  
        %>
        <script>
            alert("Student Result added successfully.");
            window.location.href = "adminHome.jsp"; // Redirect to adminHome.jsp
        </script>
        <% 
  
    } catch (Exception e) {
        out.println(e);
    }
} else {
    out.println("Roll number cannot be null.");
}
%>
