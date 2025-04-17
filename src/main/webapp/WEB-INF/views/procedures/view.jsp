<%@page import="java.util.List,pis.pojo.Procedure, pis.CommonServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" />
				<figure>
				  <table id="procedure" class="display" summary="Procedure Data" title="Procedure Data">
				    <thead>
				      <tr>
				        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
				          <th id="maintain"><a href="/PIS/procedures?opr=add">Add</a></th>
				        </c:if>
				        <th id="ProcedureID">Procedure ID</th>
				        <th id="ProcedureName">Procedure Name</th>
				        <th id="Description">Description</th>
				        <th id="Cost">Cost</th>
				        <th id="BillingCode">Billing Code</th>
				        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
				          <th id="delete">Delete</th>
				        </c:if>
				      </tr>
				    </thead>
				    <tbody>
				<% 
					// Execute the Select Query
					List<Procedure> list = (List<Procedure>) request.getAttribute(CommonServlet.PROCEDURES);
					int count = list.size();
					for (Procedure procedure : list) {
				
						// Get the data from the row
						String procedureId = procedure.getProcedureId();
						String procedureName = procedure.getProcedureName();
						String description = procedure.getDescription();
						String cost = procedure.getCost();
						String billingCode = procedure.getBillingCode();
				%>
				    
				      <tr>
				        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
				          <td headers="maintain"><a href="/PIS/procedures?opr=edit&ProcedureID=<%=procedureId%>">Edit</a></td>
				        </c:if>
				        <td headers="ProcedureID"><%=procedureId%></td>
				        <td headers="ProcedureName"><%=procedureName%></td>
				        <td headers="Description"><%=description%></td>
				        <td headers="Cost"><%=cost%></td>
				        <td headers="BillingCode"><%=billingCode%></td>
				        <c:if test="${sessionScope.sessionUserToken.role == 'ADMIN'}">
				          <td headers="delete"><a href="/PIS/procedures?opr=delete&ProcedureID=<%=procedureId%>">Delete</a></td>
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
	    $('#procedure').DataTable();
	 });
</script>				
<jsp:include page="../footer.jsp" />
