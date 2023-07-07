<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*" %>
<%
  // Get the submitted form data
  String rollno = request.getParameter("rollno");
  String name = request.getParameter("name");
  
  // Database connection
  Connection con = null;
  PreparedStatement studentStatement = null;
  PreparedStatement rollnoStatement = null;
  
  try {
    // Get the database connection
    con = ConnectionProvider.getCon();
    
    // Prepare the SQL query to delete the record from the student table
    String studentQuery = "DELETE FROM student WHERE rollno = ? AND Sname = ?";
    studentStatement = con.prepareStatement(studentQuery);
    studentStatement.setString(1, rollno);
    studentStatement.setString(2, name);
    
    // Execute the query to delete from the student table
    int studentRowsAffected = studentStatement.executeUpdate();
    
    // Prepare the SQL query to delete the record from the rollno table
    String rollnoQuery = "DELETE FROM rollno WHERE rollno = ?";
    rollnoStatement = con.prepareStatement(rollnoQuery);
    rollnoStatement.setString(1, rollno);
    
    // Execute the query to delete from the rollno table
    int rollnoRowsAffected = rollnoStatement.executeUpdate();
    
    // Check the results
    if (studentRowsAffected > 0 && rollnoRowsAffected > 0) {
      // Records deleted successfully
      response.sendRedirect("adminHome.jsp");
    } else {
      // No matching records found or deletion failed
      response.sendRedirect("removeerror.jsp"); // Replace with your error page URL
    }
  } catch (Exception e) {
    e.printStackTrace();
    // Handle the exception as per your requirements
  } 
  
%>
