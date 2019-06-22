<%@page import="java.util.List,pis.pojo.PatientHX, pis.PatientHXServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" />
			<figure>
			  <table id="patienthx" class="display" summary="Patients HX Data" title="Patients HX Data">
			    <thead>
			      <tr>
			        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
			          <th id="maintain"><a href="/PIS/patienthx?opr=add">Add</a></th>
			        </c:if>
			        <th id="MedRecNo">Medical Record Number</th>
			        <th id="Name">Patient Name</th>
			        <th id="ProcedureID">Procedure ID</th>
			        <th id="ProcedureName">Procedure Name</th>
			        <th id="Description">Description</th>
			        <th id="DateOfService">Date Of Service</th>
			        <th id="DoctorSeen">Doctor Seen</th>
			        <th id="CostOfVist">Cost Of Vist</th>
			        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
			          <th id="delete">Delete</th>
			        </c:if>
			      </tr>
			    </thead>
			    <tbody>
				<%
				List<PatientHX> list = (List<PatientHX>) request.getAttribute(PatientHXServlet.PATIENTHXS);
				int count = list.size();
				for (PatientHX patientHX : list) {
					// Get the data from the row
					String medRecNo = patientHX.getMedRecNo();
					String name = patientHX.getName();
					String proProcedureID = patientHX.getProcedureID();
					String procedureName = patientHX.getProcedureName();
					String procedureDesc = patientHX.getProcedureDesc();
					String proDateOfService = patientHX.getDateOfService();
					String proDoctorSeen = patientHX.getDoctorSeen();
					String proCostOfVisit = patientHX.getCostOfVisit();
				%>    
			      <tr>
			        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
			          <td headers="maintain"><a href="/PIS/patienthx?opr=edit&MedRecNo=<%=medRecNo%>&DateOfService=<%=proDateOfService%>&DoctorSeen=<%=proDoctorSeen%>&ProcedureID=<%=proProcedureID%>">Edit</a></td>
			        </c:if>
			        <td headers="MedRecNo"><%=medRecNo%></td>
			        <td headers="Name"><%=name%></td>
			        <td headers="ProcedureID"><%=proProcedureID%></td>
			        <td headers="ProcedureName"><%=procedureName%></td>
			        <td headers="Description"><%=procedureDesc%></td>
			        <td headers="DateOfService"><%=proDateOfService%></td>
			        <td headers="DoctorSeen"><%=proDoctorSeen%></td>
			        <td headers="CostOfVisit"><%=proCostOfVisit%></td>
			        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
			          <td headers="delete"><a href="/PIS/patienthx?opr=delete&MedRecNo=<%=medRecNo%>&DateOfService=<%=proDateOfService%>&DoctorSeen=<%=proDoctorSeen%>&ProcedureID=<%=proProcedureID%>">Delete</a></td>
			        </c:if>
			      </tr>
				<%
				  count++;
				}
				%>			      
    </tbody>
    <tfoot>
      <tr>
		<c:choose>
          <c:when test="${sessionScope.sessionUserToken.role == 'ADMIN'}">      
            <td class="text-center" colspan="10"><b>Total: <%=count%></b></td>
          </c:when>
          <c:otherwise>
            <td class="text-center" colspan="8"><b>Total: <%=count%></b></td>
          </c:otherwise>
        </c:choose>	        
      </tr>
    </tfoot>
</table>
</figure>
<script  type="text/javascript">
	$(document).ready(function() {
	    $('#patienthx').DataTable();
	 });
</script>
<jsp:include page="../footer.jsp" />
