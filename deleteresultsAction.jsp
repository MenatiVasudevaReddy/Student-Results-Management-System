<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String rollno = request.getParameter("rollno");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pstmt = con.prepareStatement("DELETE FROM result WHERE rollno=?");
    pstmt.setString(1, rollno);
    
    int rowsAffected = pstmt.executeUpdate();

    if (rowsAffected > 0) {
        response.sendRedirect("adminHome.jsp?msg=deleteSuccess");
    } else {
        response.sendRedirect("adminHome.jsp?msg=deleteFailed");
    }
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("adminHome.jsp?msg=deleteFailed");
}
%>
