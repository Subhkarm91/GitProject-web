<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
	<title>Welcome Own Company Home Page</title>
</head>

<body style="background-color:rgba(255, 99, 71, 0.2);">
	<h2 style="font-family:verdana;text-align:center;">Welcome Own Company Home Page</h2>
	<hr>
	
	<p style="font-family:courier;text-align:center;">
	Welcome to the own company home page!
	</p>
	
	<hr>
	
	<!-- display user name and role -->
	
	<p  style="font-family:courier;text-align:center;">
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
		<br><br>
		First name: ${user.firstName}, Last name: ${user.lastName}, Email: ${user.email}
	</p>
	
	<security:authorize access="hasRole('MANAGER')">
	
		<!-- Add a link to point to /leaders ... this is for the managers -->
		
		<p style="font-family:courier;text-align:center;">
			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
			(Only for Manager peeps)
		</p>

	</security:authorize>	
	
	
	<security:authorize access="hasRole('ADMIN')">  

		<!-- Add a link to point to /systems ... this is for the admins -->
		
		<p style="font-family:courier;text-align:center;">
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admin peeps)
		</p>
	
	</security:authorize>
	
	<hr>
	
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<p style="font-family:courier;text-align:center;"><input type="submit" value="Logout" />
	</p>
	</form:form>
	
</body>

</html>









