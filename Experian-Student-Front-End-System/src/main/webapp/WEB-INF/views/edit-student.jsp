<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Student Portal | Edit Student</title>




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


<!-- Custom Theme Style -->


<link
	href="<c:url value="/resources/static/build/css/custom.min.css" />"
	rel="stylesheet" />

</head>

  <body class="nav-md footer_fixed">
	<div class="container body">
		<div class="main_container">
		<div class="col-md-3 left_col menu_fixed">
				<div class="left_col scroll-view">
					

					<div class="clearfix"></div>




					<!-- Sidebar -->
					<jsp:include page="dashboard-sidebar-menu.jsp" />
					<!-- Sidebar -->



				</div>
			</div>

			<!-- top navigation -->
			<jsp:include page="top-navigation.jsp" />

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Edit Student</h3>
						</div>


					</div>
					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="x_panel">

								<div class="x_content">
									<form:form id="editForm"
										action="${pageContext.request.contextPath}/student/edit/${studentNumber}"
										modelAttribute="editForm" method="post">

										<c:forEach items="${alertMessages}" var="alert">
											<div>
												<div class="${alert.cssClass}">
													<strong><c:out value="${alert.prefix}" /></strong>
													<c:out value="${alert.message}" />
												</div>
											</div>
										</c:forEach>

										<div id="wizard" class="form_wizard wizard_horizontal">
											<ul class="wizard_steps">
												<li><a href="#step-1"> <span class="step_no">1</span>
														<span class="step_descr"> Step 1<br /> <small>Edit
																Student</small>
													</span>
												</a></li>
												<li><a href="#step-2"> <span class="step_no">2</span>
														<span class="step_descr"> Step 2<br /> <small>Student
																Confirmation</small>
													</span>
												</a></li>
											</ul>



										</div>

										<span class="section">Personal Info</span>
										<div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">First
												Name<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6">


												<form:input type="text" path="firstName"
													class="form-control" placeholder="First Name"
													required="required" />

											</div>
										</div>
										<div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">Last
												Name<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6">
												<form:input type="text" path="lastName" class="form-control"
													placeholder="Last Name" required="required" />
											</div>
										</div>
										<div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">Mobile
												Number<span class="required">*</span>
											</label>
											<div class="col-md-1 col-sm-6">


												<form:select id="countryCode" path="countryCode"
													class="form-control taskselect">
													<form:options items="${countryCodes}" path="countryCode" />
												</form:select>

											</div>
											<div class="col-md-5 col-sm-6">

												<form:input type="number" path="cellNumber"
													class="form-control" placeholder="Mobile Number"
													required="required" />
											</div>
										</div>
										<div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">Email
												Address<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6">
												<form:input type="email" path="emailAddress"
													class="form-control" placeholder="Email"
													required="required" />
											</div>
										</div>
										<div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">Date
												of Birth<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6">
												<form:input type="date" path="dob" class="form-control"
													placeholder="Date of birth" data-date-format="DD/MM/YYYY"
													required="required" />
											</div>
										</div>
										<div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">Current
												Score <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6">
												<form:input type="number" path="currentScore"
													class="form-control" placeholder="Current Score"
													required="required" />
											</div>
										</div>

										<div class="ln_solid">
											<div class="form-group">
												<div class="col-md-6 offset-md-3">
													<button type='submit' class="btn btn-success">Submit</button>
													<button type='reset' class="btn btn-danger">Cancel</button>
												</div>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">KLV Student Portal | Lebohang Madimabe</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<script
		src="<c:url value="/resources/static/vendors/validator/multifield.js"/>"></script>

	<script
		src="<c:url value="/resources/static/vendors/validator/validator.js"/>"></script>

	<!-- Javascript functions	-->
	<script>
		function hideshow() {
			var password = document.getElementById("password1");
			var slash = document.getElementById("slash");
			var eye = document.getElementById("eye");

			if (password.type === 'password') {
				password.type = "text";
				slash.style.display = "block";
				eye.style.display = "none";
			} else {
				password.type = "password";
				slash.style.display = "none";
				eye.style.display = "block";
			}

		}
	</script>

	<script>
		// initialize a validator instance from the "FormValidator" constructor.
		// A "<form>" element is optionally passed as an argument, but is not a must
		var validator = new FormValidator({
			"events" : [ 'blur', 'input', 'change' ]
		}, document.forms[0]);
		// on form "submit" event
		document.forms[0].onsubmit = function(e) {
			var submit = true, validatorResult = validator.checkAll(this);
			console.log(validatorResult);
			return !!validatorResult.valid;
		};
		// on form "reset" event
		document.forms[0].onreset = function(e) {
			validator.reset();
		};
		// stuff related ONLY for this demo page:
		$('.toggleValidationTooltips').change(function() {
			validator.settings.alerts = !this.checked;
			if (this.checked)
				$('form .alert').remove();
		}).prop('checked', false);
	</script>

	<!-- jQuery -->


	<script
		src="<c:url value="/resources/static/vendors/jquery/dist/jquery.min.js"/>"></script>

	<!-- Bootstrap -->

	<script
		src="<c:url value="/resources/static/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"/>"></script>
	<!-- FastClick -->

	<script
		src="<c:url value="/resources/static/vendors/fastclick/lib/fastclick.js"/>"></script>
	<!-- NProgress -->

	<script
		src="<c:url value="/resources/static/vendors/nprogress/nprogress.js"/>"></script>
	<!-- validator -->
	<!-- <script src="../vendors/validator/validator.js"></script> -->

	<!-- Custom Theme Scripts -->

	<script src="<c:url value="/resources/static/build/js/custom.min.js"/>"></script>

</body>

</html>
