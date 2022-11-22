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

<title>Student Portal | Search Student</title>

<!-- Bootstrap -->
<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<script
	src="<c:url value="/resources/static/vendors/jquery/dist/jquery.min.js" />"></script>


<link
	href="<c:url value="/resources/static/vendors/bootstrap/dist/css/bootstrap.min.css" />"
	rel="stylesheet" />


<link
	href="<c:url value="/resources/static/vendors/bootstrap/dist/css/font-awesome.min.css" />"
	rel="stylesheet" />

<!-- NProgress -->


<link
	href="<c:url value="/resources/static/vendors/nprogress/nprogress.css" />"
	rel="stylesheet" />



<link
	href="<c:url value="/resources/static/vendors/iCheck/skins/flat/green.css" />"
	rel="stylesheet" />
<!-- Datatables -->




<link
	href="<c:url value="/resources/static/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" />"
	rel="stylesheet" />


<link
	href="<c:url value="/resources/static/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" />"
	rel="stylesheet" />



<link
	href="<c:url value="/resources/static/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" />"
	rel="stylesheet" />



<link
	href="<c:url value="/resources/static/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" />"
	rel="stylesheet" />


<link
	href="<c:url value="/resources/static/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" />"
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
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Search Student</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group"></div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">




						<div class="col-md-12 col-sm-12 ">
							<form:form id="atmForm"
								action="${pageContext.request.contextPath}/student/search"
								modelAttribute="searchForm" method="post">
								<div class="x_panel">
									<div class="x_title">
										<h2>Student Info</h2>
										<c:forEach items="${alertMessages}" var="alert">
											<div>
												<div class="${alert.cssClass}">
													<strong><c:out value="${alert.prefix}" /></strong>
													<c:out value="${alert.message}" />
												</div>
											</div>
										</c:forEach>
										<div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">Search
												By<span class="required">*</span>
											</label>
											<div class="col-md-3 col-sm-6">

												<form:select class="form-control" path="searchType"
													name="searchTypee" id="types">
													<option value="TYPE_STUDENT_NUMBER">Student No.</option>
													<option value="TYPE_FIRST_NAME">First Name</option>
													<option value="TYPE_LAST_NAME">Last Name</option>
													<option value="TYPE_EMAIL">Email Address</option>
												</form:select>
											</div>

											<label class="col-form-label col-md-3 col-sm-3  label-align">Category<span
												class="required">*</span></label>
											<div class="col-md-2 col-sm-6">
												<form:input type="text" path="searchCategory"
													class="form-control" placeholder="" required="required" />
											</div>
											<div class="col-md-2 col-sm-6">
												<button type='submit' class="btn btn-success">Search</button>
											</div>
										</div>
										<ul class="nav navbar-right panel_toolbox">


										</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<div class="row">

											<div class="col-sm-12">

												<div class="card-box table-responsive">

													<table id="datatable-buttons"
														class="table table-striped table-bordered"
														style="width: 100%">
														<thead>
															<tr>
																<th>Student No.</th>
																<th>Full Name</th>
																<th>Cell No.</th>
																<th>Email</th>
																<th>Current Score</th>
																<th>Average Score</th>
																<th>Action</th>
															</tr>
														</thead>
														<c:forEach items="${studentInfoList}" var="list"
															varStatus="loop">
															<tr>
																<td><c:out value="${list.studentNumber}" /></td>
																<td><c:out
																		value="${list.firstName} ${list.lastName}" /></td>

																<td><c:out value="${list.cellNumber}" /></td>
																<td><c:out value="${list.emailAddress}" /></td>
																<td><c:out value="${list.currentScore}%" /></td>
																<td><c:out value="${list.averageScore}%" /></td>

																<td><a
																	href="${pageContext.request.contextPath}/student/edit/${list.studentNumber}"
																	id="submitScoreButton" type="button"
																	class="btn btn-success"> Edit</a></td>

															</tr>
														</c:forEach>

														<tbody>

														</tbody>
													</table>
												</div>
											</div>
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

	<footer>
		<div class="pull-right">KLV Student Portal | Lebohang Madimabe</div>
		<div class="clearfix"></div>
	</footer>
	<!-- /page content -->

	<!-- footer content -->

	<!-- /footer content -->


	<script
		src="<c:url value="/resources/static/vendors/Flot/jquery.flot.resize.js"/>"></script>

	<script
		src="<c:url value="/resources/static/vendors/jquery/dist/jquery.min.js"/>"></script>

	<script
		src="<c:url value="/resources/static/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"/>"></script>

	<script
		src="<c:url value="/resources/static/vendors/fastclick/lib/fastclick.js"/>"></script>

	<script
		src="<c:url value="/resources/static/vendors/nprogress/nprogress.js"/>"></script>

	<script
		src="<c:url value="/resources/static/vendors/iCheck/icheck.min.js"/>"></script>

	<script
		src="<c:url value="/resources/static/vendors/datatables.net/js/jquery.dataTables.min.js"/>"></script>

	<!-- Datatables -->


	<script
		src="<c:url value="/resources/static/vendors/datatables.net/js/jquery.dataTables.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"/>"></script>

	<script
		src="<c:url value="/resources/static/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"/>"></script>



	<script
		src="<c:url value="/resources/static/vendors/datatables.net-buttons/js/buttons.flash.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-buttons/js/buttons.html5.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-buttons/js/buttons.print.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/jszip/dist/jszip.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/pdfmake/build/pdfmake.min.js"/>"></script>


	<script
		src="<c:url value="/resources/static/vendors/pdfmake/build/vfs_fonts.js"/>"></script>



	<script src="<c:url value="/resources/static/build/js/custom.min.js"/>"></script>

</body>
</html>