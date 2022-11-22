<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Student Portal | Login</title>

<!-- Bootstrap -->
<link
	href="<c:url value="/resources/static/vendors/bootstrap/dist/css/bootstrap.min.css" />"
	rel="stylesheet" />
<!-- Font Awesome -->
<link
	href="<c:url value="/resources/static/vendors/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet" />
<!-- NProgress -->
<link
	href="<c:url value="/resources/static/vendors/nprogress/nprogress.css" />"
	rel="stylesheet" />

<!-- Animate.css -->

<link
	href="<c:url value="/resources/static/vendors/animate.css/animate.min.css" />"
	rel="stylesheet" />
<!-- Custom Theme Style -->
<link
	href="<c:url value="/resources/static/build/css/custom.min.css" />"
	rel="stylesheet" />
</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form:form id="loginForm"
						action="${pageContext.request.contextPath}/login"
						modelAttribute="loginForm" method="post">
					
						<h1>Login</h1>
						
							<c:forEach items="${alertMessages}" var="alert">
							<div>
								<div class="${alert.cssClass}">
									<strong><c:out value="${alert.prefix}" /></strong>
									<c:out value="${alert.message}" />
								</div>
							</div>
						</c:forEach>
						<div>

							<form:input type="text" path="username" class="form-control"
								placeholder="Username" required="required" />
						</div>
						<div>


							<form:input type="password" path="password" class="form-control"
								placeholder="Password" required="required" />

						</div>
						<div>

							<button type="submit" type="button"
								class="btn btn-success submit">Sign in</button>


							 <a class="reset_pass" href="#">Lost your password?</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								New to site? <a href="" class="to_register"> Create Account
								</a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>Welcome to Student Portal</h1>
								<p>Â©2022 All Rights Reserved | Lebohang Madimabe</p>
							</div>
						</div>
					</form:form>
				</section>
			</div>


		</div>
	</div>
</body>
</html>
