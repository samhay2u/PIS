<%@page import="java.util.List,pis.pojo.Patient,pis.pojo.Procedure,pis.pojo.PatientHX, pis.PatientHXServlet, pis.CommonServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp" />
			<div class="col-sm-4 col-sm-offset-4">
			<c:choose>
              <c:when test="${sessionScope.sessionUserToken.role == 'ADMIN'}">  			
			    <h2>Maintain Patient's Procedure History</h2>
				  <form method="post" action="/PIS/patienthx" id="patienthxForm">
			     <fieldset>
			     <%
					String opr = request.getParameter(CommonServlet.OPR), medRecNo = "", proDateOfService = "", proDoctorSeen = "", proProcedureID = "", proCostOfVisit = "";
					boolean isEdit = "edit".equals(opr);
			
					// if the opr html querry parametr up in the url has "opr=edit" representation
					// then do all this below
					if (isEdit) {
					   PatientHX patientHX = (PatientHX) request.getAttribute(PatientHXServlet.PATIENTHX);
					   if (patientHX != null) {
						  medRecNo = patientHX.getMedRecNo();
						  proDateOfService = patientHX.getDateOfService();
						  proDoctorSeen = patientHX.getDoctorSeen();
						  proProcedureID = patientHX.getProcedureID();
						  proCostOfVisit = patientHX.getCostOfVisit();
						}
					}
					
					// because we are not wanting to reuse the cose then we put everything here for
					// the ADD and the edit functions if we call add then it wont have anything the
					// "id"
					// because it didnt retrieve anything.. so it will be just blank in this case
					// Medical record Number
					String readonly = isEdit ? "readonly" : "";
			     %>     
			     <div class="form-group">
			       <label for="MedRecNo" class="control-label">Patient</label>
				<%
						if (isEdit) {
							String readonlyName = medRecNo;
							Patient patient = (Patient) request.getAttribute(CommonServlet.PATIENT);
							if (patient != null) {
								readonlyName += " - " + patient.getName();
							}
				%>			
							<input name="MedRecNo" type="hidden" id="MedRecNo" value="<%=medRecNo%>" /><%=readonlyName%>
				<%
						} else {
				%>
							<select class="form-control" name="MedRecNo" id="MedRecNo">
				<%			
							for (Patient patient: (List<Patient>) request.getAttribute(CommonServlet.PATIENTS)) {
				%>
				                <option value="<%=patient.getMedRecNo()%>"><%=patient.getName()%></option>
				<%				
							}
				%>
							</select>
				<%
						}
				%>
				       <input name="opr" type="hidden" id="opr" value="<%=opr%>Submit" />
				     </div>
				     <div class="form-group">
				       <label for="DateOfService" class="control-label">Date of Service (YYYY-MM-DD)</label>
				       <input name="DateOfService" type="text" id="DateOfService" class="form-control" value="<%=proDateOfService%>"  />
				     </div>
				     <div class="form-group">
				       <label for="DoctorSeen" class="control-label">Doctor Seen</label>
				       <input name="DoctorSeen" type="text" id="DoctorSeen" class="form-control" value="<%=proDoctorSeen%>"  />
				     </div>
				     <div class="form-group">
				       <label for="ProcedureID" class="control-label">Procedure</label>
				<%
						if (isEdit) {
							String readOnlyName = proProcedureID;
							Procedure procedure = (Procedure) request.getAttribute(CommonServlet.PROCEDURE);
							if (procedure != null) {
								readOnlyName += " - " + procedure.getProcedureName();
							}
				%>
							<input name="ProcedureID" type="hidden" id="ProcedureID" value="<%=proProcedureID%>" /><%=readOnlyName%>
				<%			
						} else {
				%>		
				            <select class="form-control" name="ProcedureID" id="ProcedureID">
				<%			
							for (Procedure procedure : (List<Procedure>) request.getAttribute(CommonServlet.PROCEDURES)) {
				%>
								<option value="<%=procedure.getProcedureId()%>"><%=procedure.getProcedureName()%></option>
				<%				
							}
				 %>			
							</select>
				<%			
						}
				 %>
				     </div>
				     <div class="form-group">
				       <label for="CostOfVist" class="control-label">Cost of Vist</label>
				       <input name="CostOfVist" type="text" id="CostOfVist" class="form-control" value="<%=proCostOfVisit%>" />
				     </div>
				     <div class="form-group text-center">
				       <button id="patienthxSubmit" name="patienthxSubmit" type="submit" class="btn btn-primary">Submit</button>
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