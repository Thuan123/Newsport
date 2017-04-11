<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  <nav class="main-menu-wrap left">
							<div class="menu-main-menu-container">
							  <ul id="menu-main-menu-1" class="menu">
							    <li class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-165">
							      <a href="<c:url value="/"/>">Home</a>
							    </li>
	                            <li class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-165">
							      <a href="<c:url value="/admin/page/index"/>">Manage Pages</a>
							    </li>
							    <li class="mega-dropdown menu-item menu-item-type-taxonomy menu-item-object-category menu-item-170">
                                  <a href="<c:url value="#"/>">Manage Category</a>
                                </li>
                                <li class="mega-dropdown menu-item menu-item-type-taxonomy menu-item-object-category menu-item-170">
                                  <a href="<c:url value="#"/>">Manage Image</a>
                                </li>  	  	
	                          </ul>
                             </li>
                            </ul>
                        </div>		      
</nav>
</body>
</html>