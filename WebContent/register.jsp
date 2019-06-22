<%@page import="pis.model.UserDAO,pis.pojo.User"%>
<% 
  String firstName 				= request.getParameter("first_name");
  String middleName 			= request.getParameter("middle_name");
  String lastName 				= request.getParameter("last_name");
  String email 					= request.getParameter("user_email");
  String userName 				= request.getParameter("user_id"); 						// get user_id from imported index.jsp form text entry area and store in string var
  String password 				= request.getParameter("user_password");				// get password from imported index.jsp store in string var
  String cssMessageClass 		= "success";
  String errorMessage 			= "";

  if (firstName != null && middleName != null && lastName != null && email != null && userName != null && password != null) {
	 errorMessage 				= firstName + " " + middleName + " " + lastName;
	 User user 					= new User(userName, password, firstName, middleName, lastName, email);
	 UserDAO userDao 			= new UserDAO();// create a new object of type commnServelt from the parrent class commonServlet
	
	 if (userDao.register(user)) {
	    errorMessage 			+= " Registered Successfully";
	 }
	 
	 else {	  
	   cssMessageClass 			= "error";
	   errorMessage 			= "Failed to Register " + errorMessage;
	 }
  }
  
%>
<!DOCTYPE html>
<html>																													<!-- standard boiler plate header stuff 	 begin  -->
<head>																													<!--   -->
<meta charset="ISO-8859-1">																								<!--  international charachter set begin head -->
<meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="expires" content="0" />																				<!--   says same thing for different browsers-->
<meta http-equiv="pragma" content="no-cache" />																			<!--   says same thing for different browser-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">		
<link rel="stylesheet" href="/PIS/css/site.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type = "text/javascript">
   // Global error message variable 
   var errorMessage;

	function showError() {
		$( "#dialog-message" ).text(errorMessage);
		$( "#dialog-message" ).
		 dialog(
				 {
				  modal: true,
				  width: 500,                     
				  height: 250,
				  show: {
					effect: "shake",
					duration: 1000
				  },
				  hide: {
					effect: "fade",
					duration: 500
				  },
				  buttons: {
					Ok: function() {
					  $( this ).dialog( "close" );
					}
				  }
				}
		 );
	}   
   
   // Common function to validate name and update error message accordingly 
   function checkName(field, type) {	   
	   if (!field.value.match(/^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/)) {
		  errorMessage += type + " Name must have alphanumerics only\n";
		  field.style.backgroundColor = "#F29E98";
		  field.select();
	   }
   }

   // Form validation
   function validateForm() {
	   errorMessage 		= "";
	   
	   // Resets the text field's color 
       var elements 		= document.getElementById("userForm").elements;
	   for (var i = 0;i < elements.length;i++) {
	       if (elements[i].type != null && elements[i].type == "text") {
	          elements[i].style.backgroundColor = "#FFFFFF";
	       }
	   }

	   // Validate all names
	   checkName(document.getElementById("first_name"), "First");
	   checkName(document.getElementById("middle_name"), "Middle");
	   checkName(document.getElementById("last_name"), "Last");	   
	   
	   // Check for error messages
	   if (errorMessage != "") {
		  showError();
	   }
	   
	   // return tre/false based on error messages 
	   return errorMessage == "";	   
   }
   
</script>

<title>Patient Information Management System Register</title>																<!-- title tab name above url    -->
</head>																													<!-- standard header stuff 	 end  -->
<body>
	<nav class="navbar navbar-default navbar-inverse" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><img
					src="images/medical_logo.png" alt="" width="10%"></a>				
			</div>
			<div class="navbar-expand">
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item"><a class="nav-link" href="/PIS">Login</a></li>
					<li class="active nav-item"><a class="nav-link" href="#">Register</a></li>					
				</ul>
			</div>
	</nav>
    <div id="dialog-message" title="Error...(hey this is an example of jquery testing)">
     <p>
      <span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 50px 0;"></span>
     </p>
	</div>																											<!-- begin body  -->
	<h1 align="center">Patient Information System Registration</h1>																					<!-- start page general menue header -->
	  <section class="outer-wrapper">																					<!-- begin css table influence on the remainder of the site with general outer wrapper-->
	    <div class="inner-wrapper">																						<!-- begin css table/cell influence on the remainder of the table w/inner wrapper  -->
	      <div class="container">																						<!--because its not in css sites file it must be in bootstrap  -->
	        <div class="row justify-content-center">																							<!-- because its not in css sites file it must be in bootstrap  -->
              <div class="col-sm-4 col-sm-offset-4">																	<!-- in bootstrap...maybe  a repeating 4 collumn grid area   -->           
              <div class="<%=cssMessageClass%>"><%=errorMessage%></div>																<!-- error Message  if wrong pw/un entered -->
				 <form method="post" action="/PIS/register.jsp" id="userForm" onsubmit="return validateForm()">						<!-- ??????????????  -->
			     <fieldset>
			         <div class="form-group">													<!-- ????????  -->
				       <label for="first_name" class="control-label">First Name</label>								<!--   -->
				       <input name="first_name" type="text" id="first_name" placeholder="Enter First Name" required class="form-control" value=""  />					<!--   -->
				     </div>	
				     <div class="form-group">													<!-- ????????  -->
				       <label for="middle_name" class="control-label">Middle Name</label>								<!--   -->
				       <input name="middle_name" type="text" id="middle_name" placeholder="Enter Middle Name" required class="form-control" value=""  />					<!--   -->
				     </div>
				     <div class="form-group">													<!-- ????????  -->
				       <label for="last_name" class="control-label">Last Name</label>								<!--   -->
				       <input name="last_name" type="text" id="last_name" placeholder="Enter Last Name" required class="form-control" value=""  />					<!--   -->
				     </div>
				     <div class="form-group">													<!-- ????????  -->
				       <label for="user_email" class="control-label">Email</label>								<!--   -->
				       <input name="user_email" type="email" id="user_email" placeholder="Enter Email" required class="form-control" value=""  />					<!--   -->
				     </div>					     
                     <div class="form-group">													<!-- ????????  -->
				       <label for="user_id" class="control-label">User Id</label>								<!--   -->
				       <input name="user_id" type="text" id="user_id" placeholder="Enter User Id" required class="form-control" value=""  />					<!--   -->
				     </div>																								<!--   -->
				     <div class="form-group">																			<!--   -->
				       <label for="user_password" class="control-label">User Password</label>							<!--   -->
				       <input name="user_password" type="password" id="password" placeholder="Enter Password" required class="form-control" value="" />				<!--   -->
				     </div>																								<!--   -->
				     <div class="form-group text-center">																<!-- just centers the whole wrapped form experience in the middle   -->
				       <button id="register" name="userRegister" type="submit" value="register" class="btn btn-primary">Register</button>	<!--   -->
				     </div><!--  ?????????????? -->
			     </fieldset>																							<!--   -->
				 </form>																								<!--   -->
			 </div>																										<!--   -->
		    </div>
	       </div>
	      </div>
   </section>
</body>
</html>



