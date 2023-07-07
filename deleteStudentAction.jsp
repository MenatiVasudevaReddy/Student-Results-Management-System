<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String rollno = request.getParameter("rollno");

try {
    Connection con = ConnectionProvider.getCon();

    // Delete from results table
    PreparedStatement pstmtResults = con.prepareStatement("DELETE FROM result WHERE rollno=?");
    pstmtResults.setString(1, rollno);
    pstmtResults.executeUpdate();
    
    // Delete from student table
    PreparedStatement pstmtStudent = con.prepareStatement("DELETE FROM student WHERE rollno=?");
    pstmtStudent.setString(1, rollno);
    int rowsAffected = pstmtStudent.executeUpdate();

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
