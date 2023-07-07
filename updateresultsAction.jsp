<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String[] rollnos = request.getParameterValues("rollno");
String[] s1Values = request.getParameterValues("s1");
String[] s2Values = request.getParameterValues("s2");
String[] s3Values = request.getParameterValues("s3");
String[] s4Values = request.getParameterValues("s4");
String[] s5Values = request.getParameterValues("s5");
String[] s6Values = request.getParameterValues("s6");

Connection con = null;
PreparedStatement pstmt = null;

try {
    con = ConnectionProvider.getCon();

    // Prepare the update statement outside the loop
    pstmt = con.prepareStatement("UPDATE result SET s1=?, s2=?, s3=?, s4=?, s5=?, s6=? WHERE rollno=?");

    // Iterate over the rows
    for (int i = 0; i < rollnos.length; i++) {
        String rollno = rollnos[i];
        String s1 = s1Values[i];
        String s2 = s2Values[i];
        String s3 = s3Values[i];
        String s4 = s4Values[i];
        String s5 = s5Values[i];
        String s6 = s6Values[i];

        // Set the parameter values for the update statement
        pstmt.setString(1, s1);
        pstmt.setString(2, s2);
        pstmt.setString(3, s3);
        pstmt.setString(4, s4);
        pstmt.setString(5, s5);
        pstmt.setString(6, s6);
        pstmt.setString(7, rollno);

        // Execute the update statement for each row
        int rowsAffected = pstmt.executeUpdate();

        // Check the rows affected and handle accordingly
        if (rowsAffected > 0) {
            // Row updated successfully
            // You can add your specific success handling logic here
        } else {
            // Failed to update row
            // You can add your specific failure handling logic here
        }
    }

    // Redirect to the appropriate page after all rows are updated
    response.sendRedirect("AllStudentsResults.jsp?msg2=valid");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("AllStudentsResults.jsp?msg2=invalid");
} finally {
    // Close the PreparedStatement and Connection objects in the finally block
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
