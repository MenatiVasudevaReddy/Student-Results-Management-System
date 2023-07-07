<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String classValue = request.getParameter("class");
String section = request.getParameter("section");
String Sname = request.getParameter("Sname");
String fatherName = request.getParameter("fatherName");
String dob = request.getParameter("dob");
String gender = request.getParameter("gender");
String rollno = request.getParameter("rollno");

String updateQuery = "UPDATE Student SET class = ?, section = ?, Sname = ?, fatherName = ?, dob = ?, gender = ? WHERE rollno = ?";

Connection con = null;
PreparedStatement pstmt = null;
try {
    con = ConnectionProvider.getCon();

    pstmt = con.prepareStatement(updateQuery);
    pstmt.setString(1, classValue);
    pstmt.setString(2, section);
    pstmt.setString(3, Sname);
    pstmt.setString(4, fatherName);
    pstmt.setString(5, dob);
    pstmt.setString(6, gender);
    pstmt.setString(7, rollno);
    
    int rowsAffected = pstmt.executeUpdate();

    if (rowsAffected > 0) {
        // Update successful
        response.sendRedirect("registeredStudents.jsp?msg=valid");
    } else {
        // Update failed
        response.sendRedirect("updatestudent.jsp?msg=invalid");
    }
} catch (SQLException e) {
    e.printStackTrace();
    // Handle the SQLException appropriately (e.g., display a user-friendly error message)
    response.sendRedirect("updatestudent.jsp?msg=error");
} catch (Exception e) {
    e.printStackTrace();
    // Handle any other exceptions that may occur
    response.sendRedirect("updatestudent.jsp?msg=error");
} finally {
    // Close the PreparedStatement and Connection in the finally block
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    if (con != null) {
        try {
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
%>
