<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String classValue = request.getParameter("class");
String section = request.getParameter("section");
String rollno = request.getParameter("rollno");
String Sname = request.getParameter("Sname");
String fatherName = request.getParameter("fatherName");
String dob = request.getParameter("dob");
String gender = request.getParameter("gender");

String query = "INSERT INTO student (class, section, rollno, Sname, fatherName, dob, gender) VALUES (?, ?, ?, ?, ?, ?, ?)";

if (rollno != null && !rollno.isEmpty() &&
    Sname != null && !Sname.isEmpty() &&
    fatherName != null && !fatherName.isEmpty() &&
    gender != null && !gender.isEmpty() &&
    classValue != null && !classValue.isEmpty() &&
    section != null && !section.isEmpty() &&
    dob != null && !dob.isEmpty()) {

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, classValue);
        pstmt.setString(2, section);
        pstmt.setString(3, rollno);
        pstmt.setString(4, Sname);
        pstmt.setString(5, fatherName);
        pstmt.setString(6, dob);
        pstmt.setString(7, gender);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) { 
%>
            <script>
                alert("New Student added successfully.");
                window.location.href = "adminHome.jsp"; // Redirect to adminHome.jsp
            </script>
<%
        } else {
            throw new SQLException("Failed to insert student. No rows affected.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the SQLException appropriately (e.g., display a user-friendly error message)
    } catch (Exception e) {
        e.printStackTrace();
        // Handle any other exceptions that may occur
    }
} else {
    // Handle the case where required parameters are missing or empty
    response.getWriter().println("Missing or empty parameters. Please provide all the required information.");
}
%>
