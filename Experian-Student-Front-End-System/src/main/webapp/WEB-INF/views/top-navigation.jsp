<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="top_nav">
	<sec:authentication property="principal.username" var="name" />
	<div class="nav_menu">
		<div class="nav toggle">
			<a id="menu_toggle"><i class="fa fa-bars"></i></a>
		</div>
		<nav class="nav navbar-nav">
		
			<ul class=" navbar-right">
				<li class="nav-item dropdown open" style="padding-left: 15px;">
					<a href="${pageContext.request.contextPath}/home"
					class="user-profile dropdown-toggle" aria-haspopup="true"
					id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
						<img
						src="${pageContext.request.contextPath}/resources/static/images/img.jpg"
						alt="">
				</a>${name}
					<div class="dropdown-menu dropdown-usermenu pull-right"
						aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i
							class="fa fa-sign-out pull-right"></i> Log Out</a>
					</div>
				</li>
			</ul>
		</nav>
	</div>
</div>