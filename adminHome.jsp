<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<title>ADMIN HOME</title>
<script src="path/to/removeStudent.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
	.btn-big {
	  padding: 10px 20px;
	  font-size: 16px;
	  background-color: white;
	  color: black;
	}
	
	.btn-big:hover {
	  background-color: orange;
	}
	
	/* Center align buttons */
  .center-buttons {
    display: flex;
    justify-content: center;
    }
	
    .logout-box {
      position: absolute;
      top: 100px;
      right: 80px;
      background-color: white;
      padding: 10px;
      border-radius: 5px; 
    }
	   
	.tbl-content table {
	  width: 100%;
	  border-collapse: collapse;
	  background-color: white; /* Add this line */
	}
	
	.tbl-content td {
	  padding: 8px;
	  text-align: center;
	  border: 2px solid black;
	  font-size: 20px;
	  color: black;
	  background-color: white; /* Add this line */
	}
	
     .back-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: red;
    color: #fff;
    text-decoration: none;
    border-radius: 4px;
    position: absolute;
    top: 40px;
    right: 120px;
  }
    .my-form .container {
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .my-form .card {
            border-color: #ccc;
            box-shadow: 0 2px 2px rgba(0, 0, 0, 0.3);
        }

        .my-form .card-header {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .my-form .card-body {
            padding: 15px;
        }

        .my-form .form-group {
            margin-bottom: 15px;
        }

        .my-form .col-form-label {
            padding-top: 8px;
            padding-bottom: 8px;
        }

        .my-form .btn-block {
            width: 100%;
        }
  
</style>

<body>
<img src="logo.png"  align="left"width="100" height="100">
<center>
	<img src="new_logo.jpg" width="100" height="100">
	<img src="apj sir.png" align="right"  width="100" height="100">
</center>

<div class="w3-container">
  <div class="w3-bar w3-black">
    <div class="center-buttons">
      <button class="w3-bar-item w3-button tablink btn-big" onclick="openCity(event,'London')">Add New Student</button>
      <button class="w3-bar-item w3-button tablink btn-big" onclick="openCity(event,'Paris')">Insert New Result</button>
	  <button class="w3-bar-item w3-button tablink btn-big" onclick="window.location.href='registeredStudents.jsp', '_blank'">Registered Students</button>
	  <button class="w3-bar-item w3-button tablink btn-big" onclick="window.location.href='AllStudentsResults.jsp', '_blank'">All Student Result</button>
   </div>
      
		<a href="index.html" class="back-button">LOGOUT</a>
  </div>
</div>

<div id="London" class="w3-container w3-border city"><br>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

    <main class="my-form">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Add New Students</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validateForm()" action="addnewstudent.jsp" method="post">
                            
                            <div class="form-group row">
                                <label for="full_name" class="col-md-4 col-form-label text-md-right">CLASS</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="class" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">SECTION</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="section" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="user_name" class="col-md-4 col-form-label text-md-right">ROLL NUMBER</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="rollno" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="phone_number" class="col-md-4 col-form-label text-md-right">STUDENT NAME</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="Sname" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="present_address" class="col-md-4 col-form-label text-md-right">FATHER NAME</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="fatherName" required>
                                </div>
                            </div>
                            
							<div class="form-group row">
				   			 	<label for="date_of_birth" class="col-md-4 col-form-label text-md-right">DATE OF BIRTH</label>
				    			<div class="col-md-6">
				        			<input type="date" class="form-control" name="dob" required>
				    			</div>
				    		</div>
				    		
							<div class="form-group row">
							    <label for="gender" class="col-md-4 col-form-label text-md-right">Gender</label>
							    <div class="col-md-6">
							        <select id="gender" class="form-control" name="gender" required>
							            <option value="" disabled selected>Select</option>
							            <option value="Male">Male</option>
							            <option value="Female">Female</option>
							            <option value="Other">Other</option>
							        </select>
							    </div>
							</div>
							
							   <div class="form-group row">
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary btn-block">Save</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 
 <script>
    function validateForm() {
        // Validate roll number (integer)
        var rollno = document.getElementsByName("rollno")[0].value;
        if (!Number.isInteger(Number(rollno))) {
            alert("Roll number should be an integer.");
            return false;
        }

        // Validate section (single alphabet)
        var section = document.getElementsByName("section")[0].value;
        if (!/^[A-Za-z]$/.test(section)) {
            alert("Section should be a single alphabet.");
            return false;
        }

        // Validate student name and father name (alphabets only)
        var studentName = document.getElementsByName("Sname")[0].value;
        var fatherName = document.getElementsByName("fatherName")[0].value;
        if (!/^[A-Za-z]+$/.test(studentName) || !/^[A-Za-z]+$/.test(fatherName)) {
            alert("Student name and Father name should contain alphabets only.");
            return false;
        }

        return true;
    }
</script>

</main>

</body>
</html> 

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
  </div>

  <div id="Paris" class="w3-container w3-border city" style="display:none"><br>
  
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>

<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Insert New Result</div>
                        <div class="card-body">
                           <form name="my-form" onsubmit="return validform()" action="insertnewresult.jsp" method="post">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">ROLL NUMBER</label>
                                    <div class="col-md-6">
                                        <input type="text"class="form-control" name="rollno" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">EXAM 1</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s1" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">EXAM 2</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s2" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">EXAM 3</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s3" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">EXAM 4</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s4" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">EXAM 5</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s5" required>
                                    </div>
                                </div>
                                
                                 <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">EXAM 6</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s6" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </div>
     
</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html> 

<br><center>All Right Reserved @ School :: 2023-2028</center><br>
</body>
</html>

