<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Student Portal | Dashboard</title>

<!-- Bootstrap -->
<link
	href="<c:url value="/resources/static/vendors/bootstrap/dist/css/bootstrap.css" />"
	rel="stylesheet" />

<link
	href="<c:url value="/resources/static/vendors/bootstrap/dist/css/bootstrap.css" />"
	rel="stylesheet" />
<!-- Font Awesome -->

<link
	href="<c:url value="/resources/static/vendors/font-awesome/css/font-awesome.css" />"
	rel="stylesheet" />
<!-- NProgress -->


<!-- iCheck -->


<link
	href="<c:url value="/resources/static/vendors/iCheck/skins/flat/green.css" />"
	rel="stylesheet" />

<!-- bootstrap-progressbar -->


<link
	href="<c:url value="/resources/static/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />"
	rel="stylesheet" />


<!-- JQVMap -->


<link
	href="<c:url value="/resources/static/vendors/jqvmap/dist/jqvmap.min.css" />"
	rel="stylesheet" />

<!-- bootstrap-daterangepicker -->

<link
	href="<c:url value="/resources/static/vendors/bootstrap-daterangepicker/daterangepicker.css" />"
	rel="stylesheet" />


<!-- Custom Theme Style -->
<link href="<c:url value="/resources/static/build/css/custom.css" />"
	rel="stylesheet" />
</head>

<body class="nav-md footer_fixed">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col menu_fixed">
				<div class="left_col scroll-view">


					<div class="clearfix"></div>

					<!-- sidebar menu -->
					<!-- Sidebar -->
					<jsp:include page="dashboard-sidebar-menu.jsp" />
					<!-- Sidebar -->
					<!-- /sidebar menu -->


				</div>
			</div>

			<!-- top navigation -->
			<jsp:include page="top-navigation.jsp" />
			<!-- /top navigation -->

			<!-- page content -->
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Admin Dashboard</h3>
						</div>

						<div class="title_right">
							<div class="col-md-5 col-sm-5   form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-6 col-sm-6  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Line graph<small>Student Overal Scores</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
									
									
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<canvas id="lineChart"></canvas>
								</div>
							</div>
						</div>

						<div class="col-md-6 col-sm-6  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Bar graph <small>Student Overal Averages</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
								
									
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<canvas id="mybarChart"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="clearfix"></div>

				</div>
			</div>
		</div>
		<!-- page content -->
		<!-- /page content -->

		<!-- footer content -->

		<!-- /footer content -->
	</div>

	<footer>
		<div class="pull-right">KLV Student Portal | Lebohang Madimabe</div>
		<div class="clearfix"></div>
	</footer>
	<!-- jQuery -->
	<script
		src="<c:url value="resources/static/vendors/jquery/dist/jquery.min.js"/>"></script>
	<!-- Bootstrap -->
	<script
		src="<c:url value="resources/static/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"/>"></script>
	<!-- FastClick -->
	<script
		src="<c:url value="resources/static/vendors/fastclick/lib/fastclick.js"/>"></script>
	<!-- NProgress -->
	<script
		src="<c:url value="resources/static/vendors/nprogress/nprogress.js"/>"></script>
	<!-- Chart.js -->
	<script
		src="<c:url value="resources/static/vendors/Chart.js/dist/Chart.min.js"/>"></script>
	<!-- gauge.js -->
	<script
		src="<c:url value="resources/static/vendors/gauge.js/dist/gauge.min.js"/>"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="<c:url value="resources/static/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"/>"></script>
	<!-- iCheck -->
	<script
		src="<c:url value="resources/static/vendors/iCheck/icheck.min.js"/>"></script>
	<!-- Skycons -->
	<script
		src="<c:url value="resources/static/vendors/skycons/skycons.js"/>"></script>
	<!-- Flot -->
	<script
		src="<c:url value="resources/static/vendors/Flot/jquery.flot.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/Flot/jquery.flot.pie.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/Flot/jquery.flot.time.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/Flot/jquery.flot.stack.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/Flot/jquery.flot.resize.js"/>"></script>
	<!-- Flot plugins -->
	<script
		src="<c:url value="resources/static/vendors/flot.orderbars/js/jquery.flot.orderBars.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/flot-spline/js/jquery.flot.spline.min.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/flot.curvedlines/curvedLines.js"/>"></script>
	<!-- DateJS -->
	<script
		src="<c:url value="resources/static/vendors/DateJS/build/date.js"/>"></script>
	<!-- JQVMap -->
	<script
		src="<c:url value="resources/static/vendors/jqvmap/dist/jquery.vmap.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/jqvmap/dist/maps/jquery.vmap.world.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"/>"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="<c:url value="resources/static/vendors/moment/min/moment.min.js"/>"></script>
	<script
		src="<c:url value="resources/static/vendors/bootstrap-daterangepicker/daterangepicker.js"/>"></script>

	<!-- Custom Theme Scripts -->
	<script src="<c:url value="resources/static/build/js/custom.min.js"/>"></script>

</body>
</html>
