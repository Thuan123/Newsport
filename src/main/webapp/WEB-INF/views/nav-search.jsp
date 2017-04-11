<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

</head>
<body>
	<div class="nav-search-wrap left relative">

		<span class="nav-search-but left"> <!--<a href="<c:url value="/search.html"/>">-->
			<i class="fa fa-search fa-2"></i> <!-- </a>-->

		</span>
		<div class="search-fly-wrap">
			<form method="get" id="searchform" action="<c:url value="/searchNews"/>">
				<input type="text" name="query" id="query"
					value="Type search term and press enter"
					onfocus='if (this.value == "Type search term and press enter") { this.value = ""; }'
					onblur='if (this.value == "") { this.value = "Type search term and press enter"; }' />

				<input type="hidden" id="searchsubmit" value="Search" />

			</form>
		</div>
	</div>
	<!--nav-search-wrap-->
</body>
</html>