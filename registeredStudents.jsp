<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
    <title>Registered Students</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
	
	<a href="adminHome.jsp" class="back-button">Back</a>

<button class="edit-button" onclick="window.location.href='updatestudent.jsp'">Edit / Delete Students</button>
    	
<style>
	.edit-button {
        padding: 15px 20px;
        background-color: orange;
        color: black;
        text-decoration: none;
        border-radius: 4px;
        position: absolute;
        top: 110px;
        left: 200px;
        font-size: 16px;
    }

    .edit-button:hover {
        background-color: white;
       }
    
	  .back-button {
	    display: inline-block;
	    padding: 10px 20px;
	    background-color: red;
	    color: #fff;
	    text-decoration: none;
	    border-radius: 4px;
	    position: absolute;
	    top: 120px;
	    right: 50px;
	  }
		.table-container {
		  width: 90%;
		  margin: 0 auto;
		  display: flex; /* Use flexbox for alignment */
  			justify-content: center;
		}
		
		.table-header {
		  border: 2px solid #000000;
		  background-color: white;
		  color: #000000;
		  padding: 12px;
		}
		
		table {
		  border-collapse: collapse;
		  text-align: center;
		  width: 100%;
		  background-color: white;
		  color: #000000;
		  table-layout: fixed;
		}
		
		th,td {
		  border: 2px solid #000000;
		  color: #000000;
		  padding: 15px; /* Increased padding for better spacing */
		  vertical-align: middle;
		}
		
		th.uppercase {
		  font-size: 18px;
		}
		
		thead th {
		  width: calc(100% / 7);
		}
		
		tbody td {
		  width: calc(100% / 7);
		}

		* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

		#searchBox {
		    height: 40px;
		    width: 250px;
		    position: absolute;
		    top: 5px;
    		right: 180px;
		    border: 2px solid black;
		    display: flex;
		    align-items: center;
		    justify-content: flex-end;
		    background-color: white; /* Optional: Set the background color */
		    left: calc(100% - 400px); /* Adjust the value based on the page layout */
		    margin-top: 60px; /* Adjust the value based on the page layout */
		}
		
		#input {
		     width: 70%;
		    border: none;
		    outline: none;
		    padding: 0 15px;
		}
		
        #searchBtn {
            width: 30%;
		    height: 100%;
		    border: none;
		    background-color: #000;
		    color: #fff;
		    cursor: pointer;
        }

        input {
            font-size: 18px;
        }

        #content {
            width: 90%;
            color: black;
            font-size: 20px;
            padding-top: 20px;
        }
        mark {
            background-color: yellow;
        }
         .highlight {
            background-color: yellow;
        }

  </style>
</head>
<body>

<img src="logo.png"  align="left"width="100" height="100">
<center>
	<img src="new_logo.jpg" width="100" height="100">
	<img src="apj sir.png" align="right"  width="100" height="100">
</center>

	<br><div style="text-align: center; width:100%; height:50;">
	  <h2>Update Student Details Here!</h2>
	</div><br>
	
<div id="searchBox">
    <input type="text" id="input" placeholder="Search" />
    <input type="button" id="searchBtn" value="Search" onclick="search()" />
</div>

<%
String msg = request.getParameter("msg");
	if ("valid".equals(msg)) {
	%>
		<center><font color="red" size="5">Successfully Updated</font></center>
	<%
	}	%>
	
	<%	if ("invalid".equals(msg)) {
	%>
		<center><font color="red" size="5">Something went Wrong! Try Again!</font></center>
	<%
	}	%>
	
	<%	if ("deleted".equals(msg)) {
	%>
		<center><font color="red" size="5">Successfully Deleted</font></center>
	<%
	}
%>
    
<section>
    <!--for demo wrap-->
    <div class="table-container">
    <div class="tbl-header" id="content">
        <table id="studentTable">
            <thead>
                <tr Style= "width:90%">
	              <th class="uppercase">Class</th>
	              <th class="uppercase">Section</th>
	              <th class="uppercase">Roll Number</th>
	              <th class="uppercase">Name</th>
	              <th class="uppercase">Father Name</th>
	              <th class="uppercase">DOB (YYYY/MM/DD)</th>
	              <th class="uppercase">Gender</th>
	 			 </tr>
            </thead>
        
          <tbody class="tbl-content">
            <%@page import="java.sql.*" %>
            <%@page import="Project.ConnectionProvider" %>
            <% 
            try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from student");
                while(rs.next()) { %>
                  <tr>
                    <td style="border: 2px solid black; text-align: center; font-size: 18px; class="uppercase"><%=rs.getString(1) %></td>
                    <td style="border: 2px solid black; text-align: center; font-size: 18px; class="uppercase"><%=rs.getString(2) %></td>
                    <td style="border: 2px solid black; text-align: center; font-size: 18px;">
                      <a href="studentLogin.html?rollno=<%=rs.getString(3) %>"><%=rs.getString(3) %></a>
                    </td>
                    <td style="border: 2px solid black; text-align: center; font-size: 18px; class="uppercase"><%=rs.getString(4) %></td>
                    <td style="border: 2px solid black; text-align: center; font-size: 18px; class="uppercase"><%=rs.getString(5) %></td>
                    <td style="border: 2px solid black; text-align: center; font-size: 18px; class="uppercase"><%=rs.getString(6) %></td>
                    <td style="border: 2px solid black; text-align: center; font-size: 18px; class="uppercase"><%=rs.getString(7) %></td>
                    
                  </tr>
            <% }
            } catch(Exception e) {} %>
          </tbody>
        </table>
      </div>
      </div>
    </section>

<script type="text/javascript">
    function search() {
        let input = document.getElementById("input").value.trim().toLowerCase();
        let table = document.getElementsByTagName("table")[0]; // Target the first table
        let rows = table.getElementsByTagName("tr");

        for (let i = 0; i < rows.length; i++) {
            let row = rows[i];
            let cells = row.getElementsByTagName("td");
            let found = false;

            for (let j = 0; j < cells.length; j++) {
                let cellText = cells[j].innerText.toLowerCase();

                if (cellText.includes(input)) {
                    cells[j].classList.add("highlight");
                    found = true;
                } else {
                    cells[j].classList.remove("highlight");
                }
            }

            if (found) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        }
    }
</script>
<br><center>All Right Reserved @ School :: 2023-2028</center><br>
</body>
</html>

