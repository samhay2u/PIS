<%@page import="pis.pojo.Patient, pis.CommonServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" />
			<div class="col-sm-4 col-sm-offset-4">
			<c:choose>
              <c:when test="${sessionScope.sessionUserToken.role == 'ADMIN'}">                          				
				<h2>Maintain Patient</h2>
				<form method="post" action="/PIS/patients" id="patientForm">
				  <fieldset>
				     <%
						String opr = request.getParameter(CommonServlet.OPR), medRecNo = "", name = "", dob = "", address = "", insurance = "";
						boolean isEdit = "edit".equals(opr);
				
						// if the opr html querry parametr up in the url has "opr=edit" representation
						// then do all this below
						if (isEdit) {
							Patient patient = (Patient) request.getAttribute(CommonServlet.PATIENT);
							medRecNo 		= patient.getMedRecNo();
							name 			= patient.getName();
							dob 			= patient.getDob();
							address 		= patient.getAddress();
							insurance 		= patient.getInsurance();
						}
						
						// because we are not wanting to reuse the cose then we put everything here for
						// the ADD and the edit functions if we call add then it wont have anything the
						// "id"
						// because it didnt retrieve anything.. so it will be just blank in this case
						// Medical record Number
						String readonly = isEdit ? "readonly" : "";
				     %>
				     <div class="form-group">
				       <label for="MedRecNo" class="control-label">Medical Record Number</label>
				       <input name="MedRecNo" type="text" id="MedRecNo" class="form-control" value="<%=medRecNo%>" <%=readonly%> />
				       <input name="opr" type="hidden" id="opr" value="<%=opr%>Submit" />
				     </div>
				     <div class="form-group">
				       <label for="Name" class="control-label">Name</label>
				       <input name="Name" type="text" id="Name" class="form-control" value="<%=name%>" />
				     </div>
				     <div class="form-group">
				       <label for="DOB" class="control-label">Date of Birth (YYYY-MM-DD)</label>
				       <input name="DOB" type="text" id="DOB" class="form-control" value="<%=dob%>" />
				     </div>
				     <div class="form-group">
				       <label for="Address" class="control-label">Address</label>
				       <input name="Address" type="text" id="Address" class="form-control" value="<%=address%>" />
				     </div>
				     <div class="form-group">
				       <label for="Insurance" class="control-label">Insurance</label>
				       <input name="Insurance" type="text" id="Insurance" class="form-control" value="<%=insurance%>" />
				     </div>
				     <div class="form-group text-center">
				       <button id="patientSubmit" name="patientSubmit" type="submit" class="btn btn-primary">Submit</button>
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
