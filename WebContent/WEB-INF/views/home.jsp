<%@page import="pis.pojo.User, pis.CommonServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />
</div>
<div class="row justify-content-center">
	<div class="col-sm-8">
		<div class="card-deck">
		    <div class="card btn btn-success">
		      <a class="text-white" href="/PIS/patients">		        
		        <div class="card-body text-center">
		          <img src="images/patients_pic.jpg" alt="Patients" class="rounded img-thumbnail" />
		          <p class="card-text">Patients</p>
		        </div>
		      </a>        
		    </div>
		    <div class="card btn btn-info">		       
		      <a class="text-white" href="/PIS/procedures">
		        <div class="card-body text-center">
		          <img src="images/procedures_pic.jpg" alt="Procedures" class="rounded img-thumbnail"/>
		          <p class="card-text">Procedures</p>
		        </div>
		      </a>        
		    </div>    
		    <div class="card btn btn-warning">
		      <a class="text-white" href="/PIS/patienthx">
		        <div class="card-body text-center">
		          <img src="images/patientHX_pic.jpg" alt="Patient's Procedure History" class="rounded img-thumbnail"/>
		          <p class="card-text">Patients History</p>
		        </div>
		      </a>      
		    </div>    
		</div>
	</div>
</div>
<br/>
<div class="row justify-content-center">	
	 <div class="col-sm-6">
<%
       String userName = "", 
              password = "",
              applicationURL = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/", 
              webServiceURL = applicationURL;

       pageContext.setAttribute("reactURL", applicationURL + "react");
       
       Object obj = session.getAttribute(CommonServlet.SESSION_USER_TOKEN);
	   if (obj != null && obj instanceof User) {
		  User user = (User) obj;
		  webServiceURL += "rest/top5?userName=" + user.getUserId() + "&password=" + user.getActualPassword();
	   }
 %>	 
       <script type = "text/javascript">
         var webServiceURL = "<%=webServiceURL%>";
       </script>
 
	   <c:import url="${reactURL}"/>
	   <div class="text-center"><small>(*Dashboard Demonstration of Web Services)</small></div>
	   <br/>
	 </div>	
<jsp:include page="footer.jsp" />