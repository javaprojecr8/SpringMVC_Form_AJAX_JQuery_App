<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
        th, td, p, input {
            font:14px Verdana;
        }
        table, th, td 
        {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
        th {
            font-weight:bold;
        }
    </style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%-- <script type="text/javascript"
	src="<c:url value="/resources/js/app.js" />">
	
</script> --%>


<script type="text/javascript">
	$(document).ready(
			function() {

				// SUBMIT FORM
				$("#userSaveBtn").click(function(event) {
					event.preventDefault();
					ajaxPost();
				});

				function ajaxPost() {
					$.ajax({
						type : "POST",
						url : window.location + "save",
						data : $('form[name=userRegForm]').serialize(),
						success : function(result) {
					        var col = [];
					        for (var i = 0; i < result.length; i++) {
					            for (var key in result[i]) {
					                if (col.indexOf(key) === -1) {
					                    col.push(key);
					                }
					            }
					        }

					        // CREATE DYNAMIC TABLE.
					        var table = document.createElement("table");

					        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

					        var tr = table.insertRow(-1);                   // TABLE ROW.

					        for (var i = 0; i < col.length; i++) {
					            var th = document.createElement("th");      // TABLE HEADER.
					            th.innerHTML = col[i];
					            tr.appendChild(th);
					        }

					        // ADD JSON DATA TO THE TABLE AS ROWS.
					        for (var i = 0; i < result.length; i++) {

					            tr = table.insertRow(-1);

					            for (var j = 0; j < col.length; j++) {
					                var tabCell = tr.insertCell(-1);
					                tabCell.innerHTML = result[i][col[j]];
					            }
					        }

					        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
					        var divContainer = document.getElementById("showData");
					        divContainer.innerHTML = "";
					        divContainer.appendChild(table);
						},
						error : function(e) {
							alert("Error!")
						}
					});

				}
			})
</script>
</head>
<body>
	<h2>User Input From</h2>
	<hr />
	<form:form action="saveUser" method="post" modelAttribute="user"
		id="userRegForm" name="userRegForm">
		<table>
			<tr>
				<th>User Id</th>
				<td><form:input path="userId" /></td>
			</tr>
			<tr>
				<th>First Name</th>
				<td><form:input path="firstName" /></td>
			</tr>
			<tr>
				<th>Last Name</th>
				<td><form:input path="lastName" /></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><form:input path="email" /></td>
			</tr>
			<tr>
				<td><input type="reset" value="Reset" />
				<td><input type="button" value="Submit" id="userSaveBtn"></td>
			</tr>
		</table>
	</form:form>

	<hr />

 <p id="showData"></p>
</body>
</html>