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
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<title>Student Portal - Login</title>
<!--     Fonts and icons     -->

<!-- CSS Files -->

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->

<link href="<c:url value="/resources/static/css/nucleo-icons.css" />"
	rel="stylesheet" />

<link href="<c:url value="/resources/static/css/nucleo-svg.css" />"
	rel="stylesheet" />

<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>


<link href="<c:url value="/resources/static/css/nucleo-svg.css" />"
	rel="stylesheet" />





<link
	href="<c:url value="/resources/static/css/soft-ui-dashboard.css?v=1.0.3" />"
	rel="stylesheet" />


</head>

<body class="">
	<div class="container position-sticky z-index-sticky top-0">
		<div class="row">
			<div class="col-12"></div>
		</div>
	</div>
	<main class="main-content  mt-0">
		<section>
			<form:form id="loginForm"
				action="${pageContext.request.contextPath}/login"
				modelAttribute="loginForm" method="post">
				<div class="page-header min-vh-75">
					<div class="container">
						<div class="row">
							<div
								class="col-xl-5 col-lg-5 col-md-6 d-flex flex-column mx-auto">
								<div class="card card-plain mt-8">
									<div class="card-header pb-0 text-left bg-transparent">
										<h3 class="font-weight-bolder text-info text-gradient">Welcome
											back to Student Portal</h3>
										<p class="mb-0">Enter your email and password to sign in</p>
									</div>
									<div class="card-body">
										<form role="form">
											<c:forEach items="${alertMessages}" var="alert">
												<div>
													<div class="${alert.cssClass}">
														<strong><c:out value="${alert.prefix}" /></strong>
														<c:out value="${alert.message}" />
													</div>
												</div>
											</c:forEach>
											<label>Username</label>
											<div class="mb-3">

												<form:input type="text" path="username" class="form-control"
													placeholder="Username" required="required" />


											</div>
											<label>Password</label>
											<div class="mb-3">



												<form:input type="password" path="password"
													class="form-control" placeholder="Password"
													required="required" />

											</div>
											<div class="form-check form-switch">
												<input class="form-check-input" type="checkbox"
													id="rememberMe" checked=""> <label
													class="form-check-label" for="rememberMe">Remember
													me</label>
											</div>
											<div class="text-center">
												<button type="submit" type="button"
													class="btn bg-gradient-info w-100 mt-4 mb-0">Sign
													in</button>
											</div>
										</form>
									</div>
									<div class="card-footer text-center pt-0 px-lg-2 px-1">
										<p class="mb-4 text-sm mx-auto">
											Don't have an account? <a href=""
												class="text-info text-gradient font-weight-bold">Sign up</a>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div
									class="oblique position-absolute top-0 h-100 d-md-block d-none me-n8">
									<div
										class="oblique-image bg-cover position-absolute fixed-top ms-auto h-100 z-index-0 ms-n6"
										style="background-image: url('/resources/static/img/curved-images/curved6.jpg')"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</section>
	</main>
	<!-- -------- START FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
	<footer class="footer py-5">
		<div class="container">
			<div class="row">

				<div class="col-lg-8 mx-auto text-center mb-4 mt-2">
					<a href="" target="_blank" class="text-secondary me-xl-4 me-4">
						<span class="text-lg fab fa-dribbble"></span>
					</a> <a href="" target="_blank" class="text-secondary me-xl-4 me-4">
						<span class="text-lg fab fa-twitter"></span>
					</a> <a href="" target="_blank" class="text-secondary me-xl-4 me-4">
						<span class="text-lg fab fa-instagram"></span>
					</a> <a href="" target="_blank" class="text-secondary me-xl-4 me-4">
						<span class="text-lg fab fa-pinterest"></span>
					</a> <a href="" target="_blank" class="text-secondary me-xl-4 me-4">
						<span class="text-lg fab fa-github"></span>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-8 mx-auto text-center mt-1">
					<p class="mb-0 text-secondary">
						Copyright ??
						<script>
							document.write(new Date().getFullYear())
						</script>
						Lebohang Madimabe
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- -------- END FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
	<!--   Core JS Files   -->

	<script src="<c:url value="/resources/static/js/core/popper.min.js" />"></script>
	<script
		src="<c:url value="/resources/static/js/core/bootstrap.min.js" />"></script>
	<script
		src="<c:url value="/resources/static/js/plugins/perfect-scrollbar.min.js" />"></script>

	<script
		src="<c:url value="/resources/static/js/plugins/smooth-scrollbar.min.js" />"></script>
	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}
	</script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->

	<script
		src="<c:url value="/resources/static/js/soft-ui-dashboard.min.js?v=1.0.3" />"></script>
</body>

</html>