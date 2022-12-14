<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- menu profile quick info -->
<div class="profile clearfix">
	<div class="profile_pic">
		<img src="${pageContext.request.contextPath}/resources/static/images/img.jpg"
			alt="..." class="img-circle profile_img">
	</div>
	<div class="profile_info">
		<span>Welcome,</span>

		<sec:authentication property="principal.username" var="name" />



		<h2>${name}${surname}</h2>
	</div>
</div>
<!-- /menu profile quick info -->

<br />

<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	<div class="menu_section">
		<h3>General</h3>
		<ul class="nav side-menu">
			<li><a><i class="fa fa-home"></i> Home <span
					class="fa fa-chevron-down"></span></a>
				<ul class="nav child_menu">
					<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
				</ul></li>
			<li><a><i class="fa fa-edit"></i> Admin Tasks <span
					class="fa fa-chevron-down"></span></a>
				<ul class="nav child_menu">
					<li><a
						href="${pageContext.request.contextPath}/student/register">Register
							Student</a></li>
					<li><a
						href="${pageContext.request.contextPath}/student/search">Search
							Student</a></li>
					<li><a
						href="${pageContext.request.contextPath}/student/reports">Student
							Reports</a></li>

				</ul></li>

		</ul>
	</div>


</div>
<!-- /menu footer buttons -->
<div class="sidebar-footer hidden-small">
	<a data-toggle="tooltip" data-placement="top" title="Settings"> <span
		class="glyphicon glyphicon-cog" aria-hidden="true"></span>
	</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
		<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
	</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
		class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
	</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
		href="login.html"> <span class="glyphicon glyphicon-off"
		aria-hidden="true"></span>
	</a>
</div>
<!-- /menu footer buttons -->