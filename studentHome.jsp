<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
try
{
	String rollNo = request.getParameter("rollNo");
    String dob = request.getParameter("dob");

    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM student INNER JOIN result ON student.rollNo = result.rollNo WHERE student.rollNo = '"+rollNo+"' AND student.dob = '"+dob+"'");

	if(rs.next()){
%>

	<img src="logo.png"  align="left"width="120" height="120">
	
	<center><img src="new_logo.jpg" width="150" height="150"></center>
	
	<a href="studentLogin.html" class="back-button">LOGOUT</a>
	    
	  <hr class="new1">

<style>
    .logout-box {
      position: absolute;
      top: 80px;
      right: 100px;
      background-color: ;
      padding: 10px;
      border-radius: 5px; 
    }
    
  .back-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: red;
    color: #fff;
    text-decoration: none;
    border-radius: 4px;
    position: absolute;
    top: 80px;
    right: 40px;
  }
  
	table {
	  width: 80%;
	  margin: 0 auto;
	  border-collapse: collapse;
	}
	
	th {
	  padding: 20px 15px;
	  text-align: left;
	  font-weight: 400;
	  font-size: 16px;
	  color: black;
	  text-transform: uppercase;
	  border: 2px solid black;
	  vertical-align: top; /* Add this line */
	}
	
	html {
	  font-family: arial;
	  font-size: 20px;
	}
	
	td {
	  border: 2px solid Black;
	  padding: 15px;
	  color: black;
	  text-align: center;
	  font-size: 16px;
	  vertical-align: middle; /* Add this line */
	}
  
  thead {
    font-weight: bold;
    text-align: center;
    background: #F0F8FF;
    color: black;
    font-size: 18px;
  }
  
  tbody > tr:nth-child(odd) {
    background: #FF7F50;
    font-size: 16px;
  }
  
  tbody > tr:nth-child(even) {
    background: #E6E6FA;
    font-size: 16px;
  }
  
  .footer {
    text-align: right;
    font-weight: bold;
    background: #F0F8FF;
    font-size: 18px;
  }
  
  body {
    background: #FFFFF0;
    font-family: 'Roboto', sans-serif;
  }
</style>

<head>
  <Title>Student Results</Title>
</head>
<body>

  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th colspan="5"><b>SCHOOL NAME: GSR MAGNET EM HIGH SCHOOL, Vanguard Campus</th>
          <th><b>ROLLNO:</b> <%=rs.getString(3) %></th>
        </tr>
      </thead>
      
      <thead>
        <tr>
        	<th colspan="3"><b>Name: </b><%=rs.getString(4) %></th>
          	<th colspan="3"><b>Father Name: </b><%=rs.getString(5) %></th>
        </tr>
      </thead>
      
      <thead>
        <tr>
          <th colspan="3"><b>CLASS: </b><%=rs.getString(1) %></th>
          <th><b>SECTION: </b><%=rs.getString(2) %></th>
          <th><b>DOB: </b><%=rs.getString(6) %></th>
          <th><b>Gender: </b><%=rs.getString(7) %></th>
        </tr>
      </thead>

    <thead>
      <tr>
        <td colspan="3">Course</td>
        <td rowspan="2">Maximum Marks</td>
        <td rowspan="2">Pass Marks</td>
        <td rowspan="2">Obtained Marks</td>
      </tr>
      <tr>
        <td>Subject Code </td>
        <td colspan="2">Subject Name </td>
      </tr>
    </thead>
    
    <tbody>
      <tr>
        <td>NAS101</td>
        <td colspan="2">EXAM 1 </td>
        <td>100</td>
        <td>50</td>
        <td><%=rs.getString(8) %></td>
      </tr>
      <tr>
        <td>NAS102</td>
        <td colspan="2">EXAM 2</td>
        <td>100</td>
        <td>50</td>
        <td><%=rs.getString(9) %></td>
      </tr>
      <tr>
        <td>NAS103</td>
        <td colspan="2">EXAM 3</td>
        <td>100</td>
        <td>50 </td>
        <td><%=rs.getString(10) %></td>
      </tr>
      <tr>
        <td>NEE101</td>
        <td colspan="2">EXAM 4</td>
        <td>100</td>
        <td>50</td>
        <td><%=rs.getString(11) %></td>
      </tr>
      <tr>
        <td>NEC101</td>
        <td colspan="2">EXAM 5</td>
        <td>100</td>
        <td>50</td>
        <td><%=rs.getString(12) %></td>
      </tr>
      <tr>
        <td>NAS152</td>
        <td colspan="2">EXAM 6</td>
        <td>100</td>
        <td>50</td>
        <td><%=rs.getString(13) %></td>
      </tr>
      <tr>
      </tbody>
      
    <tfoot>
      <tr>
		  <td colspan="3" class="footer">Total Marks</td>
		  <td>600</td>
		  <td>300</td>
		  <td><b>
		    <% 
		    int sum = rs.getInt(8) + rs.getInt(9) + rs.getInt(10) + rs.getInt(11) + rs.getInt(12) + rs.getInt(13);
		    out.println(sum);
		    %>
		  </td>
		</tr>
		<tr>
		  <td colspan="3" class="footer">Percentage</td>
		  <td colspan="1"><b>
		    <% 
		    int percentage = (sum * 100) / 600;
		    out.println(percentage + "%");
		    %>
		  </td>  
		  <td colspan="1" class="footer">Result</td>
		  <td colspan="1"><b>
		    <% 
		    boolean allSubjectsPass = (rs.getInt(8) >= 50) && (rs.getInt(9) >= 50) && (rs.getInt(10) >= 50) && (rs.getInt(11) >= 50) && (rs.getInt(12) >= 50) && (rs.getInt(13) >= 50);
		    out.println(allSubjectsPass ? "Pass" : "Fail");
		    %>
		  </td> 
		</tr>
     </tfoot>
  </table>
  
  <center><h5 style="color: red;">Note: If any subject mark is less than 50, the result is Fail. The result is Pass only if all subjects have marks above or equal to 50.</h5></center>
   
  <center><h5>Designed & Developed by School Team. All Right Reserved @ School :: 2023-2028</h5></center>
</body>

<%}
	else{
		response.sendRedirect("error.html");
	}
	}
	catch(Exception e){
		
	}
	%>
