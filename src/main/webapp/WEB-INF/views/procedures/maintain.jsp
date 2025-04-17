<%@page import="pis.pojo.Procedure, pis.CommonServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" />
			<div class="col-sm-4 col-sm-offset-4">
			<c:choose>
              <c:when test="${sessionScope.sessionUserToken.role == 'ADMIN'}">			
				<h2>Maintain Procedure</h2>
				  <form method="post" action="/PIS/procedures" id="procedureForm">
				     <fieldset>
				     <%
						String opr = request.getParameter(CommonServlet.OPR), procedureName = "", procedureId = "", description = "", cost = "", billingCode = "";
						boolean isEdit = "edit".equals(opr);
						// if the opr html querry parametr up in the url has "opr=edit" representation
						// then do all this below
						if (isEdit) {
							Procedure procedure = (Procedure) request.getAttribute(CommonServlet.PROCEDURE);
							procedureId = procedure.getProcedureId();
							procedureName = procedure.getProcedureName();
							description = procedure.getDescription();
							cost = procedure.getCost();
							billingCode = procedure.getBillingCode();
						}
						// because we are not wanting to reuse the cose then we put everything here for
						// the ADD and the edit functions if we call add then it wont have anything the
						// "id"
						// because it didnt retrieve anything.. so it will be just blank in this case
						// Medical record Number
						String readonly = isEdit ? "readonly" : "";
				     %>     
				     <div class="form-group">
				       <label for="ProcedureID" class="control-label">Procedure ID</label>
				       <input name="ProcedureID" type="text" id="ProcedureID" class="form-control" value="<%=procedureId%>" <%=readonly%> />
				       <input name="opr" type="hidden" id="opr" value="<%=opr%>Submit" />
				     </div>
				     <div class="form-group">
				       <label for="ProcedureName" class="control-label">Procedure Name</label>
				       <input name="ProcedureName" type="text" id="ProcedureName" class="form-control" value="<%=procedureName%>" />
				     </div>
				     <div class="form-group">
				       <label for="Description" class="control-label">Description</label>
				       <input name="Description" type="text" id="Description" class="form-control" value="<%=description%>" />
				     </div>
				     <div class="form-group">
				       <label for="Cost" class="control-label">Cost</label>
				       <input name="Cost" type="text" id="Cost" class="form-control" value="<%=cost%>" />
				     </div>
				     <div class="form-group">
				       <label for="BillingCode" class="control-label">Billing Code</label>
				       <input name="BillingCode" type="text" id="BillingCode" class="form-control" value="<%=billingCode%>" />
				     </div>
				     <div class="form-group text-center">
				       <button id="procedureSubmit" name="procedureSubmit" type="submit" class="btn btn-primary">Submit</button>
				     </div>
				     </fieldset>
				  </form>
			  </c:when>
	          <c:otherwise>
	            <div class="error">You are not authorized to maintain Patients</div>
	          </c:otherwise>
			</c:choose>				  
			</div>
<jsp:include page="../footer.jsp" />
