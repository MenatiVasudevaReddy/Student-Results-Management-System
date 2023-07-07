<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Update Student Details</title>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<a href="adminHome.jsp" class="back-button">Back</a>
 
<style>

  .back-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: red;
    color: #fff;
    text-decoration: none;
    border-radius: 4px;
    position: absolute;
    top: 130px;
    right: 150px;
  }

	input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
	{
	    border: none;
	    background: silver;
	    height: 60px;
	    font-size: 18px;
	    padding: 10px;
	    width: 100%;	
	    border-radius: 10px;
	    margin-left: 3%;
	    color: #000000;
	}
	table {
		  border-collapse: collapse;
		  border: 2px solid #000000;
		  text-align: center;
		  width: 90%;
		  margin: 0% auto;
		  background-color: white;
		  color: #000000;
		}
		
		th, td {
		  border: 2px solid #000000;
		  color: #000000;
		  padding: 15px;
		  vertical-align: middle;
		}
		
		th.uppercase {
		  font-size: 16px;
		}
		
		thead th {
		  width: 100px;
		}
		
		tbody td {
		  width: 100px;
		}

</style>

<script>
function showPopup() {
  var result = confirm("Student details updated successfully. Do you want to go back to the admin home page?");
  if (result) {
    window.location.href = "registeredStudents.jsp"; 
  } else {
	  window.location.href = "updatestudent.jsp";
  }
}
</script>

<script>
        // JavaScript function to confirm the deletion
        function confirmDelete(rollno) {
            if (confirm("Are you sure you want to delete this student?")) {
                window.location.href = "deleteStudentAction.jsp?rollno=" + rollno;
            }
        }
</script>

</head>
<body>

<img src="logo.png"  align="left"width="100" height="100">
<center>
	<img src="new_logo.jpg" width="100" height="100">
	<img src="apj sir.png" align="right"  width="100" height="100">
</center>

<%
String course = request.getParameter("Class");
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from student");
%>

<br><div style="text-align: center; width:100%; height:50;">
  <h2>Update Student Details Here!</h2>
</div><br>

<form action="updatestudentAction.jsp" method="POST">

<table>
    <tr>
        <th class="uppercase">Class</th>
        <th class="uppercase">Section</th>
        <th class="uppercase">Roll No</th>
        <th class="uppercase">Student Name</th>
        <th class="uppercase">Father Name</th>
        <th class="uppercase">dob</th>
        <th class="uppercase">Gender</th>
        <th class="uppercase">Actions</th>
        <th class="uppercase">Actions</th>
    </tr>
	    
	<%
	    while(rs.next()) {
	%>
	    <tr>
	        <td><input type="text" value="<%=rs.getString(1)%>" name="class" required></td>
	        <td><input type="text" value="<%=rs.getString(2)%>" name="section" required></td>
	        <td><input type="text" value="<%=rs.getString(3)%>" name="rollno" required></td>
	        <td><input type="text" value="<%=rs.getString(4)%>" name="Sname" required></td>
	        <td><input type="text" value="<%=rs.getString(5)%>" name="fatherName" required></td>
	        <td><input type="text" value="<%=rs.getString(6)%>" name="dob" required></td>
	        <td><input type="text" value="<%=rs.getString(7)%>" name="gender" required></td>
	        <td><button type="submit" class="button" style="font-size: 18px; padding: 10px 20px; background-color: powderblue;" onclick="showPopup()">Save</button></td>
	        <td><button type="button" class="button" style="font-size: 18px; padding: 10px 20px; background-color: powderblue;" onclick="confirmDelete('<%=rs.getString(3)%>')">Delete</button></td>
	    </tr>
		<%
	    }
	}
	catch(Exception e) {
	    System.out.println(e);
	}
	%>

	</table>
</form>

<br><div style="text-align: center; width:100%; height:50;">
  <h3>All Right Reserved @ School :: 2023-2028</h3>
</div>
</body>
</html>
