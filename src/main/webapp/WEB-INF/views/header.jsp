<%@page import="pis.pojo.User, pis.CommonServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/select/1.2.7/css/select.dataTables.min.css" />
<link rel="stylesheet" href="/PIS/css/site.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<title>Patient Information Management System</title>
</head>
<body>
	<nav class="navbar navbar-default navbar-inverse" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"><img
				src="images/medical_logo.png" alt="" width="10%"></a>
		</div>
		<div class="navbar-expand">
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item"><a class="nav-link" href="/PIS/start">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="/PIS/patients">Patients</a></li>
				<li class="nav-item"><a class="nav-link" href="/PIS/procedures">Procedures</a></li>
				<li class="nav-item"><a class="nav-link" href="/PIS/patienthx">History</a></li>
				<li class="active nav-item"><a class="nav-link" href="/PIS">Logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- <a href="/PIS">Logout</a>-->
	<h1 align="center"><%=request.getAttribute(CommonServlet.TITLE)%></h1>
	<section class="outer-wrapper">
		<div class="inner-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-sm text-center">
						<%
							Object obj = session.getAttribute(CommonServlet.SESSION_USER_TOKEN);
							if (obj != null && obj instanceof User) {
								User user = (User) obj;
						%>
						<div class="success">
							Welcome
							<%=user.getName()%></div>
						<%
							}

							String message = (String) request.getAttribute(CommonServlet.MESSAGE); // Get the message from the request attribute

							if (message != null && !"".equals(message)) {
								String cssMessageClass = message.contains("successfully") ? "success" : "error";
						%>
						<div class="<%=cssMessageClass%>"><%=message%></div>
						<%
							}
						%>
						<br />
					</div>
				</div>
				<div class="row justify-content-center">