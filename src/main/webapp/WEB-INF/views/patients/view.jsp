<%@page import="java.util.List,pis.pojo.Patient, pis.CommonServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" />          
				<figure>
				  <table id="patient" class="display" summary="Patients Data" title="Patients Data">
				    <thead>
				      <tr>
                        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
                          <th id="maintain"><a href="/PIS/patients?opr=add">Add</a></th>
                        </c:if>
				        <th id="MedRecNo">Medical Record Number</th>
				        <th id="Name">Name</th>
				        <th id="DOB">Date of Birth</th>
				        <th id="Address">Address</th>
				        <th id="Insurance">Insurance</th>
				        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
				          <th id="delete">Delete</th>
				        </c:if>
				      </tr>
				    </thead>
				    <tbody>
				<%
				// List<Patient> bean used to transfer object from controller to view
				List<Patient> list = (List<Patient>) request.getAttribute(CommonServlet.PATIENTS);
				int count = list.size();
				for (Patient patient: list) {
					// Get the data from the row
					String medRecNo = patient.getMedRecNo();
					String name = patient.getName();
					String dob = patient.getDob();
					String address = patient.getAddress();
					String insurance = patient.getInsurance();
				%>
				      <tr>
				        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
				          <td headers="maintain"><a href="/PIS/patients?opr=edit&MedRecNo=<%=medRecNo%>">Edit</a></td>
				        </c:if>
				        <td headers="MedRecNo"><%=medRecNo%></td>
				        <td headers="Name"><%=name%></td>
				        <td headers="DOB"><%=dob%></td>
				        <td headers="Address"><%=address%></td>
				        <td headers="Insurance"><%=insurance%></td>
				        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
				          <td headers="delete"><a href="/PIS/patients?opr=delete&MedRecNo=<%=medRecNo%>">Delete</a></td>
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
                            <td class="text-center" colspan="7"><b>Total: <%=count%></b></td>                          
                          </c:when>
                          <c:otherwise>
                            <td class="text-center" colspan="5"><b>Total: <%=count%></b></td>
                          </c:otherwise>
                        </c:choose>				        
				      </tr>
				    </tfoot>
				</table>
				</figure>
<script  type="text/javascript">
	$(document).ready(function() {
	    $('#patient').DataTable();
	 });
</script>				
<jsp:include page="../footer.jsp" />
