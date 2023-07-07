<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Registered Students</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<button class="edit-button" onclick="window.location.href='updateresults.jsp'">Edit / Delete Students Results</button>
     
<style>
    .edit-button {
        padding: 15px 20px;
        background-color: orange;
        color: black;
        text-decoration: none;
        border-radius: 4px;
        position: absolute;
        top: 100px;
        left: 150px;
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
	  padding: 12px;
	  vertical-align: middle;
	}
	
	th.uppercase {
	  font-size: 18px;
	}
	
	thead th {
	  width: calc(100% / 9); /* Divide the width evenly among 3 columns */
	}
	
	tbody td {
	  width: calc(100% / 9); /* Divide the width evenly among 3 columns */
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
		    top: 2px;
    		right: 150px;
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

<img src="logo.png" align="left" width="100" height="100">
<center>
    <img src="new_logo.jpg" width="100" height="100">
    <img src="apj sir.png" align="right" width="100" height="100">
</center>
<br>
	<div id="searchBox">
	    <input type="text" id="input" placeholder="Search" />
	    <input type="button" id="searchBtn" value="Search" onclick="search()" />
	</div>

<%
String msg2 = request.getParameter("msg2");
    if ("valid".equals(msg2)) {
	%>
	<center><font color="red" size="5">Successfully Updated</font></center>
	<%
	}
	%>
	
	<%
	if ("invalid".equals(msg2)) {
	%>
	<center><font color="red" size="5">Something went Wrong! Try Again!</font></center>
	<%
	}
	%>
	
	<%
	if ("deleted".equals(msg2)) {
	%>
	<center><font color="red" size="5">Successfully Deleted</font></center>
	<%
	}
	%>

<div style="text-align: center; width:100%; height:50;">
    <h2>Update Student Results Here!</h2><br>
</div>

<br>

<section>
    <!--for demo wrap-->
    <div class="tbl-header">
        <table id="studentTable">
            <thead>
                <tr>
                    <th class="uppercase">Roll Number</th>
                    <th class="uppercase">EXAM 1</th>
                    <th class="uppercase">EXAM 2</th>
                    <th class="uppercase">EXAM 3</th>
                    <th class="uppercase">EXAM 4</th>
                    <th class="uppercase">EXAM 5</th>
                    <th class="uppercase">EXAM 6</th>
                    <th class="uppercase">Total Marks</th>
                    <th class="uppercase">Result</th>
                </tr>
            </thead>
        
    </div>
    <div class="tbl-content">
     
            <tbody>
                <%@page import="java.sql.*" %>
                <%@page import="Project.ConnectionProvider" %>
                <% 
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from result");
                    while(rs.next()) {
                        int s1 = Integer.parseInt(rs.getString(2));
                        int s2 = Integer.parseInt(rs.getString(3));
                        int s3 = Integer.parseInt(rs.getString(4));
                        int s4 = Integer.parseInt(rs.getString(5));
                        int s5 = Integer.parseInt(rs.getString(6));
                        int s6 = Integer.parseInt(rs.getString(7));
                        int totalMarks = s1 + s2 + s3 + s4 + s5 + s6;
                        String result = (s1 < 50 || s2 < 50 || s3 < 50 || s4 < 50 || s5 < 50 || s6 < 50) ? "Fail" : "Pass";
                %>
                <tr>
                    <td><a href="studentLogin.html?rollno=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getString(5) %></td>
                    <td><%=rs.getString(6) %></td>
                    <td><%=rs.getString(7) %></td>
                    <td><%=totalMarks %></td>
                    <td><%=result %></td>
                </tr>
                <% }
                } catch(Exception e) {} %>
            </tbody>
        </table>
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

<a href="adminHome.jsp" class="back-button">Back</a>

<br><center>All Right Reserved @ School :: 2023-2028</center><br>

</body>
</html>
