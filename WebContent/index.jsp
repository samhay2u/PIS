<%@page import="pis.model.UserDAO,pis.pojo.User,pis.CommonServlet,pis.util.Factory"%>
<%
	session.removeAttribute(CommonServlet.SESSION_USER_TOKEN);
	String userName = request.getParameter("user_id"); // get user_id from imported index.jsp form text entry area and store in string var
	String password = request.getParameter("user_password"); // get password from imported index.jsp store in string var
	String login = request.getParameter("userSubmit");
	String register = request.getParameter("userRegister");
	String errorMessage = "";
	User user = null;

	if ("login".equals(login)) {
		if (userName != null && password != null) { // if something has been typed in both text fields 
			UserDAO userDao = new UserDAO(); // create a new object of type commnServelt from the parrent class commonServlet
			user = userDao.retrieve(userName); // call/use java libary function... specially created for varifiying usernames and passwords
																// and set that equal to the empty error message variable created above
			if (user != null && Factory.inValid(password, user.getHashedPassword())) { // if validateLogin did not come back with an error then open the PIS start screen because
			    user.setActualPassword(password); 
				session.setAttribute(CommonServlet.SESSION_USER_TOKEN, user);
				response.sendRedirect("/PIS/start");
			}

			else {
				errorMessage = "Invalid User: " + userName;
			}
		}
	}

	if ("register".equals(register)) {
		response.sendRedirect("register.jsp");
	}
%>
<!DOCTYPE html>
<html>
<!-- standard boiler plate header stuff 	 begin  -->
<head>
<!--   -->
<meta charset="ISO-8859-1">
<!--  international charachter set begin head -->
<meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
<!--  says do not cache this page because it is a login page -->
<meta http-equiv="expires" content="0" />
<!--   says same thing for different browsers-->
<meta http-equiv="pragma" content="no-cache" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
<link rel="stylesheet" href="/PIS/css/site.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- include style sheet named site.css  -->
<title>Login: Patient Information Management System</title>
<!-- title tab name above url    -->
</head>
<!-- standard header stuff 	 end  -->
<body>	
	<nav class="navbar navbar-default navbar-inverse" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><img
					src="images/medical_logo.png" alt="" width="10%"></a>				
			</div>
			<div class="navbar-expand">
				<ul class="nav navbar-nav navbar-right">
					<li class="active nav-item"><a class="nav-link" href="#">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="/PIS/register.jsp">Register</a></li>					
				</ul>
			</div>
	</nav>	
	<!-- begin body  -->
	<h1 align="center">Patient Information Management System Login</h1>
	<!-- start page general menue header -->
	<section class="outer-wrapper">
		<!-- begin css table influence on the remainder of the site with general outer wrapper-->
		<div class="inner-wrapper">
			<!-- begin css table/cell influence on the remainder of the table w/inner wrapper  -->
			<div class="container">
				<!--because its not in css sites file it must be in bootstrap  -->
				<div class="row justify-content-center">
					<!-- because its not in css sites file it must be in bootstrap  -->
					<div class="col-sm-4 col-sm-offset-4">
						<!-- in bootstrap...maybe  a repeating 4 collumn grid area   -->
						<div class="error"><%=errorMessage%></div>
						<!-- error Message  if wrong pw/un entered -->

						<form method="post" action="/PIS/index.jsp" id="userForm">
							<!-- ??????????????  -->
							<fieldset>
								<!--  ?????????????? -->
								<div class="form-group">
									<!-- ????????  -->
									<label for="user_id" class="control-label">User Id</label>
									<!--   -->
									<input name="user_id" type="text" id="user_id"
										placeholder="Enter User Id" class="form-control" value="" />
									<!--   -->
								</div>
								<!--   -->
								<div class="form-group">
									<!--   -->
									<label for="user_password" class="control-label">User
										Password</label>
									<!--   -->
									<input name="user_password" type="password" id="password"
										placeholder="Enter Password" class="form-control" value="" />
									<!--   -->
								</div>
								<!--   -->
								<div class="form-group text-center">
									<!-- just centers the whole wrapped form experience in the middle   -->
									<button id="login" name="userSubmit" type="submit"
										value="login" class="btn btn-primary">Login</button>
									<!--   -->
									&nbsp;&nbsp;&nbsp;
									<button id="register" name="userRegister" type="submit"
										value="register" class="btn btn-primary">Register</button>
									<br/>
									<a class="small" href="javascript:alert('Sorry! Not Implemented Yet. Coming Next.')">Forgot my password</a>
									<!--   -->
								</div>
								<!--   -->
							</fieldset>
							<!--   -->
						</form>
						<!--   -->
					</div>
					<!--   -->
				</div>
			</div>
		</div>
	</section>
</body>
</html>